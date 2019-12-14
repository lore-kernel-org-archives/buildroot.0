From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 23:48:18 +0100
Subject: [Buildroot] [git commit] package/libnfc: add sub-options to enable
 individual drivers
Message-ID: <20191214224442.097DD8B49C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a49188a69416542087acd1246b17c0139ff0054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, the arygon and pn53x_usb were unconditionally enabled, and
there were no options to choose other drivers. Therefore, we had
sub-options for each individual driver, keeping arygon and pn53x_usb
enabled by default to preserve backward compatibility.

Also, due to this, the BR2_TOOLCHAIN_HAS_THREADS dependency on the
libnfc package is no longer needed, and is only needed for some of the
sub-options.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
[Thomas:
 - drop the default ""
 - remove the top-level HAS_THREADS dependency, and move it down to
   the sub-options that need it
 - improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnfc/Config.in | 65 +++++++++++++++++++++++++++++++++++++++++++++---
 package/libnfc/libnfc.mk | 40 +++++++++++++++++++++++++++--
 2 files changed, 100 insertions(+), 5 deletions(-)

diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index c8fe251459..014ab94ce8 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -1,8 +1,5 @@
 config BR2_PACKAGE_LIBNFC
 	bool "libnfc"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Public platform independent Near Field Communication (NFC)
 	  library.
@@ -11,6 +8,68 @@ config BR2_PACKAGE_LIBNFC
 
 if BR2_PACKAGE_LIBNFC
 
+config BR2_PACKAGE_LIBNFC_ACR122_PCSC
+	bool "acr122_pcsc driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite
+	depends on BR2_USE_MMU # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  support for acr112_pcsc driver
+
+comment "acr122_pcsc driver needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_LIBNFC_ACR122_USB
+	bool "acr122_usb driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  support for acr122_usb driver
+
+comment "acr122_usb driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_LIBNFC_ACR122S
+	bool "acr122s driver"
+	help
+	  support for acr122s driver
+
+config BR2_PACKAGE_LIBNFC_ARYGON
+	bool "arygon driver"
+	default y
+	help
+	  support for arygon driver
+
+config BR2_PACKAGE_LIBNFC_PN532_I2C
+	bool "pn532_i2c driver"
+	help
+	  support for pn532_i2c driver
+
+config BR2_PACKAGE_LIBNFC_PN532_SPI
+	bool "pn532_spi driver"
+	help
+	  support for pn532_spi driver
+
+config BR2_PACKAGE_LIBNFC_PN532_UART
+	bool "pn532_uart driver"
+	help
+	  support for pn532_uart driver
+
+config BR2_PACKAGE_LIBNFC_PN53X_USB
+	bool "pn53x_usb driver"
+	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  support for pn53x_usb driver
+
+comment "pn53x_usb driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBNFC_EXAMPLES
 	bool "build libnfc examples"
 	select BR2_PACKAGE_READLINE
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index b13fd69d82..ca8700484b 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -12,10 +12,46 @@ LIBNFC_LICENSE_FILES = COPYING
 LIBNFC_AUTORECONF = YES
 LIBNFC_INSTALL_STAGING = YES
 
-LIBNFC_DEPENDENCIES = host-pkgconf libusb libusb-compat
+LIBNFC_DEPENDENCIES = host-pkgconf
 
 # N.B. The acr122 driver requires pcsc-lite.
-LIBNFC_CONF_OPTS = --with-drivers=arygon,pn53x_usb
+ifeq ($(BR2_PACKAGE_LIBNFC_ACR122_PCSC),y)
+LIBNFC_DRIVER_LIST += acr122_pcsc
+LIBNFC_DEPENDENCIES += pcsc-lite
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNFC_ACR122_USB),y)
+LIBNFC_DRIVER_LIST += acr122_usb
+LIBNFC_DEPENDENCIES += libusb libusb-compat
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNFC_ACR122S),y)
+LIBNFC_DRIVER_LIST += acr122s
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNFC_ARYGON),y)
+LIBNFC_DRIVER_LIST += arygon
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNFC_PN532_I2C),y)
+LIBNFC_DRIVER_LIST += pn532_i2c
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNFC_PN532_SPI),y)
+LIBNFC_DRIVER_LIST += pn532_spi
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNFC_PN532_UART),y)
+LIBNFC_DRIVER_LIST += pn532_uart
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNFC_PN53X_USB),y)
+LIBNFC_DRIVER_LIST += pn53x_usb
+LIBNFC_DEPENDENCIES += libusb libusb-compat
+endif
+
+LIBNFC_CONF_OPTS = \
+	--with-drivers=$(subst $(space),$(comma),$(strip $(LIBNFC_DRIVER_LIST)))
 
 ifeq ($(BR2_PACKAGE_LIBNFC_EXAMPLES),y)
 LIBNFC_CONF_OPTS += --enable-example
