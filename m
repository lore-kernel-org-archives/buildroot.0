From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2012 21:02:04 +0100
Subject: [Buildroot] [PATCHv2 for-2012.11 2/5] manual: various fixes
In-Reply-To: <1354046527-13132-1-git-send-email-arnout@mind.be>
References: <1354046527-13132-1-git-send-email-arnout@mind.be>
Message-ID: <1354046527-13132-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Various consistency and correctness improvements.

Also removing some sentences that are not or no longer relevant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-directory.txt |   13 ++++----
 docs/manual/adding-packages-generic.txt   |   23 ++++++-------
 docs/manual/adding-packages-gettext.txt   |   20 ++++++-----
 docs/manual/adding-packages-tips.txt      |   31 ++++++++++++------
 docs/manual/beyond-buildroot.txt          |    2 ++
 docs/manual/board-support.txt             |    4 +--
 docs/manual/customize-toolchain.txt       |    3 +-
 docs/manual/download-location.txt         |   14 +++++---
 docs/manual/embedded-basics.txt           |    4 ++-
 docs/manual/faq-troubleshooting.txt       |    8 +++--
 docs/manual/how-buildroot-works.txt       |   33 ++++++++++++-------
 docs/manual/legal-notice.txt              |    3 +-
 docs/manual/makedev-syntax.txt            |    3 +-
 docs/manual/package-make-target.txt       |   51 ++++++++++++-----------------
 docs/manual/patch-policy.txt              |   27 +++++++--------
 docs/manual/prerequisite.txt              |    4 +--
 docs/manual/rebuilding-packages.txt       |   40 ++++++++--------------
 docs/manual/using.txt                     |    4 +--
 docs/manual/writing-rules.txt             |   37 ++++++++++++++-------
 19 files changed, 176 insertions(+), 148 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 88a4645..f271e59 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -7,10 +7,11 @@ First of all, create a directory under the +package+ directory for
 your software, for example +libfoo+.
 
 Some packages have been grouped by topic in a sub-directory:
 +multimedia+, +x11r7+, +efl+ and +matchbox+. If your package fits in
 one of these categories, then create your package directory in these.
+New subdirectories are discouraged, however.
 
 
 +Config.in+ file
 ^^^^^^^^^^^^^^^^
 
@@ -30,16 +31,16 @@ config BR2_PACKAGE_LIBFOO
 The +bool+ line, +help+ line and other meta-informations about the
 configuration option must be indented with one tab. The help text
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
 put your package in one of the existing categories). The files
 included there are 'sorted alphabetically' per category and are 'NOT'
@@ -66,13 +67,13 @@ rules:
 * Use a +depends on+ type of dependency when the user really needs to
   be aware of the dependency. Typically, Buildroot uses this type of
   dependency for dependencies on toolchain options (target
   architecture, MMU support, C library, C++ support, large file
   support, thread support, RPC support, IPV6 support, WCHAR support),
-  or for dependencies on "big" things, such as the X.org system. In
-  some cases, especially dependency on toolchain options, it is
-  recommended to add a +comment+ displayed when the option is not
+  or for dependencies on "big" things, such as the X.org system. For
+  dependencies on toolchain options,there should be a +comment+ that
+  is displayed when the option is not
   enabled, so that the user knows why the package is not available.
   The +depends on+ keyword express the dependency with a forward
   semantic.
 
 .Note
@@ -158,11 +159,11 @@ Note that such dependencies will ensure that the dependency option
 is also enabled, but not necessarily built before your package. To do
 so, the dependency also needs to be expressed in the +.mk+ file of the
 package.
 
 Further formatting details: see xref:writing-rules-config-in[the
-writing rules].
+coding style].
 
 The +.mk+ file
 ^^^^^^^^^^^^^^
 
 Finally, here's the hardest part. Create a file named +libfoo.mk+. It
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index ee96bc1..7025320 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -149,15 +149,15 @@ information is (assuming the package name is +libfoo+) :
   Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
 
 * +LIBFOO_PATCH+ may contain the name of a patch, that will be
   downloaded from the same location as the tarball indicated in
   +LIBFOO_SOURCE+. If +HOST_LIBFOO_PATCH+ is not specified, it
