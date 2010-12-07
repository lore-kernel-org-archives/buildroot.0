From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Tue,  7 Dec 2010 13:36:50 -0800
Subject: [Buildroot] [PATCH] Add support for the X-Loader 1st stage
	bootloader
In-Reply-To: <1291757810-11503-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1291757810-11503-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1291757810-11503-2-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commits adds support for X-Loader, the 1st stage bootloader for
OMAP3 platforms.

This first draft only supports downloading from a custom tarball
location. There doesn't seem to be an authoritative source of X-Loader
releases, and Git download doesn't work here because bootloaders are
outside of the package infrastructure.

Although support for additional patchsets isn't implemented yet, the
IFT signing of the X-Loader image with signGP is.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
---
 boot/Config.in            |    1 +
 boot/x-loader/Config.in   |   48 ++++++++++++++++++++
 boot/x-loader/x-loader.mk |  106 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+), 0 deletions(-)
 create mode 100644 boot/x-loader/Config.in
 create mode 100644 boot/x-loader/x-loader.mk

diff --git a/boot/Config.in b/boot/Config.in
index 6bcc98a..a7052b4 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -7,6 +7,7 @@ source "boot/syslinux/Config.in"
 source "boot/u-boot/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91dataflashboot/Config.in"
+source "boot/x-loader/Config.in"
 
 endmenu
 
