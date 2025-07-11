Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316ADC83F1B
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 17:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C192461267;
	Fri, 11 Jul 2025 17:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zAp8s4XMu9m; Fri, 11 Jul 2025 17:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD23660DBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD23660DBE;
	Fri, 11 Jul 2025 17:36:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C977D199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 17:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFC7383DF2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 17:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKCy1WNGy4uw for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 17:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B62283D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B62283D5E
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B62283D5E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 17:36:37 +0000 (UTC)
Received: from charybdis.. (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 0294AE000D9;
 Fri, 11 Jul 2025 19:36:34 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, Florian Larysch <fl@n621.de>
Date: Fri, 11 Jul 2025 19:36:32 +0200
Message-ID: <20250711173633.20222-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1752255395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nQIBC9ocCztIbtdWnl+V57bbmGlmNIjr8fRKZjwcm20=;
 b=sbulQsYBd1TgLjox8Bo7GLFAtE5I9mbO6BRbBUzUFX2ij4UNSeVmbvJV9qS+mAqtoUpIYB
 +VrZGg1u326bEfCRGzj4t/Acki3bdot5HKt4yDPIvbiRtBHKyUZZ53WXy9nDfnR/JV75gB
 CpdGVg624YFJ8twfYtJUYnZCuRAGuwI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=sbulQsYB
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: add support for pulseaudio
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

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 2d65623926..9ba7ac0f61 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -94,6 +94,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libjack
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+FFMPEG_DEPENDENCIES += pulseaudio
+FFMPEG_CONF_OPTS += --enable-libpulse
+else
+FFMPEG_CONF_OPTS += --disable-libpulse
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 FFMPEG_DEPENDENCIES += libv4l
 FFMPEG_CONF_OPTS += --enable-libv4l2
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
