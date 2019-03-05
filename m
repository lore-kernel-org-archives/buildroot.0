From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 21:44:54 +0100
Subject: [Buildroot] [git commit] package/flashrom: pciutils is optional,
 not mandatory
Message-ID: <20190305204525.C2EC5812EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f317411f3391451f0815c8d4f2f95ed1b14770a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/Config.in   |  1 -
 package/flashrom/flashrom.mk | 12 ++++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 8f26a634e6..66fe359724 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	select BR2_PACKAGE_LIBFTDI
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 70f47b5a04..73d56f7f80 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -7,13 +7,21 @@
 FLASHROM_VERSION = 1.0
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
-FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi host-pkgconf
+FLASHROM_DEPENDENCIES = libusb libusb-compat libftdi host-pkgconf
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_PCIUTILS),y)
+FLASHROM_DEPENDENCIES += pciutils
+FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBPCI_PROGRAMMERS=yes
+else
+FLASHROM_MAKE_OPTS += CONFIG_ENABLE_LIBPCI_PROGRAMMERS=no
+endif
+
 define FLASHROM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -DHAVE_STRNLEN" -C $(@D)
+		CFLAGS="$(TARGET_CFLAGS) -DHAVE_STRNLEN" \
+		$(FLASHROM_MAKE_OPTS) -C $(@D)
 endef
 
 define FLASHROM_INSTALL_TARGET_CMDS
