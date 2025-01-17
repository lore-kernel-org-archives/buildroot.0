Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73369C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0DF6FBB5;
	Fri, 17 Jan 2025 10:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnYZ-1Lgyle3; Fri, 17 Jan 2025 10:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F3396FBA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F3396FBA6;
	Fri, 17 Jan 2025 10:54:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 617261EDA
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AB936FB8C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qDHdct00TPr for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C1DC6FB81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C1DC6FB81
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C1DC6FB81
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:43 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5439e331cceso236733e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111281; x=1737716081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPYl1WEodUNBz4aa5IKyriEqCa/oXAsq2WohDW/woQo=;
 b=JVanguNLR7XlzZkeWj0Momi/h9bLenpewo8OfH2MeyLi9/TZgJlqJx0MJicCJGgWV/
 4zREBQytVv1HZOTSDn7yTfHEoUARTsIDGT6ww0QJLoHpE/o+Zd4jAHWtNZsaAPNEJErG
 XW8X/n5NilHnbygdL5ATngBVEa4qzDYPMYEMtWk666p4n/VfQrTt24VGypM7Mrz7VOzB
 nBWDRsC7scB3h1psrK7DKlqa+iaAs164g0MlcleCIvLCPdgPB3JtK1pzeBIOwtRW0TuW
 9MXhNA4FgSSAFKk9F0XEQlmFxUeGACB8Eg+360vhsZc/mCCvWfufkEraUwWplXwDcJkY
 VlUg==
X-Gm-Message-State: AOJu0YymjW7xGD+baTTOPJHuA/YT9ZRFVB3NX3MgfP5C2KWWSr8Q7fAQ
 l7OvR35XxQPyq0L55/Mu69J3DeTQTyH5enQraj6YHoX4KrylKhPt8zzk+Q==
X-Gm-Gg: ASbGncvQ2szwcq2so254mNUC0gV+dV+PxHu3AYjaXIUec2j95/Aw+9m3ZauK9UbxPib
 NatFslu1NrfFf9NDB46Titn5uALuEGJh17HmuQnYxzu1mEznQfEcvxj1wtMLkLBuaGstoMO+Wdv
 DFBIzAVNAgN84Nwj0H1+s3PklctYXM7NmReg6HqiQVdAf5X4xorqEWP+paPX0A8ZM8PsE08P3l+
 Jne2ZcYMfn1vJwwKReN3CPt6gNDrJr3lENkzgExmGu1Ar7AWZFYxX4rDkB1IR1Fj7esPZgMPeQf
 rBWKPLOMA8E=
X-Google-Smtp-Source: AGHT+IGyJ1IG4Wrk8IKlLUICBBsYSA79CLtCc3SOd1FMgzM83SexFcFXtdkkL4FuJbG0JSWl6mqQEA==
X-Received: by 2002:a05:6512:1247:b0:542:98e0:7c67 with SMTP id
 2adb3069b0e04-5439c27d401mr733373e87.51.1737111281071; 
 Fri, 17 Jan 2025 02:54:41 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:39 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:38 +0100
Message-ID: <20250117105354.618220-15-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111281; x=1737716081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPYl1WEodUNBz4aa5IKyriEqCa/oXAsq2WohDW/woQo=;
 b=Q8Yi3SE91j++se8kifTX8cXoRZP3iFHzpJKEeGR0oAXdJrIwdi/Nz58v1DuLTZkAYT
 uX32qtHS7HE9zmTX1faIItDAv6UfxYdRmr21R+qaIzgeyDfkxxkYyshJr+lZHYUdy4Zt
 IzyzzErumKFKCFJR5Ctt2d72NOFlK8zH9of0wCFu7aQzkYxd69Lm6onVKW1PD/ruYWhb
 1a1v9e9GurUVoxVqV9DDaLDquhLz49gcea9NC3/0IL1eLKGznqFNRvnUO/M1VEX6Tf/B
 9bBYp5L6BZE7EXWqtNRbRQ8TMClo3HU0y11WxD4URVfWNZZHBBrM8UcoKYqVGCqHBQpl
 eswg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q8Yi3SE9
Subject: [Buildroot] [PATCH 15/19] package/qt6/qt6multimedia: sort 'depends
 on' and 'select' lines
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index b3b3c80231..934fd061c1 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -32,11 +32,11 @@ config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 	bool "ffmpeg plugin"
 	# qt6-multimedia ffmpeg plugin needs
 	# qt6base-concurrent, PulseAudio and ffmpeg-swcale.
-	select BR2_PACKAGE_QT6BASE_CONCURRENT
-	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_PULSEAUDIO
+	select BR2_PACKAGE_QT6BASE_CONCURRENT
+	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	help
 	  This option enables ffmpeg media backend
 
@@ -59,9 +59,9 @@ config BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
 	bool "gstreamer plugin"
 	# gstreamer 1.x and gst-plugins-base-app are required
 	# for gstreamer support in qt6-multimedia
-	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_GSTREAMER1
 	help
 	  This option enables gstreamer media backend
 
@@ -90,10 +90,10 @@ comment "Linux DMA buffer support needs DMA buffer feature of libgbm"
 
 config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
 	bool "linux dma buffer support"
-	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	# qt6 configure script needs EGL to check
 	# for linux dma buffer support
 	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	help
 	  This option enables the linux dma buffer support
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
