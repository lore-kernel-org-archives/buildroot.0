From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:26:31 +0200
Subject: [Buildroot] [git commit] pigpio: new package
Message-ID: <20181009133505.5F783814CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3fb16a0ffead163aa2cfec7e561431a346f30c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pigpio is a library for the Raspberry Pi which allows
control of the General Purpose Input Outputs (GPIO).

http://abyz.me.uk/rpi/pigpio/

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas:
 - Use proper SPDX tag for The Unlicense
 - Add missing dependency on !BR2_STATIC_LIBS, since the Makefile is
   unconditionally building a shared library
 - Use BR2_arm instead of BR2_ARM_EABIHF, there's nothing that makes
   it EABIHF specific.
 - Use -D and full destination paths during the installation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/pigpio/Config.in   | 13 +++++++++++++
 package/pigpio/pigpio.hash |  3 +++
 package/pigpio/pigpio.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 54bc1b8616..09d7138827 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -921,6 +921,7 @@ F:	package/libwebsock/
 F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
+F:	package/pigpio/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
 
diff --git a/package/Config.in b/package/Config.in
index 1f1158a79c..09e281eb39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -487,6 +487,7 @@ endmenu
 	source "package/pdbg/Config.in"
 	source "package/picocom/Config.in"
 	source "package/pifmrds/Config.in"
+	source "package/pigpio/Config.in"
 	source "package/powertop/Config.in"
 	source "package/pps-tools/Config.in"
 	source "package/pru-software-support/Config.in"
diff --git a/package/pigpio/Config.in b/package/pigpio/Config.in
new file mode 100644
index 0000000000..fee496b2ef
--- /dev/null
+++ b/package/pigpio/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PIGPIO
+	bool "pigpio"
+	depends on BR2_aarch64 || BR2_arm
+	depends on !BR2_STATIC_LIBS
+	help
+	  Pigpio is a library for the Raspberry Pi which allows
+	  control of the General Purpose Input Outputs (GPIO).
+
+	  http://abyz.me.uk/rpi/pigpio/
+
+comment "pigpio needs a toolchain w/ dynamic library"
+	depends on BR2_aarch64 || BR2_arm
+	depends on !BR2_STATIC_LIBS
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
index 0000000000..48628a9539
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
+PIGPIO_LICENSE = Unlicense
+PIGPIO_LICENSE_FILES = UNLICENCE
+
+define PIGPIO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define PIGPIO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/pig2vcd $(TARGET_DIR)/usr/bin/pig2vcd
+	$(INSTALL) -D -m 0755 $(@D)/pigpiod $(TARGET_DIR)/usr/bin/pigpiod
+	$(INSTALL) -D -m 0755 $(@D)/pigs $(TARGET_DIR)/usr/bin/pigs
+	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so $(TARGET_DIR)/usr/lib/libpigpio.so
+	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so $(TARGET_DIR)/usr/lib/libpigpiod_if.so
+	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so $(TARGET_DIR)/usr/lib/libpigpiod_if2.so
+endef
+
+$(eval $(generic-package))
