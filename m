From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 26 Sep 2007 14:12:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/busybox
	project target etc...
Message-ID: <20070926211240.7B063A48ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-26 14:12:38 -0700 (Wed, 26 Sep 2007)
New Revision: 20045

Log:
- revert some bad checkins, fixup bad settings in atmel targets and move the gcc target abi back to a place where the other arch-specific settings live


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/Makefile
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/project/Config.in
   trunk/buildroot/target/Config.in
   trunk/buildroot/target/arch.in
   trunk/buildroot/target/device/Atmel/Config.in
   trunk/buildroot/target/device/Config.in
   trunk/buildroot/target/device/Toolchain.in
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/external-toolchain/Config.in
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/Config.in
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -10,9 +10,8 @@
 	string
 	default "0.10.0-svn"
 
-source "project/Config.in"
-
 source "target/arch.in"
+source "target/device/Config.in"
 
 menu "Build options"
 
@@ -68,6 +67,8 @@
 	  If the Linux shell environment has defined the BUILDROOT_DL_DIR
 	  environment variable, then this overrides this configuration item.
 
+	  The default is $(BASE_DIR)/dl
+
 source	"target/device/Mirrors.in"
 
 config BR2_STAGING_DIR

Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/Makefile	2007-09-26 21:12:38 UTC (rev 20045)
@@ -168,7 +168,7 @@
 # along with the packages to build for the target.
 #
 ##############################################################
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils
 else
 BASE_TARGETS:=uclibc
@@ -200,7 +200,7 @@
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 # avoid pulling in external toolchain which is broken for toplvl parallel builds
 include $(filter-out $(wildcard toolchain/external-toolchain/*),$(wildcard toolchain/*/*.mk))
 else

Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/package/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -2,16 +2,8 @@
 
 source "package/busybox/Config.in"
 
-comment "The minimum needed to build a uClibc development system ---"
+comment "The minimum needed to build a uClibc development system"
 
-menuconfig BR2_APPLICATIONS
-	bool "Common Applications"
-	default y
-	help
-	  A set of applications, utilities and libraries for 
-	  text processing, toolchain generation and other things.
-
-if BR2_APPLICATIONS
 source "package/bash/Config.in"
 source "package/bzip2/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
@@ -37,6 +29,15 @@
 source "package/tar/Config.in"
 endif
 
+#menuconfig BR2_APPLICATION_SUPPORT
+#	bool "Common Applications"
+#	default y
+#	help
+#	  A set of applications, utilities and libraries for 
+#	  text processing, toolchain generation and other things.
+
+
+#if BR2_APPLICATION_SUPPORT
 comment "Other development stuff"
 source "package/autoconf/Config.in"
 source "package/automake/Config.in"
@@ -119,7 +120,6 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/which/Config.in"
 endif
-endif
 
 menuconfig BR2_NETWORK_SUPPORT
 	bool "Networking"
@@ -128,8 +128,6 @@
 	  Support for communication, networking and related packages
 
 if BR2_NETWORK_SUPPORT
-comment "Communications applications"
-source "package/microcom/Config.in"
 comment "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
@@ -157,6 +155,9 @@
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
 source "package/mdnsresponder/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/microcom/Config.in"
+endif
 source "package/mrouted/Config.in"
 source "package/mutt/Config.in"
 source "package/nbd/Config.in"

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/package/Makefile.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -10,7 +10,7 @@
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
 	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
@@ -63,7 +63,7 @@
 #########################################################################
 
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
 # Quotes are needed for spaces et al in path components.

Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/package/busybox/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -1,10 +1,3 @@
-menuconfig BR2_BUSYBOX_MENU
-	bool "Busybox configuration -- the default minimal system"
-	default y
-	help
-	  Configuration of Busybox, 
-
-if BR2_BUSYBOX_MENU
 config BR2_PACKAGE_BUSYBOX
 	bool "BusyBox"
 	default y
@@ -23,42 +16,10 @@
 	help
 	  Select the version of BusyBox you wish to use.
 
-	config BR2_BUSYBOX_VERSION_1_0_1
-		bool "BusyBox 1.0.1"
-		depends on BR2_DEPRECATED
-
-	config BR2_BUSYBOX_VERSION_1_1_3
-		bool "BusyBox 1.1.3"
-		depends on BR2_DEPRECATED
-
 	config BR2_BUSYBOX_VERSION_1_2_2_1
 		bool "BusyBox 1.2.2.1"
 		depends on BR2_DEPRECATED
 
