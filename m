Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79929C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1BFA402CA;
	Thu,  9 May 2024 14:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTZH0WgutOp7; Thu,  9 May 2024 14:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8183F40355
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8183F40355;
	Thu,  9 May 2024 14:07:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 117A91BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F07C740355
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4mft2lVX3Av for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBD6C402CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBD6C402CA
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C04E086B63; Thu,  9 May 2024 14:07:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 16:02:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a23bd9effcff987a512e1e437d7c7ae47b62985
X-Git-Newrev: 00773beaafc4b490656fdb0b2b5073b4d929a05b
X-Patchwork-Hint: ignore
Message-Id: <20240509140752.C04E086B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: fix sixaxis build
 without tools
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=00773beaafc4b490656fdb0b2b5073b4d929a05b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 5.75 in
commit b890206876588ed0d16187abf49d35a45177cc3d and
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9f71892b63f6b65dab874a633d88ae2dcad93a16:

/home/autobuild/autobuild/instance-2/output-1/host/lib/gcc/x86_64-buildroot-linux-musl/12.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: plugins/bluetoothd-sixaxis.o: in function `sixaxis_init':
sixaxis.c:(.text.sixaxis_init+0x23): undefined reference to `udev_new'

Fixes: b890206876588ed0d16187abf49d35a45177cc3d
 - http://autobuild.buildroot.org/results/c337d0f473c5fbb3e6cda1317ba06f5e2b16a43e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...figure.ac-fix-sixaxis-build-without-tools.patch | 35 ++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk               |  1 +
 2 files changed, 36 insertions(+)

diff --git a/package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch b/package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch
new file mode 100644
index 0000000000..1e0e34cb8f
--- /dev/null
+++ b/package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch
@@ -0,0 +1,35 @@
+From f4795bf64dbf8778fc765b7dad1b1bfb365b48d7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 8 May 2024 19:54:16 +0200
+Subject: configure.ac: fix sixaxis build without tools
+
+Fix the following build failure with --enable-sixaxis --enable-udev
+--disable-tools raised since version 5.73 and
+9f71892b63f6b65dab874a633d88ae2dcad93a16:
+
+sixaxis.c:(.text.sixaxis_init+0x23): undefined reference to `udev_new'
+
+Fixes: http://autobuild.buildroot.org/results/c337d0f473c5fbb3e6cda1317ba06f5e2b16a43e
+
+Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=f4795bf64dbf8778fc765b7dad1b1bfb365b48d7
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9dea70ddc1..8b3cdb4e8f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -226,7 +226,7 @@ AM_CONDITIONAL(MONITOR, test "${enable_monitor}" != "no")
+ 
+ AC_ARG_ENABLE(udev, AS_HELP_STRING([--disable-udev],
+ 		[disable udev device support]), [enable_udev=${enableval}])
+-if (test "${enable_tools}" != "no" && test "${enable_udev}" != "no"); then
++if (test "${enable_udev}" != "no"); then
+ 	PKG_CHECK_MODULES(UDEV, libudev >= 196)
+ 	AC_DEFINE(HAVE_UDEV, 1, [Define to 1 if udev is required])
+ fi
+-- 
+cgit 1.2.3-korg
+
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 26f0f4afd4..d386ad57f0 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -9,6 +9,7 @@ BLUEZ5_UTILS_VERSION = 5.75
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 # 0001-configure.ac-Fix-disable-cups.patch
+# 0002-configure.ac-fix-sixaxis-build-without-tools.patch
 BLUEZ5_UTILS_AUTORECONF = YES
 BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
