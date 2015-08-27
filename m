From: Renaud AUBIN <root@renaud.io>
Date: Thu, 27 Aug 2015 22:43:22 +0200
Subject: [Buildroot] [PATCH] wiringpi: New package
Message-ID: <1440708202-19616-1-git-send-email-root@renaud.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable Raspberry Pi GPIO access through the WiringPi library.

Git http backend is not enabled on the official repo. There is no
official release tarball. As a consequence, this packaging uses an
unofficial repo hosted on github.
---
 package/Config.in            |  4 ++++
 package/wiringpi/Config.in   | 11 +++++++++++
 package/wiringpi/wiringpi.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 package/wiringpi/Config.in
 create mode 100644 package/wiringpi/wiringpi.mk

diff --git a/package/Config.in b/package/Config.in
index 783fbb4..0c08fc2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1502,4 +1502,8 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 endmenu
 
+menu "Raspberry Pi"
+	source "package/wiringpi/Config.in"
+endmenu
+
 endmenu
diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
new file mode 100644
index 0000000..46141d4
--- /dev/null
+++ b/package/wiringpi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_WIRINGPI
+        bool "wiringpi"
+        help
+          WiringPi is a GPIO access library written in C for the
+          BCM2835 used in the Raspberry Pi. It?s released under the
+          GNU LGPLv3 license and is usable from C and C++ and many
+          other languages with suitable wrappers (See below) It?s
+          designed to be familiar to people who have used the
+          Arduino ?wiring? system
+
+          http://wiringpi.com/
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
new file mode 100644
index 0000000..4340a4f
--- /dev/null
+++ b/package/wiringpi/wiringpi.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# wiringpi
+#
+################################################################################
+
+WIRINGPI_VERSION = 2.25
+WIRINGPI_SITE = $(call github,nibua-r,unofficial-wiringpi,v$(WIRINGPI_VERSION))
+WIRINGPI_INSTALL_STAGING = YES
+WIRINGPI_LICENSE = LGPLv3
+WIRINGPI_LICENSE_FILES = COPYING.LESSER
+
+define WIRINGPI_BUILD_CMDS
+    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/wiringPi
+    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/wiringPi static
+    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/devLib
+    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/devLib static
+    $(MAKE) LDFLAGS="-L$(@D)/devLib -L$(@D)/wiringPi" INCLUDE="-I$(@D)/devLib -I$(@D)/wiringPi" CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/gpio all
+endef
+
+define WIRINGPI_INSTALL_STAGING_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.so.$(WIRINGPI_VERSION) $(STAGING_DIR)/usr/lib
+    $(INSTALL) -D -m 0644 $(@D)/wiringPi/*.h $(STAGING_DIR)/usr/include/
+    $(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.a $(STAGING_DIR)/usr/lib
+    cd $(STAGING_DIR)/usr/lib; ln -sf libwiringPi.so.$(WIRINGPI_VERSION) libwiringPi.so
+    $(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.so.$(WIRINGPI_VERSION) $(STAGING_DIR)/usr/lib
+    $(INSTALL) -D -m 0644 $(@D)/devLib/*.h $(STAGING_DIR)/usr/include/
+    $(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.a $(STAGING_DIR)/usr/lib
+    cd $(STAGING_DIR)/usr/lib; ln -sf libwiringPiDev.so.$(WIRINGPI_VERSION) libwiringPiDev.so
+endef
+
+define WIRINGPI_INSTALL_TARGET_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.so.$(WIRINGPI_VERSION) $(TARGET_DIR)/usr/lib
+    cd $(TARGET_DIR)/usr/lib; ln -sf libwiringPi.so.$(WIRINGPI_VERSION) libwiringPi.so
+    $(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.so.$(WIRINGPI_VERSION) $(TARGET_DIR)/usr/lib
+    cd $(TARGET_DIR)/usr/lib; ln -sf libwiringPiDev.so.$(WIRINGPI_VERSION) libwiringPiDev.so
+    $(INSTALL) -D -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