-  defaults to +LIBFOO_PATCH+. Also note that another mechanism is
-  available to patch a package: all files of the form
-  +packagename-packageversion-description.patch+ present in the
+  defaults to +LIBFOO_PATCH+. Note that patches that are included
+  in Buildroot itself use a different mechanism: all files of the
+  form +packagename-packageversion-description.patch+ present in the
   package directory inside Buildroot will be applied to the package
-  after extraction.
+  after extraction (see xref:patch-policy[patching a package]).
 
 * +LIBFOO_SITE+ provides the location of the package, which can be a
   URL or a local filesystem path. HTTP, FTP and SCP are supported URL
   types for retrieving package tarballs. Git, Subversion, Mercurial,
   and Bazaar are supported URL types for retrieving packages directly
@@ -249,13 +249,10 @@ information is (assuming the package name is +libfoo+) :
   This name will appear in the manifest file produced by +make legal-info+.
   If the license appears in xref:legal-info-list-licenses[the following list],
   use the same string to make the manifest file uniform.
   Otherwise, describe the license in a precise and concise way, avoiding
   ambiguous names such as +BSD+ which actually name a family of licenses.
-  If the root filesystem you generate contains non-opensource packages, you
-  can define their license as +PROPRIETARY+: Buildroot will not save any
-  licensing info or source code for this package.
   This variable is optional. If it is not defined, +unknown+ will appear in
   the +license+ field of the manifest file for this package.
 
 * +LIBFOO_LICENSE_FILES+ is a space-separated list of files in the package
   tarball that contain the license(s) under which the package is released.
@@ -263,10 +260,15 @@ information is (assuming the package name is +libfoo+) :
   See xref:legal-info[] for more information.
   This variable is optional. If it is not defined, a warning will be produced
   to let you know, and +not saved+ will appear in the +license files+ field
   of the manifest file for this package.
 
+* +LIBFOO_REDISTRIBUTE+ can be set to +YES+ (default) or +NO+ to indicate if
+  the package source code is allowed to be redistributed. Set it to +NO+ for
+  non-opensource packages: Buildroot will not save the source code for this
+  package when collecting the +legal-info+.
+
 The recommended way to define these variables is to use the following
 syntax:
 
 ----------------------
 LIBFOO_VERSION = 2.32
@@ -290,14 +292,13 @@ different steps of the build process.
 
 * +LIBFOO_INSTALL_TARGET_CMDS+ lists the actions to be
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
   package is a target package. The package must install its files to
   the directory given by +$(STAGING_DIR)+. All development files
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index e9446d2..58fd98d 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -25,18 +25,22 @@ Therefore, Buildroot defines two configuration options:
 
 * +BR2_NEEDS_GETTEXT_IF_LOCALE+, which is true if the toolchain
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
index 5e327d2..b5dc017 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -17,11 +17,14 @@ In Buildroot, there is some relationship between:
 * the makefile variable prefix.
 
 It is mandatory to maintain consistency between these elements,
 using the following rules:
 
