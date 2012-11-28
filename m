From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 17:07:42 -0800
Subject: [Buildroot] [git commit] manual: various fixes
Message-ID: <20121128011238.720DE97200@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65f66c170e6703cf1b75574e7aabea1302f51c50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Various consistency and correctness improvements.

Also removing some sentences that are not or no longer relevant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-conclusion.txt |    3 +-
 docs/manual/adding-packages-directory.txt  |   13 ++++---
 docs/manual/adding-packages-generic.txt    |   25 +++++++------
 docs/manual/adding-packages-gettext.txt    |   20 ++++++----
 docs/manual/adding-packages-tips.txt       |   30 +++++++++++-----
 docs/manual/beyond-buildroot.txt           |    2 +
 docs/manual/board-support.txt              |    4 +-
 docs/manual/customize-toolchain.txt        |    3 +-
 docs/manual/download-location.txt          |   14 +++++---
 docs/manual/embedded-basics.txt            |    4 ++-
 docs/manual/faq-troubleshooting.txt        |    8 +++-
 docs/manual/how-buildroot-works.txt        |   33 +++++++++++------
 docs/manual/legal-notice.txt               |   33 +++++++++---------
 docs/manual/makedev-syntax.txt             |    3 +-
 docs/manual/package-make-target.txt        |   51 +++++++++++----------------
 docs/manual/patch-policy.txt               |   27 ++++++++-------
 docs/manual/prerequisite.txt               |    4 +--
 docs/manual/rebuilding-packages.txt        |   40 ++++++++--------------
 docs/manual/using.txt                      |    4 +-
 docs/manual/writing-rules.txt              |   37 +++++++++++++------
 20 files changed, 193 insertions(+), 165 deletions(-)

diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.txt
index 137b7c3..0f6f0ca 100644
--- a/docs/manual/adding-packages-conclusion.txt
+++ b/docs/manual/adding-packages-conclusion.txt
@@ -8,5 +8,6 @@ matter of writing a Makefile using an existing example and modifying it
 according to the compilation process required by the package.
 
 If you package software that might be useful for other people, don't
-forget to send a patch to the Buildroot mailing list!
+forget to send a patch to the Buildroot mailing list (see
+xref:submitting-patches[])!
 
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 88a4645..5903ed1 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -9,6 +9,7 @@ your software, for example +libfoo+.
 Some packages have been grouped by topic in a sub-directory:
 +multimedia+, +x11r7+, +efl+ and +matchbox+. If your package fits in
 one of these categories, then create your package directory in these.
+New subdirectories are discouraged, however.
 
 
 +Config.in+ file
@@ -32,12 +33,12 @@ configuration option must be indented with one tab. The help text
 itself should be indented with one tab and two spaces, and it must
 mention the upstream URL of the project.
 
-Of course, you can add other sub-options into a +if
+You can add other sub-options into a +if
 BR2_PACKAGE_LIBFOO...endif+ statement to configure particular things
 in your software. You can look at examples in other packages. The
 syntax of the +Config.in+ file is the same as the one for the kernel
 Kconfig file. The documentation for this syntax is available at
-http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt[]
+http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[]
 
 Finally you have to add your new +libfoo/Config.in+ to
 +package/Config.in+ (or in a category subdirectory if you decided to
@@ -68,9 +69,9 @@ rules:
   dependency for dependencies on toolchain options (target
   architecture, MMU support, C library, C++ support, large file
   support, thread support, RPC support, IPV6 support, WCHAR support),
-  or for dependencies on "big" things, such as the X.org system. In
-  some cases, especially dependency on toolchain options, it is
-  recommended to add a +comment+ displayed when the option is not
+  or for dependencies on "big" things, such as the X.org system. For
+  dependencies on toolchain options, there should be a +comment+ that
+  is displayed when the option is not
   enabled, so that the user knows why the package is not available.
   The +depends on+ keyword express the dependency with a forward
   semantic.
@@ -160,7 +161,7 @@ so, the dependency also needs to be expressed in the +.mk+ file of the
 package.
 
 Further formatting details: see xref:writing-rules-config-in[the
-writing rules].
+coding style].
 
 The +.mk+ file
 ^^^^^^^^^^^^^^
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index ee96bc1..3f21f86 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -151,11 +151,11 @@ information is (assuming the package name is +libfoo+) :
 * +LIBFOO_PATCH+ may contain the name of a patch, that will be
   downloaded from the same location as the tarball indicated in
   +LIBFOO_SOURCE+. If +HOST_LIBFOO_PATCH+ is not specified, it
