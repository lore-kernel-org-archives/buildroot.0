From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 02 May 2014 07:47:30 +0200
Subject: [Buildroot] [PATCH] manual: use one-line titles instead of two-line
 titles (trivial)
Message-ID: <0f7edee196f1f7a6643f.1399009650@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asciidoc supports two syntaxes for section titles: two-line titles (title
plus underline consisting of a particular symbol), and one-line titles
(title prefixed with a specific number of = signs).

The two-line title underlines are:
Level 0 (top level):     ======================
Level 1:                 ----------------------
Level 2:                 ~~~~~~~~~~~~~~~~~~~~~~
Level 3:                 ^^^^^^^^^^^^^^^^^^^^^^
Level 4 (bottom level):  ++++++++++++++++++++++

and the one-line title prefixes:
= Document Title (level 0) =
== Section title (level 1) ==
=== Section title (level 2) ===
==== Section title (level 3) ====
===== Section title (level 4) =====

The buildroot manual is currenly using the two-line titles, but this has
multiple disadvantages:

- asciidoc also uses some of the underline symbols for other purposes (like
  preformatted code, example blocks, ...), which makes it difficult to do
  mass replacements, such as a planned follow-up patch that needs to move
  all sections one level down.

- it is difficult to remember which level a given underline symbol (=-~^+)
  corresponds to, while counting = signs is easy.

This patch changes all two-level titles to one-level titles in the manual.
The bulk of the change was done with the following Python script, except for
the level 1 titles (-----) as these underlines are also used for literal
code blocks.
This patch only changes the titles, no other changes. In
adding-packages-directory.txt, I did add missing newlines between some
titles and their content.

----------------------------------------------------------------------------
#!/usr/bin/env python

import sys
import mmap
import re

for input in sys.argv[1:]:

    f = open(input, 'r+')
    f.flush()
    s = mmap.mmap(f.fileno(), 0)

    # Level 0 (top level):     ======================   =
    # Level 1:                 ----------------------   ==
    # Level 2:                 ~~~~~~~~~~~~~~~~~~~~~~   ===
    # Level 3:                 ^^^^^^^^^^^^^^^^^^^^^^   ====
    # Level 4 (bottom level):  ++++++++++++++++++++++   =====

    def replace_title(s, symbol, replacement):
        pattern = re.compile(r'(.+\n)\%s{2,}\n' % symbol, re.MULTILINE)
        return pattern.sub(r'%s \1' % replacement, s)

    new = s
    new = replace_title(new, '=', '=')
    new = replace_title(new, '+', '=====')
    new = replace_title(new, '^', '====')
    new = replace_title(new, '~', '===')
    #new = replace_title(new, '-', '==')

    s.seek(0)
    s.write(new)
    s.resize(s.tell())
    s.close()
    f.close()

----------------------------------------------------------------------------

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: the mentioned follow-up patch will restructure the manual into a user
guide and a developer guide. It is not yet ready though. To avoid having to
rebase this preparatory patch over and over, I'd prefer it being integrated
already now.


 docs/manual/adding-packages-autotools.txt   |   9 ++----
 docs/manual/adding-packages-cmake.txt       |   9 ++----
 docs/manual/adding-packages-conclusion.txt  |   3 +-
 docs/manual/adding-packages-directory.txt   |  25 +++++++---------
 docs/manual/adding-packages-generic.txt     |   9 ++----
 docs/manual/adding-packages-gettext.txt     |   3 +-
 docs/manual/adding-packages-hooks.txt       |   6 +--
 docs/manual/adding-packages-luarocks.txt    |   9 ++----
 docs/manual/adding-packages-perl.txt        |   9 ++----
 docs/manual/adding-packages-python.txt      |   9 ++----
 docs/manual/adding-packages-tips.txt        |   9 ++----
 docs/manual/adding-packages-virtual.txt     |  21 ++++---------
 docs/manual/adding-packages.txt             |   3 +-
 docs/manual/advanced.txt                    |   3 +-
 docs/manual/appendix.txt                    |  12 ++-----
 docs/manual/beyond-buildroot.txt            |  12 ++-----
 docs/manual/ccache-support.txt              |   3 +-
 docs/manual/common-usage.txt                |  21 ++++---------
 docs/manual/configure.txt                   |  18 ++++--------
 docs/manual/contribute.txt                  |  27 ++++++------------
 docs/manual/customize-busybox-config.txt    |   3 +-
 docs/manual/customize-kernel-config.txt     |   3 +-
 docs/manual/customize-outside-br.txt        |   3 +-
 docs/manual/customize-packages.txt          |   3 +-
 docs/manual/customize-rootfs.txt            |   3 +-
 docs/manual/customize-store.txt             |  18 ++++--------
 docs/manual/customize-toolchain.txt         |   9 ++----
 docs/manual/customize-uclibc-config.txt     |   3 +-
 docs/manual/customize.txt                   |   3 +-
 docs/manual/debugging-buildroot.txt         |   3 +-
 docs/manual/developer-guide.txt             |   3 +-
 docs/manual/download-infra.txt              |   3 +-
 docs/manual/download-location.txt           |   3 +-
 docs/manual/eclipse-integration.txt         |   3 +-
 docs/manual/faq-troubleshooting.txt         |  24 +++++----------
 docs/manual/get-involved.txt                |  36 ++++++++----------------
 docs/manual/getting.txt                     |   3 +-
 docs/manual/going-further.txt               |   3 +-
 docs/manual/how-buildroot-works.txt         |   3 +-
 docs/manual/introduction.txt                |   3 +-
 docs/manual/known-issues.txt                |   3 +-
 docs/manual/legal-notice.txt                |  12 ++-----
 docs/manual/make-tips.txt                   |   3 +-
 docs/manual/makedev-syntax.txt              |   3 +-
 docs/manual/makeusers-syntax.txt            |   3 +-
 docs/manual/manual.txt                      |   3 +-
 docs/manual/package-make-target.txt         |   3 +-
 docs/manual/patch-policy.txt                |  24 +++++----------
 docs/manual/prerequisite.txt                |   9 ++----
 docs/manual/rebuilding-packages.txt         |   6 +--
 docs/manual/starting-up.txt                 |   3 +-
 docs/manual/using-buildroot-development.txt |   3 +-
 docs/manual/using-buildroot-toolchain.txt   |   3 +-
 docs/manual/using.txt                       |   3 +-
 docs/manual/working-with.txt                |   6 +--
 docs/manual/writing-rules.txt               |  12 ++-----
 56 files changed, 154 insertions(+), 300 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -1,13 +1,11 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Infrastructure for autotools-based packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Infrastructure for autotools-based packages
 
 [[autotools-package-tutorial]]
 