-* the _make_ target name will be the _package name_ itself (e.g.:
+* the package directory and the +*.mk+ name are the _package name_
+  itself (e.g.: +package/foo-bar_boo/foo-bar_boo.mk+);
+
+* the _make_ target name is the _package name_ itself (e.g.:
   +foo-bar_boo+);
 
 * the config entry is the upper case _package name_ with `.` and `-`
   characters substituted with `_`, prefixed with +BR2_PACKAGE_+ (e.g.:
   +BR2_PACKAGE_FOO_BAR_BOO+);
@@ -33,22 +36,30 @@ using the following rules:
 
 [[github-download-url]]
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
 
 ------------------------
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
+Note that the name of the name of the tarball is the default
++foo-1234567.tar.gz+ so it is not necessary to specify it in the +.mk+
+file.
diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index e7b902d..a87b584 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -17,10 +17,12 @@ NFS-root directory:
 
 -------------------
 sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
 -------------------
 
+Remember to add this path to +/etc/exports+.
+
 Then, you can execute a NFS-boot from your target.
 
 Chroot
 ------
 
diff --git a/docs/manual/board-support.txt b/docs/manual/board-support.txt
index 5a4da2c..44ab6eb 100644
--- a/docs/manual/board-support.txt
+++ b/docs/manual/board-support.txt
@@ -24,12 +24,12 @@ root of the Buildroot source tree. Move this file into the +configs/+
 directory, and rename it +BOARDNAME_defconfig+.
 
 It is recommended to use upstream versions of the Linux kernel and
 bootloaders where possible, and also to use default kernel and bootloader
 configurations if possible. If the defaults are incorrect for
-your platform, we encourage you to send fixes to the corresponding upstream
-projects.
+your board, or no default exists, we encourage you to send fixes to the
+corresponding upstream projects.
 
 However, in the mean time, you may want to store kernel or bootloader
 configuration or patches specific to your target platform. To do so,
 create a directory +board/MANUFACTURER+ and a subdirectory
 +board/MANUFACTURER/BOARDNAME+ (after replacing, of course,
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 11f6f28..2b24412 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -35,12 +35,11 @@ the menu +Toolchain+.
 
 Using the Crosstool-NG backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
-limited set of settings under the Buildroot +Toolchain+ menu (ie. when invoking
-+make menuconfig+); mostly:
+limited set of settings under the Buildroot +Toolchain+ menu:
 
 * The http://crosstool-ng.org[crosstool-NG] configuration file
 
 * Gdb and some toolchain options
 
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 13e675c..4befe0a 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -1,16 +1,16 @@
 // -*- mode:doc; -*-
 
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
 link from the +dl+ directory to the shared download location:
 
@@ -24,5 +24,9 @@ value of DL_DIR in the project is overridden. The following line
 should be added to +<~/.bashrc>+.
 
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
@@ -47,11 +47,13 @@ that runs on your system. If you're using a PC, your compilation
 toolchain runs on an x86 processor and generates code for an x86
 processor. Under most Linux systems, the compilation toolchain uses
 the GNU libc (glibc) as the C standard library. This compilation
 toolchain is called the "host compilation toolchain". The machine on
 which it is running, and on which you're working, is called the "host
-system".
+system" footnote:[This terminology differs from what is used by GNU
+configure, where the host is the machine on which the application will
+run (which is usually the same as target)].
 
 The compilation toolchain is provided by your distribution, and
 Buildroot has nothing to do with it (other than using it to build a
 cross-compilation toolchain and other tools that are run on the
 development host).
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index fc75d66..5a22702 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -96,11 +96,11 @@ distribution_ (see: xref:faq-no-compiler-on-target[]).
 When adding a new package to Buildroot, you will most likely have to
 deal with expressing the dependencies of this package.
 
 In the +Config.in+ file, dependencies may be expressed following two
 semantics.
-See xref:depends-on-vs-select[].
+See xref:depends-on-vs-select[choosing between _depends_ and _select_].
 
 [[faq-why-not-visible-package]]
 Why are some packages not visible in the Buildroot config menu?
 ---------------------------------------------------------------
 
@@ -129,6 +129,10 @@ one, among these:
 * file ownerships, modes and permissions are not correctly set in the
   target directory;
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
@@ -8,29 +8,38 @@ download, configure, and compile software with the correct options. It
 also includes patches for various software packages - mainly the ones
 involved in the cross-compilation toolchain (+gcc+, +binutils+ and
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
 
 * +something.mk+ is the Makefile that downloads, configures,
   compiles and installs the package +something+.
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 989b285..c23b550 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -115,12 +115,11 @@ Buildroot, with the name used in the manifest file:
   http://www.gnu.org/licenses/lgpl.html[
   GNU Lesser General Public License] (any version);
 * +BSD-4c+: Original BSD 4-clause license;
 * +BSD-3c+: BSD 3-clause license;
 * +BSD-2c+: BSD 2-clause license;
-* +PROPRIETARY+: marks a non-opensource package;
-  Buildroot does not save any licensing info or source code for these packages.
+* +MIT+: MIT-style license.
 
 Complying with the Buildroot license
 ------------------------------------
 
 Buildroot itself is an open source software, released under the
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index fc57105..27517b3 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -25,11 +25,12 @@ There are a few non-trivial blocks here:
   * d: a directory
   * c: a character device file
   * b: a block device file
   * p: a named pipe
 - +mode+, +uid+ and +gid+ are the usual permissions settings
-- +major+ and +minor+ are here for device files
+- +major+ and +minor+ are here for device files - set to - for other
+  files
 - +start+, +inc+ and +count+ are for when you want to create a batch
   of files, and can be reduced to a loop, beginning at +start+,
   incrementing its counter by +inc+ until it reaches +count+
 
 Let's say you want to change the permissions of a given file; using
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index e8d5f53..7374957 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -1,31 +1,24 @@
 // -*- mode:doc; -*-
 
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
 
 ------------
 make <package>-<target>
 ------------
 
-In order, the package build commands are:
+The package build targets are (in the order they are executed):
 
 [width="90%",cols="^1,4",options="header"]
 |===================================================
 | command/target    | Description
 
@@ -36,31 +29,26 @@ the source repository, etc)
 build the package
 
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
 
 |===================================================