-	config BR2_BUSYBOX_VERSION_1_4_0
-		bool "BusyBox 1.4.0"
-		depends on BR2_DEPRECATED
-
-	config BR2_BUSYBOX_VERSION_1_4_1
-		bool "BusyBox 1.4.1"
-		depends on BR2_DEPRECATED
-
-	config BR2_BUSYBOX_VERSION_1_4_2
-		bool "BusyBox 1.4.2"
-		depends on BR2_DEPRECATED
-
-	config BR2_BUSYBOX_VERSION_1_5_0
-		bool "BusyBox 1.5.0"
-		depends on BR2_DEPRECATED
-
-	config BR2_BUSYBOX_VERSION_1_5_1
-		bool "BusyBox 1.5.1"
-		depends on BR2_DEPRECATED
-
-	config BR2_BUSYBOX_VERSION_1_6_0
-		bool "BusyBox 1.6.0"
-		depends on BR2_DEPRECATED
-
 	config BR2_BUSYBOX_VERSION_1_6_1
 		bool "BusyBox 1.6.1"
 		depends on BR2_DEPRECATED
@@ -77,15 +38,7 @@
 
 config BR2_BUSYBOX_VERSION
 	string
-	default "1.0.1"		if BR2_BUSYBOX_VERSION_1_0_1
-	default "1.1.3"		if BR2_BUSYBOX_VERSION_1_1_3
 	default "1.2.2.1"	if BR2_BUSYBOX_VERSION_1_2_2_1
-	default "1.4.0"		if BR2_BUSYBOX_VERSION_1_4_0
-	default "1.4.1"		if BR2_BUSYBOX_VERSION_1_4_1
-	default "1.4.2"		if BR2_BUSYBOX_VERSION_1_4_2
-	default "1.5.0"		if BR2_BUSYBOX_VERSION_1_5_0
-	default "1.5.1"		if BR2_BUSYBOX_VERSION_1_5_1
-	default "1.6.0"		if BR2_BUSYBOX_VERSION_1_6_0
 	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
 	default "1.7.0"		if BR2_BUSYBOX_VERSION_1_7_0
 	default "1.7.1"		if BR2_BUSYBOX_VERSION_1_7_1
@@ -108,15 +61,7 @@
 	string "BusyBox configuration file to use?"
 	depends BR2_PACKAGE_BUSYBOX
 	default "target/device/x86/i386/busybox.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
-	default "package/busybox/busybox-1.0.1.config" if BR2_BUSYBOX_VERSION_1_0_1
-	default "package/busybox/busybox-1.1.3.config" if BR2_BUSYBOX_VERSION_1_1_3
 	default "package/busybox/busybox-1.2.2.1.config" if BR2_BUSYBOX_VERSION_1_2_2_1
-	default "package/busybox/busybox-1.4.0.config" if BR2_BUSYBOX_VERSION_1_4_0
-	default "package/busybox/busybox-1.4.1.config" if BR2_BUSYBOX_VERSION_1_4_1
-	default "package/busybox/busybox-1.4.1.config" if BR2_BUSYBOX_VERSION_1_4_2
-	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_0
-	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_1
-	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_0
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_0
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_1
@@ -134,8 +79,6 @@
 	  Do not show packages in menuconfig that are potentially provided
 	  by busybox.
 
-comment "Skeleton configuration"
-
 config BR2_PACKAGE_BUSYBOX_SKELETON
 	bool "use minimal target skeleton"
 	depends on BR2_PACKAGE_BUSYBOX
@@ -144,22 +87,8 @@
 	  Use a minimal target skeleton. Make sure to select mdev
 	  which is used to populate /dev/.
 
-config BR2_HOSTNAME
-	string "hostname"
-	default "uclibc"
-	help
-	  The hostname string is stored in "/etc/hostname"
-
-config BR2_BANNER
-	string "banner"
-	default "Welcome to the Erik's uClibc development environment."
-	help
-	  The banner string is stored in "/etc/issue"
-
-
 #config BR2_PACKAGE_BUSYBOX_INITRAMFS
 #	bool "initramfs perusing busybox"
 #	depends on BR2_PACKAGE_BUSYBOX
 #	help
 #	  Build small initramfs perusing busybox.
