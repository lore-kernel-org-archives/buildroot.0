Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A74C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 13:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CD8540E82;
	Tue, 15 Jul 2025 13:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Txrsc_-mIEya; Tue, 15 Jul 2025 13:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 927B840F08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927B840F08;
	Tue, 15 Jul 2025 13:27:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A63FBDF
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0E13408E7
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Un1BM9_BJmE4 for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 13:27:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDC7D408F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC7D408F1
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDC7D408F1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:27:50 +0000 (UTC)
Received: from charybdis.. (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 04E6FE001A3;
 Tue, 15 Jul 2025 15:27:48 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Florian Larysch <fl@n621.de>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Tue, 15 Jul 2025 15:27:15 +0200
Message-ID: <20250715132715.21766-3-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1752586068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SL2PQE8yxRHhKd3Env7E1XnRan74jyorTCbbYsZcoZs=;
 b=siBWbyLnZFE/Atf+Evr/2oDW8dIVyjWQ6qTbtOOCAQkNugHANx6HA57MZukamx1Cw/XSch
 XOqkNNerqScObE5/NoV++GitbkSi61EGRyku1YIVets6rTagkdQeJ7aIs9nkugVYt1OQ7t
 nhRfwwGHkF1l9DxY8Iw6y8qt31yLPls=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=siBWbyLn
Subject: [Buildroot] [PATCH 1/1] Revert "package/ffmpeg: add support for
 pulseaudio"
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

This reverts commit e44aff6b1b1a5237b3f5cae019982370671dbd42 which added
support for linking ffmpeg against libpulse if it is present to provide
libavdevice support for the PulseAudio protocol. However, it turns out
that this creates a dependency cycle when BR2_PACKAGE_LIBSOXR is
enabled, since the pulseaudio daemon can use libsoxr for resampling and
libsoxr can use the FFT implementation from ffmpeg.

Resolving this would probably mean breaking up the pulseaudio package
into the client libraries and the daemon proper (a standalone libpulse
without the daemon is still useful since it can talk to a remote daemon
via the network or more likely today talk to a local instance of
PipeWire, which also implements the PulseAudio protocol).

For now, break the dependency cycle by reverting to the original state
(no pulseaudio client support in ffmpeg).

Reported-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/ffmpeg/ffmpeg.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9ba7ac0f61..2d65623926 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -94,13 +94,6 @@ else
 FFMPEG_CONF_OPTS += --disable-libjack
 endif
 
-ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-FFMPEG_DEPENDENCIES += pulseaudio
-FFMPEG_CONF_OPTS += --enable-libpulse
-else
-FFMPEG_CONF_OPTS += --disable-libpulse
-endif
-
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 FFMPEG_DEPENDENCIES += libv4l
 FFMPEG_CONF_OPTS += --enable-libv4l2
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
