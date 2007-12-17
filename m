From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Mon, 17 Dec 2007 04:29:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/ed package/hotplug
	package/tar p etc...
Message-ID: <20071217122910.3700C1200F2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-17 04:29:06 -0800 (Mon, 17 Dec 2007)
New Revision: 20656

Log:
Add support for GNU and kernel.org mirrors

Modified:
   trunk/buildroot/package/ed/ed.mk
   trunk/buildroot/package/hotplug/hotplug.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/util-linux/util-linux.mk
   trunk/buildroot/target/device/Config.in.mirrors
   trunk/buildroot/target/device/Sharp/LNode80/linux.mk
   trunk/buildroot/target/device/Soekris/net4521/linux.mk
   trunk/buildroot/target/device/Via/epia-mii/linux.mk
   trunk/buildroot/target/device/jp/q5/linux.mk
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/target/x86/syslinux/syslinux.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/ed/ed.mk
===================================================================
--- trunk/buildroot/package/ed/ed.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/package/ed/ed.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -5,7 +5,7 @@
 #############################################################
 ED_VERSION:=0.8
 ED_SOURCE:=ed-$(ED_VERSION).tar.bz2
-ED_SITE:=http://ftp.gnu.org/gnu/ed/
+ED_SITE:=$(BR2_GNU_MIRROR)/ed/
 ED_CAT:=$(BZCAT)
 ED_DIR:=$(BUILD_DIR)/ed-$(ED_VERSION)
 ED_BINARY:=ed

Modified: trunk/buildroot/package/hotplug/hotplug.mk
===================================================================
--- trunk/buildroot/package/hotplug/hotplug.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/package/hotplug/hotplug.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -5,7 +5,7 @@
 #############################################################
 HOTPLUG_VERSION:=0.5
 HOTPLUG_SOURCE=package/hotplug/diethotplug-$(HOTPLUG_VERSION).tar
-HOTPLUG_SITE=http://www.kernel.org/pub/linux/utils/kernel/hotplug/
+HOTPLUG_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 HOTPLUG_DIR=$(BUILD_DIR)/diethotplug-$(HOTPLUG_VERSION)
 HOTPLUG_CAT=cat
 

Modified: trunk/buildroot/package/tar/tar.mk
===================================================================
--- trunk/buildroot/package/tar/tar.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/package/tar/tar.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -5,7 +5,7 @@
 #############################################################
 GNUTAR_VERSION:=1.18
 GNUTAR_SOURCE:=tar-$(GNUTAR_VERSION).tar.bz2
-GNUTAR_SITE:=http://ftp.gnu.org/gnu/tar/
+GNUTAR_SITE:=$(BR2_GNU_MIRROR)/tar/
 GNUTAR_DIR:=$(BUILD_DIR)/tar-$(GNUTAR_VERSION)
 GNUTAR_CAT:=$(BZCAT)
 GNUTAR_BINARY:=src/tar

Modified: trunk/buildroot/package/tftpd/tftpd.mk
===================================================================
--- trunk/buildroot/package/tftpd/tftpd.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/package/tftpd/tftpd.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -5,7 +5,7 @@
 #############################################################
 TFTP_HPA_VERSION:=0.40
 TFTP_HPA_SOURCE:=tftp-hpa-$(TFTP_HPA_VERSION).tar.bz2
-TFTP_HPA_SITE:=http://www.kernel.org/pub/software/network/tftp/
+TFTP_HPA_SITE:=$(BR2_KERNEL_MIRROR)/software/network/tftp/
 TFTP_HPA_DIR:=$(BUILD_DIR)/tftp-hpa-$(TFTP_HPA_VERSION)
 TFTP_HPA_CAT:=$(BZCAT)
 TFTP_HPA_BINARY:=tftpd/tftpd

Modified: trunk/buildroot/package/util-linux/util-linux.mk
===================================================================
--- trunk/buildroot/package/util-linux/util-linux.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/package/util-linux/util-linux.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -5,7 +5,7 @@
 #############################################################
 UTIL-LINUX_VERSION:=2.12r
 UTIL-LINUX_SOURCE:=util-linux-$(UTIL-LINUX_VERSION).tar.bz2
-UTIL-LINUX_SITE:=http://www.kernel.org/pub/linux/utils/util-linux
+UTIL-LINUX_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux
 UTIL-LINUX_DIR:=$(BUILD_DIR)/util-linux-$(UTIL-LINUX_VERSION)
 UTIL-LINUX_CAT:=$(BZCAT)
 UTIL-LINUX_BINARY:=$(UTIL-LINUX_DIR)/misc-utils/chkdupexe

Modified: trunk/buildroot/target/device/Config.in.mirrors
===================================================================
--- trunk/buildroot/target/device/Config.in.mirrors	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/target/device/Config.in.mirrors	2007-12-17 12:29:06 UTC (rev 20656)
@@ -12,6 +12,32 @@
 	  The list of mirrors is available here:
 	  http://prdownloads.sourceforge.net/index-sf.html?download
 
+config BR2_KERNEL_MIRROR
+	string "Kernel.org mirror"
+	default "http://www.kernel.org/pub/"
+	help
+	  kernel.org is mirrored on a number of servers around the world.
+	  The following allows you to select your preferred mirror.
+
+	  Have a look on the kernel.org site for a list of mirrors, then enter
+	  the URL to the base directory.  Examples:
+
+	     http://www.XX.kernel.org/pub (XX = country code)
+	     http://mirror.aarnet.edu.au/pub/ftp.kernel.org
+
+config BR2_GNU_MIRROR
+	string "GNU Software mirror"
+	default "http://ftp.gnu.org"
+	help
+	  GNU has multiple software mirrors scattered around the world.
+	  The following allows you to select your preferred mirror.
+
+	  Have a look on the gnu.org site for a list of mirrors, then enter
+	  the URL to the base directory.  Examples:
+
+	     http://ftp.gnu.org/pub/gnu (XX = country code)
+	     http://mirror.aarnet.edu.au/pub/gnu
+
 source	"target/device/Atmel/Config.in.mirrors"
 
 endmenu

