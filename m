From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2012 22:59:16 +0100
Subject: [Buildroot] [PATCHv3 for-2012.11 1/5] manual: trivial fixes
Message-ID: <1354053560-30352-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
As promised, here is the series with the trivial fixes split off.
This patch doesn't require review IMHO.
---
 docs/manual/adding-packages-autotools.txt  |    4 +--
 docs/manual/adding-packages-cmake.txt      |    4 +--
 docs/manual/adding-packages-conclusion.txt |    2 +-
 docs/manual/adding-packages-directory.txt  |    2 +-
 docs/manual/adding-packages-generic.txt    |   34 +++++++++----------
 docs/manual/adding-packages-tips.txt       |    4 +--
 docs/manual/board-support.txt              |    2 +-
 docs/manual/common-usage.txt               |    8 ++---
 docs/manual/customize-rootfs.txt           |    8 ++---
 docs/manual/customize-toolchain.txt        |   10 +++---
 docs/manual/customize-uclibc-config.txt    |   11 +++---
 docs/manual/embedded-basics.txt            |    2 +-
 docs/manual/external-toolchain.txt         |    9 ++---
 docs/manual/how-buildroot-works.txt        |    2 +-
 docs/manual/introduction.txt               |    4 +--
 docs/manual/legal-notice.txt               |   27 ++++++++++-----
 docs/manual/make-tips.txt                  |   50 ++++++++++++++++------------
 docs/manual/makedev-syntax.txt             |    2 +-
 docs/manual/patch-policy.txt               |    9 ++---
 docs/manual/prerequisite.txt               |    2 +-
 docs/manual/rebuilding-packages.txt        |    4 +--
 docs/manual/using.txt                      |   22 ++++++------
 docs/manual/writing-rules.txt              |    4 +--
 23 files changed, 122 insertions(+), 104 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 1184b69..4127df4 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -131,17 +131,17 @@ cases, typical packages will therefore only use a few of them.
   not. Valid values are +YES+ and +NO+. By
   default, the value is +YES+
 
 * +LIBFOO_INSTALL_STAGING_OPT+ contains the make options
   used to install the package to the staging directory. By default, the
-  value is +DESTDIR=$$(STAGING_DIR) install+, which is
+  value is +DESTDIR=$(STAGING_DIR) install+, which is
   correct for most autotools packages. It is still possible to override
   it.
 
 * +LIBFOO_INSTALL_TARGET_OPT+ contains the make options
   used to install the package to the target directory. By default, the
-  value is +DESTDIR=$$(TARGET_DIR) install+. The default
+  value is +DESTDIR=$(TARGET_DIR) install+. The default
   value is correct for most autotools packages, but it is still possible
   to override it if needed.
 
 * +LIBFOO_CLEAN_OPT+ contains the make options used to
   clean the package. By default, the value is +clean+.
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 81ac0a7..4a9e893 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -113,16 +113,16 @@ typical packages will therefore only use a few of them.
   in the build step. These are passed after the +make+ command. By
   default, empty.
 
 * +LIBFOO_INSTALL_STAGING_OPT+ contains the make options used to
   install the package to the staging directory. By default, the value
-  is +DESTDIR=$$(STAGING_DIR) install+, which is correct for most
+  is +DESTDIR=$(STAGING_DIR) install+, which is correct for most
   CMake packages. It is still possible to override it.
 
 * +LIBFOO_INSTALL_TARGET_OPT+ contains the make options used to
   install the package to the target directory. By default, the value
-  is +DESTDIR=$$(TARGET_DIR) install+. The default value is correct
+  is +DESTDIR=$(TARGET_DIR) install+. The default value is correct
   for most CMake packages, but it is still possible to override it if
   needed.
 
 * +LIBFOO_CLEAN_OPT+ contains the make options used to clean the
   package. By default, the value is +clean+.
diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.txt
index 42f1c8f..137b7c3 100644
--- a/docs/manual/adding-packages-conclusion.txt
+++ b/docs/manual/adding-packages-conclusion.txt
@@ -6,7 +6,7 @@ Conclusion
 As you can see, adding a software package to Buildroot is simply a
 matter of writing a Makefile using an existing example and modifying it
 according to the compilation process required by the package.
 
 If you package software that might be useful for other people, don't
