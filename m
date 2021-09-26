Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29733C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 13:21:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50BCC60ED4
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 13:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50BCC60ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 122AB81CA3;
	Sun, 26 Sep 2021 13:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRVToOISQkDI; Sun, 26 Sep 2021 13:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AE9681C71;
	Sun, 26 Sep 2021 13:21:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74D911BF30A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 13:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63E03606BD
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 13:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLgiISuVl1uu for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 13:21:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2744C605D8
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:21:31 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout05.t-online.de (Postfix) with SMTP id 54A2C18583
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 15:21:24 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.205.79]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mUU5n-27AbR30; Sun, 26 Sep 2021 15:21:20 +0200
Received: from [192.168.1.109] (port=47024 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>)
 id 1mUU5n-0006Zy-EK; Sun, 26 Sep 2021 15:21:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 15:21:19 +0200
Message-Id: <20210926132119.2664730-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632662480-0000144F-83BA8033/0/0 CLEAN NORMAL
X-TOI-MSGID: ca38d292-3bca-4151-b372-f047f4cda918
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-octonet: fix json
 dependency
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While creating the initial package file a wrong dependency was chosen.

This package really depends on jsoncpp, not json-for-modern-cpp:
https://github.com/DigitalDevices/pvr.octonet/commit/f724c5934c63c64a0085c3dbe4cd3c3fc58f1318

This bug was found while testing per-package directories.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-octonet/Config.in           | 8 ++++----
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi-pvr-octonet/Config.in b/package/kodi-pvr-octonet/Config.in
index e831194ba5..7b46cccb2a 100644
--- a/package/kodi-pvr-octonet/Config.in
+++ b/package/kodi-pvr-octonet/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_KODI_PVR_OCTONET
 	bool "kodi-pvr-octonet"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
-	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	select BR2_PACKAGE_JSONCPP
 	help
 	  DigitalDevices Octonet PVR client addon for Kodi
 
 	  https://github.com/DigitalDevices/pvr.octonet
 
-comment "kodi-pvr-octonet needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "kodi-pvr-octonet needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
index 170f56f7f5..e2699bc44d 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
@@ -8,6 +8,6 @@ KODI_PVR_OCTONET_VERSION = 19.0.0-Matrix
 KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
 KODI_PVR_OCTONET_LICENSE = GPL-2.0+
 KODI_PVR_OCTONET_LICENSE_FILES = LICENSE.md
-KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi
+KODI_PVR_OCTONET_DEPENDENCIES = jsoncpp kodi
 
 $(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