-endif

Modified: trunk/buildroot/project/Config.in
===================================================================
--- trunk/buildroot/project/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/project/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -1,4 +1,4 @@
-menu "Project Options"
+comment "Project Options"
 
 config BR2_PROJECT
 	string "Project name"
@@ -11,4 +11,15 @@
 	  Older targets may still build in the build_<arch>
 	  and store binaries in the top directory.
 
-endmenu
+config BR2_HOSTNAME
+	string "hostname"
+	default "uclibc"
+	help
+	  The hostname string is stored in "/etc/hostname"
+
+config BR2_BANNER
+	string "banner"
+	default "Welcome to the Erik's uClibc development environment."
+	help
+	  The banner string is stored in "/etc/issue"
+

Modified: trunk/buildroot/target/Config.in
===================================================================
--- trunk/buildroot/target/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/target/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -1,4 +1,4 @@
-menu "Target Options"
+menu "Target filesystem options"
 
 comment "filesystem for target device"
 
@@ -47,5 +47,3 @@
 source "target/hurd/Config.in"
 endif
 endmenu
-
-source "target/device/Config.in"

Modified: trunk/buildroot/target/arch.in
===================================================================
--- trunk/buildroot/target/arch.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/target/arch.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -108,7 +108,19 @@
 	default ARM_XSCALE	if BR2_xscale
 	default ARM_IWMMXT	if BR2_iwmmxt
 
+choice
+	prompt "Target ABI"
+	depends BR2_arm || BR2_armeb
+	default BR2_ARM_OABI
+	help
+	  Application Binary Interface to use
 
+config BR2_ARM_OABI
+	bool "OABI"
+config BR2_ARM_EABI
+	bool "EABI"
+endchoice
+
 choice
 	prompt "Target Architecture Variant"
 	depends BR2_avr32
@@ -623,3 +635,24 @@
 	default z990		if BR2_s390_z990
 	default z9-109		if BR2_s390_z9_109
 
+config BR2_GCC_TARGET_ABI
+	string
+	default apcs-gnu	if BR2_arm_dunno
+	default atpcs		if BR2_arm_dunno
+	default aapcs		if BR2_arm_dunno
+	default aapcs-linux	if BR2_arm_dunno
+	default iwmmxt		if BR2_iwmmxt
+	default 32		if BR2_mipsel && BR2_OABI
+	default n32		if BR2_mipsel && BR2_EABI
+	default o64		if BR2_mips && BR2_OABI
+	default 64		if BR2_mips && BR2_ABI64
+	default eabi		if BR2_mips && BR2_EABI
+	default mmixware	if BR2_mmix && BR2_ABI_native
+	default gnu		if BR2_mmix && !BR2_ABI_native
+	default altivec		if BR2_powerpc && BR2_ABI_altivec
+	default no-altivec	if BR2_powerpc && BR2_ABI_no-altivec
+	default spe		if BR2_powerpc && BR2_ABI_spe
+	default no-spe		if BR2_powerpc && BR2_ABI_no-spe
+	default ibmlongdouble	if BR2_powerpc && BR2_ABI_ibmlongdouble
+	default ieeelongdouble	if BR2_powerpc && BR2_ABI_ieeelongdouble
+

Modified: trunk/buildroot/target/device/Atmel/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/target/device/Atmel/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -10,19 +10,19 @@
 
 config BR2_BOARD_NAME
 	string