-+autotools-package+ tutorial
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +autotools-package+ tutorial
 
 First, let's see how to write a +.mk+ file for an autotools-based
 package, with an example :
@@ -67,8 +65,7 @@ package to be built.
 
 [[autotools-package-reference]]
 
-+autotools-package+ reference
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +autotools-package+ reference
 
 The main macro of the autotools package infrastructure is
 +autotools-package+. It is similar to the +generic-package+ macro. The ability to
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -1,13 +1,11 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Infrastructure for CMake-based packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Infrastructure for CMake-based packages
 
 [[cmake-package-tutorial]]
 
-+cmake-package+ tutorial
-^^^^^^^^^^^^^^^^^^^^^^^^
+==== +cmake-package+ tutorial
 
 First, let's see how to write a +.mk+ file for a CMake-based package,
 with an example :
@@ -66,8 +64,7 @@ package to be built.
 
 [[cmake-package-reference]]
 
-+cmake-package+ reference
-^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +cmake-package+ reference
 
 The main macro of the CMake package infrastructure is
 +cmake-package+. It is similar to the +generic-package+ macro. The ability to
diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.txt
--- a/docs/manual/adding-packages-conclusion.txt
+++ b/docs/manual/adding-packages-conclusion.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Conclusion
-~~~~~~~~~~
+=== Conclusion
 
 As you can see, adding a software package to Buildroot is simply a
 matter of writing a Makefile using an existing example and modifying it
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Package directory
-~~~~~~~~~~~~~~~~~
+=== Package directory
 
 First of all, create a directory under the +package+ directory for
 your software, for example +libfoo+.
@@ -13,8 +12,7 @@ one of these categories, then create you
 New subdirectories are discouraged, however.
 
 
-+Config.in+ file
-~~~~~~~~~~~~~~~~
+=== +Config.in+ file
 
 Then, create a file named +Config.in+. This file will contain the
 option descriptions related to our +libfoo+ software that will be used
@@ -52,8 +50,7 @@ source "package/libfoo/Config.in"
 --------------------------
 
 [[depends-on-vs-select]]
-Choosing +depends on+ or +select+
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Choosing +depends on+ or +select+
 
 The +Config.in+ file of your package must also ensure that
 dependencies are enabled. Typically, Buildroot uses the following
@@ -164,8 +161,8 @@ Further formatting details: see xref:wri
 coding style].
 
 [[dependencies-target-toolchain-options]]
-Dependencies on target and toolchain options
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Dependencies on target and toolchain options
+
 Many packages depend on certain options of the toolchain: the choice of
 C library, C++ support, largefile support, thread support, RPC support,
 IPv6 support, wchar support, or dynamic library support. Some packages
@@ -268,8 +265,8 @@ use in the comment.
 ** Dependency symbol: +!BR2_PREFER_STATIC_LIB+
 ** Comment string: +dynamic library+
 
-Dependencies on a Linux kernel built by buildroot
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Dependencies on a Linux kernel built by buildroot
+
 Some packages need a Linux kernel to be built by buildroot. These are
 typically kernel modules or firmware. A comment should be added in the
 Config.in file to express this dependency, similar to dependencies on
@@ -285,8 +282,8 @@ kernel, use this format:
 foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
 --------------------------
 
-Dependencies on udev /dev management
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Dependencies on udev /dev management
+
 If a package needs udev /dev management, it should depend on symbol
 +BR2_PACKAGE_HAS_UDEV+, and the following comment should be added:
 
@@ -301,8 +298,8 @@ management, use this format:
 foo needs udev /dev management and a toolchain w/ featA, featB, featC
 --------------------------
 
-The +.mk+ file
-~~~~~~~~~~~~~~
+=== The +.mk+ file
+
 [[adding-packages-mk]]
 
 Finally, here's the hardest part. Create a file named +libfoo.mk+. It
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Infrastructure for packages with specific build systems
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Infrastructure for packages with specific build systems
 
 By 'packages with specific build systems' we mean all the packages
 whose build system is not one of the standard ones, such as
@@ -11,8 +10,7 @@ system is based on hand-written Makefile
 
 [[generic-package-tutorial]]
 
-+generic-package+ tutorial
-^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +generic-package+ tutorial
 
 ------------------------------
 01: ################################################################################
@@ -159,8 +157,7 @@ Makefile code necessary to make your pac
 
 [[generic-package-reference]]
 
-+generic-package+ reference
-^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +generic-package+ reference
 
 There are two variants of the generic target. The +generic-package+ macro is
 used for packages to be cross-compiled for the target.  The
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Gettext integration and interaction with packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Gettext integration and interaction with packages
 
 Many packages that support internationalization use the gettext
 library. Dependencies for this library are fairly complicated and
diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[hooks]]
-Hooks available in the various build steps
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Hooks available in the various build steps
 
 The generic infrastructure (and as a result also the derived autotools
 and cmake infrastructures) allow packages to specify hooks.
@@ -40,8 +39,7 @@ endef
 LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 ----------------------
 
