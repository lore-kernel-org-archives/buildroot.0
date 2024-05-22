Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B662BC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 09:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FBB060A9E;
	Wed, 22 May 2024 09:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n03512QTcb28; Wed, 22 May 2024 09:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1742A60ADD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1742A60ADD;
	Wed, 22 May 2024 09:56:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C39631C59C8
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 09:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7A6860AC1
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 09:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5jVi5zxfxhi for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 09:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9CEFA60A9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CEFA60A9E
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CEFA60A9E
 for <buildroot@buildroot.org>; Wed, 22 May 2024 09:55:58 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9i4y-00B1rx-H5; Wed, 22 May 2024 11:16:12 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 6030201d;
 Wed, 22 May 2024 09:16:09 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 12:16:07 +0300
Message-ID: <20240522091608.3659847-5-aperez@igalia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522091608.3659847-1-aperez@igalia.com>
References: <20240522091608.3659847-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kzz6rKXHsbuUSmx1GUq37NMtm49FiVOvYLQEiAPQBJA=; b=ZUA/ps6mPsFH6QTnqrfKBLj2qN
 2b083W74FMf2VfqjI0JcYLHokWyrNhaGLdf3YgaS4EjE+ALA6G3OEeo0AcZcBsb3jHy7ZjwKZ5dhb
 0QOhVdhmk4/j7TMw2dZlxitdRry/VWorLDvDamRSzy/+TptmAhV+nDZ2UZ2tAdQUCY7ANvRgXE/qC
 zsoYeskfdeZ4A+zTLaAHLlfvNNOzvP+iaVNhfoN0qgx7R/+tgxFontCDp+zZUw++UCZ8WBR2h+Zfm
 u7KnI6T3SRsknDXqkDoSW+nqOhovlG9yVilJAw2/j2hUBFTc7biksKwleuZcRbKXml5dbkPdO4Pls
 Z/mPSTbg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=ZUA/ps6m
Subject: [Buildroot] [PATCH 4/4] package/wpewebkit: use libavif if enabled
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make wpewebkit pick a value for the USE_AVIF option depending
on BR2_PACKAGE_LIBAVIF.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index e09867ac63..012d0f7f0b 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -28,8 +28,7 @@ WPEWEBKIT_CONF_OPTS = \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=OFF \
 	-DENABLE_WEB_RTC=OFF \
-	-DUSE_ATK=OFF \
-	-DUSE_AVIF=OFF
+	-DUSE_ATK=OFF
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
 WPEWEBKIT_CONF_OPTS += \
@@ -61,6 +60,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DENABLE_MEDIA_STREAM=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBAVIF),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_AVIF=ON
+WPEWEBKIT_DEPENDENCIES += libavif
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_AVIF=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
 else
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
