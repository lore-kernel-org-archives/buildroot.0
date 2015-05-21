From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:06:20 +0200
Subject: [Buildroot] [git commit branch/next] flashrom: Bump to version 0.9.8
Message-ID: <20150521211005.D906180E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b01950f0c7b3b351241dec89979c2c3e0dd0931
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version adds support for new Intel SoC (e.g. BayTrail) and
spi over usb devices such as pickit2 and ftdi usb-spi.

[Thomas:
  - add missing Config.in comment about the thread dependency
  - remove 'Requires PCIUtils libraries' from the Config.in help text,
    since flashrom now requires more than PCIUtils library, and we
    typically don't document such dependencies in Config.in help
    texts.]

Signed-off-by: Florent Valette <florent.valette@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flashrom/Config.in   |   11 ++++++++++-
 package/flashrom/flashrom.mk |    4 ++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 956500f..17a0416 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,11 +1,20 @@
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
-	  Requires PCIUtils libraries.
 
 	  http://flashrom.org/
+
+comment "flashrom needs a toolchain w/ threads"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
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
 