-Using the +POST_RSYNC+ hook
-^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Using the +POST_RSYNC+ hook
 The +POST_RSYNC+ hook is run only for packages that use a local source,
 either through the +local+ site method or the +OVERRIDE_SRCDIR+
 mechanism. In this case, package sources are copied using +rsync+ from
diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -1,13 +1,11 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Infrastructure for LuaRocks-based packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Infrastructure for LuaRocks-based packages
 
 [[luarocks-package-tutorial]]
 
-+luarocks-package+ tutorial
-^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +luarocks-package+ tutorial
 
 First, let's see how to write a +.mk+ file for a LuaRocks-based package,
 with an example :
@@ -48,8 +46,7 @@ package to be built.
 
 [[luarocks-package-reference]]
 
-+luarocks-package+ reference
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +luarocks-package+ reference
 
 LuaRocks is a deployment and management system for Lua modules, and supports
 various +build.type+: +builtin+, +make+ and +cmake+. In the contetx of
diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -1,13 +1,11 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Infrastructure for Perl/CPAN packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Infrastructure for Perl/CPAN packages
 
 [[perl-package-tutorial]]
 
-+perl-package+ tutorial
-^^^^^^^^^^^^^^^^^^^^^^^
+==== +perl-package+ tutorial
 
 First, let's see how to write a +.mk+ file for a Perl/CPAN package,
 with an example :
@@ -67,8 +65,7 @@ following things should be checked.
 
 [[perl-package-reference]]
 
-+perl-package+ reference
-^^^^^^^^^^^^^^^^^^^^^^^^
+==== +perl-package+ reference
 
 As a policy, packages that provide Perl/CPAN modules should all be
 named +perl-<something>+ in Buildroot.
diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Infrastructure for Python packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Infrastructure for Python packages
 
 This infrastructure applies to Python packages that use the standard
 Python setuptools mechanism as their build system, generally
@@ -10,8 +9,7 @@ recognizable by the usage of a +setup.py
 
 [[python-package-tutorial]]
 
-+python-package+ tutorial
-^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +python-package+ tutorial
 
 First, let's see how to write a +.mk+ file for a Python package,
 with an example :
@@ -61,8 +59,7 @@ built.
 
 [[python-package-reference]]
 
-+python-package+ reference
-^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +python-package+ reference
 
 As a policy, packages that merely provide Python modules should all be
 named +python-<something>+ in Buildroot. Other packages that use the
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -1,12 +1,10 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Tips and tricks
-~~~~~~~~~~~~~~~
+=== Tips and tricks
 
 [[package-name-variable-relation]]
-Package name, config entry name and makefile variable relationship
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Package name, config entry name and makefile variable relationship
 
 In Buildroot, there is some relationship between:
 
@@ -36,8 +34,7 @@ using the following rules:
 
 
 [[github-download-url]]
-How to add a package from github
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== How to add a package from github
 
 Packages on github often don't have a download area with release tarballs.
 However, it is possible to download tarballs directly from the repository
diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Infrastructure for virtual packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Infrastructure for virtual packages
 
 [[virtual-package-tutorial]]
 
@@ -16,16 +15,14 @@ The implementation of this API is differ
 the 'Texas Instruments OMAP35xx' plaftorms. So +libgles+ will be a virtual
 package and +sunxi-mali+ and +ti-gfx+ will be the providers.
 
-+virtual-package+ tutorial
-^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== +virtual-package+ tutorial
 
 In the following example, we will explain how to add a new virtual package
 ('something-virtual') and a provider for it ('some-provider').
 
 First, let's create the virtual package.
 
-Virtual package's +Config.in+ file
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Virtual package's +Config.in+ file
 
 The +Config.in+ file of virtual package 'something-virtual' should contain:
 
@@ -42,8 +39,7 @@ In this file, we declare two options, +B
 +BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+, whose values will be used by the
 providers.
 
-Virtual package's +*.mk+ file
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Virtual package's +*.mk+ file
 
 The +.mk+ for the virtual package should just evaluate the +virtual-package+ macro:
 
@@ -60,8 +56,7 @@ 07: $(eval $(virtual-package))
 The ability to have target and host packages is also available, with the
 +host-virtual-package+ macro.
 
-Provider's +Config.in+ file
-^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Provider's +Config.in+ file
 
 When adding a package as a provider, only the +Config.in+ file requires some
 modifications. The +*.mk+ file should follow the Buildroot infrastructure with
@@ -92,8 +87,7 @@ provider, but only if it is selected.
 Of course, do not forget to add the proper build and runtime dependencies for
 this package!
 
-Notes on depending on a virtual package
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Notes on depending on a virtual package
 
 When adding a package that requires a certain +FEATURE+ provided by a virtual
 package, you have to use +depends on BR2_PACKAGE_HAS_FEATURE+, like so:
@@ -107,8 +101,7 @@ config BR2_PACKAGE_FOO
     depends on BR2_PACKAGE_HAS_FEATURE
 ---------------------------
 
-Notes on depending on a specific provider
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Notes on depending on a specific provider
 
 If your package really requires a specific provider, then you'll have to
 make your package +depends on+ this provider; you can _not_ +select+ a
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[adding-packages]]
-Adding new packages to Buildroot
---------------------------------
+== Adding new packages to Buildroot
 
 This section covers how new packages (userspace libraries or
 applications) can be integrated into Buildroot. It also shows how
diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
--- a/docs/manual/advanced.txt
+++ b/docs/manual/advanced.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Advanced usage
---------------
+== Advanced usage
 
 include::using-buildroot-toolchain.txt[]
 
diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Appendix
-========
+= Appendix
 
 include::makedev-syntax.txt[]
 include::makeusers-syntax.txt[]
@@ -11,22 +10,19 @@ include::makeusers-syntax.txt[]
 // Automatically generated lists:
 
 [[package-list]]
