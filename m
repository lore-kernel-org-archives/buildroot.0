Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1846C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8076441579;
	Sun,  6 Aug 2023 14:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8076441579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qLU0B4NQ3Ed; Sun,  6 Aug 2023 14:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F6D409B6;
	Sun,  6 Aug 2023 14:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F6D409B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FC831BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC487813BD
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC487813BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7SfVqJpVrgZ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:05:00 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B91BE813B2
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B91BE813B2
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C721A4C10F6;
 Sun,  6 Aug 2023 16:02:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLE-0000Bn-11;
 Sun, 06 Aug 2023 16:02:44 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:41 +0200
Message-Id: <20230806140241.4155773-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330564;
 bh=DJC0Ldf86wXKgGZYiNuXiKBzovHrvpEX4e8brW8QGII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j/it8QuZl2ytD9oqRJ8tc2q/pvyq5INKf1LahF7GeMFfaPNqPSInXsHkZCmAKT6ew
 IFSSGqcFXyy93+XZR3smPM21JHfWkiIm0Ggmyaaoz5uVQS8qZBi84qmXibqfpLKPd9
 s6N3nHGd4IeWBaSOb/TV0cn7q9Vm/qEJ5N/sPqAp9ITYgJTRyGHSG+oZUgRezOtDzS
 BpbAlLebqooZDqRib3OMnTup24OjJMSdbN+tpXLk1AHYyz02+m+RIJIy9tYz6zZEaJ
 J1qPr4HqYzLVpXBq+NoVfNZd6KzE2aDXf6E+MpkyEhOgC9E9J8U4wfwmfDtxOnYu+9
 pMWThirmTIc5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=j/it8QuZ
Subject: [Buildroot] [PATCH/next v9 12/12] package/usbutils: only needs
 libudev, not udev daemon
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/usbutils/Config.in   | 12 +++++++++---
 package/usbutils/usbutils.mk |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index a38eb2f2e5..64e0905cb6 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -2,14 +2,20 @@ config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	depends on BR2_PACKAGE_HAS_UDEV # needs hwdb
+	depends on BR2_USE_MMU # libudev <- eudev/systemd
+	depends on BR2_USE_WCHAR # libudev <- eudev/systemd
+	depends on !BR2_STATIC_LIBS # libudev <- eudev/systemd
+	select BR2_PACKAGE_EUDEV_ENABLE_HWDB if BR2_PACKAGE_EUDEV
+	select BR2_PACKAGE_SYSTEMD_HWDB if BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_LIBUDEV
 	select BR2_PACKAGE_LIBUSB
 	help
 	  USB enumeration utilities
 
 	  http://linux-usb.sourceforge.net/
 
-comment "usbutils needs udev /dev management and toolchain w/ threads, gcc >= 4.9"
+comment "usbutils needs a toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV || \
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 84a6a625cf..d9e28a1b5d 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -7,7 +7,7 @@
 USBUTILS_VERSION = 015
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
-USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
+USBUTILS_DEPENDENCIES = host-pkgconf libudev libusb
 USBUTILS_LICENSE = GPL-2.0+ (utils) GPL-2.0 or GPL-3.0 (lsusb.py)
 USBUTILS_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
