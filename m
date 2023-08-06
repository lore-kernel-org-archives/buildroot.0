Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D54C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3597A40330;
	Sun,  6 Aug 2023 14:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3597A40330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1ZbT3Sp5FOi; Sun,  6 Aug 2023 14:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A30940632;
	Sun,  6 Aug 2023 14:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A30940632
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CADA51BF8C7
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0AF460AAC
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0AF460AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQAZnFJPFJJJ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:02:59 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F26346059D
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26346059D
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83FF4A4C1066;
 Sun,  6 Aug 2023 16:02:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLD-0000Bn-0z;
 Sun, 06 Aug 2023 16:02:43 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:30 +0200
Message-Id: <20230806140241.4155773-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330563;
 bh=PH5/0cUD3p9Q+3kvlWA8uzy3Kejj2Aayhqfatu9H2AA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AoYIdHsMm58Hk0rdxRwneh7H3surpaCRny0DqvbnGwVr6v5AdnRLsa787WzNUerBN
 EWLaZLiZ1caUHvm1mcr9yjBmhAXDcCloZeSA5sZoElfecVgC4dqr7LjlpPNTaARDql
 VpPdAHDWGt0Tf34atxnROqh9ujmbY7TvzMrPKT2AwdLFIxol0S35WH68jbeMsVF9nj
 R4FBwT377LT57Al9xYS7/J/muSKhANvMxJ0id8jquatdk93tm7xHvPWk3oF4CQ39zi
 Os71e9ReYwrWHLxjT5cvAivAitP0hbHctpUUSx9Gmu60YVieWmT3axSdAPYBk8B/Kn
 XfdWfiyfS9Z7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=AoYIdHsM
Subject: [Buildroot] [PATCH/next v9 01/12] package/eudev: add option to
 enable the udev daemon
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This is currently forcefully enabled, and does not (yet) change the way
we handle eudev-based /dev management, but will help introduce libudev
in followup commits.

The rules generator does not make sense without the daemon, while the
hardware database (hwdb) is used by the library.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/eudev/Config.in | 24 +++++++++++++++++-------
 system/Config.in        |  1 +
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 6e7bbe4648..a561a96edf 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -4,12 +4,6 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # needs C99 compiler
 	depends on !BR2_STATIC_LIBS # kmod
-	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBS
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
 	help
 	  eudev is a fork of systemd-udev with the goal of obtaining
 	  better compatibility with existing software such as OpenRC and
@@ -20,6 +14,20 @@ config BR2_PACKAGE_EUDEV
 
 if BR2_PACKAGE_EUDEV
 
+config BR2_PACKAGE_EUDEV_DAEMON
+	bool "udev daemon"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	select BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	help
+	  Install the udev daemon.
+
+if BR2_PACKAGE_EUDEV_DAEMON
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
@@ -28,6 +36,8 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 	help
 	  Enable persistent rules generator
 
+endif # BR2_PACKAGE_EUDEV_DAEMON
+
 config BR2_PACKAGE_EUDEV_ENABLE_HWDB
 	bool "enable hwdb installation"
 	default y
@@ -35,7 +45,7 @@ config BR2_PACKAGE_EUDEV_ENABLE_HWDB
 	help
 	  Enables hardware database installation to /etc/udev/hwdb.bin
 
-endif
+endif # BR2_PACKAGE_EUDEV
 
 comment "eudev needs eudev /dev management"
 	depends on BR2_USE_MMU
diff --git a/system/Config.in b/system/Config.in
index 24798dc068..a77631cb6c 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -228,6 +228,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
 	select BR2_PACKAGE_EUDEV
+	select BR2_PACKAGE_EUDEV_DAEMON
 
 comment "eudev needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
