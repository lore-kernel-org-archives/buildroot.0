From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 10:12:18 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061202181218.C04A2485C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 10:12:18 -0800 (Sat, 02 Dec 2006)
New Revision: 16755

Log:
- bump non-sanitized version to 2.6.19
- remove some superfluous mkdir's
- allow for patch, patch.gz, patch.bz2 per version


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2006-12-02 17:58:10 UTC (rev 16754)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2006-12-02 18:12:18 UTC (rev 16755)
@@ -38,9 +38,9 @@
 		depends !BR2_nios2
 		bool "Linux 2.6.12 kernel headers"
 
-	config BR2_KERNEL_HEADERS_2_6_18
+	config BR2_KERNEL_HEADERS_2_6_19
 		depends !BR2_nios2
-		bool "Linux 2.6.18 kernel headers"
+		bool "Linux 2.6.19 kernel headers"
 
 endchoice
 
@@ -53,4 +53,4 @@
 	default "2.6.9"     if BR2_KERNEL_HEADERS_2_6_9
 	default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
 	default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
-	default "2.6.18"    if BR2_KERNEL_HEADERS_2_6_18
+	default "2.6.19"    if BR2_KERNEL_HEADERS_2_6_19

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-02 17:58:10 UTC (rev 16754)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-02 18:12:18 UTC (rev 16755)
@@ -93,18 +93,20 @@
 endif
 LINUX_HEADERS_IS_KERNEL=n
 
-ifeq ("$(strip $(DEFAULT_KERNEL_HEADERS))","2.6.18")
+ifeq ("$(strip $(DEFAULT_KERNEL_HEADERS))","2.6.19")
 VERSION:=2
 PATCHLEVEL:=6
-SUBLEVEL:=18
+SUBLEVEL:=19
+EXTRAVERSION:=
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
-LINUX_HEADERS_SOURCE:=linux-2.6.18.3.tar.bz2
+LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-2.6.18.3
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_IS_KERNEL=y
 endif
 
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 
@@ -117,20 +119,17 @@
 endif
 
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
-	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE)
 
 ifeq ($(LINUX_HEADERS_DO_MOVE),y)
 $(LINUX_HEADERS_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	rm -rf $(LINUX_HEADERS_DIR)
-	mkdir -p $(TOOL_BUILD_DIR)
 	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	mv $(LINUX_HEADERS_UNPACK_DIR) $(LINUX_HEADERS_DIR)
 	touch $(LINUX_HEADERS_DIR)/.unpacked
 else
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	rm -rf $(LINUX_HEADERS_DIR)
-	mkdir -p $(TOOL_BUILD_DIR)
 	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
 endif
@@ -145,7 +144,7 @@
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/")
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers linux-$(LINUX_HEADERS_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 	touch $(LINUX_HEADERS_UNPACK_DIR)/.patched
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
