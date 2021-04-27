From: Eugen Hristev <eugen.hristev@microchip.com>
Date: Tue, 27 Apr 2021 15:56:56 +0300
Subject: [Buildroot] [PATCH v3 1/2] boot/at91bootstrap3: add support for
 at91bootstrap 4.x series
Message-ID: <20210427125657.1449953-1-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce support for the next generation of at91bootstrap,
at91bootstrap 4.x series.

AT91Bootstrap 4.x only supports devices: sam9x60, sama5d2, sama5d3,
sama5d4, sama7g5.

User can select 4.x series as a bool, and if so, the latest 4.x
version is automatically selected.
If the user deselects this option, only 3.x latest version can be
picked.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- s/BR2_TARGET_AT91BOOTSTRAP4_NEEDS_PYTHON3/BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
missed that.

Changes in v2:
- adapt both 3.x and 4.x series in the same package

 boot/at91bootstrap3/Config.in         | 20 ++++++++++++++++++--
 boot/at91bootstrap3/at91bootstrap3.mk | 12 +++++++++++-
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 25ab30489f..18f027639c 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -14,13 +14,23 @@ config BR2_TARGET_AT91BOOTSTRAP3
 
 if BR2_TARGET_AT91BOOTSTRAP3
 
+config BR2_TARGET_AT91BOOTSTRAP3_4SERIES
+	bool "AT91Bootstrap3 4.x series"
+	help
+	  AT91Bootstrap3 4.x series version
+
 choice
 
 	prompt "AT91 Bootstrap 3 version"
 
-config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
+	depends on !BR2_TARGET_AT91BOOTSTRAP3_4SERIES
 	bool "3.9.3"
 
+config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_4X
+	depends on BR2_TARGET_AT91BOOTSTRAP3_4SERIES
+	bool "4.0.0-rc1"
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
 	help
@@ -51,7 +61,8 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v3.9.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v3.9.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
+	default "v4.0.0-rc1" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_4X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
@@ -96,4 +107,9 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE
 	help
 	  Path to the at91bootstrap3 configuration file
 
+config BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
+	bool "AT91Bootstrap3 requires host Python 3.x for NAND/PMECC scripts"
+	help
+	  Host Python 3.x needs to be installed to use the NAND/PMECC python scripts
+
 endif # BR2_TARGET_AT91BOOTSTRAP3
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index a942afcdc9..7f11eb1dbb 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -6,6 +6,10 @@
 
 AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
 
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3),y)
+AT91BOOTSTRAP3_DEPENDENCIES += host-python3
+endif
+
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)
 AT91BOOTSTRAP3_TARBALL = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION))
 AT91BOOTSTRAP3_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP3_TARBALL)))
@@ -19,7 +23,7 @@ else
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 endif
 
-AT91BOOTSTRAP3_LICENSE = Atmel License
+AT91BOOTSTRAP3_LICENSE = Microchip License
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
 AT91BOOTSTRAP3_LICENSE_FILES = main.c
 endif
@@ -47,9 +51,15 @@ define AT91BOOTSTRAP3_BUILD_CMDS
 	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D)
 endef
 
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_4SERIES),y)
+define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
+	cp $(@D)/build/binaries/*.bin $(BINARIES_DIR)
+endef
+else
 define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
 	cp $(@D)/binaries/*.bin $(BINARIES_DIR)
 endef
+endif
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
 AT91BOOTSTRAP3_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))_defconfig
-- 
2.25.1
