From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 12:08:06 +0100
Subject: [Buildroot] [git commit] zd1211-firmware: new package
Message-ID: <20130104110755.DCD509A604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b16f37b03c383f70c6cc50582f6b3ee4cf5aa037
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                          |    1 +
 package/zd1211-firmware/Config.in          |    4 ++++
 package/zd1211-firmware/zd1211-firmware.mk |   19 +++++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2cbadf4..11ff82d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -203,6 +203,7 @@ menu "Misc devices firmwares"
 source "package/b43-firmware/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/ux500-firmware/Config.in"
+source "package/zd1211-firmware/Config.in"
 endmenu
 source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
diff --git a/package/zd1211-firmware/Config.in b/package/zd1211-firmware/Config.in
new file mode 100644
index 0000000..4469533
--- /dev/null
+++ b/package/zd1211-firmware/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_ZD1211_FIRMWARE
+	bool "zd1211-firmware"
+	help
+	  Firmware for the ZyDAS ZD1211 / Atheros AR5007UG wifi devices.
diff --git a/package/zd1211-firmware/zd1211-firmware.mk b/package/zd1211-firmware/zd1211-firmware.mk
new file mode 100644
index 0000000..afea0e9
--- /dev/null
+++ b/package/zd1211-firmware/zd1211-firmware.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# zd1211-firmware
+#
+#############################################################
+
+ZD1211_FIRMWARE_VERSION = 1.4
+ZD1211_FIRMWARE_SITE = http://downloads.sourceforge.net/project/zd1211/zd1211-firmware/$(ZD1211_FIRMWARE_VERSION)
+ZD1211_FIRMWARE_SOURCE = zd1211-firmware-$(ZD1211_FIRMWARE_VERSION).tar.bz2
+ZD1211_FIRMWARE_LICENSE = GPLv2
+ZD1211_FIRMWARE_LICENSE_FILES = COPYING
+
+# Not all of the firmware files are used
+define ZD1211_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/zd1211/
+	cp -dpf $(@D)/zd1211*{ub,uphr,ur} $(TARGET_DIR)/lib/firmware/zd1211
+endef
+
+$(eval $(generic-package))
