From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Feb 2019 20:26:11 +0100
Subject: [Buildroot] [PATCH/next 4/6] package/flashrom: libusb-compat is
 optional, not mandatory
In-Reply-To: <20190228192613.30160-1-fontaine.fabrice@gmail.com>
References: <20190228192613.30160-1-fontaine.fabrice@gmail.com>
Message-ID: <20190228192613.30160-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
