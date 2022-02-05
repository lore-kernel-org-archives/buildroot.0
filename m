Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD74C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 11:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F1560B68;
	Sat,  5 Feb 2022 11:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWJZc8HquwRk; Sat,  5 Feb 2022 11:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF0D60B36;
	Sat,  5 Feb 2022 11:42:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCFBF1BF4E4
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 11:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB9DE60B36
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 11:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JytKTtaM4QF1 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 11:42:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE34A60AD5
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 11:42:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DA2518269F; Sat,  5 Feb 2022 11:35:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 12:42:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b784733f9cfd661f013dde1b0aa5347e825a4187
X-Git-Newrev: aad609936fc83acfe1eac6ffc86d29ac35dcf54e
X-Patchwork-Hint: ignore
Message-Id: <20220205113500.DA2518269F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusb: bump to version 1.0.25
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aad609936fc83acfe1eac6ffc86d29ac35dcf54e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/libusb/libusb/blob/v1.0.25/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-parsing-of-descriptors-for-multi-con.patch | 62 ----------------------
 package/libusb/libusb.hash                         |  2 +-
 package/libusb/libusb.mk                           |  2 +-
 3 files changed, 2 insertions(+), 64 deletions(-)

diff --git a/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch b/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch
deleted file mode 100644
index 55e6a1494e..0000000000
--- a/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 623e2a995d156e115c91f56a3ec691bdc333df8b Mon Sep 17 00:00:00 2001
-From: Chris Dickens <christopher.a.dickens@gmail.com>
-Date: Sun, 13 Dec 2020 15:49:19 -0800
-Subject: [PATCH] linux_usbfs: Fix parsing of descriptors for
- multi-configuration devices
-
-Commit e2be556bd2 ("linux_usbfs: Parse config descriptors during device
-initialization") introduced a regression for devices with multiple
-configurations. The logic that verifies the reported length of the
-configuration descriptors failed to count the length of the
-configuration descriptor itself and would truncate the actual length by
-9 bytes, leading to a parsing error for subsequent descriptors.
-
-Closes #825
-
-Signed-off-by: Chris Dickens <christopher.a.dickens@gmail.com>
-(cherry picked from commit f6d2cb561402c3b6d3627c0eb89e009b503d9067)
-Signed-off-by: John Keeping <john@metanate.com>
----
- libusb/os/linux_usbfs.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/libusb/os/linux_usbfs.c b/libusb/os/linux_usbfs.c
-index fb2ed53..4d2dc8d 100644
---- a/libusb/os/linux_usbfs.c
-+++ b/libusb/os/linux_usbfs.c
-@@ -641,7 +641,12 @@ static int seek_to_next_config(struct libusb_context *ctx,
- 	uint8_t *buffer, size_t len)
- {
- 	struct usbi_descriptor_header *header;
--	int offset = 0;
-+	int offset;
-+
-+	/* Start seeking past the config descriptor */
-+	offset = LIBUSB_DT_CONFIG_SIZE;
-+	buffer += LIBUSB_DT_CONFIG_SIZE;
-+	len -= LIBUSB_DT_CONFIG_SIZE;
- 
- 	while (len > 0) {
- 		if (len < 2) {
-@@ -718,7 +723,7 @@ static int parse_config_descriptors(struct libusb_device *dev)
- 		}
- 
- 		if (priv->sysfs_dir) {
--			 /*
-+			/*
- 			 * In sysfs wTotalLength is ignored, instead the kernel returns a
- 			 * config descriptor with verified bLength fields, with descriptors
- 			 * with an invalid bLength removed.
-@@ -727,8 +732,7 @@ static int parse_config_descriptors(struct libusb_device *dev)
- 			int offset;
- 
- 			if (num_configs > 1 && idx < num_configs - 1) {
--				offset = seek_to_next_config(ctx, buffer + LIBUSB_DT_CONFIG_SIZE,
--							     remaining - LIBUSB_DT_CONFIG_SIZE);
-+				offset = seek_to_next_config(ctx, buffer, remaining);
- 				if (offset < 0)
- 					return offset;
- 				sysfs_config_len = (uint16_t)offset;
--- 
-2.30.1
-
diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 6169a186a5..a18935fe03 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7efd2685f7b327326dcfb85cee426d9b871fd70e22caa15bb68d595ce2a2b12a  libusb-1.0.24.tar.bz2
+sha256  8a28ef197a797ebac2702f095e81975e2b02b2eeff2774fa909c78a74ef50849  libusb-1.0.25.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 28efcadefc..1e82cb9a85 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).24
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).25
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
