Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9736DCD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 21:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 851AC41B4B;
	Mon, 15 Jun 2026 21:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2mnIkQkcwgn; Mon, 15 Jun 2026 21:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA91E41B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781558193;
	bh=QchbAD0kF7+IeXZ1KqWJrFmTNTe3shCtRpiq3mqWtI8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HjkUP1Xaj3BQZ/vrUQHQyrxDcOv0TvGdiFANybMPxj80pSgTVcDz58pC1yk96xEpU
	 DDHTtWAXiKAGuY09fGzs+HgrYHNFVraT5ttpihEKo4D6lqGBlJpcP5ep04y9JgjJDA
	 B/g8C5egZHkJhd7YcJczU6+vKXJHFF3RTTfTFHxaASd4sfSbyx/LGe6Vdlh7hK3wmB
	 XQawgRSnIIlOeR/U8meeeXbLWwQ9WW5vkb+MCaw7Ec0HfwlBSXSPKRWo27LEs4e35p
	 eKTk7wXAgO8o7Kwv7eIKUH0FnZtPTf6A+tP5By5tdNm6xMku02bIsFj7nloUkhKp27
	 YhMlpqZ832tiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA91E41B3E;
	Mon, 15 Jun 2026 21:16:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E5D42F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C3F98460F
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7YAGVnBBKWl for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 21:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 166368460D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 166368460D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 166368460D
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:16:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b12b.dip0.t-ipconnect.de [84.161.177.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92FC3A4C336A;
 Mon, 15 Jun 2026 23:16:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55018)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZEfC-000000001YO-2jcm;
 Mon, 15 Jun 2026 21:16:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Jun 2026 23:16:08 +0200
Message-ID: <20260615211608.372629-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615211608.372629-1-bernd@kuhls.net>
References: <20260615211608.372629-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781558175;
 bh=AE08CrJpkLUozYMvudh1txyxOPddtBIfUdue6g/plAQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lM5PhQgZHq4FB82ysxtPGMpypvBXSK87MyJJD2BYsnv+/I+bd4vXcsIBoxd61VrvH
 +4TMw3fsJf3Amz0tmKc9CSOdZIlBBCD1uAEbrrHjSPnyqXeOkVSG6DpYJR2ueX2rOr
 obkPuIvaUlDFlTywABq+SN9NypcIX7sTUp/SzYMAzpueiOVpMbg+gtC/vJ2878NR0a
 aY1vM5rALWYM0YaXgjLHpvSJgTaWVOYqJo6CVejOHqI4sO3zF3eUf79S+b4t36g+qg
 PR+ycGCVip0p5/xPIIPlp0MzLwkWyAz0JD3ruIu3pgMj+tcMvXqJCBGovtLoaThmew
 zymCvxonxhCzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lM5PhQgZ
Subject: [Buildroot] [PATCH 2/2] package/usbutils: only needs libudev,
 not udev daemon
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

libudev-zero version 1.0.4 added support for usb.ids with commit
https://github.com/illiliti/libudev-zero/commit/2bebebc9e0444ec53afd7f1f37aa80ff6b95f5f7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/787f089f803e70db0e0a91dd6cb4ed5f319cb280

 package/libudev-zero/Config.in | 2 ++
 package/usbutils/Config.in     | 6 +++---
 package/usbutils/usbutils.mk   | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libudev-zero/Config.in b/package/libudev-zero/Config.in
index 41f1d762f1..92b56cfa10 100644
--- a/package/libudev-zero/Config.in
+++ b/package/libudev-zero/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBUDEV_ZERO
 	bool "libudev-zero"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_HAS_LIBUDEV
+	select BR2_PACKAGE_HWDATA if BR2_PACKAGE_USBUTILS # runtime
+	select BR2_PACKAGE_HWDATA_USB_IDS if BR2_PACKAGE_USBUTILS
 	help
 	  Daemonless replacement for libudev
 
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 7e7029bbfe..ffc4104e7c 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	depends on BR2_PACKAGE_HAS_UDEV # needs hwdb
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBUSB
 	help
@@ -10,7 +10,7 @@ config BR2_PACKAGE_USBUTILS
 
 	  http://linux-usb.sourceforge.net/
 
-comment "usbutils needs udev /dev management and toolchain w/ threads, gcc >= 4.9"
+comment "usbutils needs libudev and a toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV || \
+		!BR2_PACKAGE_HAS_LIBUDEV || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 5b6037afa2..afeb7ded2a 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -7,7 +7,7 @@
 USBUTILS_VERSION = 019
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
-USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
+USBUTILS_DEPENDENCIES = host-pkgconf libudev libusb
 USBUTILS_LICENSE = GPL-2.0+ (utils) GPL-2.0 or GPL-3.0 (lsusb.py)
 USBUTILS_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