-forget to send a patch to Buildroot developers!
+forget to send a patch to the Buildroot mailing list!
 
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c8f41ff..88a4645 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -5,11 +5,11 @@ Package directory
 
 First of all, create a directory under the +package+ directory for
 your software, for example +libfoo+.
 
 Some packages have been grouped by topic in a sub-directory:
-+multimedia+, +java+, +x11r7+, and +games+. If your package fits in
++multimedia+, +x11r7+, +efl+ and +matchbox+. If your package fits in
 one of these categories, then create your package directory in these.
 
 
 +Config.in+ file
 ^^^^^^^^^^^^^^^^
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b05043a..ee96bc1 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -173,12 +173,12 @@ information is (assuming the package name is +libfoo+) :
   If +HOST_LIBFOO_SITE+ is not specified, it defaults to
   +LIBFOO_SITE+.
   Examples: +
     +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
     +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
-    +LIBFOO_SITE=git://github.com/kergoth/tslib.git+
-    +LIBFOO_SITE=/opt/software/libfoo.tar.gz+
+    +LIBFOO_SITE=git://github.com/kergoth/tslib.git+ +
+    +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
     +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
 
 * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
   package source code. In many cases, Buildroot guesses the method
   from the contents of +LIBFOO_SITE+ and setting +LIBFOO_SITE_METHOD+
@@ -219,11 +219,11 @@ information is (assuming the package name is +libfoo+) :
 
 * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
   name) that are required for the current target package to
   compile. These dependencies are guaranteed to be compiled and
   installed before the configuration of the current package starts. In
-  a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependency for
+  a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for
   the current host package.
 
 * +LIBFOO_INSTALL_STAGING+ can be set to +YES+ or +NO+ (default). If
   set to +YES+, then the commands in the +LIBFOO_INSTALL_STAGING_CMDS+
   variables are executed to install the package into the staging
@@ -273,50 +273,50 @@ LIBFOO_VERSION = 2.32
 ----------------------
 
 Now, the variables that define what should be performed at the
 different steps of the build process.
 
-* +LIBFOO_CONFIGURE_CMDS+, used to list the actions to be performed to
-  configure the package before its compilation
+* +LIBFOO_CONFIGURE_CMDS+ lists the actions to be performed to
+  configure the package before its compilation.
 
-* +LIBFOO_BUILD_CMDS+, used to list the actions to be performed to
-  compile the package
+* +LIBFOO_BUILD_CMDS+ lists the actions to be performed to
+  compile the package.
 
-* +HOST_LIBFOO_INSTALL_CMDS+, used to list the actions to be performed
+* +HOST_LIBFOO_INSTALL_CMDS+ lists the actions to be performed
   to install the package, when the package is a host package. The
   package must install its files to the directory given by
   +$(HOST_DIR)+. All files, including development files such as
   headers should be installed, since other packages might be compiled
   on top of this package.
 
-* +LIBFOO_INSTALL_TARGET_CMDS+, used to list the actions to be
+* +LIBFOO_INSTALL_TARGET_CMDS+ lists the actions to be
   performed to install the package to the target directory, when the
   package is a target package. The package must install its files to
   the directory given by +$(TARGET_DIR)+. Only the files required for
   'documentation' and 'execution' of the package should be
   installed. Header files should not be installed, they will be copied
   to the target, if the +development files in target filesystem+
   option is selected.
 
-* +LIBFOO_INSTALL_STAGING_CMDS+, used to list the actions to be
+* +LIBFOO_INSTALL_STAGING_CMDS+ lists the actions to be
   performed to install the package to the staging directory, when the
   package is a target package. The package must install its files to
   the directory given by +$(STAGING_DIR)+. All development files
   should be installed, since they might be needed to compile other
   packages.
 
-* +LIBFOO_CLEAN_CMDS+, used to list the actions to perform to clean up
+* +LIBFOO_CLEAN_CMDS+, lists the actions to perform to clean up
   the build directory of the package.
 
-* +LIBFOO_UNINSTALL_TARGET_CMDS+, used to list the actions to
+* +LIBFOO_UNINSTALL_TARGET_CMDS+ lists the actions to
   uninstall the package from the target directory +$(TARGET_DIR)+
 