Modified: trunk/buildroot/target/device/Sharp/LNode80/linux.mk
===================================================================
--- trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -50,7 +50,7 @@
 LINUX_DIR=$(BUILD_DIR)/linux-lnode80
 LINUX_SOURCE=linux-$(DOWNLOAD_LINUX_VERSION).tar.bz2
 LINUX_CAT:=$(BZCAT)
-LINUX_SITE=http://www.kernel.org/pub/linux/kernel/v2.4
+LINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.4
 # Used by pcmcia-cs and others
 LINUX_SOURCE_DIR=$(LINUX_DIR)
 

Modified: trunk/buildroot/target/device/Soekris/net4521/linux.mk
===================================================================
--- trunk/buildroot/target/device/Soekris/net4521/linux.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/target/device/Soekris/net4521/linux.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -51,7 +51,7 @@
 LINUX_DIR=$(BUILD_DIR)/linux-$(LINUX_VERSION)
 LINUX_SOURCE=linux-$(DOWNLOAD_LINUX_VERSION).tar.bz2
 LINUX_CAT:=$(BZCAT)
-LINUX_SITE=http://www.kernel.org/pub/linux/kernel/v2.4
+LINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.4
 # Used by pcmcia-cs and others
 LINUX_SOURCE_DIR=$(LINUX_DIR)
 

Modified: trunk/buildroot/target/device/Via/epia-mii/linux.mk
===================================================================
--- trunk/buildroot/target/device/Via/epia-mii/linux.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/target/device/Via/epia-mii/linux.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -38,7 +38,7 @@
 LINUX_DIR=$(BUILD_DIR)/linux-$(LINUX_VERSION)
 LINUX_SOURCE=linux-$(DOWNLOAD_LINUX_VERSION).tar.bz2
 LINUX_CAT:=$(BZCAT)
-LINUX_SITE=http://www.kernel.org/pub/linux/kernel/v2.6
+LINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
 LINUX_KCONFIG=target/device/Via/epia-mii/linux.config
 LINUX_KERNEL=$(BUILD_DIR)/buildroot-kernel
 # Used by pcmcia-cs and others

Modified: trunk/buildroot/target/device/jp/q5/linux.mk
===================================================================
--- trunk/buildroot/target/device/jp/q5/linux.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/target/device/jp/q5/linux.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -50,7 +50,7 @@
 LINUX_DIR=$(BUILD_DIR)/linux-$(LINUX_VERSION)
 LINUX_SOURCE=linux-$(DOWNLOAD_LINUX_VERSION).tar.bz2
 LINUX_CAT:=$(BZCAT)
-LINUX_SITE=http://www.kernel.org/pub/linux/kernel/v2.4
+LINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.4
 # Used by pcmcia-cs and others
 LINUX_SOURCE_DIR=$(LINUX_DIR)
 

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/target/linux/Makefile.in	2007-12-17 12:29:06 UTC (rev 20656)
@@ -23,7 +23,7 @@
 
 LINUX26_SOURCE=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
 LINUX26_BZCAT:=$(BZCAT)
-LINUX26_SITE=http://ftp.kernel.org/pub/linux/kernel/v2.6
+LINUX26_SITE=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
 
 ifeq ($(BOARD_PATH),)
 BOARD_PATH:=$(strip $(subst ",,$(BR2_BOARD_PATH)))

Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -27,7 +27,7 @@
 SYSLINUX_DIR2=$(TOOL_BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_CAT:=$(BZCAT)
-SYSLINUX_SITE=http://www.kernel.org/pub/linux/utils/boot/syslinux
+SYSLINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
 SYSLINUX_BIN=$(SYSLINUX_DIR2)/mtools/syslinux
 
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -24,7 +24,7 @@
 
 ifeq ($(GCC_SNAP_DATE),)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)
-GCC_SITE:=http://ftp.gnu.org/gnu/gcc/gcc-$(GCC_VERSION)
+GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
 #GCC_SITE:=ftp://ftp.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gcc/gcc-$(GCC_OFFICIAL_VER)
 else
 GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -22,7 +22,7 @@
 
 ifeq ($(GCC_SNAP_DATE),)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)
-GCC_SITE:=http://ftp.gnu.org/gnu/gcc/gcc-$(GCC_VERSION)
+GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
 #GCC_SITE:=ftp://ftp.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gcc/gcc-$(GCC_OFFICIAL_VER)
 else
 GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -21,7 +21,7 @@
 else
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-GDB_SITE:=http://ftp.gnu.org/gnu/gdb
+GDB_SITE:=$(BR2_GNU_MIRROR)/gdb
 else
 GDB_SITE:=$(VENDOR_SITE)
 endif

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-12-17 11:37:47 UTC (rev 20655)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-12-17 12:29:06 UTC (rev 20656)
@@ -514,7 +514,8 @@
 uclibc-dirclean:
 	rm -rf $(UCLIBC_DIR)
 
-uclibc-target-utils: $(TARGET_DIR)/usr/bin/ldd
+uclibc-target-utils: 
+#$(TARGET_DIR)/usr/bin/ldd
 
 uclibc-target-utils-source: $(DL_DIR)/$(UCLIBC_SOURCE)
 
