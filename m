From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Feb 2021 22:25:43 +0100
Subject: [Buildroot] [git commit] package/libusb: apply upstream patch to
 fix descriptor parsing
Message-ID: <20210219210703.048D9807BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6aeee74d36d14346febeebc134bb74215d7d7af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

v1.0.24 of libusb has a bug in the Linux backend where it fails to
enumerate any device with more than one configuration.  Backport the
upstream patch which fixes this as otherwise libusb based applications
are unable to communicate with any devices advertising more than one
configuration.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-Fix-parsing-of-descriptors-for-multi-con.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch b/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch
new file mode 100644
index 0000000000..601b322e54
--- /dev/null
+++ b/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch
@@ -0,0 +1,62 @@
+From 623e2a995d156e115c91f56a3ec691bdc333df8b Mon Sep 17 00:00:00 2001
+From: Chris Dickens <christopher.a.dickens@gmail.com>
+Date: Sun, 13 Dec 2020 15:49:19 -0800
+Subject: [PATCH 1/1] linux_usbfs: Fix parsing of descriptors for
+ multi-configuration devices
+
+Commit e2be556bd2 ("linux_usbfs: Parse config descriptors during device
+initialization") introduced a regression for devices with multiple
+configurations. The logic that verifies the reported length of the
+configuration descriptors failed to count the length of the
+configuration descriptor itself and would truncate the actual length by
+9 bytes, leading to a parsing error for subsequent descriptors.
+
+Closes #825
+
+Signed-off-by: Chris Dickens <christopher.a.dickens@gmail.com>
+(cherry picked from commit f6d2cb561402c3b6d3627c0eb89e009b503d9067)
+Signed-off-by: John Keeping <john@metanate.com>
+---
+ libusb/os/linux_usbfs.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/libusb/os/linux_usbfs.c b/libusb/os/linux_usbfs.c
+index fb2ed53..4d2dc8d 100644
+--- a/libusb/os/linux_usbfs.c
++++ b/libusb/os/linux_usbfs.c
+@@ -641,7 +641,12 @@ static int seek_to_next_config(struct libusb_context *ctx,
+ 	uint8_t *buffer, size_t len)
+ {
+ 	struct usbi_descriptor_header *header;
+-	int offset = 0;
++	int offset;
++
++	/* Start seeking past the config descriptor */
++	offset = LIBUSB_DT_CONFIG_SIZE;
++	buffer += LIBUSB_DT_CONFIG_SIZE;
++	len -= LIBUSB_DT_CONFIG_SIZE;
+ 
+ 	while (len > 0) {
+ 		if (len < 2) {
+@@ -718,7 +723,7 @@ static int parse_config_descriptors(struct libusb_device *dev)
+ 		}
+ 
+ 		if (priv->sysfs_dir) {
+-			 /*
++			/*
+ 			 * In sysfs wTotalLength is ignored, instead the kernel returns a
+ 			 * config descriptor with verified bLength fields, with descriptors
+ 			 * with an invalid bLength removed.
+@@ -727,8 +732,7 @@ static int parse_config_descriptors(struct libusb_device *dev)
+ 			int offset;
+ 
+ 			if (num_configs > 1 && idx < num_configs - 1) {
+-				offset = seek_to_next_config(ctx, buffer + LIBUSB_DT_CONFIG_SIZE,
+-							     remaining - LIBUSB_DT_CONFIG_SIZE);
++				offset = seek_to_next_config(ctx, buffer, remaining);
+ 				if (offset < 0)
+ 					return offset;
+ 				sysfs_config_len = (uint16_t)offset;
+-- 
+2.30.1
+
