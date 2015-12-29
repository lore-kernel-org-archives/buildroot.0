From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 22:54:15 +0100
Subject: [Buildroot] [git commit] bcm2835: new package
Message-ID: <20151229220020.0E1527FBED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d856fc15c083876e2f96d5f8e0763e6c04be6c19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - addition of 'depends on BR2_arm' as suggested by Yann.
 - addition of a comment in the Config.in help text that says that
   this library is a pure abomination.
 - fix the hash, since apparently upstream changes the released
   tarballs after they are published.
 - fix license, it's GPLv2, not GPLv2+.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/bcm2835/Config.in    | 19 +++++++++++++++++++
 package/bcm2835/bcm2835.hash |  2 ++
 package/bcm2835/bcm2835.mk   | 13 +++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 283363d..bc6099d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -906,6 +906,7 @@ menu "Graphics"
 endmenu
 
 menu "Hardware handling"
+	source "package/bcm2835/Config.in"
 	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
 	source "package/dtc/Config.in"
diff --git a/package/bcm2835/Config.in b/package/bcm2835/Config.in
new file mode 100644
index 0000000..4c3eb2c
--- /dev/null
+++ b/package/bcm2835/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_BCM2835
+	bool "bcm2835"
+	depends on BR2_arm
+	help
+	  C library for Broadcom BCM 2835 as used in Raspberry Pi.
+	  It provides access to GPIO and other IO functions on the
+	  Broadcom BCM 2835 chip, allowing access to the GPIO pins
+	  on the 26 pin IDE plug on the RPi board so you can control
+	  and interface with various external devices.
+
+	  WARNING: the opinion of the Buildroot developers is that
+	  such library is a complete abomination as it entirely works
+	  around the standard Linux interfaces to access GPIOs, I2C,
+	  SPI busses or other IOs. The library directly remaps the
+	  hardware registers in user-space, completely bypassing what
+	  the kernel drivers are doing, and potentially conflicting
+	  with them.
+
+	  http://www.airspayce.com/mikem/bcm2835
diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
new file mode 100644
index 0000000..1aea3ae
--- /dev/null
+++ b/package/bcm2835/bcm2835.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 295f66dab533592ce41db8e07befe985645a2e661bbf75dce9c383e61e24cb5f bcm2835-1.48.tar.gz
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
new file mode 100644
index 0000000..c111a0a
--- /dev/null
+++ b/package/bcm2835/bcm2835.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# bcm2835
+#
+################################################################################
+
+BCM2835_VERSION = 1.48
+BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
+BCM2835_LICENSE = GPLv2
+BCM2835_LICENSE_FILES = COPYING
+BCM2835_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
