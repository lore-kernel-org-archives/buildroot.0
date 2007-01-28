From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 28 Jan 2007 04:03:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/busybox
	toolchain/gcc
Message-ID: <20070128120359.062A7485AF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-28 04:03:58 -0800 (Sun, 28 Jan 2007)
New Revision: 17593

Log:
- add an experimental BR2_PREFER_IMA.
  Currently disfunctional for gcc-4.2 due to PR30620 and possibly others


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/busybox/busybox.mk
   trunk/buildroot/toolchain/gcc/Config.in.2
   trunk/buildroot/toolchain/gcc/Makefile.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-01-28 11:57:00 UTC (rev 17592)
+++ trunk/buildroot/Config.in	2007-01-28 12:03:58 UTC (rev 17593)
@@ -10,7 +10,7 @@
 	prompt "Target Architecture"
 	default BR2_i386
 	help
-	  Stuff
+	  Select the target architecture family to build for.
 
 config BR2_alpha
 	bool "alpha"
@@ -52,6 +52,9 @@
 	prompt "Target Architecture Variant"
 	depends BR2_arm || BR2_armeb
 	default BR2_generic_arm
+	help
+	  Specific CPU variant to use
+
 config BR2_generic_arm
 	bool "generic_arm"
 config BR2_arm610
@@ -97,6 +100,9 @@
 	prompt "Target ABI"
 	depends BR2_arm || BR2_armeb
 	default BR2_ARM_OABI
+	help
+	  Application Binary Interface to use
+
 config BR2_ARM_OABI
 	bool "OABI"
 config BR2_ARM_EABI
@@ -107,6 +113,9 @@
 	prompt "Target Architecture Variant"
 	depends BR2_sh
 	default BR2_sh4
+	help
+	  Specific CPU variant to use
+
 config BR2_sh2a_nofpueb
 	bool "sh2a_nofpueb"
 config BR2_sh2eb
@@ -129,6 +138,9 @@
 	prompt "Target Architecture Variant"
 	depends BR2_i386
 	default BR2_x86_i686
+	help
+	  Specific CPU variant to use
+
 config BR2_x86_i386
 	bool "i386"
 config BR2_x86_i486
@@ -221,54 +233,54 @@
 	string "Sourceforge mirror site"
 	default "easynews"
 	help
-	    Sourceforge has a system of mirror sites.  Some sites may be closer
-	    to your location, and sometimes mirror sites go down and are no longer
-	    available.  This option allows you to select your preferred Sourceforge
-	    mirror site.
+	  Sourceforge has a system of mirror sites.  Some sites may be closer
+	  to your location, and sometimes mirror sites go down and are no longer
+	  available.  This option allows you to select your preferred Sourceforge
+	  mirror site.
 
-	    The list of mirrors is available here:
-	    http://prdownloads.sourceforge.net/index-sf.html?download
+	  The list of mirrors is available here:
+	  http://prdownloads.sourceforge.net/index-sf.html?download
 
 config BR2_STAGING_DIR
 	string "Toolchain and header file location?"
 	default "$(BUILD_DIR)/staging_dir"
 	help
-	    This is the location where the toolchain will be installed.  The
-	    toolchain will not work if it is moved from this location.
-	    Therefore, if you wish to package up a uClibc toolchain, it is
-	    important that is is set to the final location where the toolchain
-	    will be used.
+	  This is the location where the toolchain will be installed.  The
+	  toolchain will not work if it is moved from this location.
+	  Therefore, if you wish to package up a uClibc toolchain, it is
+	  important that is is set to the final location where the toolchain
+	  will be used.
 
-	    Most people will leave this set to the default value of
-	    "$(BUILD_DIR)/staging_dir".
+	  Most people will leave this set to the default value of
+	  "$(BUILD_DIR)/staging_dir".
 
 config BR2_TOPDIR_PREFIX
 	string "Custom build dir prefix"
 	default ""
 	help
-	    Add a custom string to the beginning of the build directories.
+	  Add a custom string to the beginning of the build directories.
 
-	    build_ARCH -> [PREFIX]_build_ARCH
-	    toolchain_build_ARCH -> [PREFIX]_toolchain_build_ARCH
+	  build_ARCH -> [PREFIX]_build_ARCH
+	  toolchain_build_ARCH -> [PREFIX]_toolchain_build_ARCH
 
 config BR2_TOPDIR_SUFFIX
 	string "Custom build dir suffix"
 	default ""
 	help
-	    Add a custom string to the end of the build directories.
+	  Add a custom string to the end of the build directories.
 
