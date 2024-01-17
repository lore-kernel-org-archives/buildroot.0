Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EA1C47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A8BF42125;
	Wed, 17 Jan 2024 22:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A8BF42125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMZGV-kdM6IQ; Wed, 17 Jan 2024 22:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A6242112;
	Wed, 17 Jan 2024 22:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A6242112
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47A5B1BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E40483E61
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E40483E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63aLxE1vlA7U for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:51:06 +0000 (UTC)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A33B83E63
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A33B83E63
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5cd8667c59eso8091503a12.2
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531865; x=1706136665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hdIf7ztpdMlIi5FUQr+DjirfulUJeazi3pukRctYiXM=;
 b=eCmtha5BZKB+yXmj7+b1tl5VLhdv2DP+poDnqfQuSIjJL789uimhasTR4x6ime+mwc
 H2xZZ8kR5RX9uamM9206Ml7rNWkK4gD6nb99dxZu4geGkJfbNaHqhVE2QPFcvmuiJUop
 Ws0MsxIAWlCMZPKKl/B92ovwDa7WRgPo+c6OIg/SlAK9bcAHz3eu8e6jRxyOSFtpane1
 As0ZMiyaI2wBaTP8Viyda99pqBpeRcnqMkh4rcfi8cT1DgJ+RCwDyHYRbK0hndh0xk6y
 v51aSOOY8pCLR8vBKAM8B2e5xVHBAHxZvZC1qEE+c5XW29nfpnJVNcX4yoCTX1GpPQUk
 7chQ==
X-Gm-Message-State: AOJu0YyWh4EArZZ6spkei/czx+zUCpAYNVYawK3JNKmJFVB1OGX2vZq2
 kU0+S6rU3V9bvXShuYxXAOXGjjEGJL+OOSVX8N3v9lL1sUM=
X-Google-Smtp-Source: AGHT+IEmAU7NCQntkjbyoJNR1feBwdzYwyOp/lWHNBMCmmLSDZbraC2BO3jGcQMPgkQmAcqIDlWIbw==
X-Received: by 2002:a05:6a20:4c03:b0:199:e237:1497 with SMTP id
 fm3-20020a056a204c0300b00199e2371497mr7472409pzb.65.1705531864968; 
 Wed, 17 Jan 2024 14:51:04 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:51:04 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:46 -0700
Message-ID: <20240117225049.28443-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531865; x=1706136665;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdIf7ztpdMlIi5FUQr+DjirfulUJeazi3pukRctYiXM=;
 b=Wl0lH48Am3ZphQKHV47b+RqN6mOHJ49u4sPlFAeKni82ZjQTB10E6xmFfbqP3tUEJD
 m3hcISWA9CL7iuyLU7snhnaAQuCqUKY8GKTvb0D2ECr0WfzGikivQM94UxW7pedZfEIn
 OjYyJG0/fNcNBdkWxB503rjeeJ4ppYh2jz5ks=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Wl0lH48A
Subject: [Buildroot] [PATCH v3 07/10] package/flutter-pi/Config.in:
 propagate flutter-engine dependencies
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As discussed with Yann, it is better to make the dependencies of
flutter-pi verbose, even if flutter-engine and host-flutter-sdk-bin have
eleven dependencies combined. This change clears up any ambiguity a user may
have regarding the dependencies the flutter-pi package relies upon and why.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/Config.in | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index 4bbdc3cc77..bb0e3702c1 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -1,9 +1,20 @@
 menuconfig BR2_PACKAGE_FLUTTER_PI
 	bool "flutter-pi"
-	depends on BR2_PACKAGE_FLUTTER_ENGINE
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_5 # flutter-engine
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # flutter-engine
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # flutter-engine
+	depends on BR2_TOOLCHAIN_USES_GLIBC # flutter-engine
+	depends on BR2_INSTALL_LIBSTDCPP # flutter-engine
+	depends on !BR2_STATIC_LIBS # flutter-engine, wayland
+	depends on BR2_USE_WCHAR # flutter-engine
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES # flutter-engine
 	depends on BR2_PACKAGE_HAS_LIBGBM
 	depends on BR2_PACKAGE_SYSTEMD # Event loop and dbus support
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
+	select BR2_PACKAGE_FLUTTER_ENGINE
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -80,8 +91,22 @@ config BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN
 
 endif
 
-comment "flutter-pi needs flutter-engine"
-	depends on !BR2_PACKAGE_FLUTTER_ENGINE
+comment "flutter-pi needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS \
+		|| !BR2_USE_WCHAR || !BR2_HOST_GCC_AT_LEAST_5
+
+comment "flutter-pi needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+comment "flutter-pi needs an OpenGL or OpenGLES backend"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
 
 comment "flutter-pi needs GBM, systemd, and udev"
 	depends on !BR2_PACKAGE_HAS_LIBGBM || \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
