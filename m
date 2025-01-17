Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56341C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7B66FB52;
	Fri, 17 Jan 2025 10:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDg1t0S9ID_k; Fri, 17 Jan 2025 10:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CEAD6FB9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CEAD6FB9D;
	Fri, 17 Jan 2025 10:50:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4060B94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 258066FB30
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFnXA7ZXEpxf for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4477B6FB9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4477B6FB9C
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4477B6FB9C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:24 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso2121653e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111022; x=1737715822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDoVMCEK3zONo0cQ/Znc8t7lbKJGj5ItpLa29Chvy0I=;
 b=tnCFjoVDdDOvOfYV16LafSuf0whNuUQSRx6rrh/E43zNUxXbspKz3hcmWQidAJpbhj
 2TEP2LvHm2RAP/vmZGP8dPblJ6xfuHig3U9UsDzWeSA0z+wRy5zSxXRBOWuBvdSx3mmR
 fbdL46cXLrNorstA80A/YMtCR93GIwra1NM0PPQkwCCX/T0GOwbsp1hPyVPZgXbuhLv9
 S6EPI1yX0fXlsNBVJoW7kOr0j9lN2IC8mdUyjQSju3YQwzmlVdZ4w0UEYvUSLMq1Y5lb
 zO/Kbli1F/ZV6Z2H2wsjFIcRLgOYNYPphVkDw9ZC+qVq0SbR+a9LkVL+Q1wLgGgnOj38
 r7gw==
X-Gm-Message-State: AOJu0YzEi9wKJehWmsxuf2conTwMLrIwzgAqRMY+I2l4O+5Nz3sfJB+O
 apfOn2inAtHlYyOrFynjyqv8FKws0CWGYwgNi2MZjKcd5l6DJQnsD0ukLg==
X-Gm-Gg: ASbGnctkeB90unX1di36V7/eKtsGm2wDc9mU7uUKO+1ewwu8G+Sq3GwgX6itAty33CY
 35C6v0Ea10IRf0ItUVtxuWVnNEMykORGALGTYCPj2vE4bQF8GKz8EmG4dyl+BIaIO2uZVL+x8ZF
 HviXsBhUu/TB1VLnp6dH5gN7G4BCqGuWW9m2egsVNkCAX4DUqpYryQEtARXbZ37emFNUwwmTLw3
 3Sv9OS63m4IDQw1nXYmawlQf4zysynnazeTJQCsTfn6xUoBRqiTZBuU8datkI1RQTgjMYi2U6gj
 so9FrqVG9+8=
X-Google-Smtp-Source: AGHT+IHK61Gmo/4PhvXmI8haXOgZGWiuxxWc2b9lg8RdM1junhwvbK55Mml40ZeuGX1+mXhHThdZKA==
X-Received: by 2002:ac2:4424:0:b0:540:1f2f:6ac8 with SMTP id
 2adb3069b0e04-5439c282100mr519301e87.33.1737111021738; 
 Fri, 17 Jan 2025 02:50:21 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:50:21 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:58 +0100
Message-ID: <20250117104911.613221-18-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111022; x=1737715822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDoVMCEK3zONo0cQ/Znc8t7lbKJGj5ItpLa29Chvy0I=;
 b=H71zTkYmNR9rVcdUyfL33a0ucQ1jlBrt9lJWhyPywRi5FnSr/MmoD0J7ODceP6lWhN
 LusUB49r+3PQwphx2VKDT2KlUlKWn9VIxl8mp1NkPO6/AmfCI8gfgdMCKj0eNee+REQZ
 RKGB4B+RpaDFBapd84d/9o3rfX6I+dAbdi4TMuXQSJDlYfHBSzVeWLlb0EDfMW7I9XKi
 oQW1sXkQbQr3yYH8v/sWtwf9kQKzDs3f2dMCmSEb1LjnMEbPElaXnsNgt2+shKdpgCOx
 f7YbhMuBB7s/4X2Y7ZMOgKoREHh2yIbx0GHMGoKwjYeP9eVCNHzoqqvEmwZHdV6prCpN
 g8gA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H71zTkYm
Subject: [Buildroot] [PATCH 18/19] package/qt6/qt6multimedia: remove the
 explicit v4l option
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

I think this option is implemented incorrectly and with no good reason,
so postpone adding it.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/Config.in        | 5 -----
 package/qt6/qt6multimedia/qt6multimedia.mk | 7 -------
 2 files changed, 12 deletions(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index e3a25c31b0..70acbca8e6 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -97,11 +97,6 @@ config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
 	help
 	  This option enables the linux dma buffer support.
 
-config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L
-	bool "v4l support"
-	help
-	  This option enables the video for linux support.
-
 config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	bool "pulseaudio support"
 	select BR2_PACKAGE_PULSEAUDIO
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index d4a1b8ec50..efc6436e9b 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -101,13 +101,6 @@ else
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_dmabuf=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L),y)
-QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_v4l=ON
-QT6MULTIMEDIA_DEPENDENCIES += linux
-else
-QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_linux_v4l=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_pulseaudio=ON
 QT6MULTIMEDIA_DEPENDENCIES += pulseaudio
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
