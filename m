From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 16:10:29 -0300
Subject: [Buildroot] [PATCH 04/10] binutils: make it a proper package
In-Reply-To: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293563435-10054-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Convert binutils to a proper autotargets package
* Add version 2.21
* Drop version 2.17
* Hook up packaged binutils for target gcc
* Build tools are on HOST_DIR now so change it
* TARGET_CROSS is now in HOST_DIR too

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Makefile                                           |    4 +-
 package/Config.in                                  |    1 +
 package/Makefile.in                                |    2 +-
 package/binutils/Config.in                         |   22 +++
 .../Config.in => package/binutils/Config.in.host   |   17 +-
 .../binutils-2.18}/100-makeinfo-version.patch      |    0
 .../binutils-2.18}/110-arm-eabi-conf.patch         |    0
 .../binutils-2.18}/300-001_ld_makefile_patch.patch |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../binutils-2.19.1}/110-arm-eabi-conf.patch       |    0
 .../binutils/binutils-2.19.1}/120-sh-conf.patch    |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../binutils-2.19}/110-arm-eabi-conf.patch         |    0
 .../binutils/binutils-2.19}/120-sh-conf.patch      |    0
 .../binutils-2.19}/300-001_ld_makefile_patch.patch |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../binutils-2.20.1}/110-arm-eabi-conf.patch       |    0
 .../binutils/binutils-2.20.1}/120-sh-conf.patch    |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../binutils-2.20.1}/400-arm_link_speed.patch      |    0
 .../binutils-2.20}/110-arm-eabi-conf.patch         |    0
 .../binutils/binutils-2.20}/120-sh-conf.patch      |    0
 .../binutils-2.20}/300-001_ld_makefile_patch.patch |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../binutils-2.20}/400-arm_link_speed.patch        |    0
 .../binutils-2.21}/110-arm-eabi-conf.patch         |    0
 .../binutils/binutils-2.21}/120-sh-conf.patch      |    0
 .../binutils-2.21}/300-001_ld_makefile_patch.patch |    0
 .../300-012_check_ldrunpath_length.patch           |   21 +++
 package/binutils/binutils.mk                       |   68 ++++++++
 toolchain/Makefile.in                              |    2 +-
 toolchain/binutils/2.17/100-uclibc-conf.patch      |  139 ---------------
 toolchain/binutils/2.17/110-arm-eabi-conf.patch    |   24 ---
 .../binutils/2.17/300-001_ld_makefile_patch.patch  |   50 ------
 .../binutils/2.17/300-006_better_file_error.patch  |   43 -----
 .../2.17/300-012_check_ldrunpath_length.patch      |   47 -----
 .../2.17/400-mips-ELF_MAXPAGESIZE-4K.patch         |   26 ---
 .../binutils/2.17/500-fix-makeinfo-check.patch     |   17 --
 toolchain/binutils/binutils.mk                     |  179 --------------------
 toolchain/gcc/Config.in.2                          |    1 +
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   66 +++-----
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-buildroot/Config.in            |    2 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-external.mk                    |    1 -
 47 files changed, 148 insertions(+), 586 deletions(-)
 create mode 100644 package/binutils/Config.in
 rename toolchain/binutils/Config.in => package/binutils/Config.in.host (83%)
 rename {toolchain/binutils/2.18 => package/binutils/binutils-2.18}/100-makeinfo-version.patch (100%)
 rename {toolchain/binutils/2.18 => package/binutils/binutils-2.18}/110-arm-eabi-conf.patch (100%)
 copy {toolchain/binutils/2.18 => package/binutils/binutils-2.18}/300-001_ld_makefile_patch.patch (100%)
 rename {toolchain/binutils/2.18 => package/binutils/binutils-2.18}/300-012_check_ldrunpath_length.patch (100%)
 copy {toolchain/binutils/2.19.1 => package/binutils/binutils-2.19.1}/110-arm-eabi-conf.patch (100%)
 copy {toolchain/binutils/2.19.1 => package/binutils/binutils-2.19.1}/120-sh-conf.patch (100%)
 rename {toolchain/binutils/2.19.1 => package/binutils/binutils-2.19.1}/300-001_ld_makefile_patch.patch (100%)
 rename {toolchain/binutils/2.19.1 => package/binutils/binutils-2.19.1}/300-012_check_ldrunpath_length.patch (100%)
 rename {toolchain/binutils/2.19 => package/binutils/binutils-2.19}/110-arm-eabi-conf.patch (100%)
 rename {toolchain/binutils/2.19 => package/binutils/binutils-2.19}/120-sh-conf.patch (100%)
 rename {toolchain/binutils/2.19 => package/binutils/binutils-2.19}/300-001_ld_makefile_patch.patch (100%)
 rename {toolchain/binutils/2.19 => package/binutils/binutils-2.19}/300-012_check_ldrunpath_length.patch (100%)
 rename {toolchain/binutils/2.20.1 => package/binutils/binutils-2.20.1}/110-arm-eabi-conf.patch (100%)
 rename {toolchain/binutils/2.20.1 => package/binutils/binutils-2.20.1}/120-sh-conf.patch (100%)
 rename {toolchain/binutils/2.20.1 => package/binutils/binutils-2.20.1}/300-001_ld_makefile_patch.patch (100%)
 rename {toolchain/binutils/2.20.1 => package/binutils/binutils-2.20.1}/300-012_check_ldrunpath_length.patch (100%)
 rename {toolchain/binutils/2.20.1 => package/binutils/binutils-2.20.1}/400-arm_link_speed.patch (100%)
 rename {toolchain/binutils/2.20 => package/binutils/binutils-2.20}/110-arm-eabi-conf.patch (100%)
 rename {toolchain/binutils/2.20 => package/binutils/binutils-2.20}/120-sh-conf.patch (100%)
 rename {toolchain/binutils/2.20 => package/binutils/binutils-2.20}/300-001_ld_makefile_patch.patch (100%)
 rename {toolchain/binutils/2.20 => package/binutils/binutils-2.20}/300-012_check_ldrunpath_length.patch (100%)
 rename {toolchain/binutils/2.20 => package/binutils/binutils-2.20}/400-arm_link_speed.patch (100%)
 rename {toolchain/binutils/2.19.1 => package/binutils/binutils-2.21}/110-arm-eabi-conf.patch (100%)
 rename {toolchain/binutils/2.19.1 => package/binutils/binutils-2.21}/120-sh-conf.patch (100%)
 rename {toolchain/binutils/2.18 => package/binutils/binutils-2.21}/300-001_ld_makefile_patch.patch (100%)
 create mode 100644 package/binutils/binutils-2.21/300-012_check_ldrunpath_length.patch
 create mode 100644 package/binutils/binutils.mk
 delete mode 100644 toolchain/binutils/2.17/100-uclibc-conf.patch
 delete mode 100644 toolchain/binutils/2.17/110-arm-eabi-conf.patch
 delete mode 100644 toolchain/binutils/2.17/300-001_ld_makefile_patch.patch
 delete mode 100644 toolchain/binutils/2.17/300-006_better_file_error.patch
 delete mode 100644 toolchain/binutils/2.17/300-012_check_ldrunpath_length.patch
 delete mode 100644 toolchain/binutils/2.17/400-mips-ELF_MAXPAGESIZE-4K.patch
 delete mode 100644 toolchain/binutils/2.17/500-fix-makeinfo-check.patch
 delete mode 100644 toolchain/binutils/binutils.mk