-	default	"at91rm9200df"		if	BR2_TARGET_AT91RM9200DF
-	default	"at91rm9200se"		if	BR2_TARGET_AT91RM9200SE
-	default	"at91rm9200ek"		if	BR2_TARGET_AT91RM9200EK
-	default	"at91rm9200dk"		if	BR2_TARGET_AT91RM9200DK
-	default	"at91sam9260ek"		if	BR2_TARGET_AT91SAM9260EK
-	default	"at91sam9260dfc"	if	BR2_TARGET_AT91SAM9260DFC
-	default	"at91sam9260pf"		if	BR2_TARGET_AT91SAM9260PF
-	default	"at91sam9261ek"		if	BR2_TARGET_AT91SAM9261EK
-	default	"at91sam9262ek"		if	BR2_TARGET_AT91SAM9262EK
-	default	"at91sam9263ek"		if	BR2_TARGET_AT91SAM9263EK
-	default	"at91sam9xeek"		if	BR2_TARGET_AT91SAM9XEEK
-	default	"atstk1002"		if	BR2_TARGET_AVR32_ATSTK1002
-	default	"atngw100"		if	BR2_TARGET_AVR32_ATNGW100
+	default	"at91rm9200df"		if BR2_TARGET_AT91RM9200DF
+	default	"at91rm9200se"		if BR2_TARGET_AT91RM9200SE
+	default	"at91rm9200ek"		if BR2_TARGET_AT91RM9200EK
+	default	"at91rm9200dk"		if BR2_TARGET_AT91RM9200DK
+	default	"at91sam9260ek"		if BR2_TARGET_AT91SAM9260EK
+	default	"at91sam9260dfc"	if BR2_TARGET_AT91SAM9260DFC
+	default	"at91sam9260pf"		if BR2_TARGET_AT91SAM9260PF
+	default	"at91sam9261ek"		if BR2_TARGET_AT91SAM9261EK
+	default	"at91sam9262ek"		if BR2_TARGET_AT91SAM9262EK
+	default	"at91sam9263ek"		if BR2_TARGET_AT91SAM9263EK
+	default	"at91sam9xeek"		if BR2_TARGET_AT91SAM9XEEK
+	default	"atstk1002"		if BR2_TARGET_AVR32_ATSTK1002
+	default	"atngw100"		if BR2_TARGET_AVR32_ATNGW100
 
 config BR2_TARGET_AT91_ADVANCED_INFO
 	bool "Remove work in progress"

Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/target/device/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -1,5 +1,7 @@
-menu "Board Support Options"
+menu "Target options"
 
+source "project/Config.in"
+
 comment "Preset Devices"
 
 source "target/device/AMD/Config.in"

Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/target/device/Toolchain.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -1,33 +1,24 @@
+if BR2_TOOLCHAIN_EXTERNAL_SOURCE
 choice
 	prompt "Source location:"
-	default BR2_TOOLCHAIN_NORMAL		if!BR2_avr32
-	default BR2_TOOLCHAIN_ATMEL_AVR32	if BR2_avr32
-	depends on BR2_TOOLCHAIN_BUILDROOT
+	default BR2_TOOLCHAIN_ATMEL_AVR32 if BR2_avr32
 	help
 	  Select whether to use the toolchain built by the buildroot
 	  system or an external pre-built toolchain.
 
-config BR2_TOOLCHAIN_NORMAL
-	bool
-	prompt "Use default sources for toolchain"
-	depends on !BR2_avr32
-	help
-	  Download vanilla binutils, gcc, uclibc and gdb from their 
-	  main download locations, and apply patches from the
-	  "toolchain/<package>" directores.
-	  I.E: Do not download a prepatched vendor source suite.
-
 config BR2_TOOLCHAIN_ATMEL_AVR32
-	bool
-	prompt "Use prepatched source for AVR32 toolchain"
+	bool "Use prepatched source for AVR32 toolchain"
 	depends on BR2_avr32
-	depends on BR2_GCC_VERSION_4_1_2
-	depends on BR2_GDB_VERSION_6_4 || !BR2_PACKAGE_GDB
-	depends on BR2_BINUTILS_VERSION_2_17
-	depends on BR2_UCLIBC_VERSION_0_9_28_3
+	select BR2_GCC_VERSION_4_1_2
+	select BR2_BINUTILS_VERSION_2_17
+	select BR2_UCLIBC_VERSION_0_9_28_3
 
+config BR2_TOOLCHAIN_UNKNOWNVENDOR
+	bool "Use prepatched source from unknown vendor"
+
 endchoice
 
+if BR2_TOOLCHAIN_ATMEL_AVR32
 config BR2_VENDOR_SITE
 	string
 	default "$(BR2_ATMEL_MIRROR)/Source" if BR2_TOOLCHAIN_ATMEL_AVR32
@@ -55,3 +46,36 @@
 config BR2_VENDOR_PATCH_DIR
 	string
 	default "target/device/Atmel/toolchain/avr32" if BR2_TOOLCHAIN_ATMEL_AVR32