-* +LIBFOO_UNINSTALL_STAGING_CMDS+, used to list the actions to
+* +LIBFOO_UNINSTALL_STAGING_CMDS+ lists the actions to
   uninstall the package from the staging directory +$(STAGING_DIR)+.
 
-* +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+, used
-  to install init scripts either for the systemV-like init systems
+* +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+ list the
+  actions to install init scripts either for the systemV-like init systems
   (busybox, sysvinit, etc.) or for the systemd units. These commands
   will be run only when the relevant init system is installed (i.e. if
   systemd is selected as the init system in the configuration, only
   +LIBFOO_INSTALL_INIT_SYSTEMD+ will be run).
 
@@ -350,12 +350,12 @@ file already has full control over the actions performed in each step
 of the package construction. The hooks are more useful for packages
 using the autotools infrastructure described below.  However, since
 they are provided by the generic infrastructure, they are documented
 here. The exception is +LIBFOO_POST_PATCH_HOOKS+.  Patching the
 package and producing legal info are not user definable, so
-+LIBFOO_POST_PATCH_HOOKS+ and +LIBFOO_POST_LEGAL_INFO_HOOKS+ will be
-userful for generic packages.
++LIBFOO_POST_PATCH_HOOKS+ and +LIBFOO_POST_LEGAL_INFO_HOOKS+ are
+useful for generic packages.
 
 The following hook points are available:
 
 * +LIBFOO_POST_PATCH_HOOKS+
 * +LIBFOO_PRE_CONFIGURE_HOOKS+
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 6ec632d..5e327d2 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -30,12 +30,12 @@ using the following rules:
   `.` and `-` characters substituted with `_` (e.g.:
   +FOO_BAR_BOO_VERSION+).
 
 
 [[github-download-url]]
-How to add package from github
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+How to add a package from github
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 If the package has no release version, or its version cannot be
 identified using tag, then the sha1 of the particular commit should be
 used to identify the version (the first 7 characters of the sha1 are
 enough):
diff --git a/docs/manual/board-support.txt b/docs/manual/board-support.txt
index 271f3e0..5a4da2c 100644
--- a/docs/manual/board-support.txt
+++ b/docs/manual/board-support.txt
@@ -19,11 +19,11 @@ integrate basic board configurations. This is because package
 selections are highly application-specific.
 
 Once you have a known working configuration, run +make
 savedefconfig+. This will generate a minimal +defconfig+ file at the
 root of the Buildroot source tree. Move this file into the +configs/+
-directory, and rename it +MYBOARD_defconfig+.
+directory, and rename it +BOARDNAME_defconfig+.
 
 It is recommended to use upstream versions of the Linux kernel and
 bootloaders where possible, and also to use default kernel and bootloader
 configurations if possible. If the defaults are incorrect for
 your platform, we encourage you to send fixes to the corresponding upstream
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 98503b5..5566a39 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -45,11 +45,11 @@ When using out-of-tree builds, the Buildroot +.config+ and temporary
 files are also stored in the output directory. This means that you can
 safely run multiple builds in parallel using the same source tree as
 long as they use unique output directories.
 
 For ease of use, Buildroot generates a Makefile wrapper in the output
-directory - So after the first run, you no longer need to pass +O=..+
+directory - so after the first run, you no longer need to pass +O=..+
 and +-C ..+, simply run (in the output directory):
 
 --------------------
  $ make <target>
 --------------------
@@ -67,25 +67,25 @@ to +make+ or set in the environment:
 * +UCLIBC_CONFIG_FILE=<path/to/.config>+, path to
   the uClibc configuration file, used to compile uClibc, if an
   internal toolchain is being built.
   +
   Note that the uClibc configuration file can also be set from the
-  configuration interface, so through the Buildroot .config file; this
+  configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
   +
 * +BUSYBOX_CONFIG_FILE=<path/to/.config>+, path to
   the Busybox configuration file.
   +
   Note that the Busybox configuration file can also be set from the
-  configuration interface, so through the Buildroot .config file; this
+  configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
   +
 * +BUILDROOT_DL_DIR+ to override the directory in which
   Buildroot stores/retrieves downloaded files
   +
   Note that the Buildroot download directory can also be set from the
