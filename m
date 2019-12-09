From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Mon,  9 Dec 2019 22:59:23 +0100
Subject: [Buildroot] [PATCH 3/3] package/libnfc: add configs to select which
 driver to support
In-Reply-To: <20191209215923.28945-1-aussedat.louis@gmail.com>
References: <20191209215923.28945-1-aussedat.louis@gmail.com>
Message-ID: <20191209215923.28945-3-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, arygon and pn53x_usb are activated,
to keep old configuration.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 package/libnfc/Config.in | 55 ++++++++++++++++++++++++++++++++++++++--
 package/libnfc/libnfc.mk | 40 +++++++++++++++++++++++++++--
 2 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index c8fe251459..9a1c8103ec 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LIBNFC
 	bool "libnfc"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Public platform independent Near Field Communication (NFC)
 	  library.
@@ -11,6 +9,59 @@ config BR2_PACKAGE_LIBNFC
 
 if BR2_PACKAGE_LIBNFC
 
+config BR2_PACKAGE_LIBNFC_ACR122_PCSC
+	bool "acr122_pcsc driver"
+	default ""
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  support for acr112_pcsc driver
+
+config BR2_PACKAGE_LIBNFC_ACR122_USB
+	bool "acr122_usb driver"
+	default ""
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  support for acr122_usb driver
+
+config BR2_PACKAGE_LIBNFC_ACR122S
+	bool "acr122s driver"
+	default ""
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
+	default ""
+	help
+	  support for pn532_i2c driver
+
+config BR2_PACKAGE_LIBNFC_PN532_SPI
+	bool "pn532_spi driver"
+	default ""
+	help
+	  support for pn532_spi driver
+
+config BR2_PACKAGE_LIBNFC_PN532_UART
+	bool "pn532_uart driver"
+	default ""
+	help
+	  support for pn532_uart driver
+
+config BR2_PACKAGE_LIBNFC_PN53X_USB
+	bool "pn53x_usb driver"
+	default y
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  support for pn53x_usb driver
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
-- 
2.24.0
