From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 20 Jul 2007 15:58:48 +0200
Subject: [Buildroot] [RFC] Some additions to the package/linux/Makefile.in
Message-ID: <1184939928.6382.19.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is some additions to the Linux support.
The basic changes are:
* Selection of Linux kernel using KConfig
	BR2_DOWNLOAD_LINUX26_VERSION
	BR2_LINUX26_VERSION
* Change of result to 
	LINUX26_KERNEL:=
	$(BINARIES_DIR)/$(PROJECT)-linux-$(LINUX26_VERSION)-$(DATE).gz
* A small bug fix
-LINUX_VERSION:=$(LINUX_VERSION)
+LINUX_VERSION:=$(LINUX26_VERSION)
* The kernel is always built in $(PROJECT_BUILD_DIR)
  even if it is the same version as the LINUX_HEADERS_VERSION
* Added some test to printout Makefile variable
  which will probably be removed a little later.

This builds at least the x86 bzImage if the std configuratio is used.
zImage is too large.
vmlinux builds with errors, but I think this is because the 
original Makefile.in is flawed.

The original seems to have a problems when LINUX_HEADERS_VERSION
is the same as LINUX26_VERSION

Comments?


Index: target/linux/Makefile.in
===================================================================
--- target/linux/Makefile.in	(revision 19180)
+++ target/linux/Makefile.in	(arbetskopia)
@@ -13,10 +13,25 @@
 # Version of Linux after applying any patches
 LINUX26_VERSION=2.6.19.2
 else
+
+ifeq ($(DOWNLOAD_LINUX26_VERSION),)
+DOWNLOAD_LINUX26_VERSION:=$(strip $(subst ",,
$(BR2_DOWNLOAD_LINUX26_VERSION)))
+#"))
+endif
+ifeq ($(DOWNLOAD_LINUX26_VERSION),)
 DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
+endif
+
+ifeq	($(LINUX26_VERSION),)
+LINUX26_VERSION:=$(strip $(subst ",,$(BR2_LINUX26_VERSION)))
+#"))
+endif
+ifeq ($(LINUX26_VERSION),)
 LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
 endif
 
+endif
+
 LINUX26_SOURCE=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
 LINUX26_BZCAT:=$(BZCAT)
 LINUX26_SITE=http://ftp.kernel.org/pub/linux/kernel/v2.6
@@ -35,6 +50,7 @@
 #"))
 endif
 endif
+
 ifndef LINUX26_FORMAT
 ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
 LINUX26_FORMAT=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
@@ -55,13 +71,14 @@
 endif
 
 # File name for the Linux kernel binary
-LINUX26_KERNEL=
$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
+LINUX26_KERNEL:=
$(BINARIES_DIR)/$(PROJECT)-linux-$(LINUX26_VERSION)-$(DATE).gz
+#LINUX26_KERNEL=
$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
 
 # Version of Linux AFTER patches
 LINUX26_DIR=$(PROJECT_BUILD_DIR)/linux-$(LINUX26_VERSION)
 
 # for packages that need it
-LINUX_VERSION:=$(LINUX_VERSION)
+LINUX_VERSION:=$(LINUX26_VERSION)
 LINUX_DIR=$(LINUX26_DIR)
 LINUX_KERNEL=$(LINUX26_KERNEL)
 
@@ -83,7 +100,6 @@
 		sleep 5; \
 	fi;
 
-ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
 $(DL_DIR)/$(LINUX26_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
 
@@ -99,7 +115,6 @@
 $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
 	touch $@
-endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
 $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
 	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
@@ -166,3 +181,29 @@
 	rm -rf $(LINUX26_DIR)
 
 endif
+
+
+linux-test:
+	@echo	"BR2_PACKAGE_LINUX" $(BR2_PACKAGE_LINUX)
+	@echo	"LINUX_HEADERS_VERSION" $(LINUX_HEADERS_VERSION)
+	@echo	"BR2_DOWNLOAD_LINUX26_VERSION" $(BR2_DOWNLOAD_LINUX26_VERSION)
+	@echo	"DOWNLOAD_LINUX26_VERSION" $(DOWNLOAD_LINUX26_VERSION)
+	@echo	"BR2_LINUX26_VERSION" $(BR2_LINUX26_VERSION)
+	@echo	"LINUX26_VERSION" $(LINUX26_VERSION)
+	@echo	"LINUX26_SITE" $(LINUX26_SITE)
+	@echo	"LINUX26_DIR" $(LINUX26_DIR)
+	@echo	"LINUX26_SOURCE" $(LINUX26_SOURCE)
+	@echo	"BR2_PACKAGE_LINUX_FORMAT" $(BR2_PACKAGE_LINUX_FORMAT)
+	@echo	"LINUX26_FORMAT" $(LINUX26_FORMAT)
+	@echo	"BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION"
$(BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION)
+	@echo	"BR2_CUSTOM_LINUX26_VERSION" $(BR2_CUSTOM_LINUX26_VERSION)
+	@echo	"BR2_CUSTOM_LINUX26_RC_PATCH" $(BR2_CUSTOM_LINUX26_RC_PATCH)
+	@echo	"BR2_LINUX_BSP_PATCH" $(BR2_LINUX_BSP_PATCH)
+	@echo	"BR2_LINUX26_VERSION" $(BR2_LINUX26_VERSION)
+	@echo	"BR2_LINUX26_RC_PATCH" $(BR2_LINUX26_RC_PATCH)
+	@echo	"BR2_PACKAGE_LINUX26_KCONFIG" $(BR2_PACKAGE_LINUX_KCONFIG)
+	@echo	"LINUX26_KCONFIG" $(LINUX26_KCONFIG)
+	@echo	"BR2_LINUX_BIN_CUSTOM" $(BR2_LINUX_BIN_CUSTOM)
+	@echo	"BR2_PACKAGE_LINUX_FORMAT" $(BR2_PACKAGE_LINUX_FORMAT)
+	@echo	"BR2_LINUX_IN_ROOTFS" $(BR2_LINUX_IN_ROOTFS)
+	@echo	"BR2_LINUX_2_6_22_1" $(BR2_LINUX_2_6_22_1)


Best Regards
Ulf Samuelsson