diff --git a/Makefile b/Makefile
index 9ba80a6..2325319 100644
--- a/Makefile
+++ b/Makefile
@@ -239,7 +239,7 @@ BASE_TARGETS += host-ccache
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-BASE_TARGETS += uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
+BASE_TARGETS += uclibc-configured host-binutils cross_compiler uclibc-target-utils kernel-headers
 else
 BASE_TARGETS += uclibc
 endif
@@ -612,7 +612,7 @@ endif
 
 configured: dirs kernel-headers uclibc-config busybox-config linux26-config
 
-prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
+prepatch:	gcc-patched gdb-patched uclibc-patched
 
 cross: $(BASE_TARGETS)
 
diff --git a/package/Config.in b/package/Config.in
index 27d8023..fb47e27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -35,6 +35,7 @@ endmenu
 menu "Development tools"
 source "package/autoconf/Config.in"
 source "package/automake/Config.in"
+source "package/binutils/Config.in"
 source "package/bison/Config.in"
 source "package/bsdiff/Config.in"
 source "package/ccache/Config.in"
diff --git a/package/Makefile.in b/package/Makefile.in
index 9765a1a..983f9f5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -114,7 +114,7 @@ TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
+TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
diff --git a/package/binutils/Config.in b/package/binutils/Config.in
new file mode 100644
index 0000000..942562e
--- /dev/null
+++ b/package/binutils/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_BINUTILS
+	bool
+	depends on BR2_TOOLCHAIN_BUILDROOT
+	default y if BR2_PACKAGE_BINUTILS_TARGET || BR2_PACKAGE_BINUTILS_LIBBFD
+
+config BR2_PACKAGE_BINUTILS_TARGET
+	bool "binutils"
+	select BR2_PACKAGE_MPC if BR2_GCC_VERSION_4_5_X
+	select BR2_PACKAGE_MPFR
+	select BR2_PACKAGE_GMP
+	help
+	  The GNU Binutils are a collection of binary tools.
+
+	  http://www.gnu.org/software/binutils/
+
+config BR2_PACKAGE_BINUTILS_LIBBFD
+	bool
+	help
+	  Install libbfd from binutils in the target.
+	  
+	  This option is currently used by oprofile to just install
+	  the minimum libbfd needed instead of a full-blown binutils.
diff --git a/toolchain/binutils/Config.in b/package/binutils/Config.in.host
similarity index 83%
rename from toolchain/binutils/Config.in
rename to package/binutils/Config.in.host
index 165b43e..4a5e8ef 100644
--- a/toolchain/binutils/Config.in
+++ b/package/binutils/Config.in.host
@@ -1,18 +1,11 @@
-# Choose binutils version.
-
 comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_20_1
+	default BR2_BINUTILS_VERSION_2_21
 	help
 	  Select the version of binutils you wish to use.
 
-	config BR2_BINUTILS_VERSION_2_17
-		depends on !BR2_avr32
-		depends on BR2_DEPRECATED
-		bool "binutils 2.17"
-
 	config BR2_BINUTILS_VERSION_2_18
 		depends on !BR2_avr32
 		depends on BR2_DEPRECATED
@@ -40,19 +33,23 @@ choice
 		depends on !BR2_avr32
 		bool "binutils 2.20.1"
 
+	config BR2_BINUTILS_VERSION_2_21
+		depends on !BR2_avr32
+		bool "binutils 2.21"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "2.17"		if BR2_BINUTILS_VERSION_2_17
 	default "2.18"		if BR2_BINUTILS_VERSION_2_18
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	default "2.19"		if BR2_BINUTILS_VERSION_2_19
 	default "2.19.1"	if BR2_BINUTILS_VERSION_2_19_1
 	default "2.20"		if BR2_BINUTILS_VERSION_2_20
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
+	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 
-config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
+config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
 	default ""
 	help
