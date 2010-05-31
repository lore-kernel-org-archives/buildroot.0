From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:32 +0200
Subject: [Buildroot] [PATCH 46/46] Add support for the Barebox bootloader
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1ddd7a4eb24fe0dd428a3b71f98549560474937c.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/Config.in          |    1 +
 boot/barebox/Config.in  |   14 ++++++++++
 boot/barebox/barebox.mk |   61 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 0 deletions(-)
 create mode 100644 boot/barebox/Config.in
 create mode 100644 boot/barebox/barebox.mk

diff --git a/boot/Config.in b/boot/Config.in
index 78ff82c..6bcc98a 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -1,5 +1,6 @@
 menu "Bootloaders"
 
+source "boot/barebox/Config.in"
 source "boot/grub/Config.in"
 source "boot/grub2/Config.in"
 source "boot/syslinux/Config.in"
diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
new file mode 100644
index 0000000..0c90f03
--- /dev/null
+++ b/boot/barebox/Config.in
@@ -0,0 +1,14 @@
+menuconfig BR2_TARGET_BAREBOX
+	bool "Barebox"
+	help
+	  The Barebox bootloader, formerly known as U-Boot v2.
+
+	  http://www.barebox.org
+
+if BR2_TARGET_BAREBOX
+config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
+	string "board defconfig"
+	help
+	  Name of the board for which Barebox should be built, without
+	  the _defconfig suffix.
+endif
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
new file mode 100644
index 0000000..6024a5c
--- /dev/null
+++ b/boot/barebox/barebox.mk
@@ -0,0 +1,61 @@
+#############################################################
+#
+# Barebox
+#
+#############################################################
+
+BAREBOX_VERSION:=2010.05.0
+BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
+BAREBOX_SITE:=http://www.barebox.org/download/
+BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
+BAREBOX_CAT:=$(BZCAT)
+BAREBOX_BOARD_DEFCONFIG:=$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))
+
+ifeq ($(ARCH),i386)
+BAREBOX_ARCH=x86
+else ifeq ($(ARCH),powerpc)
+BAREBOX_ARCH=ppc
+else
+BAREBOX_ARCH=$(ARCH)
+endif
+
+BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE=$(TARGET_CROSS)
+
+$(DL_DIR)/$(BAREBOX_SOURCE):
+	 $(call DOWNLOAD,$(BAREBOX_SITE),$(BAREBOX_SOURCE))
+
+$(BAREBOX_DIR)/.unpacked: $(DL_DIR)/$(BAREBOX_SOURCE)
+	$(BAREBOX_CAT) $(DL_DIR)/$(BAREBOX_SOURCE) \
+		| tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	mkdir -p $(BAREBOX_DIR)
+	touch $@
+
+$(BAREBOX_DIR)/.patched: $(BAREBOX_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(BAREBOX_DIR) boot/barebox \
+		barebox-$(BAREBOX_VERSION)-\*.patch \
+		barebox-$(BAREBOX_VERSION)-\*.patch.$(ARCH)
+	touch $@
+
+$(BAREBOX_DIR)/.configured: $(BAREBOX_DIR)/.patched
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) $(BAREBOX_BOARD_DEFCONFIG)_defconfig
+	touch $@
+
+$(BAREBOX_DIR)/.built: $(BAREBOX_DIR)/.configured
+	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR)
+	touch $@
+
+$(BAREBOX_DIR)/.installed: $(BAREBOX_DIR)/.built
+	cp $(BAREBOX_DIR)/barebox.bin $(BINARIES_DIR)
+	touch $@
+
+barebox: $(BAREBOX_DIR)/.installed
+
+ifeq ($(BR2_TARGET_BAREBOX),y)
+TARGETS+=barebox
+
+# we NEED a board defconfig file
+ifeq ($(BAREBOX_BOARD_DEFCONFIG),)
+$(error No Barebox defconfig file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG setting)
+endif
+
+endif
-- 
1.7.0.4