-  defaults to +LIBFOO_PATCH+. Also note that another mechanism is
-  available to patch a package: all files of the form
-  +packagename-packageversion-description.patch+ present in the
-  package directory inside Buildroot will be applied to the package
-  after extraction.
+  defaults to +LIBFOO_PATCH+. Note that patches that are included
+  in Buildroot itself use a different mechanism: all files of the
+  form +<packagename>-*.patch+ present in the package directory inside
+  Buildroot will be applied to the package after extraction (see
+  xref:patch-policy[patching a package]).
 
 * +LIBFOO_SITE+ provides the location of the package, which can be a
   URL or a local filesystem path. HTTP, FTP and SCP are supported URL
@@ -251,9 +251,6 @@ information is (assuming the package name is +libfoo+) :
   use the same string to make the manifest file uniform.
   Otherwise, describe the license in a precise and concise way, avoiding
   ambiguous names such as +BSD+ which actually name a family of licenses.
-  If the root filesystem you generate contains non-opensource packages, you
-  can define their license as +PROPRIETARY+: Buildroot will not save any
-  licensing info or source code for this package.
   This variable is optional. If it is not defined, +unknown+ will appear in
   the +license+ field of the manifest file for this package.
 
@@ -265,6 +262,11 @@ information is (assuming the package name is +libfoo+) :
   to let you know, and +not saved+ will appear in the +license files+ field
   of the manifest file for this package.
 
+* +LIBFOO_REDISTRIBUTE+ can be set to +YES+ (default) or +NO+ to indicate if
+  the package source code is allowed to be redistributed. Set it to +NO+ for
+  non-opensource packages: Buildroot will not save the source code for this
+  package when collecting the +legal-info+.
+
 The recommended way to define these variables is to use the following
 syntax:
 
@@ -292,10 +294,9 @@ different steps of the build process.
   performed to install the package to the target directory, when the
   package is a target package. The package must install its files to
   the directory given by +$(TARGET_DIR)+. Only the files required for
-  'documentation' and 'execution' of the package should be
-  installed. Header files should not be installed, they will be copied
-  to the target, if the +development files in target filesystem+
-  option is selected.
+  'execution' of the package have to be
+  installed. Header files, static libraries and documentation will be
+  removed again when the target filesystem is finalized.
 
 * +LIBFOO_INSTALL_STAGING_CMDS+ lists the actions to be
   performed to install the package to the staging directory, when the
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index e9446d2..58fd98d 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -27,16 +27,20 @@ Therefore, Buildroot defines two configuration options:
   doesn't provide its own gettext implementation and if locale support
   is enabled
 
-Therefore, packages that unconditionally need gettext should:
+Packages that need gettext only when locale support is enabled should:
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT+
+* use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE+ in the
+  +Config.in+ file;
 
-* Use +$(if $(BR2_NEEDS_GETTEXT),gettext)+ in the package
-  +DEPENDENCIES+ variable
+* use +$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)+ in the package
+  +DEPENDENCIES+ variable in the +.mk+ file.
 
-Packages that need gettext only when locale support is enabled should:
+Packages that unconditionally need gettext (which should be very rare)
+should:
+
+* use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT+ in the +Config.in+
+  file;
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE+
+* use +$(if $(BR2_NEEDS_GETTEXT),gettext)+ in the package
+  +DEPENDENCIES+ variable in the +.mk+ file.
 
-* Use +$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)+ in the package
-  +DEPENDENCIES+ variable
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 5e327d2..acdee40 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -19,7 +19,10 @@ In Buildroot, there is some relationship between:
 It is mandatory to maintain consistency between these elements,
 using the following rules:
 