-List of target packages available in Buildroot
-----------------------------------------------
+== List of target packages available in Buildroot
 
 include::package-list.txt[]
 
 [[host-package-list]]
-List of host utilities available in Buildroot
----------------------------------------------
+== List of host utilities available in Buildroot
 
 The following packages are all available in the menu +Host utilities+.
 
 include::host-package-list.txt[]
 
 [[deprecated-list]]
-Deprecated features
--------------------
+== Deprecated features
 
 The following features are marked as _deprecated_ in Buildroot due to
 them being either too old or unmaintained. They will be removed at
diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -1,14 +1,11 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Beyond Buildroot
-================
+= Beyond Buildroot
 
-Boot the generated images
--------------------------
+== Boot the generated images
 
-NFS boot
-~~~~~~~~
+=== NFS boot
 
 To achieve NFS-boot, enable _tar root filesystem_ in the _Filesystem
 images_ menu.
@@ -24,8 +21,7 @@ Remember to add this path to +/etc/expor
 
 Then, you can execute a NFS-boot from your target.
 
-Chroot
-------
+== Chroot
 
 If you want to chroot in a generated image, then there are few thing
 you should be aware of:
diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[ccache]]
-Using +ccache+ in Buildroot
-~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Using +ccache+ in Buildroot
 
 http://ccache.samba.org[ccache] is a compiler cache. It stores the
 object files resulting from each compilation process, and is able to
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -1,13 +1,11 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Daily use
----------
+== Daily use
 
 include::rebuilding-packages.txt[]
 
-Offline builds
-~~~~~~~~~~~~~~
+=== Offline builds
 
 If you intend to do an offline build and just want to download
 all sources that you previously selected in the configurator
@@ -20,8 +18,7 @@ all sources that you previously selected
 You can now disconnect or copy the content of your +dl+
 directory to the build-host.
 
-Building out-of-tree
-~~~~~~~~~~~~~~~~~~~~
+=== Building out-of-tree
 
 As default, everything built by Buildroot is stored in the directory
 +output+ in the Buildroot tree.
@@ -63,8 +60,7 @@ and +-C <...>+, simply run (in the outpu
 
 [[env-vars]]
 
-Environment variables
-~~~~~~~~~~~~~~~~~~~~~
+=== Environment variables
 
 Buildroot also honors some environment variables, when they are passed
 to +make+ or set in the environment:
@@ -113,8 +109,7 @@ or +g+++ for building helper-binaries on
  $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 --------------------
 
-Dealing efficiently with filesystem images
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Dealing efficiently with filesystem images
 
 Filesystem images can get pretty big, depending on the filesystem you choose,
 the number of packages, whether you provisioned free space... Yet, some
@@ -152,8 +147,7 @@ your filesystem, those parts may not be 
 should only use sparse files when handling files on the build machine, not
 when transferring them to an actual device that will be used on the target.
 
-Graphing the dependencies between packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Graphing the dependencies between packages
 
 [[graph-depends]]
 
@@ -204,8 +198,7 @@ supported.
 BR2_GRAPH_OUT=svg make graph-depends
 --------------------------------
 
-Graphing the build duration
-~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Graphing the build duration
 
 [[graph-duration]]
 
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -2,16 +2,14 @@
 // vim: set syntax=asciidoc:
 
 [[configure]]
-Details on Buildroot configuration
-----------------------------------
+== Details on Buildroot configuration
 
 All the configuration options in +make *config+ have a help text
 providing details about the option. However, a number of topics
 require additional details that cannot easily be covered in the help
 text and are there covered in the following sections.
 
-Cross-compilation toolchain
-~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Cross-compilation toolchain
 
 A compilation toolchain is the set of tools that allows you to compile
 code for your system. It consists of a compiler (in our case, +gcc+),
@@ -61,8 +59,7 @@ chosen, a number of configuration option
 the following sections.
 
 [[internal-toolchain-backend]]
-Internal toolchain backend
-^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Internal toolchain backend
 
 The _internal toolchain backend_ is the backend where Buildroot builds
 by itself a cross-compilation toolchain, before building the userspace
@@ -128,8 +125,7 @@ Drawbacks of this backend:
   using the _External toolchain backend_.
 
 [[external-toolchain-backend]]
-External toolchain backend
-^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== External toolchain backend
 
 The _external toolchain backend_ allows to use existing pre-built
 cross-compilation toolchains. Buildroot knows about a number of
@@ -219,8 +215,7 @@ Drawbacks of this backend:
   fix from the toolchain vendor, unless you build your external
   toolchain by yourself using Crosstool-NG.
 
-/dev management
-~~~~~~~~~~~~~~~
+=== /dev management
 
 On a Linux system, the +/dev+ directory contains special files, called
 _device files_, that allow userspace applications to access the
@@ -309,8 +304,7 @@ needed, in which case *Dynamic using mde
 Note that if +systemd+ is chosen as init system, /dev management will
 be performed by the +udev+ program provided by +systemd+.
 
-init system
-~~~~~~~~~~~
+=== init system
 
 The _init_ program is the first userspace program started by the
 kernel (it carries the PID number 1), and is responsible for starting
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Contributing to Buildroot
-=========================
+= Contributing to Buildroot
 
 There are many ways in which you can contribute to Buildroot: analyzing
 and fixing bugs, analyzing and fixing package build failures detected by
@@ -23,8 +22,7 @@ source code tarball. Git is the easiest 
 send your patches to the mailing list. Refer to xref:getting-buildroot[]
 for more information on obtaining a Buildroot git tree.
 
-Reproducing, analyzing and fixing bugs
---------------------------------------
+== Reproducing, analyzing and fixing bugs
 
 A first way of contributing is to have a look at the open bug reports in
 the https://bugs.busybox.net/buglist.cgi?product=buildroot[Buildroot bug
@@ -33,8 +31,7 @@ help in reproducing, analyzing and fixin
 welcome. Don't hesitate to add a comment to bug reports reporting your
 findings, even if you don't yet see the full picture.
 
-Analyzing and fixing autobuild failures
----------------------------------------
+== Analyzing and fixing autobuild failures
 
 The Buildroot autobuilders are a set of build machines that continuously
 run Buildroot builds based on random configurations. This is done for
@@ -79,8 +76,7 @@ basically two things that can be done:
 Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
 ---------------------
 
-Reviewing and testing patches
------------------------------
+== Reviewing and testing patches
 
 With the amount of patches sent to the mailing list each day, the
 maintainer has a very hard job to judge which patches are ready to apply
@@ -146,8 +142,7 @@ Buildroot's Patchwork website can be use
 purposes. Please see xref:apply-patches-patchwork[] for more
 information on using Buildroot's Patchwork website to apply patches.
 
-Work on items from the TODO list
---------------------------------
+== Work on items from the TODO list
 
 If you want to contribute to Buildroot but don't know where to start,
 and you don't like any of the above topics, you can always work on items
@@ -157,8 +152,7 @@ Do edit the wiki to indicate when you st
 avoid duplicate efforts.
 
 [[submitting-patches]]
-Submitting patches
-------------------
+== Submitting patches
 
 [NOTE]
 _Please, do not attach patches to bugs, send them to the mailing list
@@ -202,8 +196,7 @@ If you do not use +git send-email+, make
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
 fix your e-mail client, or better yet, learn to use +git send-email+.
 
-Cover letter
-~~~~~~~~~~~~
+=== Cover letter
 
 If you want to present the whole patch set in a separate mail, add
 +--cover-letter+ to the +git format-patch+ command (see +man
@@ -222,8 +215,7 @@ in the following cases:
 * whenever you feel it will help presenting your work, your choices,
   the review process, etc.
 
-Patch revision changelog
-~~~~~~~~~~~~~~~~~~~~~~~~
+=== Patch revision changelog
 
 When improvements are requested, the new revision of each commit
 should include a changelog of the modifications between each
@@ -281,8 +273,7 @@ This can be easily handled with +git for
 ---------------------
 
 [[reporting-bugs]]
-Reporting issues/bugs or getting help
--------------------------------------
+== Reporting issues/bugs or getting help
 
 Before reporting any issue, please check
 xref:mailing-list-subscribe[the mailing list archive] in case someone has
diff --git a/docs/manual/customize-busybox-config.txt b/docs/manual/customize-busybox-config.txt
--- a/docs/manual/customize-busybox-config.txt
+++ b/docs/manual/customize-busybox-config.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[busybox-custom]]
-Customizing the Busybox configuration
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Customizing the Busybox configuration
 
 http://www.busybox.net/[Busybox] is very configurable, and you may
 want to customize it. You can follow these simple steps to do so. This
diff --git a/docs/manual/customize-kernel-config.txt b/docs/manual/customize-kernel-config.txt
--- a/docs/manual/customize-kernel-config.txt
+++ b/docs/manual/customize-kernel-config.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[kernel-custom]]
-Customizing the Linux kernel configuration
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Customizing the Linux kernel configuration
 
 The Linux kernel configuration can be customized just like
 xref:busybox-custom[BusyBox] and xref:uclibc-custom[uClibc] using
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc -*- ;
 
 [[outside-br-custom]]