diff --git a/boot/x-loader/Config.in b/boot/x-loader/Config.in
new file mode 100644
index 0000000..28ff187
--- /dev/null
+++ b/boot/x-loader/Config.in
@@ -0,0 +1,48 @@
+menuconfig BR2_TARGET_XLOADER
+	bool "X-Loader"
+	help
+		Build the 1st-stage bootloader X-Loader for OMAP platforms
+
+if BR2_TARGET_XLOADER
+config BR2_TARGET_XLOADER_BOARDNAME
+	string "X-Loader board name"
+	help
+		One of X-Loader supported boards to be built.
+		This will be suffixed with _config to meet X-Loader standard naming.
+
+choice
+	prompt "X-Loader Version"
+	default BR2_TARGET_XLOADER_CUSTOM_TARBALL
+	help
+		Select the specific X-Loade version you want to use
+
+# config BR2_TARGET_XLOADER_UPSTREAM
+#	bool "Upstream (Git)"
+
+config BR2_TARGET_XLOADER_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+endchoice
+
+if BR2_TARGET_XLOADER_CUSTOM_TARBALL
+
+config BR2_TARGET_XLOADER_CUSTOM_TARBALL_LOCATION
+	string "URL of custom X-Loader tarball"
+
+endif
+
+config BR2_TARGET_XLOADER_VERSION
+	string
+#	default "master"	if BR2_TARGET_XLOADER_UPSTREAM
+	default "custom"	if BR2_TARGET_XLOADER_CUSTOM_TARBALL
+
+# config BR2_TARGET_XLOADER_CUSTOM_PATCH_DIR
+#	string "custom patch dir"
+#	help
+#		If your board requires custom patches, add the path to the
+#		directory containing the patches here. The patches must be
+#		named x-loader-<version>-<something>.patch.
+#
+#		Most users may leave this empty.
+
+endif # BR2_TARGET_XLOADER
diff --git a/boot/x-loader/x-loader.mk b/boot/x-loader/x-loader.mk
new file mode 100644
index 0000000..9148978
--- /dev/null
+++ b/boot/x-loader/x-loader.mk
@@ -0,0 +1,106 @@
+#############################################################
+#
+# X-Loader
+#
+##############################################################
+XLOADER_VERSION:=$(call qstrip,$(BR2_TARGET_XLOADER_VERSION))
+XLOADER_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
+
+ifeq ($(XLOADER_VERSION),custom)
+# Handle custom X-Loader tarballs as specified by the configuration
+XLOADER_TARBALL=$(call qstrip,$(BR2_TARGET_XLOADER_CUSTOM_TARBALL_LOCATION))
+XLOADER_SITE:=$(dir $(XLOADER_TARBALL))
+XLOADER_SOURCE:=$(notdir $(XLOADER_TARBALL))
+else
+$(error Using X-Loader mainline Git is not yet supported.)
+endif
+
+XLOADER_DIR:=$(BUILD_DIR)/x-loader-$(XLOADER_VERSION)
+XLOADER_BIN:=x-load.bin
+XLOADER_IFT:=x-load.bin.ift
+
+SIGNGP_SITE:=http://beagleboard.googlecode.com/files/
+SIGNGP_SOURCE:=signGP.c
+SIGNGP_BIN:=signGP
+
+$(DL_DIR)/$(XLOADER_SOURCE):
+	$(call DOWNLOAD,$(XLOADER_SITE),$(XLOADER_SOURCE))
+
+$(DL_DIR)/$(SIGNGP_SOURCE):
+	$(call DOWNLOAD,$(SIGNGP_SITE),$(SIGNGP_SOURCE))
+
+$(XLOADER_DIR)/.unpacked: $(DL_DIR)/$(XLOADER_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(XLOADER_SOURCE))) $(DL_DIR)/$(XLOADER_SOURCE) \
+		| tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(XLOADER_DIR)/.patched: $(XLOADER_DIR)/.unpacked
+	# TODO
+	touch $@
+
+$(XLOADER_DIR)/.configured: $(XLOADER_DIR)/.patched
+ifeq ($(XLOADER_BOARD_NAME),)
+	$(error No X-Loader board name set. Check your BR2_TARGET_XLOADER_BOARDNAME setting)
+endif
+	$(TARGET_CONFIGURE_OPTS) \
+		$(XLOADER_CONFIGURE_OPTS) \
+		$(MAKE) -C $(XLOADER_DIR) \
+		CROSS_COMPILE="$(TARGET_CROSS)" ARCH="$(KERNEL_ARCH)" \
+		$(XLOADER_BOARD_NAME)_config
+	touch $@
+
+$(XLOADER_DIR)/$(XLOADER_BIN): $(XLOADER_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) \
+		$(XLOADER_CONFIGURE_OPTS) \
+		$(MAKE) -C $(XLOADER_DIR) \
+		CROSS_COMPILE="$(TARGET_CROSS)" ARCH="$(KERNEL_ARCH)"
+
+$(XLOADER_DIR)/$(SIGNGP_SOURCE): $(DL_DIR)/$(SIGNGP_SOURCE)
+	cp $(DL_DIR)/$(SIGNGP_SOURCE) $(XLOADER_DIR)/$(SIGNGP_SOURCE)
+
+$(XLOADER_DIR)/$(SIGNGP_BIN): $(XLOADER_DIR)/$(SIGNGP_SOURCE)
+	$(HOSTCC) $(XLOADER_DIR)/$(SIGNGP_SOURCE) -o $(XLOADER_DIR)/$(SIGNGP_BIN)
+
+$(XLOADER_DIR)/$(XLOADER_IFT): $(XLOADER_DIR)/$(XLOADER_BIN) $(XLOADER_DIR)/$(SIGNGP_BIN)
+	$(XLOADER_DIR)/$(SIGNGP_BIN) $(XLOADER_DIR)/$(XLOADER_BIN)
+
+$(BINARIES_DIR)/$(XLOADER_BIN): $(XLOADER_DIR)/$(XLOADER_BIN)
+	rm -f $(BINARIES_DIR)/$(XLOADER_BIN)
+	cp -dpf $(XLOADER_DIR)/$(XLOADER_BIN) $(BINARIES_DIR)/
+
+$(BINARIES_DIR)/$(XLOADER_IFT): $(XLOADER_DIR)/$(XLOADER_IFT)
+	rm -f $(BINARIES_DIR)/$(XLOADER_IFT)
+	cp -dpf $(XLOADER_DIR)/$(XLOADER_IFT) $(BINARIES_DIR)/
+
+
+x-loader: $(BINARIES_DIR)/$(XLOADER_BIN) $(BINARIES_DIR)/$(XLOADER_IFT)
+
+x-loader-clean:
+	-$(MAKE) -C $(XLOADER_DIR) clean
+
+x-loader-dirclean:
+	rm -rf $(XLOADER_DIR)
+
+x-loader-source: $(DL_DIR)/$(XLOADER_SOURCE)
+
+x-loader-unpacked: $(XLOADER_DIR)/.patched
+
+x-loader-configured: $(XLOADER_DIR)/.configured
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_TARGET_XLOADER),y)
+TARGETS+=x-loader
+
+# We NEED a board name unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(XLOADER_BOARD_NAME),)
+$(error No X-Loader board name set. Check your BR2_TARGET_XLOADER_BOARDNAME setting)
+endif
+endif
+
+endif
-- 
1.6.3.3.346.g8a41d