-  configuration interface, so through the Buildroot .config file; this
+  configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
 
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index d6224ff..a1a556b 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -3,19 +3,19 @@
 [[rootfs-custom]]
 Customizing the generated target filesystem
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Besides changing one or another configuration through +make *config+,
-there are a few ways to customize the resulting target filesystem:
+there are a few ways to customize the resulting target filesystem.
 
 * Customize the target filesystem directly and rebuild the image.  The
   target filesystem is available under +output/target/+.  You can
   simply make your changes here and run make afterwards - this will
   rebuild the target filesystem image. This method allows you to do
   anything to the target filesystem, but if you decide to completely
   rebuild your toolchain and tools, these changes will be lost.
-  _Changes are not resistent to the +make clean+ command_.
+  _Changes do not survive the +make clean+ command_.
 
 * Create your own 'target skeleton'. You can start with the default
   skeleton available under +system/skeleton+ and then customize it to
   suit your needs. The +BR2_ROOTFS_SKELETON_CUSTOM+ and
   +BR2_ROOTFS_SKELETON_CUSTOM_PATH+ will allow you to specify the
@@ -28,17 +28,17 @@ there are a few ways to customize the resulting target filesystem:
   *post-build script*, that gets called 'after' Buildroot builds all the
   selected software, but 'before' the rootfs packages are
   assembled. The +BR2_ROOTFS_POST_BUILD_SCRIPT+ will allow you to
   specify the location of your post-build script. This option can be
   found in the +System configuration+ menu. The destination root
-  filesystem folder *is given as the first argument to this script,
+  filesystem folder is given as the first argument to this script,
   and this script can then be used to copy programs, static data or
   any other needed file to your target filesystem. You should,
   however, use this feature with care. Whenever you find that a
   certain package generates wrong or unneeded files, you should fix
   that package rather than work around it with a post-build cleanup
-  script. _Among these first 3 methods, this one should be prefere_d.
+  script. _Among these first 3 methods, this one should be preferred_.
 
 * A special package, 'customize', stored in +package/customize+ can be
   used. You can put all the files that you want to see in the final
   target root filesystem in +package/customize/source+, and then
   enable this special package in the configuration system. _This
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 91657cf..11f6f28 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -22,17 +22,17 @@ Using the internal Buildroot toolchain backend
 The internal Buildroot toolchain backend *only* allows to generate
 *http://www.uclibc.org/[uClibc]-based toolchains*.
 
 However, it allows to tune major settings, such as:
 
-* Linux header version
+* Linux headers version;
 
-* http://www.uclibc.org/[uClibc] configuration (see xref:uclibc-custom[uClibc])
+* http://www.uclibc.org/[uClibc] configuration (see xref:uclibc-custom[uClibc]);
 
-* Binutils, GCC, Gdb and toolchain options
+* Binutils, GCC, Gdb and toolchain options.
 
