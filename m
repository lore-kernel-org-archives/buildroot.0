From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 21:45:04 +0100
Subject: [Buildroot] [git commit] package/flashrom: libftdi is optional,
 not mandatory
Message-ID: <20190305204525.CA0F8812EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13121a1daa0de24934c2e53adeab919d60e317f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/Config.in   |  1 -
 package/flashrom/flashrom.mk | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 66fe359724..0a5a7248e1 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_FLASHROM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	select BR2_PACKAGE_LIBFTDI
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 73d56f7f80..40198bac60 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -7,10 +7,21 @@
 FLASHROM_VERSION = 1.0
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
-FLASHROM_DEPENDENCIES = libusb libusb-compat libftdi host-pkgconf
+FLASHROM_DEPENDENCIES = libusb libusb-compat host-pkgconf
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBFTDI),y)
+FLASHROM_DEPENDENCIES += host-pkgconf libftdi
+FLASHROM_MAKE_OPTS += \
+	CONFIG_FT2232_SPI=yes \
+	CONFIG_USBBLASTER_SPI=yes
+else
+FLASHROM_MAKE_OPTS += \
+	CONFIG_FT2232_SPI=no \
+	CONFIG_USBBLASTER_SPI=no
+endif
+
 ifeq ($(BR2_PACKAGE_PCIUTILS),y)
 FLASHROM_DEPENDENCIES += pciutils
 FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBPCI_PROGRAMMERS=yes
