From: digitalpeer <buildroot@digitalpeer.com>
Date: Mon, 31 Mar 2008 22:39:04 -0700
Subject: [Buildroot] [PATCH] add support for micromonitor bootloader
Message-ID: <3530b0eb0803312239h4df25ffch73349edc7c4ff34c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patch adds support for the Microcross Micromonitor
(uMon) bootloader.
Josh


diff -purN buildroot/target/Config.in buildroot-umon/target/Config.in
--- buildroot/target/Config.in	2008-03-31 00:15:26.000000000 -0700
+++ buildroot-umon/target/Config.in	2008-03-31 22:22:09.000000000 -0700
@@ -19,6 +19,7 @@ source "target/x86/grub/Config.in"
 source "target/x86/syslinux/Config.in"
 source "target/powerpc/yaboot/Config.in"
 source "target/u-boot/Config.in"
+source "target/umon/Config.in"
 endmenu

 menu "Kernel"
diff -purN buildroot/target/Makefile.in buildroot-umon/target/Makefile.in
--- buildroot/target/Makefile.in	2008-03-31 00:15:26.000000000 -0700
+++ buildroot-umon/target/Makefile.in	2008-03-31 22:22:30.000000000 -0700
@@ -15,6 +15,10 @@ ifeq ($(strip $(BR2_TARGET_UBOOT)),y)
 include target/u-boot/Makefile.in
 endif

+ifeq ($(strip $(BR2_TARGET_UMON)),y)
+include target/umon/Makefile.in
+endif
+
 # and finally build the filesystems/tarballs
 include target/*/*.mk

diff -purN buildroot/target/umon/Config.in buildroot-umon/target/umon/Config.in
--- buildroot/target/umon/Config.in	1969-12-31 16:00:00.000000000 -0800
+++ buildroot-umon/target/umon/Config.in	2008-03-31 22:18:49.000000000 -0700
@@ -0,0 +1,20 @@
+config BR2_TARGET_UMON
+	bool "Micromonitor Boot Loader"
+	default n
+	help
+	  Build uMon bootloader.
+
+config BR2_TARGET_UMON_PORT
+	string "port name"
+	depends on BR2_TARGET_UMON
+	default "$(BOARD_NAME)"
+	help
+	  uMon port name. This is the name of the directory under umon_ports.
+
+config BR2_TARGET_UMON_CUSTOM_PATCH
+	string "custom patch"
+	depends on BR2_TARGET_UMON
+	help
+	  If your board requires a custom patch, add the path to the file here.
+	  Most users may leave this empty.
+
diff -purN buildroot/target/umon/Makefile.in
buildroot-umon/target/umon/Makefile.in
--- buildroot/target/umon/Makefile.in	1969-12-31 16:00:00.000000000 -0800
+++ buildroot-umon/target/umon/Makefile.in	2008-03-31 22:18:49.000000000 -0700
@@ -0,0 +1,66 @@
+#############################################################
+#
+# umon
+#
+#############################################################
+UMON_VERSION:=sep8_2007
+UMON_SOURCE:=umon_$(UMON_VERSION).tgz
+UMON_SITE:=http://microcross.com
+UMON_PORT:=$(strip $(subst ",,$(BR2_TARGET_UMON_PORT)))
+UMON_DIR:=$(PROJECT_BUILD_DIR)/umon/umon_ports/$(UMON_PORT)
+UMON_HOST_DIR:=$(PROJECT_BUILD_DIR)/umon/umon_main/host
+UMON_PATCH_DIR:=$(PROJECT_BUILD_DIR)/umon-patches
+UMON_CAT:=$(ZCAT)
+UMON_BIN:=boot.bin
+UMON_TOP:=$(PROJECT_BUILD_DIR)/umon/umon_main
+# this is a nasty hack to get the PLATFORM variable from the makefile
+UMON_PLATFORM:=$$(grep '^PLATFORM.*=' $(UMON_DIR)/makefile | sed
's@^PLATFORM.*=@@')
+
+$(DL_DIR)/$(UMON_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(UMON_SITE)/$(UMON_SOURCE)
+
+$(UMON_DIR)/.unpacked: $(DL_DIR)/$(UMON_SOURCE)
+	$(UMON_CAT) $(DL_DIR)/$(UMON_SOURCE) \
+		| tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(UMON_DIR)/.patched: $(UMON_DIR)/.unpacked
+ifneq ($(strip $(BR2_TARGET_UMON_CUSTOM_PATCH)),"")
+	@mkdir -p $(UMON_PATCH_DIR)
+	cp -dpr $(BR2_TARGET_UMON_CUSTOM_PATCH) $(UMON_PATCH_DIR)
+	toolchain/patch-kernel.sh $(PROJECT_BUILD_DIR)/umon $(UMON_PATCH_DIR) *.patch
+endif
+	touch $@
+
+$(UMON_DIR)/build_$(UMON_PLATFORM)/$(UMON_BIN): $(UMON_DIR)/.patched
+	$(MAKE) -C $(UMON_HOST_DIR) UMON_TOP=$(UMON_TOP) OSTYPE=linux install
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(UMON_DIR) UMONTOP=$(UMON_TOP)
+
+$(BINARIES_DIR)/$(UMON_BIN): $(UMON_DIR)/build_$(UMON_PLATFORM)/$(UMON_BIN)
+	cp $(UMON_DIR)/build_$(UMON_PLATFORM)/$(UMON_BIN) $(BINARIES_DIR)/$(UMON_BIN)
+
+umon: $(BINARIES_DIR)/$(UMON_BIN)
+
+umon-clean:
+	$(MAKE) -C $(UMON_DIR) clean
+
+umon-dirclean:
+	rm -rf $(UMON_DIR)
+
+umon-source: $(DL_DIR)/$(UMON_SOURCE)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_TARGET_UMON)),y)
+TARGETS+=umon
+endif
+
+umon-status:
+	@echo
+	@echo BR2_TARGET_UMON_PORT = $(BR2_TARGET_UMON_PORT)
+	@echo BR2_TARGET_UMON_CUSTOM_PATCH = $(BR2_TARGET_UMON_CUSTOM_PATCH)
+	@echo
+	@exit 0