diff --git a/toolchain/binutils/2.18/100-makeinfo-version.patch b/package/binutils/binutils-2.18/100-makeinfo-version.patch
similarity index 100%
rename from toolchain/binutils/2.18/100-makeinfo-version.patch
rename to package/binutils/binutils-2.18/100-makeinfo-version.patch
diff --git a/toolchain/binutils/2.18/110-arm-eabi-conf.patch b/package/binutils/binutils-2.18/110-arm-eabi-conf.patch
similarity index 100%
rename from toolchain/binutils/2.18/110-arm-eabi-conf.patch
rename to package/binutils/binutils-2.18/110-arm-eabi-conf.patch
diff --git a/toolchain/binutils/2.18/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.18/300-001_ld_makefile_patch.patch
similarity index 100%
copy from toolchain/binutils/2.18/300-001_ld_makefile_patch.patch
copy to package/binutils/binutils-2.18/300-001_ld_makefile_patch.patch
diff --git a/toolchain/binutils/2.18/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.18/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from toolchain/binutils/2.18/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.18/300-012_check_ldrunpath_length.patch
diff --git a/toolchain/binutils/2.19.1/110-arm-eabi-conf.patch b/package/binutils/binutils-2.19.1/110-arm-eabi-conf.patch
similarity index 100%
copy from toolchain/binutils/2.19.1/110-arm-eabi-conf.patch
copy to package/binutils/binutils-2.19.1/110-arm-eabi-conf.patch
diff --git a/toolchain/binutils/2.19.1/120-sh-conf.patch b/package/binutils/binutils-2.19.1/120-sh-conf.patch
similarity index 100%
copy from toolchain/binutils/2.19.1/120-sh-conf.patch
copy to package/binutils/binutils-2.19.1/120-sh-conf.patch
diff --git a/toolchain/binutils/2.19.1/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.19.1/300-001_ld_makefile_patch.patch
similarity index 100%
rename from toolchain/binutils/2.19.1/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.19.1/300-001_ld_makefile_patch.patch
diff --git a/toolchain/binutils/2.19.1/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.19.1/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from toolchain/binutils/2.19.1/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.19.1/300-012_check_ldrunpath_length.patch
diff --git a/toolchain/binutils/2.19/110-arm-eabi-conf.patch b/package/binutils/binutils-2.19/110-arm-eabi-conf.patch
similarity index 100%
rename from toolchain/binutils/2.19/110-arm-eabi-conf.patch
rename to package/binutils/binutils-2.19/110-arm-eabi-conf.patch
diff --git a/toolchain/binutils/2.19/120-sh-conf.patch b/package/binutils/binutils-2.19/120-sh-conf.patch
similarity index 100%
rename from toolchain/binutils/2.19/120-sh-conf.patch
rename to package/binutils/binutils-2.19/120-sh-conf.patch
diff --git a/toolchain/binutils/2.19/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.19/300-001_ld_makefile_patch.patch
similarity index 100%
rename from toolchain/binutils/2.19/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.19/300-001_ld_makefile_patch.patch
diff --git a/toolchain/binutils/2.19/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.19/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from toolchain/binutils/2.19/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.19/300-012_check_ldrunpath_length.patch
diff --git a/toolchain/binutils/2.20.1/110-arm-eabi-conf.patch b/package/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
similarity index 100%
rename from toolchain/binutils/2.20.1/110-arm-eabi-conf.patch
rename to package/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
diff --git a/toolchain/binutils/2.20.1/120-sh-conf.patch b/package/binutils/binutils-2.20.1/120-sh-conf.patch
similarity index 100%
rename from toolchain/binutils/2.20.1/120-sh-conf.patch
rename to package/binutils/binutils-2.20.1/120-sh-conf.patch
diff --git a/toolchain/binutils/2.20.1/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.20.1/300-001_ld_makefile_patch.patch
similarity index 100%
rename from toolchain/binutils/2.20.1/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.20.1/300-001_ld_makefile_patch.patch
diff --git a/toolchain/binutils/2.20.1/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.20.1/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from toolchain/binutils/2.20.1/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.20.1/300-012_check_ldrunpath_length.patch
diff --git a/toolchain/binutils/2.20.1/400-arm_link_speed.patch b/package/binutils/binutils-2.20.1/400-arm_link_speed.patch
similarity index 100%
rename from toolchain/binutils/2.20.1/400-arm_link_speed.patch
rename to package/binutils/binutils-2.20.1/400-arm_link_speed.patch
diff --git a/toolchain/binutils/2.20/110-arm-eabi-conf.patch b/package/binutils/binutils-2.20/110-arm-eabi-conf.patch
similarity index 100%
rename from toolchain/binutils/2.20/110-arm-eabi-conf.patch
rename to package/binutils/binutils-2.20/110-arm-eabi-conf.patch
diff --git a/toolchain/binutils/2.20/120-sh-conf.patch b/package/binutils/binutils-2.20/120-sh-conf.patch
similarity index 100%
rename from toolchain/binutils/2.20/120-sh-conf.patch
rename to package/binutils/binutils-2.20/120-sh-conf.patch
diff --git a/toolchain/binutils/2.20/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.20/300-001_ld_makefile_patch.patch
similarity index 100%
rename from toolchain/binutils/2.20/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.20/300-001_ld_makefile_patch.patch
diff --git a/toolchain/binutils/2.20/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.20/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from toolchain/binutils/2.20/300-012_check_ldrunpath_length.patch
rename to package/binutils/binutils-2.20/300-012_check_ldrunpath_length.patch
diff --git a/toolchain/binutils/2.20/400-arm_link_speed.patch b/package/binutils/binutils-2.20/400-arm_link_speed.patch
similarity index 100%
rename from toolchain/binutils/2.20/400-arm_link_speed.patch
rename to package/binutils/binutils-2.20/400-arm_link_speed.patch
diff --git a/toolchain/binutils/2.19.1/110-arm-eabi-conf.patch b/package/binutils/binutils-2.21/110-arm-eabi-conf.patch
similarity index 100%
rename from toolchain/binutils/2.19.1/110-arm-eabi-conf.patch
rename to package/binutils/binutils-2.21/110-arm-eabi-conf.patch
diff --git a/toolchain/binutils/2.19.1/120-sh-conf.patch b/package/binutils/binutils-2.21/120-sh-conf.patch
similarity index 100%
rename from toolchain/binutils/2.19.1/120-sh-conf.patch
rename to package/binutils/binutils-2.21/120-sh-conf.patch
diff --git a/toolchain/binutils/2.18/300-001_ld_makefile_patch.patch b/package/binutils/binutils-2.21/300-001_ld_makefile_patch.patch
similarity index 100%
rename from toolchain/binutils/2.18/300-001_ld_makefile_patch.patch
rename to package/binutils/binutils-2.21/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/binutils-2.21/300-012_check_ldrunpath_length.patch b/package/binutils/binutils-2.21/300-012_check_ldrunpath_length.patch
new file mode 100644
index 0000000..df78310
--- /dev/null
+++ b/package/binutils/binutils-2.21/300-012_check_ldrunpath_length.patch
@@ -0,0 +1,21 @@
+diff -Nura binutils-2.21.orig/ld/emultempl/elf32.em binutils-2.21/ld/emultempl/elf32.em
+--- binutils-2.21.orig/ld/emultempl/elf32.em	2010-10-29 09:10:36.000000000 -0300
++++ binutils-2.21/ld/emultempl/elf32.em	2010-12-10 09:26:56.746102724 -0300
+@@ -1270,6 +1270,8 @@
+ 	      && command_line.rpath == NULL)
+ 	    {
+ 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((lib_path) && (strlen (lib_path) == 0))
++	      	lib_path = NULL;
+ 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
+ 						      force))
+ 		break;
+@@ -1497,6 +1499,8 @@
+   rpath = command_line.rpath;
+   if (rpath == NULL)
+     rpath = (const char *) getenv ("LD_RUN_PATH");
++  if ((rpath) && (strlen (rpath) == 0))
++  	rpath = NULL;
+ 
+   for (abfd = link_info.input_bfds; abfd; abfd = abfd->link_next)
+     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
new file mode 100644
index 0000000..634c7ae
--- /dev/null
+++ b/package/binutils/binutils.mk
@@ -0,0 +1,68 @@
+#############################################################
+#
+# binutils
+#
+#############################################################
+
+BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.bz2
+BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
+ifeq ($(ARCH),avr32)
+BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
+endif
+BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
+BINUTILS_INSTALL_STAGING = YES
+
+# These aren't really needed, we just pull them until gcc is a proper package
+ifeq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
+BINUTILS_DEPENDENCIES = gmp mpfr
+ifeq ($(BR2_GCC_VERSION_4_5_X),y)                                                                   
+BINUTILS_DEPENDENCIES += mpc
+endif
+endif
+# We need to specify host & target to avoid breaking ARM EABI
+BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
+		--host=$(REAL_GNU_TARGET_NAME) \
+		--target=$(REAL_GNU_TARGET_NAME) \
+		--enable-shared \
+		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
+
+# Install binutils after busybox to prefer full-blown utilities
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+BINUTILS_DEPENDENCIES += busybox
+endif
+
+# "host" binutils should actually be "cross"
+# We just keep the convention of "host utility" for now
+HOST_BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
+HOST_BINUTILS_DEPENDENCIES = host-gmp host-mpfr
+ifeq ($(BR2_GCC_VERSION_4_5_X),y)                                                                   
+HOST_BINUTILS_DEPENDENCIES += host-mpc
+endif
+HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
+			--target=$(REAL_GNU_TARGET_NAME) \
+			$(BR2_CONFIGURE_STAGING_SYSROOT) \
+			$(HOST_BINUTILS_EXTRA_CONFIG_OPTIONS)
+
+# We just want libbfd, not the full-blown binutils in staging
+define BINUTILS_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
+endef
+
+# only libbfd in the target...
+ifeq ($(BR2_PACKAGE_BINUTILS_LIBBFD),y)
+BINUTILS_INSTALL_FROM = $(@D)/bfd
+endif
+
+# ...or full binutils
+ifeq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
+BINUTILS_INSTALL_FROM = $(@D)
+endif
+
+define BINUTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(BINUTILS_INSTALL_FROM) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(call AUTOTARGETS,package,binutils))
+$(eval $(call AUTOTARGETS,package,binutils,host))
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index 2cb6e95..a7ca558 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -1,6 +1,6 @@
 BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/
 BR2_CONFIGURE_STAGING_SYSROOT=--with-sysroot=$(STAGING_DIR)
-BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
+BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
diff --git a/toolchain/binutils/2.17/100-uclibc-conf.patch b/toolchain/binutils/2.17/100-uclibc-conf.patch
deleted file mode 100644
index 25222e5..0000000
--- a/toolchain/binutils/2.17/100-uclibc-conf.patch
+++ /dev/null
@@ -1,139 +0,0 @@
---- binutils-2.16.91.0.7/bfd/configure
-+++ binutils-2.16.91.0.7/bfd/configure
-@@ -3576,7 +3576,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/binutils/configure
-+++ binutils-2.16.91.0.7/binutils/configure
-@@ -3411,7 +3411,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/configure
-+++ binutils-2.16.91.0.7/configure
-@@ -1270,7 +1270,7 @@
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
--  sh-*-linux*)
-+  sh*-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;    
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -1578,7 +1578,7 @@
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${host}" in
-       i[3456789]86-*-vsta) ;; # don't add gprof back in
-       i[3456789]86-*-go32*) ;; # don't add gprof back in
---- binutils-2.16.91.0.7/configure.in
-+++ binutils-2.16.91.0.7/configure.in
-@@ -468,7 +468,7 @@
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
--  sh-*-linux*)
-+  sh*-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;    
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -776,7 +776,7 @@
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${host}" in
-       i[[3456789]]86-*-vsta) ;; # don't add gprof back in
-       i[[3456789]]86-*-go32*) ;; # don't add gprof back in
---- binutils-2.16.91.0.7/gas/configure
-+++ binutils-2.16.91.0.7/gas/configure
-@@ -3411,7 +3411,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/gprof/configure
-+++ binutils-2.16.91.0.7/gprof/configure
-@@ -3419,6 +3419,11 @@
-   lt_cv_file_magic_test_file=`echo /lib/libc.so* /lib/libc-*.so`
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- netbsd* | knetbsd*-gnu)
-   if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
-     lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
---- binutils-2.16.91.0.7/ld/configure
-+++ binutils-2.16.91.0.7/ld/configure
-@@ -3413,7 +3413,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/libtool.m4
-+++ binutils-2.16.91.0.7/libtool.m4
-@@ -739,7 +739,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
---- binutils-2.16.91.0.7/ltconfig
-+++ binutils-2.16.91.0.7/ltconfig
-@@ -602,6 +602,7 @@
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
-+linux-uclibc*) ;;
- linux-gnu*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
-@@ -1247,7 +1248,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   version_type=linux
-   need_lib_prefix=no
-   need_version=no
---- binutils-2.16.91.0.7/opcodes/configure
-+++ binutils-2.16.91.0.7/opcodes/configure
-@@ -3579,7 +3579,7 @@
-   ;;
- 
- # This must be Linux ELF.
--linux-gnu*)
-+linux-gnu*|linux-uclibc*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
diff --git a/toolchain/binutils/2.17/110-arm-eabi-conf.patch b/toolchain/binutils/2.17/110-arm-eabi-conf.patch
deleted file mode 100644
index be85ceb..0000000
--- a/toolchain/binutils/2.17/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -urN binutils-2.16.91.0.7.orig/configure binutils-2.16.91.0.7/configure
---- binutils-2.16.91.0.7.orig/configure	2006-05-31 14:54:24.000000000 +0300
-+++ binutils-2.16.91.0.7/configure	2006-05-31 14:55:53.000000000 +0300
-@@ -1299,7 +1299,7 @@
-   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
-     ;;
-diff -urN binutils-2.16.91.0.7.orig/configure.in binutils-2.16.91.0.7/configure.in
---- binutils-2.16.91.0.7.orig/configure.in	2006-05-31 14:54:24.000000000 +0300
-+++ binutils-2.16.91.0.7/configure.in	2006-05-31 14:55:53.000000000 +0300
-@@ -497,7 +497,7 @@
-   arm-*-elf* | strongarm-*-elf* | xscale-*-elf* | arm*-*-eabi* )
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     noconfigdirs="$noconfigdirs target-libjava target-libobjc"
-     ;;
diff --git a/toolchain/binutils/2.17/300-001_ld_makefile_patch.patch b/toolchain/binutils/2.17/300-001_ld_makefile_patch.patch
deleted file mode 100644
index 04a7e61..0000000
--- a/toolchain/binutils/2.17/300-001_ld_makefile_patch.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-#!/bin/sh -e
-## 001_ld_makefile_patch.dpatch
-##
-## All lines beginning with `## DP:' are a description of the patch.
-## DP: Description: correct where ld scripts are installed
-## DP: Author: Chris Chimelis <chris@debian.org>
-## DP: Upstream status: N/A
-## DP: Date: ??
-
-if [ $# -ne 1 ]; then
-    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
-    exit 1
-fi
-
-[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
-patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
-
-case "$1" in
-       -patch) patch $patch_opts -p1 < $0;;
-       -unpatch) patch $patch_opts -p1 -R < $0;;
-        *)
-                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
-                exit 1;;
-esac
-
-exit 0
-
- at DPATCH@
---- binutils-2.16.91.0.1/ld/Makefile.am
-+++ binutils-2.16.91.0.1/ld/Makefile.am
-@@ -20,7 +20,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- 
- EMUL = @EMUL@
- EMULATION_OFILES = @EMULATION_OFILES@
---- binutils-2.16.91.0.1/ld/Makefile.in
-+++ binutils-2.16.91.0.1/ld/Makefile.in
-@@ -268,7 +268,7 @@
- # We put the scripts in the directory $(scriptdir)/ldscripts.
- # We can't put the scripts in $(datadir) because the SEARCH_DIR
- # directives need to be different for native and cross linkers.
--scriptdir = $(tooldir)/lib
-+scriptdir = $(libdir)
- BASEDIR = $(srcdir)/..
- BFDDIR = $(BASEDIR)/bfd
- INCDIR = $(BASEDIR)/include
diff --git a/toolchain/binutils/2.17/300-006_better_file_error.patch b/toolchain/binutils/2.17/300-006_better_file_error.patch
deleted file mode 100644
index f337611..0000000
--- a/toolchain/binutils/2.17/300-006_better_file_error.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-#!/bin/sh -e
-## 006_better_file_error.dpatch by David Kimdon <dwhedon@gordian.com>
-##
-## All lines beginning with `## DP:' are a description of the patch.
-## DP: Specify which filename is causing an error if the filename is a
-## DP: directory. (#45832)
-
-if [ $# -ne 1 ]; then
-    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
-    exit 1
-fi
-
-[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
-patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
-
-case "$1" in
-       -patch) patch $patch_opts -p1 < $0;;
-       -unpatch) patch $patch_opts -p1 -R < $0;;
-        *)
-                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
-                exit 1;;
-esac
-
-exit 0
-
- at DPATCH@
-diff -urNad /home/james/debian/packages/binutils/binutils-2.14.90.0.6/bfd/opncls.c binutils-2.14.90.0.6/bfd/opncls.c
---- /home/james/debian/packages/binutils/binutils-2.14.90.0.6/bfd/opncls.c	2003-07-23 16:08:09.000000000 +0100
-+++ binutils-2.14.90.0.6/bfd/opncls.c	2003-09-10 22:35:00.000000000 +0100
-@@ -150,6 +150,13 @@
- {
-   bfd *nbfd;
-   const bfd_target *target_vec;
-+  struct stat s;
-+
-+  if (stat (filename, &s) == 0)
-+    if (S_ISDIR(s.st_mode)) {
-+      bfd_set_error (bfd_error_file_not_recognized);
-+      return NULL;
-+    }
- 
-   nbfd = _bfd_new_bfd ();
-   if (nbfd == NULL)
diff --git a/toolchain/binutils/2.17/300-012_check_ldrunpath_length.patch b/toolchain/binutils/2.17/300-012_check_ldrunpath_length.patch
deleted file mode 100644
index 498651a..0000000
--- a/toolchain/binutils/2.17/300-012_check_ldrunpath_length.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-#!/bin/sh -e
-## 012_check_ldrunpath_length.dpatch by Chris Chimelis <chris@debian.org>
-##
-## All lines beginning with `## DP:' are a description of the patch.
-## DP: Only generate an RPATH entry if LD_RUN_PATH is not empty, for
-## DP: cases where -rpath isn't specified. (#151024)
-
-if [ $# -ne 1 ]; then
-    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
-    exit 1
-fi
-
-[ -f debian/patches/00patch-opts ] && . debian/patches/00patch-opts
-patch_opts="${patch_opts:--f --no-backup-if-mismatch}"
-
-case "$1" in
-       -patch) patch $patch_opts -p1 < $0;;
-       -unpatch) patch $patch_opts -p1 -R < $0;;
-        *)
-                echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
-                exit 1;;
-esac
-
-exit 0
-
- at DPATCH@
-diff -urNad /home/james/debian/packages/binutils/new/binutils-2.15/ld/emultempl/elf32.em binutils-2.15/ld/emultempl/elf32.em
---- /home/james/debian/packages/binutils/new/binutils-2.15/ld/emultempl/elf32.em	2004-05-21 23:12:58.000000000 +0100
-+++ binutils-2.15/ld/emultempl/elf32.em	2004-05-21 23:12:59.000000000 +0100
-@@ -692,6 +692,8 @@
- 	      && command_line.rpath == NULL)
- 	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
- 		break;
-@@ -871,6 +873,8 @@
-   rpath = command_line.rpath;
-   if (rpath == NULL)
-     rpath = (const char *) getenv ("LD_RUN_PATH");
-+  if ((rpath) && (strlen (rpath) == 0))
-+      rpath = NULL;
-   if (! (bfd_elf_size_dynamic_sections
- 	 (output_bfd, command_line.soname, rpath,
- 	  command_line.filter_shlib,
diff --git a/toolchain/binutils/2.17/400-mips-ELF_MAXPAGESIZE-4K.patch b/toolchain/binutils/2.17/400-mips-ELF_MAXPAGESIZE-4K.patch
deleted file mode 100644
index 5959c71..0000000
--- a/toolchain/binutils/2.17/400-mips-ELF_MAXPAGESIZE-4K.patch
+++ /dev/null
@@ -1,26 +0,0 @@
---- binutils/bfd/elf32-mips.c~
-+++ binutils/bfd/elf32-mips.c
-@@ -1613,7 +1613,9 @@
- 
- /* The SVR4 MIPS ABI says that this should be 0x10000, and Linux uses
-    page sizes of up to that limit, so we need to respect it.  */
--#define ELF_MAXPAGESIZE			0x10000
-+/*#define ELF_MAXPAGESIZE			0x10000*/
-+/* Use 4K to shrink the elf header.  NOT for general use! */
-+#define ELF_MAXPAGESIZE			0x1000
- #define elf32_bed			elf32_tradbed
- 
- /* Include the target file again for this target.  */
---- binutils/bfd/elfn32-mips.c~
-+++ binutils/bfd/elfn32-mips.c
-@@ -2399,7 +2399,9 @@
- 
- /* The SVR4 MIPS ABI says that this should be 0x10000, and Linux uses
-    page sizes of up to that limit, so we need to respect it.  */
--#define ELF_MAXPAGESIZE			0x10000
-+/*#define ELF_MAXPAGESIZE			0x10000*/
-+/* Use 4K to shrink the elf header.  NOT for general use! */
-+#define ELF_MAXPAGESIZE			0x1000
- #define elf32_bed			elf32_tradbed
- 
- /* Include the target file again for this target.  */
diff --git a/toolchain/binutils/2.17/500-fix-makeinfo-check.patch b/toolchain/binutils/2.17/500-fix-makeinfo-check.patch
deleted file mode 100644
index c4c8888..0000000
--- a/toolchain/binutils/2.17/500-fix-makeinfo-check.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- configure |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: binutils-2.17/configure
-===================================================================
---- binutils-2.17.orig/configure
-+++ binutils-2.17/configure
-@@ -3637,7 +3637,7 @@
-     # For an installed makeinfo, we require it to be from texinfo 4.4 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|4\.[1-9][0-9]|[5-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
deleted file mode 100644
index 8ab383b..0000000
--- a/toolchain/binutils/binutils.mk
+++ /dev/null
@@ -1,179 +0,0 @@
-#############################################################
-#
-# build binutils for use on the host system
-#
-#############################################################
-BINUTILS_VERSION:=$(call qstrip,$(BR2_BINUTILS_VERSION))
-
-EXTRA_BINUTILS_CONFIG_OPTIONS=$(call qstrip,$(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS))
-ifeq ($(findstring avr32,$(BINUTILS_VERSION)),avr32)
-BINUTILS_SITE:=ftp://www.at91.com/pub/buildroot/
-else
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
-endif
-
-# We do not rely on the host's gmp/mpfr but use a known working one
-BINUTILS_HOST_PREREQ:=
-BINUTILS_TARGET_PREREQ:=
-
-BINUTILS_HOST_PREREQ:=host-gmp host-mpfr
-HOST_SOURCE += host-gmp-source host-mpfr-source
-
-BINUTILS_TARGET_PREREQ:=gmp mpfr
-
-EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-gmp=$(HOST_DIR)/usr
-EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-mpfr=$(HOST_DIR)/usr
-
-BINUTILS_TARGET_CONFIG_OPTIONS=--with-gmp=$(STAGING_DIR)/usr
-BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr=$(STAGING_DIR)/usr
-
-ifeq ($(BR2_PACKAGE_LIBMPC),y)
-BINUTILS_ADD_MPC = y
-endif
-
-ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-BINUTILS_ADD_MPC = y
-endif
-
-ifeq ($(BINUTILS_ADD_MPC),y)
-BINUTILS_HOST_PREREQ += host-mpc
-HOST_SOURCE += host-mpc-source
-BINUTILS_TARGET_PREREQ += mpc
-EXTRA_BINUTILS_CONFIG_OPTIONS += --with-mpc=$(HOST_DIR)/usr
-BINUTILS_TARGET_CONFIG_OPTIONS += --with-mpc=$(STAGING_DIR)/usr
-endif
-
-BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
-
-ifneq ($(filter xtensa%,$(ARCH)),)
-include target/xtensa/patch.in
-BINUTILS_PATCH_EXTRA:=$(call XTENSA_PATCH,binutils,$(BINUTILS_PATCH_DIR),. ..)
-endif
-
-BINUTILS_SOURCE:=binutils-$(BINUTILS_VERSION).tar.bz2
-BINUTILS_DIR:=$(TOOLCHAIN_DIR)/binutils-$(BINUTILS_VERSION)
-BINUTILS_CAT:=$(BZCAT)
-
-BINUTILS_DIR1:=$(TOOLCHAIN_DIR)/binutils-$(BINUTILS_VERSION)-build
-
-$(DL_DIR)/$(BINUTILS_SOURCE):
-	mkdir -p $(DL_DIR)
-	$(call DOWNLOAD,$(BINUTILS_SITE),$(BINUTILS_SOURCE))
-
-binutils-unpacked: $(BINUTILS_DIR)/.patched
-$(BINUTILS_DIR)/.unpacked: $(DL_DIR)/$(BINUTILS_SOURCE)
-	mkdir -p $(TOOLCHAIN_DIR)
-	rm -rf $(BINUTILS_DIR)
-	$(BINUTILS_CAT) $(DL_DIR)/$(BINUTILS_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(@D)
-	touch $@
-
-binutils-patched: $(BINUTILS_DIR)/.patched
-$(BINUTILS_DIR)/.patched: $(BINUTILS_DIR)/.unpacked
-	# Apply appropriate binutils patches.
-ifneq ($(wildcard $(BINUTILS_PATCH_DIR)),)
-	toolchain/patch-kernel.sh $(BINUTILS_DIR) $(BINUTILS_PATCH_DIR) \*.patch $(BINUTILS_PATCH_EXTRA)
-endif
-	touch $@
-
-$(BINUTILS_DIR1)/.configured: $(BINUTILS_DIR)/.patched
-	mkdir -p $(BINUTILS_DIR1)
-	(cd $(BINUTILS_DIR1); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		$(BINUTILS_DIR)/configure $(QUIET) \
-		--prefix=$(STAGING_DIR)/usr \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
-		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
-		$(BR2_CONFIGURE_STAGING_SYSROOT) \
-		$(DISABLE_NLS) \
-		--disable-multilib \
-		--disable-werror \
-		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(EXTRA_BINUTILS_CONFIG_OPTIONS) \
-		$(QUIET) \
-	)
-	touch $@
-
-$(BINUTILS_DIR1)/binutils/objdump: $(BINUTILS_DIR1)/.configured
-	$(MAKE) -C $(BINUTILS_DIR1) all
-
-# Make install will put gettext data in staging_dir/share/locale.
-# Unfortunatey, it isn't configureable.
-$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld: $(BINUTILS_DIR1)/binutils/objdump
-	$(MAKE) -C $(BINUTILS_DIR1) install
-	#	tooldir=/usr build_tooldir=/usr install
-	#rm -f $(STAGING_DIR)/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip}
-
-binutils: $(BINUTILS_HOST_PREREQ) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld
-
-binutils-source: $(DL_DIR)/$(BINUTILS_SOURCE)
-
-binutils-clean:
-	-$(MAKE) -C $(BINUTILS_DIR1) DESTDIR=$(STAGING_DIR) \
-		tooldir=/usr build_tooldir=/usr uninstall
-	-$(MAKE) -C $(BINUTILS_DIR1) clean
-	rm -rf $(wildcard $(patsubst %,$(STAGING_DIR)/usr/bin/*%,ar as ld nm objdump ranlib strip c++filt)) \
-		$(wildcard $(patsubst %,$(STAGING_DIR)/usr/lib/%*,libiberty ldscripts))
-
-binutils-dirclean:
-	rm -rf $(BINUTILS_DIR1)
-
-binutils-src-dirclean:
-	rm -rf $(BINUTILS_DIR)
-
-#############################################################
-#
-# build binutils for use on the target system
-#
-#############################################################
-BINUTILS_DIR2:=$(BUILD_DIR)/binutils-$(BINUTILS_VERSION)-target
-$(BINUTILS_DIR2)/.configured: $(BINUTILS_DIR)/.patched
-	mkdir -p $(BINUTILS_DIR2)
-	(cd $(BINUTILS_DIR2); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(BINUTILS_DIR)/configure $(QUIET) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		$(DISABLE_NLS) \
-		$(BINUTILS_TARGET_CONFIG_OPTIONS) \
-		--disable-multilib \
-		--disable-werror \
-		$(SOFT_FLOAT_CONFIG_OPTION) \
-	)
-	touch $@
-
-$(BINUTILS_DIR2)/binutils/objdump: $(BINUTILS_DIR2)/.configured
-	PATH=$(TARGET_PATH) $(MAKE) -C $(BINUTILS_DIR2) all
-
-$(TARGET_DIR)/usr/bin/ld: $(BINUTILS_DIR2)/binutils/objdump
-	PATH=$(TARGET_PATH) \
-	$(MAKE) DESTDIR=$(TARGET_DIR) \
-		tooldir=/usr build_tooldir=/usr \
-		-C $(BINUTILS_DIR2) install
-	rm -rf $(TARGET_DIR)/share/locale
-	-$(STRIPCMD) $(TARGET_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/* > /dev/null 2>&1
-	-$(STRIPCMD) $(TARGET_DIR)/usr/bin/* > /dev/null 2>&1
-
-# If both binutils-target and busybox are selected, make certain binutils
-# gets to run after busybox, so it can overwrite the busybox symlink for
-# ar if enabled
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-BINUTILS_TARGET_PREREQ += busybox
-endif
-
-binutils_target: $(BINUTILS_TARGET_PREREQ) $(TARGET_DIR)/usr/bin/ld
-
-binutils_target-clean:
-	-$(MAKE) -C $(BINUTILS_DIR2) clean
-	rm -f $(TARGET_DIR)/bin/$(REAL_GNU_TARGET_NAME)* \
-		$(addprefix $(TARGET_DIR)/usr/bin/, addr2line ar as gprof ld nm objcopy objdump ranlib readelf size strings strip c++filt)
-
-binutils_target-dirclean:
-	rm -rf $(BINUTILS_DIR2)
diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index d9ebfcd..9b500f2 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GCC_TARGET
 	bool "native toolchain in the target filesystem"
 	depends on BR2_HAVE_DEVFILES
+	select BR2_PACKAGE_BINUTILS_TARGET
 	help
 	  If you want the target system to be able to run
 	  binutils/gcc and compile native code, say Y here.
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 9e7127d..543454b 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -53,9 +53,6 @@ else
 GCC_OPTSPACE=--enable-target-optspace
 endif
 
-GCC_TARGET_PREREQ=
-GCC_STAGING_PREREQ=
-
 #############################################################
 #
 # Setup some initial stuff
@@ -203,17 +200,12 @@ endif
 #############################################################
 GCC_BUILD_DIR1:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-initial
 
-
-# The --without-headers option stopped working with gcc 3.0 and has never been
-# fixed, so we need to actually have working C library header files prior to
-# the step or libgcc will not build...
-
 $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR1)
 	(cd $(GCC_BUILD_DIR1); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_DIR)/configure $(QUIET) \
-		--prefix=$(STAGING_DIR)/usr \
+		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
@@ -243,7 +235,6 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 	touch $@
 
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
-	# gcc >= 4.3.0 have to also build all-target-libgcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
 else
@@ -252,16 +243,11 @@ endif
 	touch $@
 
 gcc_initial=$(GCC_BUILD_DIR1)/.installed
-$(gcc_initial) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
-	# gcc >= 4.3.0 have to also install install-target-libgcc
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
-else
+$(gcc_initial) $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
-endif
 	touch $(gcc_initial)
 
-gcc_initial: binutils $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+gcc_initial: host-binutils $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 
 gcc_initial-clean:
 	rm -rf $(GCC_BUILD_DIR1)
@@ -276,22 +262,16 @@ gcc_initial-dirclean:
 #############################################################
 GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-intermediate
 
-
 # The --without-headers option stopped working with gcc 3.0 and has never been
 # fixed, so we need to actually have working C library header files prior to
 # the step or libgcc will not build...
 
 $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR2)
-	-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
-	mkdir -p $(STAGING_DIR)/lib
-	ln -snf ../../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
-	$(if $(BR2_ARCH_IS_64),mkdir -p $(STAGING_DIR)/lib64)
-	$(if $(BR2_ARCH_IS_64),ln -snf ../../lib64 $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64)
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_DIR)/configure $(QUIET) \
-		--prefix=$(STAGING_DIR)/usr \
+		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
@@ -338,7 +318,7 @@ else
 endif
 	touch $(gcc_intermediate)
 
-gcc_intermediate: uclibc-configured $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+gcc_intermediate: uclibc-configured $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 
 gcc_intermediate-clean:
 	rm -rf $(GCC_BUILD_DIR2)
@@ -363,11 +343,11 @@ GCC_BUILD_DIR3:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-final
 $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	# Important! Required for limits.h to be fixed.
-	ln -snf ../include/ $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
+	ln -snf ../include/ $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
-		--prefix=$(STAGING_DIR)/usr \
+		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
@@ -412,19 +392,19 @@ $(GCC_BUILD_DIR3)/.installed: $(GCC_BUILD_DIR3)/.compiled
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
+	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu,$(wildcard $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
 endif
 	# Make sure we have 'cc'.
-	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
+	if [ ! -e $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
 		ln -snf $(REAL_GNU_TARGET_NAME)-gcc \
-			$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
+			$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
-		ln -snf gcc $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc; \
+	if [ ! -e $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
+		ln -snf gcc $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc; \
 	fi
 	# Set up the symlinks to enable lying about target name.
 	set -e; \
-	(cd $(STAGING_DIR)/usr; \
+	(cd $(HOST_DIR)/usr; \
 		ln -snf $(REAL_GNU_TARGET_NAME) $(GNU_TARGET_NAME); \
 		cd bin; \
 		for app in $(REAL_GNU_TARGET_NAME)-*; do \
@@ -438,31 +418,31 @@ endif
 
 $(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR3)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
-	# These are in /lib, so...
+	# These go in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
+	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
 		$(TARGET_DIR)/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	mkdir -p $(TARGET_DIR)/usr/lib
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libstdc++.so* \
+	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libstdc++.so* \
 		$(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
-	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcj.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcj.so* $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/usr/lib/security
-	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security \
+	cp -dpf $(HOST_DIR)/usr/lib/security/classpath.security \
 		$(TARGET_DIR)/usr/lib/security/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgcj.so*
 endif
 	mkdir -p $(@D)
 	touch $@
 
-cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+cross_compiler:=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 cross_compiler gcc: gcc_intermediate \
 	$(LIBFLOAT_TARGET) uclibc $(GCC_BUILD_DIR3)/.installed \
 	$(STAMP_DIR)/gcc_libs_target_installed \
@@ -473,8 +453,8 @@ gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 gcc-clean:
 	rm -rf $(GCC_BUILD_DIR3)
 	for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
-		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog; \
-		rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
+		rm -f $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog; \
+		rm -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
 	done
 
 gcc-dirclean: gcc_initial-dirclean
@@ -556,7 +536,7 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
 	# Work around problem of missing syslimits.h
 	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \
 		echo "warning: working around missing syslimits.h"; \
-		cp -f $(STAGING_DIR)/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h \
+		cp -f $(HOST_DIR)/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h \
 			$(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/; \
 	fi
 	# Make sure we have 'cc'.
@@ -567,7 +547,7 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
 	#rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	touch -c $@
 
-gcc_target: uclibc_target binutils_target $(TARGET_DIR)/usr/bin/gcc
+gcc_target: uclibc_target binutils $(TARGET_DIR)/usr/bin/gcc
 
 gcc_target-clean:
 	rm -rf $(GCC_BUILD_DIR4)
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index f12a480..c611562 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -1,7 +1,6 @@
 # Include files required for the internal toolchain backend
 
 include toolchain/dependencies/dependencies.mk
-include toolchain/binutils/binutils.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index c458251..3894890 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -3,6 +3,6 @@
 if BR2_TOOLCHAIN_BUILDROOT
 source "toolchain/kernel-headers/Config.in"
 source "toolchain/uClibc/Config.in"
-source "toolchain/binutils/Config.in"
+source "package/binutils/Config.in.host"
 source "toolchain/gcc/Config.in"
 endif
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index 1befff2..e480da9 100644
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -2,7 +2,6 @@
 
 # Explicit ordering:
 include toolchain/helpers.mk
-include toolchain/binutils/binutils.mk
 include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index c43618b..d67405b 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -1,7 +1,6 @@
 # Required includes for the external toolchain backend
 
 include toolchain/helpers.mk
-include toolchain/binutils/binutils.mk
 include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-- 
1.7.2.2