@@ -72,17 +60,20 @@ Additionally, there are some other useful make targets:
 | command/target    | Description
 
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
@@ -1,11 +1,11 @@
 // -*- mode:doc; -*-
 
 [[patch-policy]]
 
-Patch Policy
-------------
+Patching a package
+------------------
 
 While integrating a new package or updating an existing one, it may be
 necessary to patch the source of the software to get it cross-built within
 Buildroot.
 
@@ -14,19 +14,19 @@ the builds. It supports two ways of applying patch sets: downloaded patches
 and patches supplied within buildroot.
 
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
 
 Most patches are provided within Buildroot, in the package
@@ -70,18 +70,19 @@ Patches are released under the same license as the software that is
 modified.
 
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
 
 ---------------
 configure.ac: add C++ support test
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 38f9a94..17660b7 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -45,13 +45,10 @@ Mandatory packages
 ** +texinfo+ (required for internal Buildroot toolchain backend)
 
 * Source fetching tools:
 ** +wget+
 
-* Configuration interface dependencies (requires development libraries):
-** +ncurses5+
-
 [[requirement-optional]]
 
 Optional packages
 ~~~~~~~~~~~~~~~~~
 
@@ -71,10 +68,11 @@ development context (further details: refer to xref:download-infra[]).
 ** +rsync+
 ** +scp+
 ** +subversion+
 
 * Configuration interface dependencies (requires development libraries):
+** +ncurses5+ to use the 'menuconfig' interface
 ** +qt4+ to use the 'xconfig' interface
 ** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
 
 * Development libraries:
 ** +zlib1+
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index e677590..d6a77a7 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -39,51 +39,39 @@ Understanding how to rebuild packages
 
 One of the most common questions asked by Buildroot users is how to
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
@@ -91,12 +91,12 @@ This directory contains several subdirectories:
   the images built in the +images/+ directory. If you need an
   extracted image of the root filesystem for booting over NFS, then
   use the tarball image generated in +images/+ and extract it as
   root. Compared to +staging/+, +target/+ contains only the files and
   libraries needed to run the selected target applications: the
-  development files (headers, etc.) are not present, unless the
-  +development files in target filesystem+ option is selected.
+  development files (headers, etc.) are not present, the binaries are
+  stripped.
 
 * +host/+ contains the installation of tools compiled for the host
   that are needed for the proper execution of Buildroot, including the
   cross-compilation toolchain.
 
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 2a61639..f6382b5 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -1,18 +1,20 @@
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
 
 +Config.in+ file
 ~~~~~~~~~~~~~~~~
@@ -37,13 +39,13 @@ config BR2_PACKAGE_LIBFOO
   with one tab.
 
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
 
 The +.mk+ file
@@ -53,19 +55,30 @@ The +.mk+ file
 +
 ---------------------
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
 
 ** Prefer multi-line syntax.
 +
-- 
1.7.10.4
