From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Dec 2012 00:26:14 +0100
Subject: [Buildroot] XBMC
In-Reply-To: <CAGduivzZU=-GOQzAj4keyBVVMZ=9zuXaHX0wD68X7VSpB-c1aQ@mail.gmail.com>
References: <CAGduivzZU=-GOQzAj4keyBVVMZ=9zuXaHX0wD68X7VSpB-c1aQ@mail.gmail.com>
Message-ID: <20121223002614.5efcd36e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 22 Dec 2012 00:58:49 +0100, Maxime Hadjinlian wrote:

> I wanted to add XBMC to buildroot, but since it's a pretty big
> application with a lot of dependency, I have created a separated tree
> at github :
> https://github.com/maximeh/buildroot
> 
> I would like to know if it would be of any interest to upstream this
> before sending all theses patches for review ?

It is indeed of interest to have something such as XBMC, I'd say. Of
course, it'd be even better if you could maintain the package from time
to time.

Here is a preliminary review of the patches that you have posted on
Github for XMBC. A more detailed review will be needed once you send
the patches on the list (doing review without being able to reply to
patches is annoying). Do not hesitate to send the full patch set, even
if it is quite big. I will do the review patch by patch, below.

rpi-userland
============

The package requires libcofi, so the patch should be *after* the patch
introducing libcofi in the patch set.

The help text would need a bit of love.

We don't like packages that will pull a random version of the upstream
software, so RPI_USERLAND_VERSION = master isn't good. Use either a
tag (better) or a commit ID as the version.

RPI_USERLANG_INSTALL_TARGET = YES is not needed, this is the default.

I'm not sure it's really worth the effort to clean up the staging
directory from unneeded stuff.

The rmdir -p $(TARGET_DIR_DIR)/etc/init.d || true could be replaced by
a rmdir -p --ignore-fail-on-non-empty, and TARGET_DIR_DIR should be
replaced by TARGET_DIR.

Instead of adding /opt/vc/lib in /etc/ld.so.conf, isn't it possible to
install the libraries in the right directory /usr/lib ?

Also, there have been some patches sent some time ago to add support
for the Rasberry-Pi. I don't remember if rpi-userland was part of
them, but maybe you should have a look at these patches and see how
they interact with your patch set. Another solution is to split the
problems: do one patch set adding XMBC only, and then another patch
set adding the Rasberry-Pi specific bits.

afpfs-ng
========

There is a crazy number of patches here, and none of them have a
description. Do we need all those patches? Have they been merged
upstream so that we can hope to reduce the number of patches in the
future?

AFPFS_NG_INSTALL_TARGET = YES is useless.

The += when defining the DEPENDENCIES should be simply a =.

Passing ac_cv_func_malloc_0_nonnull=yes it not needed, it is already
done by default by the autotools infrastructure. See the definition of
TARGET_CONFIGURE_ARGS in package/Makefile.in.

The Config.in file help text should be wrapped. The URL of the
upstream project should be added. And if the package actually requires
readline, then a 'select BR2_PACKAGE_READLINE' is needed here.

Minor nit: in the commit title, we don't usually put a space after the
package name. So it should be "afpfs-ng: new package" rather than
"afpfs-ng : new package".

fridibi
=======

Wrap the help text in Config.in.

Remove FRIDIBI_INSTALL_TARGET = YES

Get rid of FRIDIBI_SOURCE definition, this is the default value.

jasper
======

Does this package really depends on libjpeg ? The Config.in has a
"depends on", but the .mk file has no dependency.

Remove JASPER_INSTALL_TARGET = YES.

libass
======

I am not sure this package should be listed in "Text and terminal
handling". Maybe in Libraries -> Multimedia ?

Don't use "depends on", but use "select" for freetype and fontconfig.

Since this package uses libenca, the patch adding libenca should be
before the patch adding libass.

Please wrap the help text in Config.in.

LIBASS_SOURCE and LIBASS_INSTALL_TARGET should be removed, they are
the default value.

LIBASS_DEPENDENCIES does not mention freetype and fontconfig. Are
those needed dependencies or not? Also use = instead of += here.

libbluray
=========

Should go in Libraries -> Multimedia, not directly Multimedia, and so
the package should be in package/libbluray/.

Having _AUTORECONF = YES for a package where the source is taken from
a tarball and for which no patch is applied is unusual. Add a comment
explaining why AUTORECONF=YES is needed, or if it's not needed, remove
it.

Remove _INSTALL_TARGET=YES

libcdio
=======

Use $(BR2_GNU_MIRROR) for the download URL.

LIBCDIO_SOURCE is unneeded, this value is the default. Ditto for
LIBCDIO_INSTALL_TARGET.

libcec
======

This package depends on the lockdev package, but the lockdev package
is added in a later patch. The lockdev patch should be before the
libcec patch.

Please improve the help text with a better description of what this
library is.

Use tab for indentation in Config.in.

