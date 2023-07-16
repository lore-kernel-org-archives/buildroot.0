Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AADEEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 13:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7B9040967;
	Sun, 16 Jul 2023 13:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7B9040967
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bU2d5E8xuF_E; Sun, 16 Jul 2023 13:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836AC40979;
	Sun, 16 Jul 2023 13:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 836AC40979
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 481C81BF279
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 13:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2ED4096B
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 13:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2ED4096B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aVoyZYd0YmKV for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 13:34:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB9E540918
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB9E540918
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 13:34:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 973A8A4C0B20;
 Sun, 16 Jul 2023 15:34:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43820)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL1tI-0000KO-11;
 Sun, 16 Jul 2023 15:34:24 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 15:34:24 +0200
Message-Id: <20230716133424.4131847-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230716133424.4131847-1-bernd@kuhls.net>
References: <20230716133424.4131847-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689514464;
 bh=9Z2IvV6WRAjyHrPc4zcyb4TBf+0QLMqudjeShyOrets=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MsWCKUvTEtKtPayh04Y0ypyIczsRuHEEDoa4u6XtxSo9kiHwri3jdFSTkcIbt4yGD
 nwLiNWve7oa3zkZA7ySKlR8wfP8Iw4HyBr5Z8sdiCvrc12gW5wqSX06wQS1DhtIxbQ
 K3hug1ROh+xtoH/bwAnkagZAu/0X2k1hQpq2ChEmd++7UOGjLNAqpfMGOM692YM+sq
 418iVtTD/Ug/6XmT0RBMwdoTjhH9x1X2OhbRzi+z/Q9Z6j/QOjH1p52D+ZAWr6Ac6i
 b6SeQ4vEzwWpwBwTDb2j4P41BGHJVrEGIXBDGRRAYhA97obBuQReDoAcMR7z0YKwHi
 VGB0gxtzgzG5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=MsWCKUvT
Subject: [Buildroot] [PATCH 2/2] package/mpv: x11 supports needs
 xlib_libXpresent
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed since version 0.35.0:
https://github.com/mpv-player/mpv/commit/3d459832a88a9bd2835b339cf6ca98f84aad0115
which was added with buildroot commit
61ba55e9cce6884295e47fdf33554e6877bd0747

Fixes:
http://autobuild.buildroot.net/results/b64/b6473ba6f64b6ed5ddfe76170a47e840802859a5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpv/Config.in | 1 +
 package/mpv/mpv.mk    | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 8efb353c33..5c32f593fe 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_MPV
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXINERAMA if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXPRESENT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index e368b25736..ae3656b96c 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -205,7 +205,13 @@ endif
 # xlib_libXrandr, xlib_libXScrnSaver.
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MPV_CONF_OPTS += --enable-x11
-MPV_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXinerama xlib_libXrandr xlib_libXScrnSaver
+MPV_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXinerama  \
+	xlib_libXpresent \
+	xlib_libXrandr \
+	xlib_libXScrnSaver
 # XVideo
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
 MPV_CONF_OPTS += --enable-xv
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
