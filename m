Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526C2C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C8BD60AD4;
	Sat, 13 Jan 2024 20:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C8BD60AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48TffyMMcen8; Sat, 13 Jan 2024 20:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56F5D60B1A;
	Sat, 13 Jan 2024 20:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56F5D60B1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A321C1BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C9F1408F1
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9F1408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJxtkmPTADpK for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:33 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C52BA402FE
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52BA402FE
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ddeb7b4366so2860782a34.2
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177232; x=1705782032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hdIf7ztpdMlIi5FUQr+DjirfulUJeazi3pukRctYiXM=;
 b=hJGS+y98iTULwX2671Muep15xMhBqVjTKwUXf8CHNVKupWcVAMetxm8qxqw0otsq3w
 ozp67jX8uLXCN2JjX7eoJArylu/H2eoe2F0hFT9UopiKse8HhC3v4LgIJSPnTWraWriO
 z6FiB9tY+3PA0KLQYrFBMMk+6qne7xpNoI9Np0QysDT0ZwU8SNSBrmvaHxkp5bpbtANJ
 aByv9qW1OKIL5KPZRJFxlUQK/xm7/wVzPQfeqMn5A7S2ORqiMLbU1yCLpw3ArnD9WOjq
 6VtGLwrNAHQnT9y7dWf8bBa+j2LOLp2hYzfV26dzr94xL6mfVBUvQZm+tvaRdo186ZwT
 m6kA==
X-Gm-Message-State: AOJu0Yx4WBmR3GZeETJK2eY7uqN1Zh7BnQCWriZiEq3Do6R21lliSreM
 YnWsmPLnTOTLliq87ZHNRsU7ExNGGl7you8OMv9jYk3z/7Y=
X-Google-Smtp-Source: AGHT+IGaltAN9W1YcKKP/wtgO3Qg2OxLN7vBW+pW4c/t9bmQ8hghNjyp8LHa/GerkDtUyghh0BSWJg==
X-Received: by 2002:a05:6830:14da:b0:6db:bcb5:7ed8 with SMTP id
 t26-20020a05683014da00b006dbbcb57ed8mr3466561otq.1.1705177231982; 
 Sat, 13 Jan 2024 12:20:31 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:17 -0700
Message-ID: <20240113202020.21747-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177232; x=1705782032;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdIf7ztpdMlIi5FUQr+DjirfulUJeazi3pukRctYiXM=;
 b=PQ/7JOgxRKv6e0pPCppnzSVJ2DMTBm2c1rLw+mz0Muc2YSfmdGgNpQfFlCjCPJe+VH
 BIA9/jpLtlvvGXGkXb0HwjBsemyBJdxg+rKny6b+4JI/Gp3Z7qckHRsROSFhsUi7vv+8
 6jjQqO3xjIigFRejUCR/RwNWXz6fVkLU5lYM8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PQ/7JOgx
Subject: [Buildroot] [PATCH v2 07/10] package/flutter-pi/Config.in:
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
