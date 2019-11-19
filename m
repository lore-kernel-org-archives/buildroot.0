From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Nov 2019 17:37:47 +0100
Subject: [Buildroot] [git commit] package/raspi-gpio: new package
Message-ID: <20191202083933.EDB34803B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e958223603696de445c2d3c74f75dccbea13affd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
[Thomas: fix typo in Config.in, disable installation to staging, both
were noticed by Yann E. Morin]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/raspi-gpio/Config.in       | 12 ++++++++++++
 package/raspi-gpio/raspi-gpio.hash |  3 +++
 package/raspi-gpio/raspi-gpio.mk   | 12 ++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 19ea83df3b..1d3dcc1f5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1949,6 +1949,7 @@ F:	package/libxml2/
 F:	package/mongoose/
 F:	package/mxml/
 F:	package/python-periphery/
+F:	package/raspi-gpio/
 F:	package/sbc/
 F:	package/stunnel/
 F:	package/tree/
diff --git a/package/Config.in b/package/Config.in
index 36d2b31e2e..c2b48a6cbe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -510,6 +510,7 @@ endmenu
 	source "package/pps-tools/Config.in"
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
+	source "package/raspi-gpio/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
diff --git a/package/raspi-gpio/Config.in b/package/raspi-gpio/Config.in
new file mode 100644
index 0000000000..32a9448335
--- /dev/null
+++ b/package/raspi-gpio/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_RASPI_GPIO
+	bool "raspi-gpio"
+	help
+	  Tool to help debug / hack at the BCM283x GPIO. You can dump
+	  the state of a GPIO or (all GPIOs). You can change a GPIO
+	  mode and pulls (and level if set as an output).
+
+	  Beware this tool writes directly to the BCM283x GPIO
+	  registers, ignoring anything else that may be using them
+	  (like Linux drivers).
+
+	  https://github.com/RPi-Distro/raspi-gpio
diff --git a/package/raspi-gpio/raspi-gpio.hash b/package/raspi-gpio/raspi-gpio.hash
new file mode 100644
index 0000000000..8a808b657f
--- /dev/null
+++ b/package/raspi-gpio/raspi-gpio.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 8f3fb411746d339d69adc398497892883c11d2d715ccbe6d8b0b5a401da73bd5  raspi-gpio-2eaa8b8755a550e34d07c898b90b0d9b3d66fd81.tar.gz
+sha256 6e02227e1fb942687163996678d94add7911890c50025912d0ae7ee66d256bb2  LICENSE
diff --git a/package/raspi-gpio/raspi-gpio.mk b/package/raspi-gpio/raspi-gpio.mk
new file mode 100644
index 0000000000..f841c988bb
--- /dev/null
+++ b/package/raspi-gpio/raspi-gpio.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# raspi-gpio
+#
+################################################################################
+
+RASPI_GPIO_VERSION = 2eaa8b8755a550e34d07c898b90b0d9b3d66fd81
+RASPI_GPIO_SITE = $(call github,RPi-Distro,raspi-gpio,$(RASPI_GPIO_VERSION))
+RASPI_GPIO_LICENSE = BSD-3-Clause
+RASPI_GPIO_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