-* the _make_ target name will be the _package name_ itself (e.g.:
+* the package directory and the +*.mk+ name are the _package name_
+  itself (e.g.: +package/foo-bar_boo/foo-bar_boo.mk+);
+
+* the _make_ target name is the _package name_ itself (e.g.:
   +foo-bar_boo+);
 
 * the config entry is the upper case _package name_ with `.` and `-`
@@ -35,15 +38,9 @@ using the following rules:
 How to add a package from github
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-If the package has no release version, or its version cannot be
-identified using tag, then the sha1 of the particular commit should be
-used to identify the version (the first 7 characters of the sha1 are
-enough):
-
-------------------------
-FOO_VERSION = 1234567
-FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
-------------------------
+Packages on github often don't have a download area with release tarballs.
+However, it is possible to download tarballs directly from the repository
+on github.
 
 If the package version matches a tag, then this tag should be used to
 identify the version:
@@ -52,3 +49,16 @@ identify the version:
 FOO_VERSION = v1.0
 FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
 ------------------------
+
+If the package has no release version, or its version cannot be
+identified using tag, then the SHA1 of the particular commit should be
+used to identify the version (the first 7 characters of the SHA1 are
+enough):
+
+------------------------
+FOO_VERSION = 1234567
+FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
+------------------------
+
+Note that the name of the tarball is the default +foo-1234567.tar.gz+
+so it is not necessary to specify it in the +.mk+ file.
diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index e7b902d..a87b584 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -19,6 +19,8 @@ NFS-root directory:
 sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
 -------------------
 
+Remember to add this path to +/etc/exports+.
+
 Then, you can execute a NFS-boot from your target.
 
 Chroot
diff --git a/docs/manual/board-support.txt b/docs/manual/board-support.txt
index 5a4da2c..44ab6eb 100644
--- a/docs/manual/board-support.txt
+++ b/docs/manual/board-support.txt
@@ -26,8 +26,8 @@ directory, and rename it +BOARDNAME_defconfig+.
 It is recommended to use upstream versions of the Linux kernel and
 bootloaders where possible, and also to use default kernel and bootloader
 configurations if possible. If the defaults are incorrect for
-your platform, we encourage you to send fixes to the corresponding upstream
-projects.
+your board, or no default exists, we encourage you to send fixes to the
+corresponding upstream projects.
 
 However, in the mean time, you may want to store kernel or bootloader
 configuration or patches specific to your target platform. To do so,
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 11f6f28..2b24412 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -37,8 +37,7 @@ Using the Crosstool-NG backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
-limited set of settings under the Buildroot +Toolchain+ menu (ie. when invoking
-+make menuconfig+); mostly:
+limited set of settings under the Buildroot +Toolchain+ menu:
 
 * The http://crosstool-ng.org[crosstool-NG] configuration file
 
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 13e675c..4befe0a 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -3,12 +3,12 @@
 Location of downloaded packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-It might be useful to know that the various tarballs that are
-downloaded by the Makefiles are all stored in +DL_DIR+ which by
-default is the +dl+ directory. This is useful, for example, if you want
+The various tarballs that are downloaded by Buildroot are all stored in
++DL_DIR+, which by default is the +dl+ directory. If you want
 to keep a complete version of Buildroot which is known to be working
-with the associated tarballs. This will allow you to regenerate the
-toolchain and the target filesystem with exactly the same versions.
+with the associated tarballs, you can make a copy of this directory.
+This will allow you to regenerate the toolchain and the target filesystem
+with exactly the same versions.
 
 If you maintain several Buildroot trees, it might be better to have a
 shared download location. This can be accessed by creating a symbolic
@@ -26,3 +26,7 @@ should be added to +<~/.bashrc>+.
 -----------------
  $ export BUILDROOT_DL_DIR <shared download location>
 -----------------
+
+The download location can also be set in the +.config+ file, with the
++BR2_DL_DIR+ option. This value is overridden by the +BUILDROOT_DL_DIR+
+environment variable.
diff --git a/docs/manual/embedded-basics.txt b/docs/manual/embedded-basics.txt
index a33338c..fdadf62 100644
--- a/docs/manual/embedded-basics.txt
+++ b/docs/manual/embedded-basics.txt
@@ -49,7 +49,9 @@ processor. Under most Linux systems, the compilation toolchain uses
 the GNU libc (glibc) as the C standard library. This compilation
 toolchain is called the "host compilation toolchain". The machine on
 which it is running, and on which you're working, is called the "host
-system".
+system" footnote:[This terminology differs from what is used by GNU
+configure, where the host is the machine on which the application will
+run (which is usually the same as target)].
 
 The compilation toolchain is provided by your distribution, and
 Buildroot has nothing to do with it (other than using it to build a
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index fc75d66..5a22702 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -98,7 +98,7 @@ deal with expressing the dependencies of this package.
 
 In the +Config.in+ file, dependencies may be expressed following two
 semantics.
-See xref:depends-on-vs-select[].
+See xref:depends-on-vs-select[choosing between _depends_ and _select_].
 
 [[faq-why-not-visible-package]]
 Why are some packages not visible in the Buildroot config menu?
@@ -131,4 +131,8 @@ one, among these:
 * device nodes are not created in the target directory.
 
 For these reasons, commands run through chroot, using the target
-directory as the new root, would fail.
+directory as the new root, will most likely fail.
+
+If you want to run the target filesystem inside a chroot, or as an NFS
+root, then use the tarball image generated in +images/+ and extract it
+as root.
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index 7e33d8e..ec08f95 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -10,25 +10,34 @@ involved in the cross-compilation toolchain (+gcc+, +binutils+ and
 +uClibc+).
 
 There is basically one Makefile per software package, and they are
-named with the +.mk+ extension. Makefiles are split into three main
-sections:
+named with the +.mk+ extension. Makefiles are split into many different
+parts.
 
-* *toolchain* (in the +toolchain/+ directory) contains the Makefiles
+* The +toolchain/+ directory contains the Makefiles
   and associated files for all software related to the
   cross-compilation toolchain: +binutils+, +gcc+, +gdb+,
   +kernel-headers+ and +uClibc+.
 
-* *package* (in the +package/+ directory) contains the Makefiles and
-  associated files for all user-space tools that Buildroot can compile
-  and add to the target root filesystem. There is one sub-directory
-  per tool.
+* The +arch/+ directory contains the definitions for all the processor
+  architectures that are supported by Buildroot.
 
-* *target* (in the +target+ directory) contains the Makefiles and
+* The +package/+ directory contains the Makefiles and
+  associated files for all user-space tools and libraries that Buildroot
+  can compile and add to the target root filesystem. There is one
+  sub-directory per package.
+
+* The +linux/+ directory contains the Makefiles and associated files for
+  the Linux kernel.
+
+* The +boot/+ directory contains the Makefiles and associated files for
+  the bootloaders supported by Buildroot.
+
+* The +system/+ directory contains support for system integration, e.g.
+  the target filesystem skeleton and the selection of an init system.
+
+* The +fs/+ directory contains the Makefiles and
   associated files for software related to the generation of the
-  target root filesystem image. Four types of filesystems are
-  supported: ext2, jffs2, cramfs and squashfs. For each of them there
-  is a sub-directory with the required files. There is also a
-  +default/+ directory that contains the target filesystem skeleton.
+  target root filesystem image.
 
 Each directory contains at least 2 files:
 
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 989b285..0f30234 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -73,52 +73,51 @@ License abbreviations
 Here is a list of the licenses that are most widely used by packages in
 Buildroot, with the name used in the manifest file:
 
-* +GPLv2+:
+* `GPLv2`:
   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
   GNU General Public License, version 2];