+endif
+if BR2_TOOLCHAIN_UNKNOWNVENDOR
+config BR2_VENDOR_SITE
+	string "vendor site"
+	default "http://vendor.com/somewhere/"
+
+config BR2_VENDOR_SUFFIX
+	string "vendor suffix"
+	default ""
+
+config BR2_VENDOR_BINUTILS_RELEASE
+	string "binutils suffix"
+	default ""
+
+config BR2_VENDOR_GCC_RELEASE
+	string "gcc suffix"
+	default ""
+
+config BR2_VENDOR_UCLIBC_RELEASE
+	string "uClibc suffix"
+	default ""
+
+config BR2_VENDOR_GDB_RELEASE
+	string "gdb suffix"
+	default ""
+
+config BR2_VENDOR_PATCH_DIR
+	string "local accumulated patchdir"
+	default "target/device/$(VENDOR)/toolchain/"
+endif
+
+
+endif

Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -1,18 +1,31 @@
 menu "Toolchain"
 choice
 	prompt "Toolchain type"
-	default BR2_TOOLCHAIN_BUILDROOT
+	default BR2_TOOLCHAIN_BUILDROOT if !BR2_avr32
+	default BR2_TOOLCHAIN_EXTERNAL_SOURCE if BR2_avr32
 	help
-	  Select whether to use the toolchain built by the buildroot
-	  system or an external pre-built toolchain.
+	  Select whether to use the toolchain provided by buildroot
+	  or an external toolchain.
 
+	  Some vendors provide toolchains in binary form, some in
+	  source form.
+
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
+	depends on !BR2_avr32
 
 config BR2_TOOLCHAIN_EXTERNAL
-	bool "External toolchain"
+	bool "External binary toolchain"
+
+config BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	bool "External source toolchain"
 endchoice
 
+config BR2_TOOLCHAIN_SOURCE
+	bool
+	default y if BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default n if BR2_TOOLCHAIN_EXTERNAL
+
 source "target/device/Toolchain.in"
 
 source "toolchain/Config.in.2"

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/Config.in.2	2007-09-26 21:12:38 UTC (rev 20045)
@@ -1,6 +1,6 @@
 #
 
-if BR2_TOOLCHAIN_BUILDROOT
+if BR2_TOOLCHAIN_SOURCE
 source "toolchain/kernel-headers/Config.in"
 source "toolchain/uClibc/Config.in"
 source "toolchain/binutils/Config.in"

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-26 21:12:38 UTC (rev 20045)
@@ -65,15 +65,11 @@
 BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),)
-BINUTILS_SITE:=$(VENDOR_SITE)
-endif
-
 BINUTILS_OFFICIAL_VERSION:=$(BINUTILS_VERSION)$(VENDOR_SUFFIX)$(VENDOR_BINUTILS_RELEASE)
-
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
-else
+else # ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),)
+BINUTILS_SITE:=$(VENDOR_SITE)
 BINUTILS_PATCH_DIR:=$(VENDOR_PATCH_DIR)/binutils-$(BINUTILS_OFFICIAL_VERSION)
 endif
 

Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -1,8 +1,9 @@
 #
 
-menu "External Toolchain Options"
-       depends on BR2_TOOLCHAIN_EXTERNAL
+if BR2_TOOLCHAIN_EXTERNAL
+comment "External Toolchain Options"
 
+
 config BR2_TOOLCHAIN_EXTERNAL_LIB_C
 	string "The core C library from the external toolchain"
 	default "libc.so.6"
@@ -104,4 +105,4 @@
 	help
 	  Optimizations to use when building for the target host.
 
