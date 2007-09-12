From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 11 Sep 2007 21:06:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/linux
	toolchain/kernel-headers
Message-ID: <20070912040655.EDDE1A60C5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-11 21:06:54 -0700 (Tue, 11 Sep 2007)
New Revision: 19818

Log:
Unbreak multiple boards, add Ingo's rt patch

Modified:
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-11 19:07:12 UTC (rev 19817)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-12 04:06:54 UTC (rev 19818)
@@ -110,7 +110,7 @@
 endif
 	touch $@
 
-$(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
+$(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
 	toolchain/patch-kernel.sh $(LINUX26_DIR) toolchain/kernel-headers \
 		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
 ifeq ($(BR2_KERNEL_HEADERS_IPMI),y)
@@ -121,6 +121,9 @@
 	toolchain/patch-kernel.sh $(LINUX26_DIR) toolchain/kernel-headers/lzma \
 		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
 endif
+ifeq ($(BR2_KERNEL_HEADERS_RT),y)
+	toolchain/patch-kernel.sh $(LINUX26_DIR) $(DL_DIR) $(LINUX_RT_SOURCE)
+endif
 ifeq ($(BR2_KERNEL_HEADERS_PATCH_DIR),y)
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
 		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}

Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-09-11 19:07:12 UTC (rev 19817)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-09-12 04:06:54 UTC (rev 19818)
@@ -6,7 +6,7 @@
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_22
+	default BR2_KERNEL_HEADERS_2_6_22_1
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -40,42 +40,61 @@
 		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.12 kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_20_4
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
+		bool "Linux 2.6.20.4 kernel headers"
+
 	config BR2_KERNEL_HEADERS_2_6_20
 		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
-		bool "Linux 2.6.20 kernel headers"
+		bool "Latest Linux 2.6.20.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_21_5
+		depends !BR2_avr32 && !BR2_nios2
+		bool "Linux 2.6.21.5 kernel headers"
+
 	config BR2_KERNEL_HEADERS_2_6_21
 		depends !BR2_avr32 && !BR2_nios2
-		bool "Linux 2.6.21.x kernel headers"
+		bool "Latest Linux 2.6.21.x kernel headers"
 
-	config BR2_KERNEL_HEADERS_2_6_22
+	config BR2_KERNEL_HEADERS_2_6_22_1
 		depends !BR2_nios2
-		bool "Linux 2.6.22.x kernel headers"
+		bool "Linux 2.6.22.1 kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_22
+		depends !BR2_avr32 && !BR2_nios2
+		bool "Latest Linux 2.6.22.x kernel headers"
+
 endchoice
 
 config BR2_KERNEL_HEADERS_IPMI
 	bool "use ipmi kernel patches"
 	default n
-	depends BR2_KERNEL_HEADERS_2_6_20 || BR2_KERNEL_HEADERS_2_6_21 || BR2_KERNEL_HEADERS_2_6_22
+	depends BR2_KERNEL_HEADERS_2_6_20_4 || BR2_KERNEL_HEADERS_2_6_21_5 || BR2_KERNEL_HEADERS_2_6_22_1
 	help
 	  Apply patches which add IPMI sensor support.
 
 config BR2_KERNEL_HEADERS_LZMA
 	bool "use lzma initramfs kernel patches"
 	default n
-	depends BR2_KERNEL_HEADERS_2_6_21 || BR2_KERNEL_HEADERS_2_6_22
+	depends BR2_KERNEL_HEADERS_2_6_21_5 || BR2_KERNEL_HEADERS_2_6_22_1
 	help
 	  Apply patches which allow for lzma compressed
 	  initramfs filesystems.  This requires the lzma
 	  program in your development environment.
 
+config BR2_KERNEL_HEADERS_RT
+	bool "use realtime (-rt) kernel patches"
+	default n
+	depends BR2_KERNEL_HEADERS_2_6_21_5 || BR2_KERNEL_HEADERS_2_6_22_1
+	help
+	  Apply Ingo's realtime extensions to linux
+
 config BR2_KERNEL_HEADERS_PATCH_DIR
 	bool "Add additional headers from $(KERNEL_HEADERS_PATCH_DIR)"
 	default n
-	depends BR2_KERNEL_HEADERS_2_6_20 || BR2_KERNEL_HEADERS_2_6_21 || BR2_KERNEL_HEADERS_2_6_22
+	depends BR2_KERNEL_HEADERS_2_6_20_4 || BR2_KERNEL_HEADERS_2_6_21_5 || BR2_KERNEL_HEADERS_2_6_22_1
 	help
-	  Apply additonal kernel patches defined by KERNEL_HEADERS_PATCH_DIR
+	  Apply additional kernel patches defined by KERNEL_HEADERS_PATCH_DIR
 	  in your board directory.
 
 config BR2_DEFAULT_KERNEL_HEADERS
@@ -87,8 +106,11 @@
 	default "2.6.9"     if BR2_KERNEL_HEADERS_2_6_9
 	default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
 	default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
+	default "2.6.20.4"  if BR2_KERNEL_HEADERS_2_6_20_4
 	default "2.6.20.19"  if BR2_KERNEL_HEADERS_2_6_20
+	default "2.6.21.5"  if BR2_KERNEL_HEADERS_2_6_21_5
 	default "2.6.21.7"  if BR2_KERNEL_HEADERS_2_6_21
+	default "2.6.22.1"  if BR2_KERNEL_HEADERS_2_6_22_1
 	default "2.6.22.6"  if BR2_KERNEL_HEADERS_2_6_22
 
 endmenu

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-09-11 19:07:12 UTC (rev 19817)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-09-12 04:06:54 UTC (rev 19818)
@@ -3,6 +3,7 @@
 # full kernel tarballs >= 2.6.19.1
 #
 #############################################################
+
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.6")
 VERSION:=2
 PATCHLEVEL:=6
@@ -18,6 +19,22 @@
 LINUX_HEADERS_IS_KERNEL=y
 endif
 
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.1")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=22
+EXTRAVERSION:=.1
+LOCALVERSION:=
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
+LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_IS_KERNEL=y
+LINUX_RT_VERSION:=rt9
+endif
+
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.21.7")
 VERSION:=2
 PATCHLEVEL:=6
@@ -33,6 +50,22 @@
 LINUX_HEADERS_IS_KERNEL=y
 endif
 
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.21.5")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=21
+EXTRAVERSION:=.5
+LOCALVERSION:=
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
+LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_IS_KERNEL=y
+LINUX_RT_VERSION:=rt20
+endif
+
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20.19")
 VERSION:=2
 PATCHLEVEL:=6
@@ -48,19 +81,44 @@
 LINUX_HEADERS_IS_KERNEL=y
 endif
 
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20.4")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=20
+EXTRAVERSION:=.4
+LOCALVERSION:=
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
+LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_IS_KERNEL=y
+endif
+
+
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 # Need to redefine KERNEL_HEADERS_PATCH_DIR if you want
 # board specific kernel headers
 KERNEL_HEADERS_PATCH_DIR:=toolchain/kernel-headers/empty
+LINUX_HEADERS_DEPENDS:=
 
-$(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
+ifeq ($(BR2_KERNEL_HEADERS_RT),y)
+LINUX_RT_SOURCE:=patch-$(LINUX_HEADERS_VERSION)-$(LINUX_RT_VERSION)
+LINUX_RT_SITE:=http://www.kernel.org/pub/linux/kernel/projects/rt/older/
+LINUX_HEADERS_DEPENDS+=$(DL_DIR)/$(LINUX_RT_SOURCE)
+$(DL_DIR)/$(LINUX_RT_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LINUX_RT_SITE)/$(LINUX_RT_SOURCE)
+endif
+
+$(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)  
 	@echo "*** Using kernel-headers generated from kernel source"
 	rm -rf $(LINUX_HEADERS_DIR)
 	[ -d $(TOOL_BUILD_DIR) ] || $(INSTALL) -d $(TOOL_BUILD_DIR)
 	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	touch $@
 
-$(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
+$(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 ifeq ($(BR2_KERNEL_HEADERS_IPMI),y)
@@ -71,6 +129,9 @@
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers/lzma \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 endif
+ifeq ($(BR2_KERNEL_HEADERS_RT),y)
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(DL_DIR) $(LINUX_RT_SOURCE)
+endif
 ifeq ($(BR2_KERNEL_HEADERS_PATCH_DIR),y)
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
 		\*.patch{,.gz,.bz2}