-* +GPLv2++:
+* `GPLv2+`:
   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
   GNU General Public License, version 2]
   or (at your option) any later version;
-* +GPLv3+:
+* `GPLv3`:
   http://www.gnu.org/licenses/gpl.html[
   GNU General Public License, version 3];
-* +GPLv3++:
+* `GPLv3+`:
   http://www.gnu.org/licenses/gpl.html[
   GNU General Public License, version 3]
   or (at your option) any later version;
-* +GPL+:
+* `GPL`:
   http://www.gnu.org/licenses/gpl.html[
   GNU General Public License] (any version);
-* +LGPLv2+:
+* `LGPLv2`:
   http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
   GNU Library General Public License, version 2];
-* +LGPLv2++:
+* `LGPLv2+`:
   http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
   GNU Library General Public License, version 2.1]
   or (at your option) any later version;
-* +LGPLv2.1+:
+* `LGPLv2.1`:
   http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
   GNU Lesser General Public License, version 2.1];
-* +LGPLv2.1++:
+* `LGPLv2.1+`:
   http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
   GNU Lesser General Public License, version 2.1]
   or (at your option) any later version;
-* +LGPLv3+:
+* `LGPLv3`:
   http://www.gnu.org/licenses/lgpl.html[
   GNU Lesser General Public License, version 3];
