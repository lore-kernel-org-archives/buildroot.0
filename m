Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66151C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:38:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0658A61AD0
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0658A61AD0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B503C60A83;
	Wed, 17 Nov 2021 21:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymNPchoGRtK4; Wed, 17 Nov 2021 21:38:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 004C860A8D;
	Wed, 17 Nov 2021 21:38:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA281BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ED4860A8D
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwBHamWOFd10 for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:38:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BF8260A8A
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:38:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 72FAA8D5A1; Wed, 17 Nov 2021 21:34:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:34:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 12c01079bdb4a82ac91dee3e9826b070faaddb78
X-Git-Newrev: 033ef8497aba5a87e3812ca474af2320fbabe72f
X-Patchwork-Hint: ignore
Message-Id: <20211117213407.72FAA8D5A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi: use libgbm
 virtual package
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

commit: https://git.buildroot.net/buildroot/commit/?id=033ef8497aba5a87e3812ca474af2320fbabe72f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Kodi needs gbm_bo_get_fd:
https://github.com/xbmc/xbmc/blob/Matrix/xbmc/utils/GBMBufferObject.cpp#L54

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi/Config.in | 3 ++-
 package/kodi/kodi.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index af7604428e..e594219418 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -22,7 +22,8 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_MESA3D_GBM
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 934cce6de2..a2c42b64c9 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -92,7 +92,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM),y)
 KODI_CORE_PLATFORM_NAME += gbm
-KODI_DEPENDENCIES += libinput libxkbcommon mesa3d
+KODI_DEPENDENCIES += libgbm libinput libxkbcommon
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
