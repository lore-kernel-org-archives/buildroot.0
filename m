Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268BFC4707B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A1042E1F;
	Fri, 12 Jan 2024 00:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6A1042E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_pzWXfoO380; Fri, 12 Jan 2024 00:58:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AB7242E0A;
	Fri, 12 Jan 2024 00:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB7242E0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E30131BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC5206F563
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5206F563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30zY6KPX8yEg for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:35 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DCF060D77
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DCF060D77
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d9b37f4804so4407453b3a.1
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021053; x=1705625853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hdIf7ztpdMlIi5FUQr+DjirfulUJeazi3pukRctYiXM=;
 b=qw9cpPFPIhCneSnQPlzJ/Z93m16z/tdxei7NjnvfC2a5FgsqeEDq+M9eOW1vXPwjK1
 IUSHB4fFDeuFX25oQ+0SPPgGaHDAUp1BbTmP8eq9nRuzPy31uRgAzvAm9KplHkpiRClP
 BxrqGUcEX/utSQwW4aAf4/Jjt6SeeQ0rGofQzqBWmseWxH/OdUxonODcDO3CA2FwuSGX
 gM/t4m3+jIlniBnCvzZ6zdjH/Xr+6/tkf3J5+abo5e1rt3fHJ0rNlylh/wKrHYH9rrz6
 8R0Nwu8yiD0GiRALat2NRoMld7JE6EN8WJMopsH0M/wi8xA0vGQ1YW6KVDw9N50x12fL
 qMlA==
X-Gm-Message-State: AOJu0YzprM+iZnttb2v/IXN5rBMVQdfT+CwLMpWdUaCqhAlKCBaWiNpf
 6uwrAAR9d+skDyxtK+CtWlARtUtOx5c0yxzCDhCYva8PBtk=
X-Google-Smtp-Source: AGHT+IFnm2jiibzXGzLc+3EF5LrdPZ+ZirChG8ZobOBnr/09Rzbg5ly4LVlBLyZtGdSF6FJMjXZLFA==
X-Received: by 2002:a05:6a20:a112:b0:19a:797f:eac8 with SMTP id
 q18-20020a056a20a11200b0019a797feac8mr190065pzk.46.1705021053264; 
 Thu, 11 Jan 2024 16:57:33 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:16 -0700
Message-ID: <20240112005719.1082305-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021053; x=1705625853;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdIf7ztpdMlIi5FUQr+DjirfulUJeazi3pukRctYiXM=;
 b=XxdpVmzNpvfkYHT3Jc1nFQUjOWT6XGlrGxg2abg/sLFQNfqeiUyVP59c0Rl3LCyJFh
 +ENDgV/SOAgxrj7J8sEU2j5ZbRblxLVpMRryRonsrqVKQFbjJdbV6svM/ROPFwF1Ljjg
 c8oOrS7ycR2uFsrgj/bjz7OYfNUwsvAlxTtMU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XxdpVmzN
Subject: [Buildroot] [PATCH 07/10] package/flutter-pi/Config.in: propagate
 flutter-engine dependencies
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