-* +LGPLv3++:
+* `LGPLv3+`:
   http://www.gnu.org/licenses/lgpl.html[
   GNU Lesser General Public License, version 3]
   or (at your option) any later version;
-* +LGPL+:
+* `LGPL`:
   http://www.gnu.org/licenses/lgpl.html[
   GNU Lesser General Public License] (any version);
-* +BSD-4c+: Original BSD 4-clause license;
-* +BSD-3c+: BSD 3-clause license;
-* +BSD-2c+: BSD 2-clause license;
-* +PROPRIETARY+: marks a non-opensource package;
-  Buildroot does not save any licensing info or source code for these packages.
+* `BSD-4c`: Original BSD 4-clause license;
+* `BSD-3c`: BSD 3-clause license;
+* `BSD-2c`: BSD 2-clause license;
+* `MIT`: MIT-style license.
 
 Complying with the Buildroot license
 ------------------------------------
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index fc57105..27517b3 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -27,7 +27,8 @@ There are a few non-trivial blocks here:
   * b: a block device file
   * p: a named pipe
 - +mode+, +uid+ and +gid+ are the usual permissions settings
-- +major+ and +minor+ are here for device files
+- +major+ and +minor+ are here for device files - set to - for other
+  files
 - +start+, +inc+ and +count+ are for when you want to create a batch
   of files, and can be reduced to a loop, beginning at +start+,
   incrementing its counter by +inc+ until it reaches +count+
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index e8d5f53..7374957 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -2,20 +2,13 @@
 
 [[pkg-build-steps]]
 
-Package make targets
-~~~~~~~~~~~~~~~~~~~~
+Package-specific _make_ targets
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-A +make <package>+ call achieves several _make targets_ with, as a
-result, this particular package and its dependencies built, installed
-in their destination directory (target, staging or host directory).
+Running +make <package>+ builds and installs that particular package
+and its dependencies.
 
-For packages based on the Buildroot infrastructures (+generic-package+,
-+autotools-package+ or +cmake-package+), each of those
-actions/steps/commands. For packages relying on other build system,
-then there is no other choice than looking at the +.mk+ file (see also
-the xref:rebuild-pkg[]).
-
-For packages relying on the Buildroot infrastructures, there are
+For packages relying on the Buildroot infrastructure, there are
 numerous special make targets that can be called independently like
 this:
 
@@ -23,7 +16,7 @@ this:
 make <package>-<target>
 ------------
 
-In order, the package build commands are:
+The package build targets are (in the order they are executed):
 
 [width="90%",cols="^1,4",options="header"]
 |===================================================
@@ -38,27 +31,22 @@ build the package
 | +extract+         | Put the source in the package build directory
 (extract the tarball, copy the source, etc)
 
-| +patch+           | Apply the patches if any
+| +patch+           | Apply the patches, if any
 
-| +configure+       | Run the configure command
+| +configure+       | Run the configure commands, if any
 
-| +build+           | Compile the source
+| +build+           | Run the compilation commands
 
 | +install-staging+ |
 *target package:* Run the installation of the package in the
-staging directory
-
-*host package:* Does nothing
+staging directory, if necessary
 
 | +install-target+  |
 *target package:* Run the installation of the package in the
-staging directory
-
-*host package:* Does nothing
+target directory, if necessary
 
 | +install+         |
-*target package:* Run the 2 previous installation commands for the
-target packages
+*target package:* Run the 2 previous installation commands
 
 *host package:* Run the installation of the package in the host
 directory
@@ -74,15 +62,18 @@ Additionally, there are some other useful make targets:
 | +show-depends+    | Displays the dependencies required to build the
 package
 
-| +clean+           | Clean the package build directory, also
-uninstall the package from both the target and the staging directory
+| +clean+           | Run the clean command of the package, also
+uninstall the package from both the target and the staging directory; _note
+that this is not implemented for all packages_
 
 | +dirclean+        | Remove the whole package build directory
 
