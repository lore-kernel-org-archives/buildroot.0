From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 11:40:54 +0200
Subject: [Buildroot] [git commit] media-ctl: remove package
Message-ID: <20151010094614.BB6CA7F960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7dd5cb263671b68a944d490e68a425e96387436
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package media-ctl is out-dated, source (and developement) have been moved
to v4l-utils since June 2014. Up-to-date version is available in
the libv4l package (BR2_PACKAGE_LIBV4L/BR2_PACKAGE_LIBV4L_UTILS).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |   10 +
 package/Config.in                                  |    1 -
 ...ers-for-compatibility-with-old-toolchains.patch |  303 --------------------
 package/media-ctl/Config.in                        |    9 -
 package/media-ctl/media-ctl.mk                     |   17 --
 5 files changed, 10 insertions(+), 330 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d8d3996..7d2d63f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,16 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_MEDIA_CTL
+	bool "media-ctl package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBV4L
+	select BR2_PACKAGE_LIBV4L_UTILS
+	help
+	  media-ctl source and developement have been moved to
+	  v4l-utils since June 2014. For an up-to-date media-ctl
+	  version select BR2_PACKAGE_LIBV4L and BR2_PACKAGE_LIBV4L_UTILS.
+
 config BR2_PACKAGE_SCHIFRA
 	bool "schifra package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index e049ffc..1ceb7d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -376,7 +376,6 @@ endif
 	source "package/lsuio/Config.in"
 	source "package/lvm2/Config.in"
 	source "package/mdadm/Config.in"
