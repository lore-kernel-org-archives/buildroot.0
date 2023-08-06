Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931DEC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 353604097A;
	Sun,  6 Aug 2023 14:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 353604097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJZ6Q51q__4c; Sun,  6 Aug 2023 14:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38F0E4021B;
	Sun,  6 Aug 2023 14:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38F0E4021B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 486C11BF3C0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8352340108
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8352340108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOSu-CIIby3c for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:03:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A51924011A
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A51924011A
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DBC12A4C10D4;
 Sun,  6 Aug 2023 16:02:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLD-0000Bn-21;
 Sun, 06 Aug 2023 16:02:43 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:33 +0200
Message-Id: <20230806140241.4155773-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330563;
 bh=ELJ5AJC4Hp2v/poBWnUBk9IWSUdpSIilC/fSPxwonH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wGOrsg8dHPfvMNbS5OMa6LoBXsrthxwyJWok9BL89XSTwwTea/TxhQLXvVS0tJ7Wm
 MMmB4z88FkeHrFGalOiWK4yp6XXiHVGcRe+RnfZr1IdHwv7cMOwotORA42w7NQ3TAP
 sT+Q7KtBKVuSAf75oFiJFNeVLcoqFhvahf3CWGCafW+erexv934cd1NnGJ+izcWIZy
 pFINA4KKcY62MXwgEcnF2RsyqHiKsk2a1EXPSs8rnm40qTISK8tX/EG0eJn5ZA65F+
 Y6JeHQvutHxcwmkPp4r3jQcl8AUKLjqUNyVswaza2UjuzZhf/p5I/JgtC7V5gTtRHu
 5gSyZCeY+a6Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=wGOrsg8d
Subject: [Buildroot] [PATCH/next v9 04/12] package/eudev: provides libudev
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

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/eudev/Config.in | 4 ++++
 package/eudev/eudev.mk  | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index e31f8ae8c8..b7fa6b8bc5 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_WCHAR # needs C99 compiler
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on !BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_HAS_LIBUDEV
 	help
 	  eudev is a fork of systemd-udev with the goal of obtaining
 	  better compatibility with existing software such as OpenRC and
@@ -14,6 +15,9 @@ config BR2_PACKAGE_EUDEV
 
 if BR2_PACKAGE_EUDEV
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "eudev"
+
 config BR2_PACKAGE_EUDEV_DAEMON
 	bool "udev daemon"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 120307b6e6..6de82acbdb 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -11,6 +11,7 @@ EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
 
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf
+EUDEV_PROVIDES = libudev
 
 EUDEV_CONF_OPTS = \
 	--disable-manpages \
@@ -31,7 +32,7 @@ ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
 
 # eudev requires only the util-linux libraries at build time
 EUDEV_DEPENDENCIES += util-linux-libs kmod
-EUDEV_PROVIDES = udev
+EUDEV_PROVIDES += udev
 
 EUDEV_CONF_OPTS += \
 	--enable-programs \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