-| +rebuild+         | Rebuild only necessary binaries and install them
-again
+| +rebuild+         | Re-run the compilation commands - this only makes
+sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a file
+directly in the build directory
 
-| +reconfigure+     | Re-run the configure command, then rebuild
-only necessary binaries, and lastly install them again
+| +reconfigure+     | Re-run the configure commands, then rebuild - this only
+makes sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a
+file directly in the build directory
 
 |===================================================
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index b65855e..9bc6537 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -2,8 +2,8 @@
 
 [[patch-policy]]
 
-Patch Policy
-------------
+Patching a package
+------------------
 
 While integrating a new package or updating an existing one, it may be
 necessary to patch the source of the software to get it cross-built within
@@ -16,15 +16,15 @@ and patches supplied within buildroot.
 Providing patches
 ~~~~~~~~~~~~~~~~~
 
-Additional tarball
-^^^^^^^^^^^^^^^^^^
+Downloaded
+^^^^^^^^^^
 
-If it is necessary to apply a patch set available as a downloadable
-tarball, then add the patch tarball to the +<packagename>_PATCH+
-variable.
+If it is necessary to apply a patch that is available for download, then it
+to the +<packagename>_PATCH+ variable. It is downloaded from the same site
+as the package itself. It can be a single patch, or a tarball containing a
+patch series.
 
-Note that the patch tarballs are downloaded from the same site as the
-sources.
+This method is typically used for packages from Debian.
 
 Within Buildroot
 ^^^^^^^^^^^^^^^^
@@ -72,14 +72,15 @@ modified.
 A message explaining what the patch does, and why it is needed, should
 be added in the header commentary of the patch.
 
-You should add a +signed-off-by+ statement in the header of the each
-patch to help with keeping track of the changes.
+You should add a +Signed-off-by+ statement in the header of the each
+patch to help with keeping track of the changes and to certify that the
+patch is released under the same license as the software that is modified.
 
 If the software is under version control, it is recommended to use the
-SCM software to generate the patch set.
+upstream SCM software to generate the patch set.
 
 Otherwise, concatenate the header with the output of the
-+diff -purN source.c.orig source.c+ command.
++diff -purN package-version.orig/ package-version/+ command.
 
 At the end, the patch should look like:
 
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 38f9a94..17660b7 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -47,9 +47,6 @@ Mandatory packages
 * Source fetching tools:
 ** +wget+
 
-* Configuration interface dependencies (requires development libraries):
-** +ncurses5+
-
 [[requirement-optional]]
 
 Optional packages
@@ -73,6 +70,7 @@ development context (further details: refer to xref:download-infra[]).
 ** +subversion+
 
 * Configuration interface dependencies (requires development libraries):
+** +ncurses5+ to use the 'menuconfig' interface
 ** +qt4+ to use the 'xconfig' interface
 ** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
 
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index e677590..d6a77a7 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -41,49 +41,37 @@ One of the most common questions asked by Buildroot users is how to
 rebuild a given package or how to remove a package without rebuilding
 everything from scratch.
 
-Removing a package is currently unsupported by Buildroot without
+Removing a package is unsupported by Buildroot without
 rebuilding from scratch. This is because Buildroot doesn't keep track
 of which package installs what files in the +output/staging+ and
-+output/target+ directories. However, implementing clean package
-removal is on the TODO-list of Buildroot developers.
++output/target+ directories, or which package would be compiled differently
+depending on the availability of another package.
 
 The easiest way to rebuild a single package from scratch is to remove
 its build directory in +output/build+. Buildroot will then re-extract,
-re-configure, re-compile and re-install this package from scratch.
+re-configure, re-compile and re-install this package from scratch. You
+can ask buildroot to do this with the +make <package>-dirclean+ command.
 
-For convenience, most packages support the special make targets
-<package>-reconfigure and <package>-rebuild to repeat the configure
-and build steps.
+For convenience, the special make targets
+<package>-reconfigure and <package>-rebuild repeat the configure
+resp. build steps.
 
 However, if you don't want to rebuild the package completely from
 scratch, a better understanding of the Buildroot internals is
 needed. Internally, to keep track of which steps have been done and
 which steps remain to be done, Buildroot maintains stamp files (empty
-files that just tell whether this or that action has been done). The
-problem is that these stamp files are not uniformly named and handled
-by the different packages, so some understanding of the particular
-package is needed.
+files that just tell whether this or that action has been done):
 