-This is directly available after selecting the +Buildroot toolchain+ type in
+These settings are available after selecting the +Buildroot toolchain+ type in
 the menu +Toolchain+.
 
 Using the Crosstool-NG backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -42,6 +42,6 @@ limited set of settings under the Buildroot +Toolchain+ menu (ie. when invoking
 
 * The http://crosstool-ng.org[crosstool-NG] configuration file
 
 * Gdb and some toolchain options
 
-Then, the toolchain can be finely tuned invoking +make ctng-menuconfig+.
+Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
diff --git a/docs/manual/customize-uclibc-config.txt b/docs/manual/customize-uclibc-config.txt
index d340c9a..38a1575 100644
--- a/docs/manual/customize-uclibc-config.txt
+++ b/docs/manual/customize-uclibc-config.txt
@@ -16,19 +16,18 @@ follow these steps:
 
 * Invoke +make uclibc-menuconfig+. The nice configuration assistant,
   similar to the one used in the Linux kernel or Buildroot,
   appears. Make your configuration changes as appropriate.
 
-* Copy the +$(O)/toolchain/uclibc-VERSION/.config+ file to a different
-  place (like +toolchain/uClibc/uClibc-myconfig.config+, or
-  +board/mymanufacturer/myboard/uClibc.config+) and adjust the uClibc
-  configuration (configuration option +BR2_UCLIBC_CONFIG+) to use this
+* Copy the +$(O)/toolchain/uClibc-VERSION/.config+ file to a different
+  place (e.g. +board/MANUFACTURER/BOARDNAME/uClibc.config+) and adjust
+  the uClibc configuration file option +BR2_UCLIBC_CONFIG+ to refer to this
   configuration instead of the default one.
 
 * Run the compilation of Buildroot again.
 
-Otherwise, you can simply change +toolchain/uClibc/uClibc.config+,
+Otherwise, you can simply change +toolchain/uClibc/uClibc-VERSION.config+,
 without running the configuration assistant.
 
-If you want to use an existing config file for uclibc, then see
+If you want to use an existing config file for uClibc, then see
 xref:env-vars[].
 
diff --git a/docs/manual/embedded-basics.txt b/docs/manual/embedded-basics.txt
index d1ee88c..a33338c 100644
--- a/docs/manual/embedded-basics.txt
+++ b/docs/manual/embedded-basics.txt
@@ -80,11 +80,11 @@ interested in Buildroot for two reasons:
   needed tools like busybox. That makes it much easier than doing it
   by hand.
 
 You might wonder why such a tool is needed when you can compile +gcc+,
 +binutils+, +uClibc+ and all the other tools by hand. Of course doing
-so is possible but, dealing with all of the configure options and
+so is possible, but dealing with all of the configure options and
 problems of every +gcc+ or +binutils+ version is very time-consuming
 and uninteresting.  Buildroot automates this process through the use
 of Makefiles and has a collection of patches for each +gcc+ and
 +binutils+ version to make them work on most architectures.
 
diff --git a/docs/manual/external-toolchain.txt b/docs/manual/external-toolchain.txt
index b337376..6124fe4 100644
--- a/docs/manual/external-toolchain.txt
+++ b/docs/manual/external-toolchain.txt
@@ -24,12 +24,12 @@ enabled in the +Toolchain+ menu, by selecting +External toolchain+ in
 
 Then, you have three solutions to use an external toolchain:
 
 * Use a predefined external toolchain profile, and let Buildroot
   download, extract and install the toolchain. Buildroot already knows
-  about a few CodeSourcery toolchains for ARM, PowerPC, MIPS and
-  SuperH. Just select the toolchain profile in +Toolchain+ through the
+  about a few CodeSourcery, Linaro, Blackfin and Xilinx toolchains.
+  Just select the toolchain profile in +Toolchain+ from the
   available ones. This is definitely the easiest solution.
 
 * Use a predefined external toolchain profile, but instead of having
   Buildroot download and extract the toolchain, you can tell Buildroot
   where your toolchain is already installed on your system. Just
@@ -43,19 +43,20 @@ Then, you have three solutions to use an external toolchain:
   select the +Custom toolchain+ solution in the +Toolchain+ list. You
   need to fill the +Toolchain path+, +Toolchain prefix+ and +External
   toolchain C library+ options. Then, you have to tell Buildroot what
   your external toolchain supports. If your external toolchain uses
   the 'glibc' library, you only have to tell whether your toolchain
-  supports C++ or not. If your external toolchain uses the 'uclibc'
+  supports C\+\+ or not and whether it has built-in RPC support. If
+  your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and
   C++. At the beginning of the execution, Buildroot will tell you if
   the selected options do not match the toolchain configuration.
 
 
 Our external toolchain support has been tested with toolchains from
-CodeSourcery, toolchains generated by
+CodeSourcery and Linaro, toolchains generated by
 http://crosstool-ng.org[crosstool-NG], and toolchains generated by
 Buildroot itself. In general, all toolchains that support the
 'sysroot' feature should work. If not, do not hesitate to contact the
 developers.
 
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index 879cff3..7e33d8e 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -4,11 +4,11 @@ How Buildroot works
 -------------------
 
 As mentioned above, Buildroot is basically a set of Makefiles that
 download, configure, and compile software with the correct options. It
 also includes patches for various software packages - mainly the ones
-involved in the cross-compilation tool chain (+gcc+, +binutils+ and
+involved in the cross-compilation toolchain (+gcc+, +binutils+ and
 +uClibc+).
 
 There is basically one Makefile per software package, and they are
 named with the +.mk+ extension. Makefiles are split into three main
 sections:
diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
index bcca544..9353f8c 100644
--- a/docs/manual/introduction.txt
+++ b/docs/manual/introduction.txt
@@ -15,7 +15,7 @@ processors everyone is used to having in his PC. They can be PowerPC
 processors, MIPS processors, ARM processors, etc.
 
 Buildroot supports numerous processors and their variants; it also
 comes with default configurations for several boards available
 off-the-shelf. Besides this, a number of third-party projects are based on,
-or develop their BSP footnote:[BSP: Board Software Package] or
-SDK footnote:[SDK: Standard Development Kit] on top of Buildroot.
+or develop their BSP footnote:[BSP: Board Support Package] or
+SDK footnote:[SDK: Software Development Kit] on top of Buildroot.
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index a7af5a8..989b285 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -3,17 +3,17 @@
 [[legal-info]]
 
 Legal notice and licensing
 ==========================
 
-Complying with opensource licenses
-----------------------------------
+Complying with open source licenses
+-----------------------------------
 
 All of the end products of Buildroot (toolchain, root filesystem, kernel,
-bootloaders) contain opensource software, released under various licenses.
+bootloaders) contain open source software, released under various licenses.
 
-Using opensource software gives you the freedom to build rich embedded
+Using open source software gives you the freedom to build rich embedded
 systems, choosing from a wide range of packages, but also imposes some
 obligations that you must know and honour.
 Some licenses require you to publish the license text in the documentation of
 your product. Others require you to redistribute the source code of the
 software to those that receive your product.
@@ -44,30 +44,34 @@ There you will find:
   patches applied to some packages by Buildroot are distributed with the
   Buildroot sources and are not duplicated in the +sources/+ subdirectory.
 * A manifest file listing the configured packages, their version, license and
   related information.
   Some of this information might not be defined in Buildroot; such items are
-  clearly marked as "unknown" or similar.
+  marked as "unknown".
 * A +licenses/+ subdirectory, which contains the license text of packages.
   If the license file(s) are not defined in Buildroot, the file is not produced
   and a warning in the +README+ indicates this.
 
 Please note that the aim of the +legal-info+ feature of Buildroot is to
 produce all the material that is somehow relevant for legal compliance with the
 package licenses. Buildroot does not try to produce the exact material that
 you must somehow make public. Certainly, more material is produced than is
 needed for a strict legal compliance. For example, it produces the source code
-for packages released under BSD-like licenses, that you might not want to
+for packages released under BSD-like licenses, that you are not required to
 redistribute in source form.
 
 Moreover, due to technical limitations, Buildroot does not produce some
 material that you will or may need, such as the toolchain source code and the
-Buildroot source code itself.
+Buildroot source code itself (including patches to packages for which source
+distribution is required).
 When you run +make legal-info+, Buildroot produces warnings in the +README+
 file to inform you of relevant material that could not be saved.
 
 [[legal-info-list-licenses]]
+License abbreviations
+---------------------
+
 Here is a list of the licenses that are most widely used by packages in
 Buildroot, with the name used in the manifest file:
 
 * +GPLv2+:
   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
@@ -84,10 +88,17 @@ Buildroot, with the name used in the manifest file:
   GNU General Public License, version 3]
   or (at your option) any later version;
 * +GPL+:
   http://www.gnu.org/licenses/gpl.html[
   GNU General Public License] (any version);
