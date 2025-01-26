Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1120C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89FFE608EB;
	Sun, 26 Jan 2025 15:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ao_ng-6KDe4u; Sun, 26 Jan 2025 15:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D0DA60C17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0DA60C17;
	Sun, 26 Jan 2025 15:48:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCB4794A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB61B40F89
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cybM-wZFZR-B for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 610B94023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 610B94023E
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 610B94023E
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:52 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3ce915a8a25so12120855ab.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 07:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737906471; x=1738511271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qSpwE84yhNcIAQbYqQxksua5I4Y/r5LNCr9PNL6vjUY=;
 b=Q8OJpcnL3rbaFeeGgq80nvVoKiuomKX/i1wS3dsRQ6SHstAwGGmPXgVYJ+O/jLvBzd
 TvMum8ZKcLDM6TeZlx1TlhaWl7OiyBU1PofZ+s31q24wQac6DjCdQGLhTLD3+zjGUN7D
 j6mBqn5p1siefGJzqinCd6Gs9Z3PM8JvTnNFdT5zGy6WKymAhAOd0UJkGCuNzH05Fw1W
 8v2pFBKv7ByWC0O3uHu2ls+QQoOvMtTaSrhztd7eyFcvFm43cWzlwDOOHfXGjxIFYdaq
 gbDzAjIMr8cDzaKatcE7kW9b2+sz4WpY+wo2iixqTU7DIeRZVC5r5ZRRE4VbNZWNZAe2
 9TKQ==
X-Gm-Message-State: AOJu0YygUULzbdQrCWINNWb+A+d9StldS35AFS34tDeI/lhf32h3kjiT
 G8zAqeJBkNv/Ha96qj04ghMbFh2sDigpAVbDJd2Y3NPzFOOQXY7JL9upDdKm
X-Gm-Gg: ASbGncvKB7PaEUufD9LT7vpKxLvxXqiwroWX5zxx0hjcjTPH44ohLjpIe1mFr8RCsPe
 OYh8moly5J0HYOMeTMq977DsOk7EoxyVRoTTFKfqCFmB5RCii71bLCRb/YXaaCCri0XsfT8QEhC
 iu8eRimj782d7DVH4uYuNqj0kpCoKE7g4qe+Mk8V2VFQuSax1iH0aojDiT3tHVLoAEqo9db5rOY
 vjxMxxXM6bei1H4JIcXDBtAPnSK+bfWWzMt1SHi6t9BH8e3+RNDfqt4t7M1T5FK4oO/7DOJ+GIB
 SJynlQnUKiK6mg4iydsQVfrv7kOO+uqveKW2v8ZhRgp1yO40OfrHcMw=
X-Google-Smtp-Source: AGHT+IGixnBoJRl9SjaYleKHjzBPHjIc7DOYJ1FdITaOfpj7TKAINoM/8U/hj2sNZxaxDGaQsJBUmQ==
X-Received: by 2002:a05:6e02:1a86:b0:3cf:cc08:6165 with SMTP id
 e9e14a558f8ab-3cfcc086245mr73465125ab.12.1737906471133; 
 Sun, 26 Jan 2025 07:47:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74ea0afsm20900715ab.47.2025.01.26.07.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 07:47:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 08:47:29 -0700
Message-Id: <20250126154732.405055-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126154732.405055-1-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737906471; x=1738511271; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSpwE84yhNcIAQbYqQxksua5I4Y/r5LNCr9PNL6vjUY=;
 b=Y5yhvwCXWI+A+2zvQSBsUUZAUUuH6nNBsDGqdlL0Ir+DXPl1SyOQEOthF7UcxhrRF3
 +7TKqMtkUuMPKtwGEbHy/e7q9hiIJ+1QA/ME3oy2+jtx0swvQzh8ED7Zlf0sGUBknrNI
 30e0U+spzDcZi/LxAc6XbQdT/ESFv4SVSMhm6DAk2BMWk4COdiuXEt7ZPZRiIg9HudnL
 u1nswNxSfYpQE1wLuisVTb5kSzImttd6P51oCmi9Z5eLxU5nY1wZVT6Wo6NV5AZMdJvI
 22/cmhTYJKKQGoSllS3wu6Y8GQWFsvDE3INWcqCiBifWmhJCP012ALg+NjuzTZGRHH31
 iSYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y5yhvwCX
Subject: [Buildroot] [PATCH v7 07/10] package/xnnpack: new package
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

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - add architecture dependency
  - update to latest version
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/xnnpack/Config.in    | 27 +++++++++++++++++++++++++++
 package/xnnpack/xnnpack.hash |  4 ++++
 package/xnnpack/xnnpack.mk   | 18 ++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/xnnpack/Config.in
 create mode 100644 package/xnnpack/xnnpack.hash
 create mode 100644 package/xnnpack/xnnpack.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c916ac8050..3d87f483f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3039,6 +3039,7 @@ F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
+F:	package/xnnpack/
 
 N:	Stefan Nickl <Stefan.Nickl@gmail.com>
 F:	board/freescale/imx8dxlevk/
diff --git a/package/Config.in b/package/Config.in
index cccb95b869..74cd3e9815 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2318,6 +2318,7 @@ endif
 	source "package/uvw/Config.in"
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
+	source "package/xnnpack/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
new file mode 100644
index 0000000000..1b186ac055
--- /dev/null
+++ b/package/xnnpack/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+
+config BR2_PACKAGE_XNNPACK
+	bool "xnnpack"
+	depends on BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	select BR2_PACKAGE_CPUINFO
+	select BR2_PACKAGE_FP16
+	select BR2_PACKAGE_FXDIV
+	select BR2_PACKAGE_PTHREADPOOL
+	help
+	  XNNPACK is a highly optimized solution for neural network
+	  inference on ARM, x86, WebAssembly, and RISC-V platforms.
+
+	  https://github.com/google/XNNPACK
+
+comment "xnnpack needs a toolchain w/ C++14, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xnnpack/xnnpack.hash b/package/xnnpack/xnnpack.hash
new file mode 100644
index 0000000000..e31eb690e2
--- /dev/null
+++ b/package/xnnpack/xnnpack.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  fb519d082e5fcaa11e849386ad00e38b9ebde2cc9363032394516cd0d00295c3  xnnpack-e4b2b942b4a6d84b680ed690fee42ae99865945c.tar.gz
+# License files, locally calculated
+sha256  63f519e15726f4c4f830bd958f694c84fecb4e0a4cacc527d2696bb71ef95ada  LICENSE
diff --git a/package/xnnpack/xnnpack.mk b/package/xnnpack/xnnpack.mk
new file mode 100644
index 0000000000..f53f45dc74
--- /dev/null
+++ b/package/xnnpack/xnnpack.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# xnnpack
+#
+################################################################################
+
+XNNPACK_VERSION = e4b2b942b4a6d84b680ed690fee42ae99865945c
+XNNPACK_SITE = $(call github,google,XNNPACK,$(XNNPACK_VERSION))
+XNNPACK_LICENSE = BSD-3-Clause
+XNNPACK_LICENSE_FILES = LICENSE
+XNNPACK_INSTALL_STAGING = YES
+XNNPACK_DEPENDENCIES = cpuinfo fp16 fxdiv pthreadpool
+XNNPACK_CONF_OPTS = \
+	-DXNNPACK_BUILD_TESTS=OFF \
+	-DXNNPACK_BUILD_BENCHMARKS=OFF \
+	-DXNNPACK_USE_SYSTEM_LIBS=ON
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