-Keeping customizations outside Buildroot
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Keeping customizations outside Buildroot
 
 The Buildroot community recommends and encourages upstreaming to the
 official Buildroot version the packages and board support that are
diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc -*- ;
 
 [[packages-custom]]
-Customizing packages
-~~~~~~~~~~~~~~~~~~~~
+=== Customizing packages
 
 It is sometimes useful to apply 'extra' patches to packages - over and
 above those provided in Buildroot. This might be used to support custom
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[rootfs-custom]]
-Customizing the generated target filesystem
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Customizing the generated target filesystem
 
 Besides changing one or another configuration through +make *config+,
 there are a few ways to customize the resulting target filesystem.
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[customize-store]]
-Storing the configuration
--------------------------
+== Storing the configuration
 
 When you have a buildroot configuration that you are satisfied with and
 you want to share it with others, put it under revision control or move
@@ -15,13 +14,11 @@ modifications.
 
 
 [[customize-store-basics]]
-Basics for storing the configuration
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Basics for storing the configuration
 
 
 [[customize-store-buildroot-config]]
-Buildroot configuration
-^^^^^^^^^^^^^^^^^^^^^^^
+==== Buildroot configuration
 
 For storing the buildroot configuration itself, buildroot offers the
 following command: +make savedefconfig+.
@@ -39,8 +36,7 @@ Alternatively, you can copy the file to 
 
 
 [[customize-store-package-config]]
-Other package configuration
-^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Other package configuration
 
 The configuration files for busybox, the linux kernel, barebox and
 uClibc should be stored as well if changed. For each of these, a
@@ -76,8 +72,7 @@ configuration files easier.
 
 
 [[customize-store-board-support]]
-Creating your own board support
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Creating your own board support
 
 Creating your own board support in Buildroot allows users of a
 particular hardware platform to easily build a system that is known to
@@ -112,8 +107,7 @@ and configurations in these directories,
 Buildroot configuration.
 
 
-Step-by-step instructions for storing configuration
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Step-by-step instructions for storing configuration
 
 To store the configuration for a specific product, device or
 application, it is advisable to use the same conventions as for the
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -2,14 +2,12 @@
 // vim: set syntax=asciidoc:
 
 [[toolchain-custom]]
-Customizing the toolchain
-~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Customizing the toolchain
 
 There are three distinct types of toolchain backend supported in Buildroot,
 available under the menu +Toolchain+, invoking +make menuconfig+.
 
-Using the external toolchain backend
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Using the external toolchain backend
 
 There is no way of tuning an external toolchain since Buildroot does not
 generate it.