+* +LGPLv2+:
+  http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
+  GNU Library General Public License, version 2];
+* +LGPLv2++:
+  http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
+  GNU Library General Public License, version 2.1]
+  or (at your option) any later version;
 * +LGPLv2.1+:
   http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
   GNU Lesser General Public License, version 2.1];
 * +LGPLv2.1++:
   http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
@@ -110,11 +121,11 @@ Buildroot, with the name used in the manifest file:
   Buildroot does not save any licensing info or source code for these packages.
 
 Complying with the Buildroot license
 ------------------------------------
 
-Buildroot itself is an opensource software, released under the
+Buildroot itself is an open source software, released under the
 http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
 License, version 2] or (at your option) any later version.
 However, being a build system, it is not normally part of the end product:
 if you develop the root filesystem, kernel, bootloader or toolchain for a
 device, the code of Buildroot is only present on the development machine, not
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 25c4e35..8cd77c0 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -2,57 +2,63 @@
 
 [[make-tips]]
 'make' tips
 -----------
 
-Because Buildroot is a set of Makefiles and patches, there are a few
-things that are useful to know, such as:
+This is a collection of tips that help you make the most of Buildroot.
 
-+make *config+ commands offer a search tool. Read the help message in
+.Configuration searches:
+
+The +make *config+ commands offer a search tool. Read the help message in
 the different frontend menus to know how to use it:
 
