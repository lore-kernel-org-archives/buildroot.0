From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2012 00:44:28 +0100
Subject: [Buildroot] Report of the Buildroot Developer Day, February 3, 2012
Message-ID: <201202160044.29316.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


---------------------------------------------------------------------

Buildroot developer day February 3, 2012

---------------------------------------------------------------------
---------------------------------------------------------------------

Table of Contents

1. Status of things discussed at last BR developer day
2. SDK (relocatable toolchain)
3. Out-of-tree builds
4. Crosstool-NG
5. Tags on patches
6. Legal info
7. Infrastructure for applying patches, i.e. how should patches be
    named
8. Version override
9. Other topics
10. Todo list

Present

    Peter Korsgaard, Thomas Petazzoni, Thomas De Schampheleire, Luca
    Ceresoli, Arnout Vandecappelle, Maxime Ripard

    Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
    Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
    Acked-by: Peter Korsgaard <jacmet@sunsite.dk>
    Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


---------------------------------------------------------------------

1. Status of things discussed at last BR developer day

---------------------------------------------------------------------

Cfr. http://lists.busybox.net/pipermail/buildroot/2011-November/
047229.html

send-patches.org. Not much has happened. When sending patches
upstream, you can put crossdev at send-patches.org in CC. To improve the
quality of patches, there is a git repository in which several
projects can collaborate. This is relevant for more complex patches
that are not likely to get merged upstream. There should be
documentation about how to make patches for buildroot, which mentions
crossdev at send-patches.org [AP-2].

planet.elinux.org. The people at elinux don?t know what a planet is,
so it would require some pushing to set it up. Also, people have to
create or aggregate some things. To get this going, it is probably
better to start something outside of elinux.org and pass it on to
them when there is actual content. Peter will set this up [AP-3].

Testing infrastructure. Nothing has happened. Testing is typically
done with a predefined toolchain configuration and with a random
package configuration. The idea was to make public the results of the
test builds. Peter needs to make a website where you can upload the
results [AP-4].

Crosstool-NG. See see below

Documentation migration to asciidoc. It?s done, and running asciidoc
on the webserver is possible. Peter will make sure this is done
automatically before the release [AP-5]. Then the existing
buildroot.html file will be removed. Also add the generated
documentation to the release tarball in the release target of the
Makefile [AP-6].

Website updates. Thomas Petazzoni had the idea of using Wordpress.
Nothing done yet. There was also the idea of a wiki. We can make a
buildroot page on the elinux.org wiki and do discussions there
[AP-13].

Patchwork. Nothing done yet. It?s not much effort though. Then we can
start trying it out; if it doesn?t work, we?ll just throw it away.
Peter will contact ozlabs.org to host it there [AP-7].

Relocatable builds (SDK). see below

Out-of-tree builds. see below


---------------------------------------------------------------------

2. SDK (relocatable toolchain)

---------------------------------------------------------------------

The idea is to allow developers to compile an individual application
without recompiling everything from source. The difference with an
SDK like Sourcery is that this one will include all the libraries
available on the target platform, not just libc. The SDK is developed
by a system integrator using buildroot, and is given to application
developers. The application developers can use the toolchain and the
libraries to develop new applications and install them on the target.
The assumption is that the buildroot-generated filesystem is already
on the target, and the extra application is just added to it in some
other way (copied, using a package manager, ?). When the application
is finished, the integrator can add buildroot packaging to properly
integrate it on the target filesystem.

Note that buildroot already works this way (in fact Peter does this
at Barco). The host-directory is the SDK. Just configure buildroot
with something like BR2_HOST_DIR="/opt/buildroot-$(BR2_ARCH)". The
only thing missing is to make it relocatable, so the developer can
install it in his home directory rather than at a fixed location.