@@ -29,8 +27,7 @@ set the environment variable +BR2_DEBUG_
 
 * +2+: trace one argument per line
 
-Using the internal Buildroot toolchain backend
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+==== Using the internal Buildroot toolchain backend
 
 The internal Buildroot toolchain backend allows to generate toolchains
 based on http://www.uclibc.org/[uClibc],
diff --git a/docs/manual/customize-uclibc-config.txt b/docs/manual/customize-uclibc-config.txt
--- a/docs/manual/customize-uclibc-config.txt
+++ b/docs/manual/customize-uclibc-config.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[uclibc-custom]]
-Customizing the uClibc configuration
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Customizing the uClibc configuration
 
 Just like xref:busybox-custom[BusyBox], http://www.uclibc.org/[uClibc]
 offers a lot of configuration options. They allow you to select
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Customization
--------------
+== Customization
 
 include::customize-rootfs.txt[]
 
diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
--- a/docs/manual/debugging-buildroot.txt
+++ b/docs/manual/debugging-buildroot.txt
@@ -3,8 +3,7 @@
 
 [[debugging-buildroot]]
 
-Debugging Buildroot
--------------------
+== Debugging Buildroot
 
 It is possible to instrument the steps +Buildroot+ does when building
 packages. Define the variable +BR2_INSTRUMENTATION_SCRIPTS+ to contain
diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
--- a/docs/manual/developer-guide.txt
+++ b/docs/manual/developer-guide.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Developer Guidelines
-====================
+= Developer Guidelines
 
 include::writing-rules.txt[]
 
diff --git a/docs/manual/download-infra.txt b/docs/manual/download-infra.txt
--- a/docs/manual/download-infra.txt
+++ b/docs/manual/download-infra.txt
@@ -3,7 +3,6 @@
 
 [[download-infra]]
 
-Download infrastructure
------------------------
+== Download infrastructure
 
 TODO
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Location of downloaded packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Location of downloaded packages
 
 The various tarballs that are downloaded by Buildroot are all stored
 in +BR2_DL_DIR+, which by default is the +dl+ directory. If you want
diff --git a/docs/manual/eclipse-integration.txt b/docs/manual/eclipse-integration.txt
--- a/docs/manual/eclipse-integration.txt
+++ b/docs/manual/eclipse-integration.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Integration with Eclipse
-------------------------
+== Integration with Eclipse
 
 While a part of the embedded Linux developers like classical text
 editors like Vim or Emacs, and command-line based interfaces, a number
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -1,12 +1,10 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Frequently Asked Questions & Troubleshooting
-============================================
+= Frequently Asked Questions & Troubleshooting
 
 [[faq-boot-hang-after-starting]]
-The boot hangs after 'Starting network...'
-------------------------------------------
+== The boot hangs after 'Starting network...'
 
 If the boot process seems to hang after the following messages
 (messages not necessarily exactly similar, depending on the list of
@@ -28,8 +26,7 @@ configuration+, and modify +Port to run 
 the correct serial port.
 
 [[faq-no-compiler-on-target]]
-Why is there no compiler on the target?
----------------------------------------
+== Why is there no compiler on the target?
 
 It has been decided that support for the _native compiler on the
 target_ would be stopped from the Buildroot-2012.11 release because:
@@ -53,8 +50,7 @@ distribution_ and you should opt for som
 * ...
 
 [[faq-no-dev-files-on-target]]
-Why are there no development files on the target?
--------------------------------------------------
+== Why are there no development files on the target?
 
 Since there is no compiler available on the target (see
 xref:faq-no-compiler-on-target[]), it does not make sense to waste
@@ -64,8 +60,7 @@ Therefore, those files are always remove
 Buildroot-2012.11 release.
 
 [[faq-no-doc-on-target]]
-Why is there no documentation on the target?
---------------------------------------------
+== Why is there no documentation on the target?
 
 Because Buildroot mostly targets _small_ or _very small_ target
 hardware with limited resource onboard (CPU, ram, mass-storage), it
@@ -76,8 +71,7 @@ is not suitable for your purpose, and yo
 distribution_ (see: xref:faq-no-compiler-on-target[]).
 
 [[faq-why-not-visible-package]]
-Why are some packages not visible in the Buildroot config menu?
----------------------------------------------------------------
+== Why are some packages not visible in the Buildroot config menu?
 
 If a package exists in the Buildroot tree and does not appear in the
 config menu, this most likely means that some of the package's
@@ -95,8 +89,7 @@ then you should certainly run a full reb
 more explanations).
 
 [[faq-why-not-use-target-as-chroot]]
-Why not use the target directory as a chroot directory?
--------------------------------------------------------
+== Why not use the target directory as a chroot directory?
 
 There are plenty of reasons to *not* use the target directory a chroot
 one, among these:
@@ -113,8 +106,7 @@ root, then use the tarball image generat
 as root.
 
 [[faq-no-binary-packages]]
-Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
-----------------------------------------------------------------
+== Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
 
 One feature that is often discussed on the Buildroot list is the
 general topic of "package management". To summarize, the idea
diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
--- a/docs/manual/get-involved.txt
+++ b/docs/manual/get-involved.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Getting involved
-================
+= Getting involved
 
 Like any open source project, Buildroot has different ways to share
 information in its community and outside.
@@ -12,8 +11,7 @@ One piece of it is the document you are 
 Each of those ways may interest you if you are looking for some help,
 want to understand Buildroot or contribute to the project.
 
-Mailing List
-------------
+== Mailing List
 
 Buildroot has a mailing list
 http://lists.busybox.net/pipermail/buildroot[] for discussion and
@@ -21,8 +19,7 @@ development.
 
 [[mailing-list-subscribe]]
 
-Subscribing to the mailing list
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Subscribing to the mailing list
 
 You can subscribe by visiting
 http://lists.busybox.net/mailman/listinfo/buildroot[].
