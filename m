Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A262D5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1DF40B4C;
	Mon, 15 Dec 2025 22:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHZk_0a9M2jI; Mon, 15 Dec 2025 22:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB6940B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839018;
	bh=W7/ZkMAzbaixAJ8qol0PWLyBupfhbPDNHdQnR/weu8I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jRXjnp3TeCUayh+xlgBPdpHduBZyulGQZSB2HJuOqbNN0bHIKTXT31s1wYr+EYc04
	 ZyvHC+vtM/4XxRiB2bB1OTeDNv9hDLAJUbi58CnX6PyV6k5ZluZ1TucnL+pefgB179
	 INPHPnGWNbGC+hY6IcvA6n9X8zdhnwN2XruoyoC/aBP6KILJRMUcelJxqUiEXI1tiS
	 yUGAUQqyAbKgDsDwcv/zwTVQ/XaCNNtceeEfEcw71hkK62G44HTcE822g9sNoM8RWl
	 9OQGEhz75Pm9sX77g0uMBoB68GimWnNMn9lCaXIZKsyHlm5ebr0ucZ4/HoWIpYOgpV
	 oOk7OVJIwF+3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DB6940B0C;
	Mon, 15 Dec 2025 22:50:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3F67151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B162781951
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eFvbO-6gaNy for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFE7B80E4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFE7B80E4E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFE7B80E4E
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C0162C19D27;
 Mon, 15 Dec 2025 22:49:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 302CC60664;
 Mon, 15 Dec 2025 22:50:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C3951194298A; Mon, 15 Dec 2025 23:50:13 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Fischer <mf@go-sys.de>
Date: Mon, 15 Dec 2025 23:49:42 +0100
Message-ID: <20251215224952.1253359-11-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839013; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+7V5JPqNwN+pbikBgUnWcU8CxzF1SAbltneaV8A194M=;
 b=yBI4US5JCwhGUDvk+ZTJrlmTTbvEQYKtJpf3oiXJRCL/HEuXqVNP8Zbk+A4NiRpf48PL4v
 zHcuxNYKQWYAmQTVNv9jCXJSULy/nTVYt4k+JRk3tSI8Sd/RM/Cf9dfeP8yZwr5dcwfAqc
 rpXsrbU/621J0taHCe/4hK1REkk6RLnDqk0AlycNuOOAgIYtXQ3p6CWuFuj6I8vsNygeXu
 6Id+I+qElU3tHIF1HjFtDqkBK/m3IS6MFVs8s2PnM9bupC6QsaRZiHOdcwjgjOnSFDo6lR
 XRK0MScAuQ9Wy7upo2Wl7Q8h8os9oP00olofntLuAjd2ETNzPHjLTLSZ9wYkgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yBI4US5J
Subject: [Buildroot] [PATCH 10/13] package/sdl2: drop rpi-userland support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the rpi-userland package, drop support for it
from package/sdl2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2/sdl2.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index eb6e753869..31f96d8e9b 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -27,6 +27,7 @@ SDL2_CONF_OPTS += \
 	--disable-video-offscreen \
 	--disable-video-vulkan \
 	--disable-video-directfb \
+	--disable-video-rpi \
 	--disable-ime \
 	--disable-ibus \
 	--disable-fcitx \
@@ -77,13 +78,6 @@ else
 SDL2_CONF_OPTS += --disable-3dnow
 endif
 
-ifeq ($(BR2_PACKAGE_SDL2_OPENGLES)$(BR2_PACKAGE_RPI_USERLAND),yy)
-SDL2_DEPENDENCIES += rpi-userland
-SDL2_CONF_OPTS += --enable-video-rpi
-else
-SDL2_CONF_OPTS += --disable-video-rpi
-endif
-
 # x-includes and x-libraries must be set for cross-compiling
 # By default x_includes and x_libraries contains unsafe paths.
 # (/usr/X11R6/include and /usr/X11R6/lib)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
