From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 20:10:13 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/flashrom: libusb
 is optional, not mandatory
Message-ID: <20190319191327.C898681E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d26ba342941d1725004165a80024b661e0d9b91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 276ddad9f4efe275af3887cd30ac1432f7e96a68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/Config.in   | 6 ------
 package/flashrom/flashrom.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 1edf162d31..f787bb3b62 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_LIBUSB
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
@@ -11,7 +9,3 @@ config BR2_PACKAGE_FLASHROM
 	  programmer devices.
 
 	  http://flashrom.org/
-
-comment "flashrom needs a toolchain w/ threads"
-	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 69a0cbfe5c..733ad7318d 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -7,7 +7,6 @@
 FLASHROM_VERSION = 1.0
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
-FLASHROM_DEPENDENCIES = libusb host-pkgconf
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 
@@ -22,6 +21,13 @@ FLASHROM_MAKE_OPTS += \
 	CONFIG_USBBLASTER_SPI=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+FLASHROM_DEPENDENCIES += host-pkgconf libusb
+FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB1_PROGRAMMERS=yes
+else
+FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB1_PROGRAMMERS=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 FLASHROM_DEPENDENCIES += host-pkgconf libusb-compat
 FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB0_PROGRAMMERS=yes