@@ -33,16 +30,14 @@ The list is also available through _Gman
 +gmane.comp.lib.uclibc.buildroot+
 http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot[].
 
-Searching the List Archives
-~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Searching the List Archives
 
 Please search the mailing list archives before asking questions on the
 mailing list, since there is a good chance someone else has asked the
 same question before. Checking the archives is a great way to avoid
 annoying everyone on the list with frequently asked questions...
 
-IRC
----
+== IRC
 
 The Buildroot IRC is irc://freenode.net/#buildroot[].
 The channel +#buildroot+ is hosted on Freenode
@@ -52,8 +47,7 @@ When asking for help on IRC, share relev
 using a code sharing website.
 
 [[patchwork]]
-Patchwork
----------
+== Patchwork
 
 Patchwork is a web-based patch tracking system designed to facilitate
 the contribution and management of contributions to an open-source
@@ -72,8 +66,7 @@ The Buildroot patch management interface
 http://patchwork.buildroot.org[].
 
 [[apply-patches-patchwork]]
-Applying Patches from Patchwork
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Applying Patches from Patchwork
 
 The main use of Buildroot's Patchwork website for a developer is for
 pulling in patches into their local git repository for testing
@@ -95,15 +88,13 @@ you can copy the +mbox+ link for the bun
 using the above commands.
 
 [[bugtracker]]
-Bugtracker
-----------
+== Bugtracker
 
 The Buildroot bugtracker is at https://bugs.busybox.net[].
 
 To open a bug, see xref:reporting-bugs[].
 
-Buildroot wikipage
-------------------
+== Buildroot wikipage
 
 After the Buildroot developer day on February 3, 2012,
 a page dedicated to Buildroot has been created on
@@ -114,21 +105,17 @@ This page is reachable at http://elinux.
 Currently, this page is mainly used as a _todo-list_.
 
 [[events]]
-Events
-------
+== Events
 
-Buildroot Developer Days aside ELC-E 2012 (November 3-4, 2012 - Barcelona)
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Buildroot Developer Days aside ELC-E 2012 (November 3-4, 2012 - Barcelona)
 
 * Event page: http://elinux.org/Buildroot:DeveloperDaysELCE2012[]
 
-Buildroot presentation at LSM 2012 (July 12-14, 2012 - Geneva)
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Buildroot presentation at LSM 2012 (July 12-14, 2012 - Geneva)
 
 * Announcement: http://lists.busybox.net/pipermail/buildroot/2012-May/053845.html[]
 
-Buildroot Developer Days aside FOSDEM 2012 (February 3, 2012 - Brussels)
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Buildroot Developer Days aside FOSDEM 2012 (February 3, 2012 - Brussels)
 
 * Announcement & agenda thread: http://lists.busybox.net/pipermail/buildroot/2012-January/049340.html[]
 * Report: http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html[]
diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
--- a/docs/manual/getting.txt
+++ b/docs/manual/getting.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[getting-buildroot]]
-Getting Buildroot
------------------
+== Getting Buildroot
 
 Buildroot releases are made approximately every 3 months. Direct Git
 access and daily snapshots are also available, if you want more
diff --git a/docs/manual/going-further.txt b/docs/manual/going-further.txt
--- a/docs/manual/going-further.txt
+++ b/docs/manual/going-further.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Going further in Buildroot's innards
-====================================
+= Going further in Buildroot's innards
 
 include::how-buildroot-works.txt[]
 
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-How Buildroot works
--------------------
+== How Buildroot works
 
 As mentioned above, Buildroot is basically a set of Makefiles that
 download, configure, and compile software with the correct options. It
diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
--- a/docs/manual/introduction.txt
+++ b/docs/manual/introduction.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-About Buildroot
-===============
+= About Buildroot
 
 Buildroot is a tool that simplifies and automates the process of
 building a complete Linux system for an embedded system, using
diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
--- a/docs/manual/known-issues.txt
+++ b/docs/manual/known-issues.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Known issues
-============
+= Known issues
 
 * The +ltp-testsuite+ package does not build with the default uClibc
   configuration used by the Buildroot toolchain backend. The LTP
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -3,11 +3,9 @@
 
 [[legal-info]]
 
-Legal notice and licensing
-==========================
+= Legal notice and licensing
 
-Complying with open source licenses
------------------------------------
+== Complying with open source licenses
 
 All of the end products of Buildroot (toolchain, root filesystem, kernel,
 bootloaders) contain open source software, released under various licenses.
@@ -71,8 +69,7 @@ When you run +make legal-info+, Buildroo
 file to inform you of relevant material that could not be saved.
 
 [[legal-info-list-licenses]]
-License abbreviations
----------------------
+== License abbreviations
 
 Here is a list of the licenses that are most widely used by packages in
 Buildroot, with the name used in the manifest files:
@@ -126,8 +123,7 @@ Buildroot, with the name used in the man
   http://apache.org/licenses/LICENSE-2.0.html[
   Apache License, version 2.0];
 
-Complying with the Buildroot license
-------------------------------------
+== Complying with the Buildroot license
 
 Buildroot itself is an open source software, released under the
 http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[make-tips]]
-'make' tips
------------
+== 'make' tips
 
 This is a collection of tips that help you make the most of Buildroot.
 
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[makedev-syntax]]
-Makedev syntax documentation
-----------------------------
+== Makedev syntax documentation
 
 The makedev syntax is used in several places in Buildroot to
 define changes to be made for permissions, or which device files to
diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc -*- ;
 
 [[makeuser-syntax]]
-Makeuser syntax documentation
------------------------------
+== Makeuser syntax documentation
 
 The syntax to create users is inspired by the makedev syntax, above, but
 is specific to Buildroot.
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-The Buildroot user manual
-=========================
+= The Buildroot user manual
 :toc:
 
 Buildroot usage and documentation by Thomas Petazzoni. Contributions
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -3,8 +3,7 @@
 
 [[pkg-build-steps]]
 