The BR2_PACKAGE_LIBCEC_RBP short text should probably be "Rasberry-Pi
support" or something like that.

The LIBCEC_VERSION should not be master, but a tag or a commit ID, so
everybody builds a similar known-working version.

_INSTALL_TARGET is not needed.

Maybe add a comment explaining why -Wno-psabi is needed.

Properly re-indent the --with-rpi-include-path and
--with-rpi-lib-path lines.

Missing newline before $(eval $(autotools-package)).

libcofi
=======

Shouldn't go in Miscellaneous, but in Libraries -> Other, or Libraries
-> Hardware Handling.

Please rewrap the help text in Config.in, and add upstream URL.

Please use a tag or commit ID instead of "master" as the version.

No need to define LIBCOFI_MAKE_OPT += -j1, just use $(MAKE1) instead
of $(MAKE) insthe build and install steps.

If you have _INSTALL_STAGING = YES, then you *must* have a
LIBCOFI_INSTALL_STAGING_CMDS. With the current package, I really don't
see who can link against libcofi: it doesn't get installed in staging,
which prevents the cross-compiler from using this library.

I haven't had a look at this package, but I guess it might be
architecture-specific, so please add a "depends on BR2_arm" if
necessary.

libenca
=======

A description of the patches is needed. Also, it would be better to
patch Makefile.am and configure.in (or configure.ac) and do a
LIBENCA_AUTORECONF = YES. And even better: make a proper change to
disable the compilation of tools, so that we can submit it upstream,
with the hope of getting rid of the patches in the long term.

Are you sure about ac_cv_file__dev_arandom=yes and
ac_cv_file__dev_srandom=yes ? I am not sure we have /dev/arandom and
/dev/srandom in our default installation (I'm not even sure what those
devices are).

Use $(@D) instead of $(LIBENCA_DIR) in the LIBENCA_MAKE_FIX. Also,
LIBENCA_MAKE_FIX could be named LIBENCA_BUILD_HOST_TOOL instead.

Add an empty newline before the $(eval $(autotools-package)) line.

libmodplug
==========

In Config.in, add a comment that explains why libmodplug is not
visible when the C++ support is not available in the toolchain:

comment "libmodplug requires C++ support in toolchain"
	depends on !BR2_INSTALL_LIBSTDCPP

LIBMODPLUG_SOURCE is not needed, this is the default value.

libnfs
======

Add spaces around the = in the LIBNFS_MAKE definition.

Use $(@D) instead of $(LIBNFS_DIR) in LIBNFS_BOOTSTRAP. I guess the
./bootstrap script uses autoconf/automake/libtool, so you should
probably depend on host-autoconf, host-automake and host-libtool. Or
better, did you try just adding LIBNFS_AUTORECONF = YES, and remove
the LIBNFS_BOOTSTRAP hook? It might work (or not, depending on what
the ./bootstrap script does).

libplist
========

Please add a description for the patch. Also, are you sure it is
really needed? Maybe we can pass a CMake argument to make sure that
SWIG is not found, or something like that.

In the Config.in, please wrap the help text.

The depends on BR2_PACKAGE_LIBXML2 should be a select.

LIBPLIST_SOURCE is the default value, please
remove. LIBPLIST_INSTALL_TARGET = YES is not needed.

Please add spaces around = signs.

librtmp
=======

I am wondering whether it should go in Libraries -> Graphics as you
did, or in Libraries -> Networking.

Tabs for indentation in Config.in. Please wrap the help text. Please
add the upstream URL.

Description + Signed-off-by needed in the patch. Is this patch part of
upstream? Do we have a chance of getting rid of it some day?

Defining a tarball-based LIBRTMP_SOURCE sounds strange when the
SITE_METHOD is git, and SITE points to a Git repository.

If you depend on OpenSSL, then the Config.in should select it.

Use $(TARGET_CONFIGURE_OPTS) instead of passing CC, LD, AR manually in
the BUILD_CMDS.

I'm pretty sure you could use "make install" for the
INSTALL_TARGET_CMDS. Just have a look at what the package installs. If
the only thing that the package installs are libraries in
target/usr/lib, headers in target/usr/include, and pkg-config stuff in
target/usr/lib/pkgconfig, then please use "make install": Buildroot
will automatically clean up what is not needed on the target.

libshairport
============

PLease replace LIBSHAIRPORT by libshairport in the commit log.

Wrap the help text in Config.in, and add the upstream project URL.

Add a description + Signed-off-by line in the patches and if possible
comment on the upstream status of those patches.

No need for _SOURCE and _INSTALL_TARGET variables.

Use = instead of += in _DEPENDENCIES.

If you depend on openssl, please add a select BR2_PACKAGE_OPENSSL in
Config.in.

lockdev
=======

I don't have the source code here, but the installation process looks
quite ugly. There's no DESTDIR variable? The "make install" target
doesn't create the symbolic links to the library?

