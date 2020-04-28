From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Apr 2020 01:47:43 -0600
Subject: [Buildroot] [PATCH 1/1] package/libusb-compat: bump to version 0.1.7
Message-ID: <20200428074743.23840-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...d-fixed-width-integer-types-in-usb.h.patch | 237 ------------------
 ... => 0001-fix-a-build-issue-on-linux.patch} |   0
 package/libusb-compat/libusb-compat.hash      |   2 +-
 package/libusb-compat/libusb-compat.mk        |   4 +-
 4 files changed, 3 insertions(+), 240 deletions(-)
 delete mode 100644 package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch
 rename package/libusb-compat/{0002-fix-a-build-issue-on-linux.patch => 0001-fix-a-build-issue-on-linux.patch} (100%)

diff --git a/package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch b/package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch
deleted file mode 100644
index 35872a9710..0000000000
--- a/package/libusb-compat/0001-Use-C99-standard-fixed-width-integer-types-in-usb.h.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-From 87adda6abc3467ede45a6d2a87df2b9efdf5bb33 Mon Sep 17 00:00:00 2001
-From: Nathan Hjelm <hjelmn@me.com>
-Date: Fri, 9 Oct 2015 15:03:10 -0600
-Subject: [PATCH] Use C99 standard fixed width integer types in usb.h
-
-This patch modifies the integer types in usb.h of the form u_int* to the
-C99 standard uint* types.
-
-Based on patch from Gwenhael Goavec-Merou.
-
-Backported from upstream commit
-https://github.com/libusb/libusb-compat-0.1/commit/2e9b6bbebb7cf1ef0095516ec6d5203deb3822e8.
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Signed-off-by: Nathan Hjelm <hjelmn@me.com>
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
----
- libusb/usb.h | 130 ++++++++++++++++++++++++++++++++---------------------------
- 1 file changed, 70 insertions(+), 60 deletions(-)
-
-diff --git a/libusb/usb.h b/libusb/usb.h
-index 84e730f..d2c30aa 100644
---- a/libusb/usb.h
-+++ b/libusb/usb.h
-@@ -2,6 +2,7 @@
-  * Prototypes, structure definitions and macros.
-  *
-  * Copyright (c) 2000-2003 Johannes Erdfelt <johannes@erdfelt.com>
-+ * Copyright (c) 2015      Nathan Hjelm <hjelmn@cs.unm.edu>
-  *
-  * This library is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public
-@@ -22,8 +23,8 @@
-  * distribution for details.
-  */
- 
--#ifndef __USB_H__
--#define __USB_H__
-+#ifndef USB_H
-+#define USB_H
- 
- #include <unistd.h>
- #include <stdlib.h>
-@@ -31,6 +32,15 @@
- 
- #include <dirent.h>
- 
-+/* stdint.h is not available on older MSVC */
-+#if defined(_MSC_VER) && (_MSC_VER < 1600) && (!defined(_STDINT)) && (!defined(_STDINT_H))
-+typedef unsigned __int8   uint8_t;
-+typedef unsigned __int16  uint16_t;
-+typedef unsigned __int32  uint32_t;
-+#else
-+#include <stdint.h>
-+#endif
-+
- /*
-  * USB spec information
-  *
-@@ -78,40 +88,40 @@
- 
- /* All standard descriptors have these 2 fields in common */
- struct usb_descriptor_header {
--	u_int8_t  bLength;
--	u_int8_t  bDescriptorType;
-+	uint8_t  bLength;
-+	uint8_t  bDescriptorType;
- };
- 
- /* String descriptor */
- struct usb_string_descriptor {
--	u_int8_t  bLength;
--	u_int8_t  bDescriptorType;
--	u_int16_t wData[1];
-+	uint8_t  bLength;
-+	uint8_t  bDescriptorType;
-+	uint16_t wData[1];
- };
- 
- /* HID descriptor */
- struct usb_hid_descriptor {
--	u_int8_t  bLength;
--	u_int8_t  bDescriptorType;
--	u_int16_t bcdHID;
--	u_int8_t  bCountryCode;
--	u_int8_t  bNumDescriptors;
--	/* u_int8_t  bReportDescriptorType; */
--	/* u_int16_t wDescriptorLength; */
-+	uint8_t  bLength;
-+	uint8_t  bDescriptorType;
-+	uint16_t bcdHID;
-+	uint8_t  bCountryCode;
-+	uint8_t  bNumDescriptors;
-+	/* uint8_t  bReportDescriptorType; */
-+	/* uint16_t wDescriptorLength; */
- 	/* ... */
- };
- 
- /* Endpoint descriptor */
- #define USB_MAXENDPOINTS	32
- struct usb_endpoint_descriptor {
--	u_int8_t  bLength;
--	u_int8_t  bDescriptorType;
--	u_int8_t  bEndpointAddress;
--	u_int8_t  bmAttributes;
--	u_int16_t wMaxPacketSize;
--	u_int8_t  bInterval;
--	u_int8_t  bRefresh;
--	u_int8_t  bSynchAddress;
-+	uint8_t  bLength;
-+	uint8_t  bDescriptorType;
-+	uint8_t  bEndpointAddress;
-+	uint8_t  bmAttributes;
-+	uint16_t wMaxPacketSize;
-+	uint8_t  bInterval;
-+	uint8_t  bRefresh;
-+	uint8_t  bSynchAddress;
- 
- 	unsigned char *extra;	/* Extra descriptors */
- 	int extralen;
-@@ -129,15 +139,15 @@ struct usb_endpoint_descriptor {
- /* Interface descriptor */
- #define USB_MAXINTERFACES	32
- struct usb_interface_descriptor {
--	u_int8_t  bLength;
--	u_int8_t  bDescriptorType;
--	u_int8_t  bInterfaceNumber;
--	u_int8_t  bAlternateSetting;
--	u_int8_t  bNumEndpoints;
--	u_int8_t  bInterfaceClass;
--	u_int8_t  bInterfaceSubClass;
--	u_int8_t  bInterfaceProtocol;
--	u_int8_t  iInterface;
-+	uint8_t  bLength;
-+	uint8_t  bDescriptorType;
-+	uint8_t  bInterfaceNumber;
-+	uint8_t  bAlternateSetting;
-+	uint8_t  bNumEndpoints;
-+	uint8_t  bInterfaceClass;
-+	uint8_t  bInterfaceSubClass;
-+	uint8_t  bInterfaceProtocol;
-+	uint8_t  iInterface;
- 
- 	struct usb_endpoint_descriptor *endpoint;
- 
-@@ -155,14 +165,14 @@ struct usb_interface {
- /* Configuration descriptor information.. */
- #define USB_MAXCONFIG		8
- struct usb_config_descriptor {
--	u_int8_t  bLength;
--	u_int8_t  bDescriptorType;
--	u_int16_t wTotalLength;
--	u_int8_t  bNumInterfaces;
--	u_int8_t  bConfigurationValue;
--	u_int8_t  iConfiguration;
--	u_int8_t  bmAttributes;
--	u_int8_t  MaxPower;
-+	uint8_t  bLength;
-+	uint8_t  bDescriptorType;
-+	uint16_t wTotalLength;
-+	uint8_t  bNumInterfaces;
-+	uint8_t  bConfigurationValue;
-+	uint8_t  iConfiguration;
-+	uint8_t  bmAttributes;
-+	uint8_t  MaxPower;
- 
- 	struct usb_interface *interface;
- 
-@@ -172,28 +182,28 @@ struct usb_config_descriptor {
- 
- /* Device descriptor */
- struct usb_device_descriptor {
--	u_int8_t  bLength;
--	u_int8_t  bDescriptorType;
--	u_int16_t bcdUSB;
--	u_int8_t  bDeviceClass;
--	u_int8_t  bDeviceSubClass;
--	u_int8_t  bDeviceProtocol;
--	u_int8_t  bMaxPacketSize0;
--	u_int16_t idVendor;
--	u_int16_t idProduct;
--	u_int16_t bcdDevice;
--	u_int8_t  iManufacturer;
--	u_int8_t  iProduct;
--	u_int8_t  iSerialNumber;
--	u_int8_t  bNumConfigurations;
-+	uint8_t  bLength;
-+	uint8_t  bDescriptorType;
-+	uint16_t bcdUSB;
-+	uint8_t  bDeviceClass;
-+	uint8_t  bDeviceSubClass;
-+	uint8_t  bDeviceProtocol;
-+	uint8_t  bMaxPacketSize0;
-+	uint16_t idVendor;
-+	uint16_t idProduct;
-+	uint16_t bcdDevice;
-+	uint8_t  iManufacturer;
-+	uint8_t  iProduct;
-+	uint8_t  iSerialNumber;
-+	uint8_t  bNumConfigurations;
- };
- 
- struct usb_ctrl_setup {
--	u_int8_t  bRequestType;
--	u_int8_t  bRequest;
--	u_int16_t wValue;
--	u_int16_t wIndex;
--	u_int16_t wLength;
-+	uint8_t  bRequestType;
-+	uint8_t  bRequest;
-+	uint16_t wValue;
-+	uint16_t wIndex;
-+	uint16_t wLength;
- };
- 
- /*
-@@ -254,7 +264,7 @@ struct usb_device {
- 
-   void *dev;		/* Darwin support */
- 
--  u_int8_t devnum;
-+  uint8_t devnum;
- 
-   unsigned char num_children;
-   struct usb_device **children;
-@@ -266,7 +276,7 @@ struct usb_bus {
-   char dirname[PATH_MAX + 1];
- 
-   struct usb_device *devices;
--  u_int32_t location;
-+  uint32_t location;
- 
-   struct usb_device *root_dev;
- };
--- 
-2.9.3
-
diff --git a/package/libusb-compat/0002-fix-a-build-issue-on-linux.patch b/package/libusb-compat/0001-fix-a-build-issue-on-linux.patch
similarity index 100%
rename from package/libusb-compat/0002-fix-a-build-issue-on-linux.patch
rename to package/libusb-compat/0001-fix-a-build-issue-on-linux.patch
diff --git a/package/libusb-compat/libusb-compat.hash b/package/libusb-compat/libusb-compat.hash
index 26c3a80ebc..3acf3c3408 100644
--- a/package/libusb-compat/libusb-compat.hash
+++ b/package/libusb-compat/libusb-compat.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a  libusb-compat-0.1.5.tar.bz2
+sha256  8259f8d5b084fe43c47823a939e955e0ba21942b8d112266c39d228cc14764d6  libusb-compat-0.1.7.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 61d4c203e7..f94aa96ada 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 LIBUSB_COMPAT_VERSION_MAJOR = 0.1
-LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).5
+LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).7
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
-LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-$(LIBUSB_COMPAT_VERSION_MAJOR)/libusb-compat-$(LIBUSB_COMPAT_VERSION)
+LIBUSB_COMPAT_SITE = https://github.com/libusb/libusb-compat-0.1/releases/download/v$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf host-libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
-- 
2.20.1