-endmenu
+endif

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -69,40 +69,6 @@
 	default "4.2.1"     if BR2_GCC_VERSION_4_2_1
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
-choice
-	prompt "Target ABI"
-	depends BR2_arm || BR2_armeb
-	default BR2_ARM_OABI
-	help
-	  Application Binary Interface to use
-
-config BR2_ARM_OABI
-	bool "OABI"
-config BR2_ARM_EABI
-	bool "EABI"
-endchoice
-
-config BR2_GCC_TARGET_ABI
-	string
-	default apcs-gnu	if BR2_arm_dunno
-	default atpcs		if BR2_arm_dunno
-	default aapcs		if BR2_arm_dunno
-	default aapcs-linux	if BR2_arm_dunno
-	default iwmmxt		if BR2_iwmmxt
-	default 32		if BR2_mipsel && BR2_OABI
-	default n32		if BR2_mipsel && BR2_EABI
-	default o64		if BR2_mips && BR2_OABI
-	default 64		if BR2_mips && BR2_ABI64
-	default eabi		if BR2_mips && BR2_EABI
-	default mmixware	if BR2_mmix && BR2_ABI_native
-	default gnu		if BR2_mmix && !BR2_ABI_native
-	default altivec		if BR2_powerpc && BR2_ABI_altivec
-	default no-altivec	if BR2_powerpc && BR2_ABI_no-altivec
-	default spe		if BR2_powerpc && BR2_ABI_spe
-	default no-spe		if BR2_powerpc && BR2_ABI_no-spe
-	default ibmlongdouble	if BR2_powerpc && BR2_ABI_ibmlongdouble
-	default ieeelongdouble	if BR2_powerpc && BR2_ABI_ieeelongdouble
-
 config BR2_TOOLCHAIN_SYSROOT
 	bool "Enable toolchain with --sysroot support"
 	depends on BR2_GCC_SUPPORTS_SYSROOT

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-26 21:12:38 UTC (rev 20045)
@@ -17,7 +17,7 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 
 # without sysroot support. Sysroot toolchain is gcc-uclibc-4.x.mk
 ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
@@ -33,15 +33,16 @@
 
 
 # redefine if using an external prepatched gcc source
-ifeq ($(BR2_TOOLCHAIN_NORMAL),)
+ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
+GCC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gcc-$(GCC_OFFICIAL_VER)
 endif
 
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 ifeq ($(GCC_SNAP_DATE),)
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else
@@ -51,16 +52,12 @@
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 endif
 endif
-else
-GCC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gcc-$(GCC_OFFICIAL_VER)
 endif
 
-
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=true
 
-
-ifeq ($(findstring 3.,$(GCC_VERSION)),3.)
+ifeq ($(findstring x3.,x$(GCC_VERSION)),x3.)
 GCC_NO_MPFR:=y
 else
 ifneq ($(BR2_INSTALL_FORTRAN),y)

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-26 21:12:38 UTC (rev 20045)
@@ -30,13 +30,14 @@
 endif
 
 # redefine if using an external prepatched gcc source
-ifeq ($(BR2_TOOLCHAIN_NORMAL),)
+ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
-endif
+GCC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gcc-$(GCC_OFFICIAL_VER)
+endif #!BR2_TOOLCHAIN_BUILDROOT
 
 # define patch location
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y) # Normal toolchain
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y) # Normal toolchain
 ifeq ($(GCC_SNAP_DATE),) # Not a snapshot
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else # Is a snapshot
@@ -47,9 +48,7 @@
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 endif # Snapshot patch
 endif # Not a snapshot
-else # Prepatched toolchain
-GCC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gcc-$(GCC_OFFICIAL_VER)
-endif # Normal toolchain
+endif # BR2_TOOLCHAIN_BUILDROOT
 
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)

Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/gdb/Config.in	2007-09-26 21:12:38 UTC (rev 20045)
@@ -22,7 +22,8 @@
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_6_6
+	default BR2_GDB_VERSION_6_6 if !BR2_avr32
+	default BR2_GDB_VERSION_6_4 if BR2_avr32
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
 	  Select the version of gdb you wish to use.

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-09-26 21:12:38 UTC (rev 20045)
@@ -3,7 +3,7 @@
 # gdb
 #
 ######################################################################
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 GDB_VERSION:=$(strip $(subst ",, $(BR2_GDB_VERSION)))
 #"))
 else
@@ -20,7 +20,7 @@
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 else
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 GDB_SITE:=http://ftp.gnu.org/gnu/gdb
 else
 GDB_SITE:=$(VENDOR_SITE)
@@ -31,7 +31,7 @@
 GDB_SOURCE:=gdb-$(GDB_OFFICIAL_VERSION).tar.bz2
 GDB_CAT:=$(BZCAT)
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
 else
 GDB_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gdb-$(GDB_OFFICIAL_VERSION)

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-26 18:18:59 UTC (rev 20044)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-26 21:12:38 UTC (rev 20045)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
@@ -34,14 +34,13 @@
 endif
 UCLIBC_SITE:=http://www.uclibc.org/downloads
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
 UCLIBC_SITE:=$(VENDOR_SITE)
 endif
 
 UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
 
-
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
 else
 UCLIBC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