_INSTALL_TARGET = YES not needed.

tinyxml
=======

Yet Another XML Parser \o/

Please add the upstream project URL in the Config.in help text. If you
have a slightly better description of the package, it would be great.

_SOURCE not needed, this is the default.

Is _AUTORECONF = YES really needed? If yes, then add a comment before
that line explaining why.

_INSTALL_TARGET = YES not needed.

Newline needed between the header (#####) and the first variable
definition, and between the last variable definition and the $(eval
$(...)) call.

Also, the "(libraries needed by some apps)" text in the header is
useless, get rid of it.

tvheadend
=========

A slightly better description of the package in Config.in would be
great. Also, add the upstream project URL.

Put the BR2_PACKAGE_TVHEADEND_AVAHI option inside a "if
BR2_PACKAGE_TVHEADEND ... endif" block, and drop the "depends on
BR2_PACKAGE_TVHEADEND". Replace the "depends on
BR2_PACKAGE_AVAHI_DAEMON" by "select BR2_PACKAGE_AVAHI" and "select
BR2_PACKAGE_AVAHI_DAEMON", and I would probably suggest to remove the
"default y" here, unless not having Avahi support makes the software
entirely useless.

Drop the _INSTALL_TARGET.

Since you depend on libv4l and openssl, please add the necessary
"select BR2_PACKAGE..." in Config.in.

xmbc
====

select BR2_INSTALL_LIBSTDCPP -> depends on BR2_INSTALL_LIBSDTCPP +
comment when BR2_INSTALL_LIBSTDCPP is not available.

Do we really need *all* these libraries for a basic build of XMBC ?
Having a more reduced XBMC would make it easier for you to get the
patches merged, and then progressively send improvements to add more
features.

Don't forget the wrap the lines in the Config.in help texts.

Typo in "select BR2_PACKAGE_LIBTHEORAK"

The fact that the BR2_PACKAGE_XBMC_AFPFS_NG selects both
BR2_PACKAGE_AFPFS_NG and BR2_PACKAGE_LIBPLIST is curious. Can afpfs-ng
really be built without libplist ? So in other words, is it really the
XMBC code that requires libplist *when* afpfs-ng support is enabled ?

Beware of trailing spaces in the Config.in file.

The S99xmbc script has some Rasberry-Pi specific parts, so it cannot
be integrated as is: the xmbc package should be usable on other
platforms as well. One solution is to have different
S99xmbc.$platformname script, and have Config.in options to enable the
installation of a particular script depending on the selected
platform.

advancedsettings.xml has some trailing spaces. I am not sure how much
this file is Rasberry-Pi specific or not.

What is the status of the different patches ?

_INSTALL_TARGET = YES not needed.

Can you explain why host-sdl_image is needed? If it is really needed,
then please put the necessary patches *before* the xmbc patch.

XBMC_MAKE_OPT += -j1 -> XMBC_MAKE = $(MAKE1)

The rpi-userland dependencies should not be here unconditionnally, we
must be able to build XMBC on other platforms. Note that a second
dependency on rpi-userland is added a bit later, under a condition,
which is OK.

What is this HOST="$(HOST)" variable ?

It should not be needed to have -I$(STAGING_DIR)/usr/include in the
"INCLUDES" variable, since the cross-compiler looks by default in this
directory for header files.

Splitting the line adding INCLUDES, LDFLAGS, CFLAGS and CXXFLAGS would be good.

The line:

  XBMC_CONF_ENV += PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)

is really not great. It would be better to figure out what's going on
with mysql, which script it tries to run, and if needed pass only the
path to this script. Clearly, putting the entire STAGING_DIR/usr/bin
directory in the PATH is bad.

Then, for all the optional features (for example FLAG or MAD), is it
possible to make sure that the feature will *not* be enabled when the
corresponding option is disabled. Usually, we do something like:

ifeq ($(BR2_PACKAGE_FOO_FEATURE_A),y)
FOO_CONF_OPT += --enable-feature-a
FOO_DEPENDENCIES += liba
else
FOO_CONT_OPT += --disable-feature-a
endif

If it's possible to do the same here, it would be great.

For XBMC_BOOTSTRAP, same comment as with another package: try to see
if you can use XBMC_AUTORECONF = YES instead. If not, then keep your
XBMC_BOOTSTRAP macro, but use $(@D) instead of $(XBMC_DIR) and add
host-autoconf, host-automake and possibly host-libtool in the
dependencies.

For the calls to install, do:

    $(INSTALL) -D -m 0755 package/thirdparty/xbmc/S99xbmc $(TARGET_DIR)/etc/init.d/S99xbmc

(i.e use $(INSTALL) instead of install, and use the -D option).

Please use the same indentation in all macros.

The XBMC_STRIP_BINARIES is useless, it is done automatically for
Buildroot, except maybe for xbmc.bin if it is not installed with
execution rights (to be verified).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