Here is what needs to be done to make a relocatable SDK (copied from
last developer day).

  * Make sure that all binaries and libraries built for the host are
    built with a rpath pointing to host/usr/lib. Normally, this
    should already be the case, but it?s worth checking.
  * Change the rpath value to $ORIGIN/../lib instead of the current
    absolute path $(O)/host/usr/lib.
  * Modify the compiler wrapper program of external toolchains so
    that instead of using a fixed location for the compiler tools, it
    deduces their location in a relative manner from its current
    location.
  * Modify/patch pkg-config so that instead of having a fixed
    location for the PKG_CONFIG_PATH and PKG_CONFIG_SYSROOT_DIR,
    those are deduced from the location of the pkg-config binary.
    This will allow a pkg-config binary that has been moved to still
    operate properly, without having to set any environment variable.
  * Write a shell script, installed in host/usr/bin, which would
    mungle the libtool .la files, the qmake.conf file and the CMake
    toolchain file to set the correct path. This script reads a file
    (can be host/usr/share/buildroot/location) which contains the
    original location of the SDK. This allows the script to do the
    right modifications on all the libtool, qmake.conf and cmake
    files. Once this is done, the script changes the host/usr/share/
    buildroot/location file so that it contains the new location.
  * Modify the external toolchain wrapper so that it bails out and
    warns the user if the directory it is executed in doesn?t match
    the location of host/usr/share/buildroot/location. We haven?t
    discussed how this could work with internal and crosstool-NG
    toolchains, though.

In addition, two things are still missing to make the host-dir a true
SDK.

  * The CMake toolchain file should be moved somewhere into host/ to
    be part of the SDK, maybe host/usr/share/cmake or host/usr/share/
    buildroot.
  * It would be nice to add a br-configure script in host/usr/bin for
    autotools-based packages. Run ?BUILDROOTSDK/usr/bin/br-configure
    --enable-foo --disable-bar, and the br-configure script would
    call the ./configure script in the current directory passing all
    the right options (--host, and all environment variables CC, LD,
    AS, AR and such).

Since there is still quite a bit of work, and nobody has just done it
already, we should make and maintain a TODO list in the repository
that enumerates these things [AP-8].


---------------------------------------------------------------------

3. Out-of-tree builds

---------------------------------------------------------------------

Adding support for out-of-tree builds has a big impact on the overall
infrastructure (particularly because not all packages support
out-of-tree builds). Also, it is not an incremental step. This is the
reason that no attempts to add it to buildroot have been successful.

There was a patch by Mike Frysinger that implemented out-of-tree
builds just for the kernel, but it never got merged because it is not
generic enough. http://lists.busybox.net/pipermail/buildroot/
2010-November/038752.html Perhaps, however, this is a more
incremental step to get this support. The main use case for
out-of-tree builds is to avoid rsync-ing the source of a locally
overridden package into the build directory. Only the kernel is so
huge that it is necessary to avoid that copy, while on the other hand
it is pretty likely that you?re editing the kernel source, to create
a BSP. Note that the approach of the original patch won?t work with
the current local override implementation.


---------------------------------------------------------------------

4. Crosstool-NG

---------------------------------------------------------------------

The plan was to use crosstool-NG as the default toolchain in the
February release. However, there are still some shortcomings in the
integration of crosstool-NG in buildroot.

Download mechanism. We want to control the download of sources from
buildroot, to:

  * use our BR2_PRIMARY_SITE etc.
  * use the configured BR2_WGET
  * have a working make source, make external-deps etc.

A solution would be that we can ask crosstool-ng for a list of
package URLs to download, and do it ourselves.

Duplicated configuration. The configuration information has to be
passed from buildroot to crosstool-NG and vice-versa. There is a
higher risk of inconsistencies, and at the very least we have to
duplicate configuration options. Also it is more difficult to
configure uClibc than with the native toolchain (extra level of
config in-between).

Duplicated dependencies. crosstool-ng builds binutils, which may be
needed by other buildroot packages as well (oprofile).

Native toolchain. If we want a native toolchain on the target, we
need to recompile one from buildroot because crosstool-ng doesn?t
support native toolchains. That means duplicated patches etc.

Conclusion. To resolve all these issues, we probably need to
integrate tighter with crosstool-ng. Fortunately we have a good
relationship with Yann Morin, so we can probably convince him to make
changes to crosstool-ng that will help us to integrate it better in
buildroot. The first step is to discuss our problems on the
crosstool-ng and buildroot mailing lists.


---------------------------------------------------------------------

5. Tags on patches

---------------------------------------------------------------------

On the previous developer day, it was decided to start using the tags
that are used in the linux kernel to make it easier for Peter to
decide which patches are ready to be committed. However, we had not
yet reached a consensus about what the proper patch usage is.