-For packages relying on Buildroot packages infrastructures (see
-xref:adding-packages[this section] for details), the following stamp
-files are relevant:
-
-* +output/build/packagename-version/.stamp_configured+. If removed,
+* +output/build/<package>-<version>/.stamp_configured+. If removed,
   Buildroot will trigger the recompilation of the package from the
   configuration step (execution of +./configure+).
 
-* +output/build/packagename-version/.stamp_built+. If removed,
+* +output/build/<package>-<version>/.stamp_built+. If removed,
   Buildroot will trigger the recompilation of the package from the
   compilation step (execution of +make+).
 
-.Notes
-- Since the _Buildroot-2012.11_ release, all packages rely on the
-Buildroot infrastructures.
-- Only toolchain packages remain using custom makefiles (i.e. do not
-use any Buildroot infrastructure).
-- Most, if not all, packages and toolchain packages will progressively
-be ported over to the generic, autotools or CMake infrastructure,
-making it much easier to rebuild individual packages.
+Note: toolchain packages use custom makefiles. Their stamp files are named
+differently.
 
-Further details about package special make target at the
+Further details about package special make targets are explained in
 xref:pkg-build-steps[].
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 9436981..6e144d0 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -93,8 +93,8 @@ This directory contains several subdirectories:
   use the tarball image generated in +images/+ and extract it as
   root. Compared to +staging/+, +target/+ contains only the files and
   libraries needed to run the selected target applications: the
-  development files (headers, etc.) are not present, unless the
-  +development files in target filesystem+ option is selected.
+  development files (headers, etc.) are not present, the binaries are
+  stripped.
 
 * +host/+ contains the installation of tools compiled for the host
   that are needed for the proper execution of Buildroot, including the
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 2a61639..f6382b5 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -1,16 +1,18 @@
 // -*- mode:doc; -*-
 
-Writing rules
--------------
+Coding style
+------------
 
-Overall, these writing rules are here to help you add new files in
+Overall, these coding style rules are here to help you to add new files in
 Buildroot or refactor existing ones.
 
 If you slightly modify some existing file, the important thing is
-keeping the consistency of the whole file, so you can:
-* either follow the potentially deprecated rules used all over this
-file
-* or entirely rework it in order to make it comply with those rules.
+to keep the consistency of the whole file, so you can:
+
+* either follow the potentially deprecated coding style used in this
+file,
+
+* or entirely rework it in order to make it comply with these rules.
 
 [[writing-rules-config-in]]
 
@@ -39,9 +41,9 @@ config BR2_PACKAGE_LIBFOO
 * The help text itself should be indented with one tab and two
   spaces.
 
-The configuration system used in Buildroot, so the content of the
-+Config.in+ files, is regular _Kconfig_. Further details about
-_Kconfig_: refer to
+The +Config.in+ files are the input for the configuration tool
+used in Buildroot, which is the regular _Kconfig_. For further
+details about the _Kconfig_ language, refer to
 http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[].
 
 [[writing-rules-mk]]
@@ -55,15 +57,26 @@ The +.mk+ file
 LIBFOO_VERSION = 1.0
 LIBFOO_CONF_OPT += --without-python-support
 ---------------------
++
+It is also possible to align the +=+ signs:
++
+---------------------
+LIBFOO_VERSION   = 1.0
+LIBFOO_SOURCE    = foo-$(LIBFOO_VERSION).tar.gz
+LIBFOO_CONF_OPT += --without-python-support
+---------------------
 
 * Indentation: use tab only:
 +
 ---------------------
 define LIBFOO_REMOVE_DOC
-$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
-	$(TARGET_DIR)/usr/share/man/man3/libfoo*
+	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
+		$(TARGET_DIR)/usr/share/man/man3/libfoo*
 endef
 ---------------------
++
+Note that commands inside a +define+ block should always start with a tab,
+so _make_ recognizes them as commands.
 
 * Optional dependency:
 