-	source "package/media-ctl/Config.in"
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/minicom/Config.in"
diff --git a/package/media-ctl/0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch b/package/media-ctl/0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
deleted file mode 100644
index 17b52ce..0000000
--- a/package/media-ctl/0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
+++ /dev/null
@@ -1,303 +0,0 @@
-From 480b9effa08541b5df369dd6516013282cf28bd8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 6 Oct 2013 17:24:04 +0200
-Subject: [PATCH] Add kernel headers for compatibility with old toolchains
-
-The media controller mechanism is relatively new in the Linux kernel,
-and therefore all toolchains don't yet have the necessary
-headers. This patch makes sure that media-ctl provides such headers,
-as was already the case with v4l2-common.h, v4l2-subdev.h and
-videodev2.h.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac              |   6 +--
- src/linux/media.h         | 132 ++++++++++++++++++++++++++++++++++++++++++++++
- src/linux/v4l2-mediabus.h | 119 +++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 252 insertions(+), 5 deletions(-)
- create mode 100644 src/linux/media.h
- create mode 100644 src/linux/v4l2-mediabus.h
-
-diff --git a/configure.ac b/configure.ac
-index a749794..56eb71f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -51,11 +51,7 @@ AC_ARG_WITH(kernel-headers,
- CPPFLAGS="$CPPFLAGS -I$KERNEL_HEADERS_DIR/include"
- 
- # Checks for header files.
--AC_CHECK_HEADERS([linux/media.h \
--		  linux/types.h \
--		  linux/v4l2-mediabus.h \
--		  linux/v4l2-subdev.h \
--		  linux/videodev2.h],
-+AC_CHECK_HEADERS([linux/types.h],
- 		  [],
- 		  [echo "ERROR: Kernel header file not found or not usable!"; exit 1])
- 
-diff --git a/src/linux/media.h b/src/linux/media.h
-new file mode 100644
-index 0000000..410e7cc
---- /dev/null
-+++ b/src/linux/media.h
-@@ -0,0 +1,132 @@
-+/*
-+ * Multimedia device API
-+ *
-+ * Copyright (C) 2010 Nokia Corporation
-+ *
-+ * Contacts: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+ *	     Sakari Ailus <sakari.ailus@iki.fi>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License version 2 as
-+ * published by the Free Software Foundation.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-+ */
-+
-+#ifndef __LINUX_MEDIA_H
-+#define __LINUX_MEDIA_H
-+
-+#include <linux/ioctl.h>
-+#include <linux/types.h>
-+#include <linux/version.h>
-+
-+#define MEDIA_API_VERSION	KERNEL_VERSION(0, 1, 0)
-+
-+struct media_device_info {
-+	char driver[16];
-+	char model[32];
-+	char serial[40];
-+	char bus_info[32];
-+	__u32 media_version;
-+	__u32 hw_revision;
-+	__u32 driver_version;
-+	__u32 reserved[31];
-+};
-+
-+#define MEDIA_ENT_ID_FLAG_NEXT		(1 << 31)
-+
-+#define MEDIA_ENT_TYPE_SHIFT		16
-+#define MEDIA_ENT_TYPE_MASK		0x00ff0000
-+#define MEDIA_ENT_SUBTYPE_MASK		0x0000ffff
-+
-+#define MEDIA_ENT_T_DEVNODE		(1 << MEDIA_ENT_TYPE_SHIFT)
-+#define MEDIA_ENT_T_DEVNODE_V4L		(MEDIA_ENT_T_DEVNODE + 1)
-+#define MEDIA_ENT_T_DEVNODE_FB		(MEDIA_ENT_T_DEVNODE + 2)
-+#define MEDIA_ENT_T_DEVNODE_ALSA	(MEDIA_ENT_T_DEVNODE + 3)
-+#define MEDIA_ENT_T_DEVNODE_DVB		(MEDIA_ENT_T_DEVNODE + 4)
-+
-+#define MEDIA_ENT_T_V4L2_SUBDEV		(2 << MEDIA_ENT_TYPE_SHIFT)
-+#define MEDIA_ENT_T_V4L2_SUBDEV_SENSOR	(MEDIA_ENT_T_V4L2_SUBDEV + 1)
-+#define MEDIA_ENT_T_V4L2_SUBDEV_FLASH	(MEDIA_ENT_T_V4L2_SUBDEV + 2)
-+#define MEDIA_ENT_T_V4L2_SUBDEV_LENS	(MEDIA_ENT_T_V4L2_SUBDEV + 3)
-+
-+#define MEDIA_ENT_FL_DEFAULT		(1 << 0)
-+
-+struct media_entity_desc {
-+	__u32 id;
-+	char name[32];
-+	__u32 type;
-+	__u32 revision;
-+	__u32 flags;
-+	__u32 group_id;
-+	__u16 pads;
-+	__u16 links;
-+
-+	__u32 reserved[4];
-+
-+	union {
-+		/* Node specifications */
-+		struct {
-+			__u32 major;
-+			__u32 minor;
-+		} v4l;
-+		struct {
-+			__u32 major;
-+			__u32 minor;
-+		} fb;
-+		struct {
-+			__u32 card;
-+			__u32 device;
-+			__u32 subdevice;
-+		} alsa;
-+		int dvb;
-+
-+		/* Sub-device specifications */
-+		/* Nothing needed yet */
-+		__u8 raw[184];
-+	};
-+};
-+
-+#define MEDIA_PAD_FL_SINK		(1 << 0)
-+#define MEDIA_PAD_FL_SOURCE		(1 << 1)
-+
-+struct media_pad_desc {
-+	__u32 entity;		/* entity ID */
-+	__u16 index;		/* pad index */
-+	__u32 flags;		/* pad flags */
-+	__u32 reserved[2];
-+};
-+
-+#define MEDIA_LNK_FL_ENABLED		(1 << 0)
-+#define MEDIA_LNK_FL_IMMUTABLE		(1 << 1)
-+#define MEDIA_LNK_FL_DYNAMIC		(1 << 2)
-+
-+struct media_link_desc {
-+	struct media_pad_desc source;
-+	struct media_pad_desc sink;
-+	__u32 flags;
-+	__u32 reserved[2];
-+};
-+
-+struct media_links_enum {
-+	__u32 entity;
-+	/* Should have enough room for pads elements */
-+	struct media_pad_desc *pads;
-+	/* Should have enough room for links elements */
-+	struct media_link_desc *links;
-+	__u32 reserved[4];
-+};
-+
-+#define MEDIA_IOC_DEVICE_INFO		_IOWR('|', 0x00, struct media_device_info)
-+#define MEDIA_IOC_ENUM_ENTITIES		_IOWR('|', 0x01, struct media_entity_desc)
-+#define MEDIA_IOC_ENUM_LINKS		_IOWR('|', 0x02, struct media_links_enum)
-+#define MEDIA_IOC_SETUP_LINK		_IOWR('|', 0x03, struct media_link_desc)
-+
-+#endif /* __LINUX_MEDIA_H */
-diff --git a/src/linux/v4l2-mediabus.h b/src/linux/v4l2-mediabus.h
-new file mode 100644
-index 0000000..7d64e0e
---- /dev/null
-+++ b/src/linux/v4l2-mediabus.h
-@@ -0,0 +1,119 @@
-+/*
-+ * Media Bus API header
-+ *
-+ * Copyright (C) 2009, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License version 2 as
-+ * published by the Free Software Foundation.
-+ */
-+
-+#ifndef __LINUX_V4L2_MEDIABUS_H
-+#define __LINUX_V4L2_MEDIABUS_H
-+
-+#include <linux/types.h>
-+#include <linux/videodev2.h>
-+
-+/*
-+ * These pixel codes uniquely identify data formats on the media bus. Mostly
-+ * they correspond to similarly named V4L2_PIX_FMT_* formats, format 0 is
-+ * reserved, V4L2_MBUS_FMT_FIXED shall be used by host-client pairs, where the
-+ * data format is fixed. Additionally, "2X8" means that one pixel is transferred
-+ * in two 8-bit samples, "BE" or "LE" specify in which order those samples are
-+ * transferred over the bus: "LE" means that the least significant bits are
-+ * transferred first, "BE" means that the most significant bits are transferred
-+ * first, and "PADHI" and "PADLO" define which bits - low or high, in the
-+ * incomplete high byte, are filled with padding bits.
-+ *
-+ * The pixel codes are grouped by type, bus_width, bits per component, samples
-+ * per pixel and order of subsamples. Numerical values are sorted using generic
-+ * numerical sort order (8 thus comes before 10).
-+ *
-+ * As their value can't change when a new pixel code is inserted in the
-+ * enumeration, the pixel codes are explicitly given a numerical value. The next
-+ * free values for each category are listed below, update them when inserting
-+ * new pixel codes.
-+ */
-+enum v4l2_mbus_pixelcode {
-+	V4L2_MBUS_FMT_FIXED = 0x0001,
-+
-+	/* RGB - next is 0x1009 */
-+	V4L2_MBUS_FMT_RGB444_2X8_PADHI_BE = 0x1001,
-+	V4L2_MBUS_FMT_RGB444_2X8_PADHI_LE = 0x1002,
-+	V4L2_MBUS_FMT_RGB555_2X8_PADHI_BE = 0x1003,
-+	V4L2_MBUS_FMT_RGB555_2X8_PADHI_LE = 0x1004,
-+	V4L2_MBUS_FMT_BGR565_2X8_BE = 0x1005,
-+	V4L2_MBUS_FMT_BGR565_2X8_LE = 0x1006,
-+	V4L2_MBUS_FMT_RGB565_2X8_BE = 0x1007,
-+	V4L2_MBUS_FMT_RGB565_2X8_LE = 0x1008,
-+
-+	/* YUV (including grey) - next is 0x2014 */
-+	V4L2_MBUS_FMT_Y8_1X8 = 0x2001,
-+	V4L2_MBUS_FMT_UYVY8_1_5X8 = 0x2002,
-+	V4L2_MBUS_FMT_VYUY8_1_5X8 = 0x2003,
-+	V4L2_MBUS_FMT_YUYV8_1_5X8 = 0x2004,
-+	V4L2_MBUS_FMT_YVYU8_1_5X8 = 0x2005,
-+	V4L2_MBUS_FMT_UYVY8_2X8 = 0x2006,
-+	V4L2_MBUS_FMT_VYUY8_2X8 = 0x2007,
-+	V4L2_MBUS_FMT_YUYV8_2X8 = 0x2008,
-+	V4L2_MBUS_FMT_YVYU8_2X8 = 0x2009,
-+	V4L2_MBUS_FMT_Y10_1X10 = 0x200a,
-+	V4L2_MBUS_FMT_YUYV10_2X10 = 0x200b,
-+	V4L2_MBUS_FMT_YVYU10_2X10 = 0x200c,
-+	V4L2_MBUS_FMT_Y12_1X12 = 0x2013,
-+	V4L2_MBUS_FMT_UYVY8_1X16 = 0x200f,
-+	V4L2_MBUS_FMT_VYUY8_1X16 = 0x2010,
-+	V4L2_MBUS_FMT_YUYV8_1X16 = 0x2011,
-+	V4L2_MBUS_FMT_YVYU8_1X16 = 0x2012,
-+	V4L2_MBUS_FMT_YUYV10_1X20 = 0x200d,
-+	V4L2_MBUS_FMT_YVYU10_1X20 = 0x200e,
-+
-+	/* Bayer - next is 0x3015 */
-+	V4L2_MBUS_FMT_SBGGR8_1X8 = 0x3001,
-+	V4L2_MBUS_FMT_SGBRG8_1X8 = 0x3013,
-+	V4L2_MBUS_FMT_SGRBG8_1X8 = 0x3002,
-+	V4L2_MBUS_FMT_SRGGB8_1X8 = 0x3014,
-+	V4L2_MBUS_FMT_SBGGR10_DPCM8_1X8 = 0x300b,
-+	V4L2_MBUS_FMT_SGBRG10_DPCM8_1X8 = 0x300c,
-+	V4L2_MBUS_FMT_SGRBG10_DPCM8_1X8 = 0x3009,
-+	V4L2_MBUS_FMT_SRGGB10_DPCM8_1X8 = 0x300d,
-+	V4L2_MBUS_FMT_SBGGR10_2X8_PADHI_BE = 0x3003,
-+	V4L2_MBUS_FMT_SBGGR10_2X8_PADHI_LE = 0x3004,
-+	V4L2_MBUS_FMT_SBGGR10_2X8_PADLO_BE = 0x3005,
-+	V4L2_MBUS_FMT_SBGGR10_2X8_PADLO_LE = 0x3006,
-+	V4L2_MBUS_FMT_SBGGR10_1X10 = 0x3007,
-+	V4L2_MBUS_FMT_SGBRG10_1X10 = 0x300e,
-+	V4L2_MBUS_FMT_SGRBG10_1X10 = 0x300a,
-+	V4L2_MBUS_FMT_SRGGB10_1X10 = 0x300f,
-+	V4L2_MBUS_FMT_SBGGR12_1X12 = 0x3008,
-+	V4L2_MBUS_FMT_SGBRG12_1X12 = 0x3010,
-+	V4L2_MBUS_FMT_SGRBG12_1X12 = 0x3011,
-+	V4L2_MBUS_FMT_SRGGB12_1X12 = 0x3012,
-+
-+	/* JPEG compressed formats - next is 0x4002 */
-+	V4L2_MBUS_FMT_JPEG_1X8 = 0x4001,
-+
-+	/* Vendor specific formats - next is 0x5002 */
-+
-+	/* S5C73M3 sensor specific interleaved UYVY and JPEG */
-+	V4L2_MBUS_FMT_S5C_UYVY_JPEG_1X8 = 0x5001,
-+};
-+
-+/**
-+ * struct v4l2_mbus_framefmt - frame format on the media bus
-+ * @width:	frame width
-+ * @height:	frame height
-+ * @code:	data format code (from enum v4l2_mbus_pixelcode)
-+ * @field:	used interlacing type (from enum v4l2_field)
-+ * @colorspace:	colorspace of the data (from enum v4l2_colorspace)
-+ */
-+struct v4l2_mbus_framefmt {
-+	__u32			width;
-+	__u32			height;
-+	__u32			code;
-+	__u32			field;
-+	__u32			colorspace;
-+	__u32			reserved[7];
-+};
-+
-+#endif
--- 
-1.8.1.2
-
diff --git a/package/media-ctl/Config.in b/package/media-ctl/Config.in
deleted file mode 100644
index 8d1beda..0000000
--- a/package/media-ctl/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_MEDIA_CTL
-	bool "media-ctl"
-	help
-	  Media controller control application
-
-	  Useful mostly with ARM OMAP processors to configure and
-	  control the image subsystem
-
-	  http://git.ideasonboard.org/media-ctl.git
diff --git a/package/media-ctl/media-ctl.mk b/package/media-ctl/media-ctl.mk
deleted file mode 100644
index ae0d470..0000000
--- a/package/media-ctl/media-ctl.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# media-ctl
-#
-################################################################################
-
-MEDIA_CTL_VERSION = 87f58c2ed885d636229f7209fde883058433a1ce
-MEDIA_CTL_SITE = git://git.ideasonboard.org/media-ctl.git
-MEDIA_CTL_INSTALL_STAGING = YES
-MEDIA_CTL_LICENSE = LGPLv2.1+
-MEDIA_CTL_LICENSE_FILES = COPYING.LIB
-
-MEDIA_CTL_AUTORECONF = YES
-MEDIA_CTL_CONF_OPTS = --with-kernel-headers=$(STAGING_DIR)/usr/include
-MEDIA_CTL_DEPENDENCIES = host-pkgconf
-
-$(eval $(autotools-package))