After some discussion, we agreed that the only thing that needs to be
formal is to indicate that a person agrees with a patch in its
current form. For this purpose, we?ll use the ?Acked-by? tag. It
means that the acker would commit the patch if s/he had commit
access.

As to testing, we agreed that a separate tag is still required for
that. It is possible to Ack a patch without testing or vice versa. It
is acceptable to commit patches which haven?t been tested by anyone
except the author: if it turns out to fail later on, the commit can
still be reverted anyway. For the testing tag, it is useful to have
additional information about what exactly has been tested, but it?s
not necessary to formalize this. In the end, what counts is that some
people have tried it, probably in fairly different configurations.

All other uses can be done informally, i.e. without a tag: - ?I
reviewed it and I have comments?; - ?I like the idea but I haven?t
looked in detail at the patch itself?.

Conclusion

Acked-by
    indicates that the patch can be committed.
Tested-by
    indicates that the patch has been tested. It is useful but not
    necessary to add a comment about what has been tested.

This must be added to the how-to-contribute documentation [AP-1].


---------------------------------------------------------------------

6. Legal info

---------------------------------------------------------------------

Buildroot users are expecting a statement from the buildroot
developers explaining how we understand that buildroot can be used to
comply to the GPL. Note that this doesn?t need to be minimal
compliance, e.g. we can advise to include buildroot itself even if it
may not be required.

What do we want to save?

  * The non-proprietary packages.
  * The license text of the packages.
  * The scripts to create it, i.e. buildroot
  * The buildroot config file.
  * The cross-compiler seems to be required too for GPLv2 packages,
    because it is not normally available on an OS.

We will add support for preparing all of this. It is up to the user?s
legal office to decide what will actually be released and what not.

License texts. Many packages mix many licenses, so a single license
text per package is not sufficient.

Some licenses require to include the copyright holders in the license
text, so you can?t have one single BSD license text that applies to
all BSD-licensed software.

Buildroot itself. Creating a buildroot tarball is not so simple.
You?d need to do a make distclean first, so the output is gone, and
then tar the buildroot top directory. However, if there is an O=?
output directory within the buildroot directory, this will be
included as well? Note also that make distclean will remove the
.config. So recommend that make legal-info is done from a clean
buildroot checkout. Alternatively, do a tar of the current directory
and exclude dl and output.

Toolchain. For external toolchains, also the source needs to be
downloaded. For Sourcery there is a separate source tarball. For
Linaro this is more difficult, because it distributes its source as a
ct-ng tarball without the actual source. We?ll just mention that this
is unsupported for this case and other cases we can?t handle.

Implementation

  * Add our advise of how to comply to GPL to the documentation.
  * If something is difficult to do, skip it and mention it to the
    user.
  * In the package mk-file, specify the license file(s) from the
    package source that have to be included. There are some cases
    where the source doesn?t have a separate license file. In this
    case, we can include a license file in buildroot?s package
    directory. We could also point to a source file that contains the
    license text (not ideal because you add redundant cruft to the
    legal-info directory).
  * To avoid duplicating the same license every time, we use a common
    license file (included only once) for known licenses (GPLv2,
    LGPLv2, LGPLv2.1, ?). This only applies for licenses for which
    the text always is identical. In particular, the BSD license is
    excluded because it explicitly states that the copyright
    statement above must be retained.
  * make legal-info creates a directory with sources, a directory
    with licenses, and an overview document with the packages and
    licenses.
  * Print and save a warning if something doesn?t work (license
    unknown, no source found because of override or local, ?)
  * At some point, the toolchains will need to be converted to
    gentargets too, so they participate in the license stuff.


---------------------------------------------------------------------

7. Infrastructure for applying patches, i.e. how should patches be
named

---------------------------------------------------------------------

Non-versioned patches
    package/foo/<seqnum>-*.patch
Versioned patches
    package/foo/version/<seqnum>-*.patch

Patches are either versioned, or they are not. Versioned patches
should only be created for packages that have multiple supported
versions.

Series files: we don?t accept it in our tree, but we would accept
support for it in apply-patches.sh. The latter is useful because some
board vendors supply the kernel patches as an unordered tarball with
a series file.