-	    build_ARCH -> build_ARCH_[SUFFIX]
-	    toolchain_build_ARCH -> toolchain_build_ARCH_[SUFFIX] 
+	  build_ARCH -> build_ARCH_[SUFFIX]
+	  toolchain_build_ARCH -> toolchain_build_ARCH_[SUFFIX] 
 
 config BR2_GNU_BUILD_SUFFIX
 	string "GNU build hostname suffix"
 	default "pc-linux-gnu"
 	help
-	    The string used to pass to configure scripts via the
-	    --build= option.  Just specify the suffix here, the leading
-	    arch will be filled in automatically.
+	  The string used to pass to configure scripts via the
+	  --build= option.  Just specify the suffix here, the leading
+	  arch will be filled in automatically.
 
-	    Here's some copy and paste build host options for you:
+	  Here's some copy and paste build host options for you:
 	      linux:   pc-linux-gnu
 	      cygwin:  pc-cygwin
 	      os x:    apple-darwin7 / apple-darwin8
@@ -278,15 +290,15 @@
 	default "linux-uclibcgnueabi" if BR2_ARM_EABI
 	default "linux-uclibc"
 	help
-	    The string used to pass to configure scripts via the
-	    --target= option.  Just specify the suffix here, the leading
-	    arch will be filled in automatically.
+	  The string used to pass to configure scripts via the
+	  --target= option.  Just specify the suffix here, the leading
+	  arch will be filled in automatically.
 
-	    Most users will want to stick with the default setting, though
-	    other users (most notably ARM EABI) like to add on to this in
-	    order to stay in line with gcc conventions.
+	  Most users will want to stick with the default setting, though
+	  other users (most notably ARM EABI) like to add on to this in
+	  order to stay in line with gcc conventions.
 
-	    Default options are:
+	  Default options are:
 	      linux-uclibcgnueabi for ARM EABI
 	      linux-uclibc for the rest
 
@@ -294,8 +306,21 @@
 	int "Number of jobs to run simultaneously"
 	default "1"
 	help
-	    Number of jobs to run simultaneously
+	  Number of jobs to run simultaneously
 
+config BR2_PREFER_IMA
+	bool "prefer IMA compiles"
+	default n
+	help
+	  Where possible, compile package with Inter Module Analysis.
+	  This potentially uses alot of system resources on your compile
+	  host with the benefit of creating smaller binaries for the target.
+
+	  If unsure, say No.
+
+	  WARNING: This is highly experimental at the moment.
+
+
 endmenu
 
 source "toolchain/Config.in"

Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-01-28 11:57:00 UTC (rev 17592)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-01-28 12:03:58 UTC (rev 17593)
@@ -96,6 +96,14 @@
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR)
+ifeq ($(BR2_PREFER_IMA)$(BR2_PACKAGE_BUSYBOX_SNAPSHOT),yy)
+	rm -f $@
+	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
+		ARCH=$(KERNEL_ARCH) STRIP="$(STRIP)" \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR) \
+		-f scripts/Makefile.IMA
+endif
 
 $(TARGET_DIR)/bin/busybox: $(BUSYBOX_DIR)/busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS),y)

Modified: trunk/buildroot/toolchain/gcc/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in.2	2007-01-28 11:57:00 UTC (rev 17592)
+++ trunk/buildroot/toolchain/gcc/Config.in.2	2007-01-28 12:03:58 UTC (rev 17593)
@@ -5,3 +5,11 @@
 	help
 	  If you want the target system to be able to run 
 	  binutils/gcc and compile native code, say Y here.
+
+config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
+	string "Additional target gcc options"
+	default ""
+	help
+	  Any additional target gcc options you may want to include....
+	  Including, but not limited to --disable-checking etc.
+	  Refer to */configure in your gcc sources.

Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-01-28 11:57:00 UTC (rev 17592)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-01-28 12:03:58 UTC (rev 17593)
@@ -55,5 +55,19 @@
 	BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)"
 
 ifeq ($(strip $(BR2_PACKAGE_GCC_TARGET)),y)
+# pull in config opts from the user
+EXTRA_TARGET_GCC_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS)))
+#"))
+
+ifeq ($(BR2_PREFER_IMA),y)
+# >= 4.2
+ifeq ($(findstring 4.2,$(GCC_VERSION)),4.2)
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--enable-intermodule
+endif
+ifeq ($(findstring 4.3,$(GCC_VERSION)),4.3)
+EXTRA_TARGET_GCC_CONFIG_OPTIONS+=--enable-intermodule
+endif
+endif # BR2_PREFER_IMA=y
+
 TARGETS+=gcc_target
 endif
