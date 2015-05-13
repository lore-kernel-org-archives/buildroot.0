From: Florent Valette <florent.valette@gmail.com>
Date: Wed, 13 May 2015 19:40:15 +0200
Subject: [Buildroot] [PATCH v2] flashrom: Bump to version 0.9.8
Message-ID: <1431538815-2215-1-git-send-email-florent.valette@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version adds support for new Intel SoC (e.g. BayTrail) and
spi over spi devices such as pickit2 and ftdi usb-spi.

Signed-off-by: Florent Valette <florent.valette@gmail.com>

---
Changes v1 -> v2:
 propagate the dependencies for libusb and libftdi
 Note, libftdi1 is not supported, it only uses libftdi.

Signed-off-by: Florent Valette <florent.valette@gmail.com>
---
 package/flashrom/Config.in   | 5 +++++
 package/flashrom/flashrom.mk | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 956500f..8bd5882 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
 	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_LIBFTDI
 	# dmidecode is only a runtime dependency
 	select BR2_PACKAGE_DMIDECODE
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS 	# libusb
+	depends on BR2_ARCH_HAS_ATOMICS 	# libftdi
 	help
 	  BIOS-updating utility.
 	  Requires PCIUtils libraries.
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 70bbe30..525470a 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 0.9.7
+FLASHROM_VERSION = 0.9.8
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = http://download.flashrom.org/releases
-FLASHROM_DEPENDENCIES = pciutils
+FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi
 FLASHROM_LICENSE = GPLv2+
 FLASHROM_LICENSE_FILES = COPYING
 
-- 
1.9.1