-* in _menuconfig_, search tool is called by pressing +/+;
-* in _xconfig_, search tool is called by pressing +ctrl+ + +f+.
+* in _menuconfig_, the search tool is called by pressing +/+;
+* in _xconfig_, the search tool is called by pressing +Ctrl+ + +f+.
 
 The result of the search shows the help message of the matching items.
 
-Display all commands executed by make:
+.Display all commands executed by make:
 
 --------------------
- $ make V=0|1 <target>
+ $ make V=1 <target>
 --------------------
 
-Display all available targets:
+.Display all available targets:
 
 --------------------
  $ make help
 --------------------
 
-Note that some settings in the +.config+ file may hide some targets:
+.Not all targets are always available,
+
+some settings in the +.config+ file may hide some targets:
+
+* +linux-menuconfig+ and +linux-savedefconfig+ only work when
+  +linux+ is enabled;
+* +uclibc-menuconfig+ is only available when the
+  Buildroot internal toolchain backend is used;
+* +ctng-menuconfig+ is only available when the
+  crosstool-NG backend is used;
+* +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
+  +barebox+ bootloader is enabled.
+
+.Cleaning:
 
-* +busybox-menuconfig+ depends on whether +busybox+ is enabled or not
-  in the +Package selection+ menu
-* +linux-menuconfig+ and +linux-savedefconfig+ depend on whether
-  +linux+ is enabled or not
-* +uclibc-menuconfig+ depends on whether the toolchain uses the
-  Buildroot internal toolchain backend or not
-* +ctng-menuconfig+ depends on whether the toolchain uses the
-  crosstool-NG backend or not
-* +barebox-menuconfig+ and +barebox-savedefconfig+ depend on whether
-  +barebox+ bootloader is enabled or not
+Explicit cleaning is required when any of the architecture or toolchain
+configuration options are changed.
 