We must get rid of architecture-specific patches. We currently have
two, both for AVR32: libmad and fbv.

Todo

  * Modify script to support new naming scheme.
  * Migrate existing patches (but this isn?t urgent, old way still
    works).
  * Remove architecture-specific patch support.


---------------------------------------------------------------------

8. Version override

---------------------------------------------------------------------

Use case: The same buildroot instance is used for two different
devices; for some packages, the user may want to have a specific
version rather than the current buildroot one. In particular,
iproute2 should have the same version as the kernel. So these users
want to override the version of a specific package from the config
file. There could still be problems with patches and dependencies,
which can also change with versions.

There are solutions within the current buildroot implementation:

  * Put the source of the required version locally and create a local
    override for the package.
  * Just copy the package directory to a new package directory where
    you can do what you like.
  * Re-assign to the FOO_VERSION variable later in the makefiles.
    Maybe it will work to move the inclusion of local.mk to the end.


---------------------------------------------------------------------

9. Other topics

---------------------------------------------------------------------

  * It would be nice if you could run a buildroot command that
    prepares a local copy of a package?s source, and allows you to
    generate patches for it later. This could use git or quilt to
    keep track of the patches.
  * In documentation, explain how to report a bug [AP-11].
  * Deprecate customize package (use post-build rsync instead)
    [AP-12].
  * It would be nice if there was a make target to reinstall
    everything to the target (i.e. remove all the target-installed
    stamps, remove the root stamp, maybe remove the target too).
    However, what is missing is the copying of the toolchain support
    files (libc.so etc.). It?s not obvious that this can be done in a
    reliable way.
  * It would be nice if there was some common infrastructure to
    combine the images into one final flash or SD card or whatever
    image. However, it is probably difficult to find the commonality
    of all the different use cases. And we don?t even see all these
    use cases.
  * SoC-specific architectures: it would be nice if the user could
    select e.g. OMAP3 instead of Cortex-A8. It?s a bit unclear what
    granularity would be needed here (OMAP? OMAP3? OMAP3530?). Also,
    it seems to be too much maintenance work to support all that, and
    the list of SoCs or SoC families could grow very long. This
    discussion was spurred by a dependency of at91boot on arm926:
    such dependencies should be avoided (because the user may have
    selected generic ARM instead), unless it doesn?t build otherwise.
  * It may be more useful to put the user-defined skeleton at the end
    of the build process instead of the beginning [AP-12].
  * The uninstall targets are pretty useless because they don?t
    really work. Should we remove support for uninstall?
  * It would be nice to have support for neon, vfp, thumb2, ? Tricky
    for external compilers, because we must know if it matches the
    options we want to give it.
  * Layered defconfigs. The idea is to be able to split the defconfig
    and patch lists into a board-level config (i.e. architecture and
    kernel selection) and an application-level config (i.e. selection
    of libraries and applications). After some discussion, however,
    it was decided that there is not enough commonality between the
    different use cases to be able to implement this generically. The
    trivial use case is a simple cat of a couple of defconfigs, so
    can easily be implemented by a user script.


---------------------------------------------------------------------

10. Todo list

---------------------------------------------------------------------

  * Document how to contribute (patches to list instead of bugzilla,
    SOB, formatting rules, acked-by and tested-by, how often to
    repost, what to expect, CC?s, ?)
  * Document how a package patch should be formatted (Comment, SOB,
    file naming rules, ?) + send upstream + CC sendpatches
  * Peter sets up a planet on whatever server and links to it from
    buildroot website
  * Peter sets up a cgi script on the website where test results can
    be POST-ed
  * Peter adds a script to the website to generate on-line
    documentation from asciidoc
  * Add the generated manual to the release tarball in the release
    target
  * Peter contacts ozlabs.org to request hosting a patchwork for
    buildroot
  * Create a TODO document in the repository, and add all the work
    for the SDK to it
  * Finalize legal-info
  * Clean up infrastructure for applying patches: modify
    apply-patches script to support new naming scheme, migrate
    existing patches, remove architecture-specific patch support
  * In documentation, explain how to report a bug
  * Deprecate customize package, add rsync to target-finalize, use
    this instead of user-defined skeleton, document this
  * Create buildroot page on elinux wiki.