-Package-specific _make_ targets
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Package-specific _make_ targets
 
 Running +make <package>+ builds and installs that particular package
 and its dependencies.
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -3,8 +3,7 @@
 
 [[patch-policy]]
 
-Patching a package
-------------------
+== Patching a package
 
 While integrating a new package or updating an existing one, it may be
 necessary to patch the source of the software to get it cross-built within
@@ -15,11 +14,9 @@ the builds. It supports three ways of ap
 patches supplied within buildroot and patches located in a user-defined
 global patch directory.
 
-Providing patches
-~~~~~~~~~~~~~~~~~
+=== Providing patches
 
-Downloaded
-^^^^^^^^^^
+==== Downloaded
 
 If it is necessary to apply a patch that is available for download, then add it
 to the +<packagename>_PATCH+ variable. It is downloaded from the same site
@@ -28,8 +25,7 @@ patch series.
 
 This method is typically used for packages from Debian.
 
-Within Buildroot
-^^^^^^^^^^^^^^^^
+==== Within Buildroot
 
 Most patches are provided within Buildroot, in the package
 directory; these typically aim to fix cross-compilation, libc support,
@@ -46,8 +42,7 @@ application order.
 reference in their filename.
 - The field +<number>+ in the patch file name refers to the 'apply order'.
 
-Global patch directory
-^^^^^^^^^^^^^^^^^^^^^^
+==== Global patch directory
 
 The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
 used to specify a space separated list of one or more directories
@@ -55,8 +50,7 @@ containing global package patches. See x
 details.
 
 [[patch-apply-order]]
-How patches are applied
-~~~~~~~~~~~~~~~~~~~~~~~
+=== How patches are applied
 
 . Run the +<packagename>_PRE_PATCH_HOOKS+ commands if defined;
 
@@ -87,8 +81,7 @@ How patches are applied
 
 If something goes wrong in the steps _3_ or _4_, then the build fails.
 
-Format and licensing of the package patches
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Format and licensing of the package patches
 
 Patches are released under the same license as the software that is
 modified.
@@ -130,8 +123,7 @@ AC_PROG_MAKE_SET
 +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
 ---------------
 
-Integrating patches found on the Web
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Integrating patches found on the Web
 
 When integrating a patch of which you are not the author, you have to
 add a few things in the header of the patch itself.
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[requirement]]
-System requirements
--------------------
+== System requirements
 
 Buildroot is designed to run on Linux systems.
 
@@ -17,8 +16,7 @@ for the libraries that may be packaged i
 
 [[requirement-mandatory]]
 
-Mandatory packages
-~~~~~~~~~~~~~~~~~~
+=== Mandatory packages
 
 * Build tools:
 
@@ -45,8 +43,7 @@ Mandatory packages
 
 [[requirement-optional]]
 
-Optional packages
-~~~~~~~~~~~~~~~~~
+=== Optional packages
 
 * Source fetching tools:
 +
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -2,8 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[full-rebuild]]
-Understanding when a full rebuild is necessary
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Understanding when a full rebuild is necessary
 
 Buildroot does not attempt to detect what parts of the system should
 be rebuilt when the system configuration is changed through +make
@@ -82,8 +81,7 @@ For reference, a full rebuild is achieve
 ---------------
 
 [[rebuild-pkg]]
-Understanding how to rebuild packages
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Understanding how to rebuild packages
 
 One of the most common questions asked by Buildroot users is how to
 rebuild a given package or how to remove a package without rebuilding
diff --git a/docs/manual/starting-up.txt b/docs/manual/starting-up.txt
--- a/docs/manual/starting-up.txt
+++ b/docs/manual/starting-up.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Starting up
-===========
+= Starting up
 
 include::prerequisite.txt[]
 
diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Using Buildroot during development
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Using Buildroot during development
 
 The normal operation of Buildroot is to download a tarball, extract
 it, configure, compile and install the software component found inside
diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Using the generated toolchain outside Buildroot
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=== Using the generated toolchain outside Buildroot
 
 You may want to compile, for your target, your own programs or other
 software that are not packaged in Buildroot. In order to do this you
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Using Buildroot
----------------
+== Using Buildroot
 
 Buildroot has a nice configuration tool similar to the one you can
 find in the http://www.kernel.org/[Linux kernel] or in
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Working with Buildroot
-======================
+= Working with Buildroot
 
 This section explains how you can customize Buildroot to fit your
 needs.
@@ -17,8 +16,7 @@ include::common-usage.txt[]
 
 include::eclipse-integration.txt[]
 
-Hacking Buildroot
------------------
+== Hacking Buildroot
 
 If Buildroot does not yet fit all your requirements, you may be
 interested in hacking it to add:
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -1,8 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-Coding style
-------------
+== Coding style
 
 Overall, these coding style rules are here to help you to add new files in
 Buildroot or refactor existing ones.
@@ -17,8 +16,7 @@ file,
 
 [[writing-rules-config-in]]
 
-+Config.in+ file
-~~~~~~~~~~~~~~~~
+=== +Config.in+ file
 
 +Config.in+ files contain entries for almost anything configurable in
 Buildroot.
@@ -49,8 +47,7 @@ http://kernel.org/doc/Documentation/kbui
 
 [[writing-rules-mk]]
 
-The +.mk+ file
-~~~~~~~~~~~~~~
+=== The +.mk+ file
 
 * Header: The file starts with a header. It contains the module name,
 preferably in lowercase, enclosed between separators made of 80 hashes. A
@@ -135,8 +132,7 @@ LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBF
 endif
 ---------------------
 
-The documentation
-~~~~~~~~~~~~~~~~~
+=== The documentation
 
 The documentation uses the
 http://www.methods.co.nz/asciidoc/[asciidoc] format.
