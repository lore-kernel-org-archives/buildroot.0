Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFCFCD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D89A060EF1;
	Wed,  6 May 2026 18:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZIG7PzVP1gB; Wed,  6 May 2026 18:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AE8860ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778093009;
	bh=/bLSytwh0K79A63ON6MFa4TLMjGs+99gGo1O8Uqlr4s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C03HBeb3vLfUwTRPr5GKTSoCWq4pF3DMJWHqyGr71l5HOS4OSo7qbn2Fth8KFa7Da
	 +ZElV+RxU7H+1Ol18O4yPXVCXtpHU59Skd1LiWh4dgooucnpnSuFpE2hN+c318AUZZ
	 hHaGViIsejEz0xwd/XEimIi73nCKCKPwzhcwl/aoLj0CbNdg2Gprs8Ecy+q9IVKcO9
	 td0EsNFQBlRaUcLtLm9fmO21keDnkvhm3QF3kJxV9EYY4ra3++1sHreNySFSFQ4P0X
	 peXg4eNSQt2a8geJAZ9SsXlRrvU5EBN4npQ3T//0zef/qr8ubiXf+FErWdIKljL6OQ
	 QC7e6k4FBBIyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AE8860ED2;
	Wed,  6 May 2026 18:43:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A593317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C41760ED2
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cpu0i8OrwDHl for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1578360EC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1578360EC9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1578360EC9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:43:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CFA16A4C20F4;
 Wed,  6 May 2026 20:41:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-2EG6;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  6 May 2026 20:40:55 +0200
Message-ID: <20260506184057.665854-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092862;
 bh=aggFrNIFEuvaUnxplaFgXsN1sAHDA8PDN28ybBZFQDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=f/gjSp9KoI1aALw6ohgWx0PCMSZ05ckBS0qNMOEoYaL9jyNpGPj+EO9ViGfdtNbZ9
 urFLU3was5AgWgYyk+Q6KJ/A0wAWERDvaHMhd8OJr/TopJpkNlIjFdI1VwLyK72aRh
 /lIdTriDD97lWUzZuy3gqQ+dI5dCrMVhKR5hncSJswGyXnnlvAreQjb7dWlpVC21hm
 coNB//b2cHMoPV+87mfBYr8Me9DbUGBvFrHE6iSyZjsi5P2ZfrW3C6m3cnuSDV28XL
 3AHF0jhUA9OXfEsSDM+MAdg5TL4UXx6R9LwGez7apnCQuWz1WkYmX06Gz5y8aiRP+W
 HSxbPU1SpT59w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=f/gjSp9K
Subject: [Buildroot] [PATCH 11/12] package/kodi: only needs libudev,
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/Config.in | 6 +++---
 package/kodi/kodi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a05a180eb3..e91b8cfb96 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -25,10 +25,10 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_LIBGBM
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
-	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	depends on BR2_PACKAGE_HAS_LIBUDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
-comment "kodi needs udev support for gbm"
+comment "kodi needs libudev support for gbm"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
@@ -254,7 +254,7 @@ config BR2_PACKAGE_KODI_LIBUSB
 	bool "usb"
 	# https://github.com/xbmc/xbmc/blob/Jarvis/configure.ac#L1554
 	# "if libudev is available, we don't need libusb"
-	depends on !BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0c177a94dd..85c15926ae 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -233,9 +233,9 @@ else
 KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 KODI_CONF_OPTS += -DENABLE_UDEV=ON
-KODI_DEPENDENCIES += udev
+KODI_DEPENDENCIES += libudev
 else
 KODI_CONF_OPTS += -DENABLE_UDEV=OFF
 ifeq ($(BR2_PACKAGE_KODI_LIBUSB),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
