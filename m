From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 07:59:16 -0800
Subject: [Buildroot] [git commit] ux500-firmware: new package
Message-ID: <20121203145714.52FD599808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=367096b0e33913f47545ef8702eaa609960baa1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (with the calao_snowball_defconfig)
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                        |    1 +
 package/ux500-firmware/Config.in         |    7 +++++++
 package/ux500-firmware/ux500-firmware.mk |   22 ++++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 663a17b..c369f74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -261,6 +261,7 @@ source "package/usb_modeswitch/Config.in"
 source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
+source "package/ux500-firmware/Config.in"
 source "package/wipe/Config.in"
 endmenu
 
diff --git a/package/ux500-firmware/Config.in b/package/ux500-firmware/Config.in
new file mode 100644
index 0000000..7e8a94b
--- /dev/null
+++ b/package/ux500-firmware/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_UX500_FIRMWARE
+	bool "ux500-firmware"
+	help
+	  This package provides various binary firmware files (closed binary blobs)
+	  for the Azurewave AW-NH580 combo module (wifi, bt, gps).
+
+	  https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files/
diff --git a/package/ux500-firmware/ux500-firmware.mk b/package/ux500-firmware/ux500-firmware.mk
new file mode 100644
index 0000000..d354468
--- /dev/null
+++ b/package/ux500-firmware/ux500-firmware.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# ux500-firmware
+#
+#############################################################
+UX500_FIRMWARE_VERSION = 1.1.3-6
+UX500_FIRMWARE_SOURCE = ux500-firmware_$(UX500_FIRMWARE_VERSION)linaro1.tar.gz
+UX500_FIRMWARE_SITE = https://launchpad.net/~igloocommunity-maintainers/+archive/snowball/+files/
+UX500_FIRMWARE_LICENSE = Snowball click-wrap license
+UX500_FIRMWARE_LICENSE_FILES = license.txt 
+UX500_FIRMWARE_REDISTRIBUTE = NO
+
+# The CG2900 linux driver has to load firmware named CG29XX_* but the firmware
+# filenames contained in this package are CG2900_* hence the code below
+define UX500_FIRMWARE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	for f in $(TARGET_DIR)/lib/firmware/CG2900* ; do \
+		mv $$f $${f/CG2900/CG29XX}; \
+	done
+endef
+
+$(eval $(generic-package))
