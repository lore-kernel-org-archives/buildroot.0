From: Grzegorz Blach <grzegorz@blach.pl>
Date: Fri, 28 Sep 2018 20:00:33 +0200
Subject: [Buildroot] [PATCH 1/2] pigpio: new package
Message-ID: <20180928180034.6543-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pigpio is a library for the Raspberry Pi which allows
control of the General Purpose Input Outputs (GPIO).

http://abyz.me.uk/rpi/pigpio/

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/pigpio/Config.in   |  8 ++++++++
 package/pigpio/pigpio.hash |  3 +++
 package/pigpio/pigpio.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/pigpio/Config.in
 create mode 100644 package/pigpio/pigpio.hash
 create mode 100644 package/pigpio/pigpio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c036fa30c4..e733743338 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -898,6 +898,7 @@ F:	package/libwebsock/
 F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
+F:	package/pigpio/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
 
diff --git a/package/Config.in b/package/Config.in
index 8fd60cdec2..65430d2a55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -488,6 +488,7 @@ endmenu
 	source "package/pdbg/Config.in"
 	source "package/picocom/Config.in"
 	source "package/pifmrds/Config.in"
+	source "package/pigpio/Config.in"
 	source "package/powertop/Config.in"
 	source "package/pps-tools/Config.in"
 	source "package/pru-software-support/Config.in"
diff --git a/package/pigpio/Config.in b/package/pigpio/Config.in
new file mode 100644
index 0000000000..b03c3c50a5
--- /dev/null
+++ b/package/pigpio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PIGPIO
+	bool "pigpio"
+	depends on BR2_aarch64 || BR2_ARM_EABIHF
+	help
+	  Pigpio is a library for the Raspberry Pi which allows
+	  control of the General Purpose Input Outputs (GPIO).
+
+	  http://abyz.me.uk/rpi/pigpio/
diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
new file mode 100644
index 0000000000..db43901483
--- /dev/null
+++ b/package/pigpio/pigpio.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	4255310dd11ed81035b60711becad081a1eaad2905f704e3eb84e692ca7e4c3d  pigpio-V67.tar.gz
+sha256	6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
new file mode 100644
index 0000000000..1bb3f350b7
--- /dev/null
+++ b/package/pigpio/pigpio.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# pigpio
+#
+################################################################################
+
+PIGPIO_VERSION = V67
+PIGPIO_SITE = $(call github,joan2937,pigpio,$(PIGPIO_VERSION))
+PIGPIO_LICENSE = unlicence.org
+PIGPIO_LICENSE_FILES = UNLICENCE
+
+define PIGPIO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define PIGPIO_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/pig2vcd $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -m 0755 $(@D)/pigpiod $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -m 0755 $(@D)/pigs $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -m 0755 $(@D)/libpigpio.so $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 0755 $(@D)/libpigpiod_if.so $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 0755 $(@D)/libpigpiod_if2.so $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
