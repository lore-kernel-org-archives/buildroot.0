Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A521C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5531C61AEA;
	Fri, 17 Jan 2025 10:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPwUMczve0jZ; Fri, 17 Jan 2025 10:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58E1F6FB5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E1F6FB5C;
	Fri, 17 Jan 2025 10:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF0ECB89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C62CB41E18
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAIOyNqJatbF for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CBE0423C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CBE0423C8
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CBE0423C8
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so1761117e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111014; x=1737715814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPYl1WEodUNBz4aa5IKyriEqCa/oXAsq2WohDW/woQo=;
 b=X7nqV2GzweUdW5nkhKpg3tryGOg56YX9mWV45jR22HvbJKUut1TA2gsW0c2mWgetPK
 mofjw7QBhaHIItRZaJM6T2ivTufQgCN4rQ6jh/lBK7GM6m7Z/JZcx8PxdUIIyanM+5qs
 IKAdpB5cI4kQJEaVRX3XtUqtiGvmWV5jdbpK5OahRw3HoiSZ3vXJaeVmWRXvN1x2JI4j
 1WZw94o6+qJpasWKZZlPEKDDurwYbsDtiXgUymYg88F+FclZKXd3OWqO7n9gPcdkn1rL
 0dTlPoZLT0Yl5AfECtGgwOnrIcpr+4V55dvFvqHzUDO5aVgIz/10lBvetQS4Y79o989U
 U+Bw==
X-Gm-Message-State: AOJu0YzUDOw9vc6fKnONbeFYjXyZsOA6K5upkApUzb4IPKpQsyjyQ9Ve
 rlMl14fcF2+gBGBzJZqIH3hkmns3xYQjnP58xeKwlfHbn7Z62M0NAjuHQw==
X-Gm-Gg: ASbGncsHNfecMweJrKc2iStgFoXTV3PB1xDtFg2SEESVQ0P33oeGd9pABDwVz9DNVZg
 7OS2gxqrQIyoGUt8DhyzgYYAv7tWzSxJvvPao65IXAYQxdiYX9AqW93CjWjz3nLVisgQqxOcrw/
 R0LkeTbppNM9y5wT4wMlqeE1tUbcZdxBbD/vwLr8aU5eKmGWRStCZB+MENKxyqi9e7Tfjmvg1Js
 UCOfkjjJg5MBiBy7eHUIIR8r/zySJN8JP34xJ+lt5dGC3JYKyu2cXhm5B3Dg/XAezYJ3ay2/qBz
 +R2g0qn/DqE=
X-Google-Smtp-Source: AGHT+IGMN9aoNWXZb7gMYL8RWSoHIDrj7/U+1AEyTrsXsuqYiwDrK3r5jMznODCWwpAyW9/gf+nHgQ==
X-Received: by 2002:a05:6512:1241:b0:53e:39c2:f02b with SMTP id
 2adb3069b0e04-5439c267d6dmr509138e87.42.1737111014264; 
 Fri, 17 Jan 2025 02:50:14 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:50:12 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:55 +0100
Message-ID: <20250117104911.613221-15-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111014; x=1737715814; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPYl1WEodUNBz4aa5IKyriEqCa/oXAsq2WohDW/woQo=;
 b=I+iokdJAwUSE+KTd2tKGciAEmGtNsp+4kzhmePXSuSow/jTzeSPjUr929RJpt9s/5e
 9aw85ECgRCfZ76f11K0YDs5YUAdgNu4n72VyrMud1PscnZl0BPdFoh1o6DkYsJuiXIfc
 16atL4nbhIap217FjXC1Ku5ZN2Kbvj4oLrzyJMAvVKVhkw1+PoNy7NqS3TPrXDGOx8A0
 ineqCPwn/xHLqHaa+SdGAr99FrDieiU49V0gz0HubkG0PFtIuoKAtyHkcXpe6hc+x1IX
 X29hQ+IGnsj9FdcII4aSVgFvDebZawZ7KBHJRHfzdPIABqFZ7o31x3trGJbuHJIMRTNT
 MNOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I+iokdJA
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