-Delete all build products (including build directories, host, staging
+To delete all build products (including build directories, host, staging
 and target trees, the images and the toolchain):
 
 --------------------
  $ make clean
 --------------------
 
-Delete all build products as well as the configuration:
+To delete all build products as well as the configuration:
 
 --------------------
  $ make distclean
 --------------------
 
-Note that if +ccache+ is enabled, running +make clean|distclean+ does
+Note that if +ccache+ is enabled, running +make clean+ or +distclean+ does
 not empty the compiler cache used by Buildroot. To delete it, refer
 to xref:ccache[].
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index 99ecdea..fc57105 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -18,11 +18,11 @@ It takes the form of a line for each file, with the following layout:
 |===========================================================
 
 There are a few non-trivial blocks here:
 
 - +name+ is the path to the file you want to create/modify
-- +type+ is the type of the file, being one of :
+- +type+ is the type of the file, being one of:
   * f: a regular file
   * d: a directory
   * c: a character device file
   * b: a block device file
   * p: a named pipe
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 1fdb04e..b65855e 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -4,15 +4,16 @@
 
 Patch Policy
 ------------
 
 While integrating a new package or updating an existing one, it may be
-necessary to patch the source of the software to get it built within
+necessary to patch the source of the software to get it cross-built within
 Buildroot.
 
 Buildroot offers an infrastructure to automatically handle this during
-the builds. It supports several ways of applying patch sets:
+the builds. It supports two ways of applying patch sets: downloaded patches
+and patches supplied within buildroot.
 
 Providing patches
 ~~~~~~~~~~~~~~~~~
 
 Additional tarball
@@ -27,14 +28,14 @@ sources.
 
 Within Buildroot
 ^^^^^^^^^^^^^^^^
 
 Most patches are provided within Buildroot, in the package
-directory; these typically aim to fix cross-compilation, +libc+ support,
+directory; these typically aim to fix cross-compilation, libc support,
 or other such issues.
 
-These patch files should have the extension +*.patch+.
+These patch files should be named +<packagename>-*.patch+.
 
 A +series+ file, as used by +quilt+, may also be added in the
 package directory. In that case, the +series+ file defines the patch
 application order.
 
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 36d8da7..38f9a94 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -21,11 +21,11 @@ Mandatory packages
 
 * Build tools:
 
 ** +which+
 ** +sed+
-** +make+ (version 3.82 or any later)
+** +make+ (version 3.81 or any later)
 ** +binutils+
 ** +build-essential+ (only for Debian based systems)
 ** +gcc+ (version 2.95 or any later)
 ** `g++` (version 2.95 or any later)
 ** +bash+
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 83f6a36..e677590 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -12,22 +12,22 @@ $ make clean all
 
 In some cases, a full rebuild is mandatory:
 
 * each time the toolchain properties are changed, this includes:
 
-** after changing some toolchain option under the _Toolchain_ menu (if
+** after changing any toolchain option under the _Toolchain_ menu (if
    the internal Buildroot backend is used);
 ** after running +make ctng-menuconfig+ (if the crosstool-NG backend
    is used);
 ** after running +make uclibc-menuconfig+.
 
 * after removing some libraries from the package selection.
 
 In some cases, a full rebuild is recommended:
 
 * after adding some libraries to the package selection (otherwise,
-  some packages that can be optionally linked against those libraries
+  packages that can be optionally linked against those libraries
   won't be rebuilt, so they won't support those new available
   features).
 
 In other cases, it is up to you to decide if you should run a
 full rebuild, but you should know what is impacted and understand what
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 892caf5..9436981 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -29,13 +29,13 @@ or
 to run the Qt or GTK-based configurators.
 
 All of these "make" commands will need to build a configuration
 utility (including the interface), so you may need to install
 "development" packages for relevant libraries used by the
-configuration utilities. Check the xref:requirement[] to know what
-Buildroot needs, and specifically the xref:requirement-optional[system requirements]
-to get the dependencies of favorite interface.
+configuration utilities. Check xref:requirement[] to know what
+Buildroot needs, and specifically the xref:requirement-optional[optional requirements]
+to get the dependencies of your favorite interface.
 
 For each menu entry in the configuration tool, you can find associated
 help that describes the purpose of the entry.
 
 Once everything is configured, the configuration tool generates a
@@ -50,19 +50,19 @@ Let's go:
 
 You *should never* use +make -jN+ with Buildroot: it does not support
 'top-level parallel make'. Instead, use the +BR2_JLEVEL+ option to
 tell Buildroot to run each package compilation with +make -jN+.
 
-This command will generally perform the following steps:
+The `make` command will generally perform the following steps:
 
-* Download source files (as required)
-* Configure, build and install the cross-compiling toolchain using the
-  appropriate toolchain backend, or simply import an external toolchain
-* Build/install selected target packages
-* Build a kernel image, if selected
-* Build a bootloader image, if selected
-* Create a root filesystem in selected formats
+* download source files (as required);
+* configure, build and install the cross-compiling toolchain using the
+  appropriate toolchain backend, or simply import an external toolchain;
+* build/install selected target packages;
+* build a kernel image, if selected;
+* build a bootloader image, if selected;
+* create a root filesystem in selected formats.
 
 Buildroot output is stored in a single directory, +output/+.
 This directory contains several subdirectories:
 
 * +images/+ where all the images (kernel image, bootloader and root
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index c32f855..2a61639 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -119,7 +119,7 @@ The documentation
 ~~~~~~~~~~~~~~~~~
 
 The documentation uses the
 http://www.methods.co.nz/asciidoc/[asciidoc] format.
 
-Further details about the http://www.methods.co.nz/asciidoc/[asciidoc]
-syntax: refer to http://www.methods.co.nz/asciidoc/userguide.html[].
+For further details about the http://www.methods.co.nz/asciidoc/[asciidoc]
+syntax, refer to http://www.methods.co.nz/asciidoc/userguide.html[].
-- 
1.7.10.4
