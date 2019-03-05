From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 21:45:31 +0100
Subject: [Buildroot] [git commit] package/flashrom: libusb-compat is
 optional, not mandatory
Message-ID: <20190305204525.D0F32812EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b36054fc7ca55b73fa09d68b239b45d0e30364e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/Config.in   | 1 -
 package/flashrom/flashrom.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 0a5a7248e1..1edf162d31 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_FLASHROM
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 40198bac60..69a0cbfe5c 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -7,7 +7,7 @@
 FLASHROM_VERSION = 1.0
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
-FLASHROM_DEPENDENCIES = libusb libusb-compat host-pkgconf
+FLASHROM_DEPENDENCIES = libusb host-pkgconf
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 
@@ -22,6 +22,13 @@ FLASHROM_MAKE_OPTS += \
 	CONFIG_USBBLASTER_SPI=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+FLASHROM_DEPENDENCIES += host-pkgconf libusb-compat
+FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB0_PROGRAMMERS=yes
+else
+FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBUSB0_PROGRAMMERS=no
+endif
+
 ifeq ($(BR2_PACKAGE_PCIUTILS),y)
 FLASHROM_DEPENDENCIES += pciutils
 FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBPCI_PROGRAMMERS=yes
