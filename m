Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33B3F5A8C5
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 21:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D93F40762;
	Mon, 20 Apr 2026 21:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjFFzKxCZ1Tr; Mon, 20 Apr 2026 21:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3969440511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776721502;
	bh=09KdFODjNsc1lMyU9L8INDM2NOmqB4nazCPkJASNqc0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d3ICtpxvMA9imPvrEOsJlpZi/uqGQghG4nDIdyzmQ38EkIQXzQ64c+hsgGbjNys57
	 mAhr+bGBGBzhXR6evEagN90fluS1lCLESvERBzcHt3+MxT8fIEvU99sOHlO5K0ocTt
	 RNzVjJc9K2HdGbFdJgReNOp3BY7Z7xDJZNX09qBwZr0W953eVfwUtVGz0jIUa+iKCd
	 FhRGOT9vHG8aQwSA7+RTo55DkZ6pjOfQHuo8xyiqiZrTTFC55tYKWj/MjJXYX7TaHe
	 e8eCaTn1zmXAXzgy5DSXywiSaPrPzxTjHwor2hPZJYlfQggkOLz5dGChaajJaC2CHP
	 Tvy8UHNh9WZ7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3969440511;
	Mon, 20 Apr 2026 21:45:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 565C4259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 21:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C90880F91
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETlWjpRUocNG for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 21:44:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0BA17807F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BA17807F4
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BA17807F4
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 21:44:56 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wEwQG-001QHW-W1; Mon, 20 Apr 2026 23:44:53 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id ba065d01;
 Mon, 20 Apr 2026 21:44:51 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 21 Apr 2026 00:44:50 +0300
Message-ID: <20260420214451.2704785-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0NAr7rkoWs95nMpdf7DwVbCmlHGn49/o5m7N7Dhexlk=; b=mm3s27UySlOK5Ng+e4+EWB6iiW
 PuvjF0bLoubFNRbNycLW5pfYm1nhOpxIdIESmc1IGzefDNs7xav2er5UVgNFFMKEdyPz9iEfMDu8W
 9So2FnEyg2CKl5jiQNsLiE7RC1h5qQ1dC937QbvkbtHLV7P9pi4IO7ymnJAYhIlYYQ8/PifJ9WZsA
 Z21LS4HWDDza8zrmEdwbTRT5iv0lWnHvICDevZoATVIB+66qzetsf8b+uu59LWfY/yE/1+nF56gs7
 u/vgNRcGws4/9ShCe9KqX6Hkz7LArJuPeN2FZHpC1ObMQz1434Cv+tgKycq4iUGvdL8XU/kXuugpN
 hhkTTm2A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=mm3s27Uy
Subject: [Buildroot] [PATCH] package/webkitgtk: security bump to 2.52.3
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

This bumps WebKitGTK to the 2.52 stable series. A welcome change
is the addition of the USE_GSTREAMER CMake option that can be used
as a blanket option to toggle all multimedia support, which matches
exactly the intention behind BR2_PACKAGE_WEBKITGTK_MULTIMEDIA.

Includes fixes (among others) for CVE-2026-20643, CVE-2026-20664,
CVE-2026-20665, CVE-2026-20691, CVE-2026-28857, CVE-2026-28859,
CVE-2026-28861, CVE-2026-28871, CVE-2025-43457, CVE-2025-46299,
CVE-2026-20608, CVE-2026-20635, CVE-2026-20636, CVE-2026-20644,
CVE-2026-20652, and CVE-2026-20676.

Highlights of the 2.52 series:
- https://webkitgtk.org/2026/03/18/webkitgtk-2.52-highlights.html

Release notes:
- https://webkitgtk.org/2026/04/16/webkitgtk2.52.3-released.html
- https://webkitgtk.org/2026/04/13/webkitgtk2.52.2-released.html
- https://webkitgtk.org/2026/03/27/webkitgtk2.52.1-released.html
- https://webkitgtk.org/2026/03/18/webkitgtk2.52.0-released.html
- https://webkitgtk.org/2026/03/12/webkitgtk2.50.6-released.html

Security advisories:
- https://webkitgtk.org/security/WSA-2026-0002.html
- https://webkitgtk.org/security/WSA-2026-0001.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash |  6 +++---
 package/webkitgtk/webkitgtk.mk   | 12 +++---------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 77bdc5485b..03b8d0a9be 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.50.5.tar.xz.sums
-sha1  e93f7efa9fbc7304cc159c35d8e76d7febab2515  webkitgtk-2.50.5.tar.xz
-sha256  8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f  webkitgtk-2.50.5.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.52.3.tar.xz.sums
+sha1  17f9b127618040a5f3fcbb70e37ea16ab6d69b0b  webkitgtk-2.52.3.tar.xz
+sha256  5b3e0d174e63dcc28848b1194e0e7448d5948c3c2427ecd931c2c5be5261aebb  webkitgtk-2.52.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 26c70ae6c8..54e769d589 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.50.5
+WEBKITGTK_VERSION = 2.52.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -56,16 +56,10 @@ WEBKITGTK_CONF_OPTS += -DENABLE_BUBBLEWRAP_SANDBOX=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_VIDEO=ON \
-	-DENABLE_WEB_AUDIO=ON \
-	-DENABLE_WEB_CODECS=ON
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER=ON
 WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-bad gst1-plugins-base
 else
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_VIDEO=OFF \
-	-DENABLE_WEB_AUDIO=OFF \
-	-DENABLE_WEB_CODECS=OFF
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_WEBDRIVER),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
