From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Feb 2021 21:11:48 +0100
Subject: [Buildroot] [RFC/next v2 2/2] package/rpi-firmware: add option for
 the debug set of start/fixup boot files
In-Reply-To: <20210216201148.26688-1-ps.report@gmx.net>
References: <20210216201148.26688-1-ps.report@gmx.net>
Message-ID: <20210216201148.26688-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option for the debug set of start/fixup boot files.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch
---
 package/rpi-firmware/Config.in       | 10 ++++++++++
 package/rpi-firmware/rpi-firmware.mk |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 424122d654..a1ad402228 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD
 	  The cut-down set of files for versions Zero/1/2/3 (only
 	  features required to boot a Linux kernel).
 
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB
+	bool "rpi 0/1/2/3 (debug)"
+	help
+	  The debug set of files for versions Zero/1/2/3.
+
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
 	bool "rpi 4 (default)"
 	help
@@ -53,6 +58,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD
 	  The cut-down set of files for versions 4 (only features
 	  required to boot a Linux kernel).
 
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
+	bool "rpi 4 (debug)"
+	help
+	  The debug set of files for versions 4.
+
 config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
 	string "Patch to a file stored as boot/config.txt"
 	help
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index a7ab8f0f14..34b71710d2 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -26,6 +26,10 @@ ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD),y)
 RPI_FIRMWARE_FILES += start_cd.elf fixup_cd.dat
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB),y)
+RPI_FIRMWARE_FILES += start_db.elf fixup_db.dat
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),y)
 RPI_FIRMWARE_FILES += start4.elf fixup4.dat
 endif
@@ -38,6 +42,10 @@ ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD),y)
 RPI_FIRMWARE_FILES += start4cd.elf fixup4cd.dat
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB),y)
+RPI_FIRMWARE_FILES += start4db.elf fixup4db.dat
+endif
+
 define RPI_FIRMWARE_INSTALL_BIN
 	for firmwbin in  $(RPI_FIRMWARE_FILES); do \
 		$(INSTALL) -D -m 0644 $(@D)/boot/$${firmwbin} $(BINARIES_DIR)/rpi-firmware/$${firmwbin} || exit 1; \
-- 
2.30.0
