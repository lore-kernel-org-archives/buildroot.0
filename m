Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD47C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 04:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09EED81E99;
	Sun,  3 Dec 2023 04:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09EED81E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4bxL_poGr3sH; Sun,  3 Dec 2023 04:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67E0F81EA8;
	Sun,  3 Dec 2023 04:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E0F81EA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE57B1BF2B9
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C34E181EA0
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34E181EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXn50_aZFuOc for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 04:19:05 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F395681E99
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 04:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F395681E99
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1cfb30ce241so17946335ad.0
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 20:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701577143; x=1702181943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRdcSox6qBzp9xh3XUb1tSdwxHD/qBhd4yrNrFV3u7c=;
 b=ugjC/5V0OEig1MwGnVxdyMCXYgFoxYbEtFjR9ZiIxS+QJmJX5BR2F0j/8V3+SqhwaF
 HnDjP+3BGs7BhGxfvlLQSihRNrqTPSehNYv7KxsDuiusaxyU2fIHzC25G/nEDM8IEyM/
 nDRG/5/uQ3EQIdAxuEq6g+EbgFeXNGLbbdNYnpCuAz9CIrufjsweilgwt1GDOY/488M1
 0Z33vdREyHkOive5/X2pRn11rCCczUmoH3gfIV8XTK3UpIdupqpqi/Szi2pZ7mtce1bU
 +whi7AoIi2z0xfNoAgXu7gD5rb3P+r1hgTk61XHRdAhIlOzrGdgdqU4KjlshUJFslOzJ
 C+Lg==
X-Gm-Message-State: AOJu0Ywc+RTpowpUkvl2qQtk5oSSh4zPM714qwtIg2z0Qok9EUibzkb9
 IrQGHNgiMbs0/YUWLtVxq/naThkuOKZ7vORjJk4=
X-Google-Smtp-Source: AGHT+IGJWX5Ck3gt311jZAhOx6EYY+wFhVzhsjWSOhxm2BZGJQt48CHk6J/AtIYIwhTR2ceKHDsLqg==
X-Received: by 2002:a17:902:ed85:b0:1d0:6ffe:a14 with SMTP id
 e5-20020a170902ed8500b001d06ffe0a14mr1776735plj.114.1701577143047; 
 Sat, 02 Dec 2023 20:19:03 -0800 (PST)
Received: from localhost.localdomain (75-174-247-100.bsmr.qwest.net.
 [75.174.247.100]) by smtp.gmail.com with ESMTPSA id
 j15-20020a170902da8f00b001cfc6388b5dsm5874084plx.260.2023.12.02.20.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 20:19:02 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 21:18:35 -0700
Message-ID: <20231203041841.492885-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701577143; x=1702181943;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRdcSox6qBzp9xh3XUb1tSdwxHD/qBhd4yrNrFV3u7c=;
 b=R8+Fr/jGUkWHhdPsJMhxAbocZo7yudHIc+RmZf29BataiIUNXBpPQPe6Io7hSXnxFZ
 S5NkT82JT7jHM7y4w3XVcspb03rVWp/p0D28yZAQKRHskBpIXpnYD8cVPvk57GIz1kTU
 4T/PkqxhsqzXw2Uakuurc+hocolbB1SD2ZHaI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=R8+Fr/jG
Subject: [Buildroot] [PATCH 2/6] package/google-breakpad: disable uclibc
 support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Pascal Huerst <pascal.huerst@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The google-breakpad package uses stab.h which is not included in uClibc.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in                         | 2 +-
 package/google-breakpad/Config.in | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 27f5deb16a..554b4062eb 100644
--- a/Config.in
+++ b/Config.in
@@ -589,7 +589,7 @@ config BR2_GOOGLE_BREAKPAD_ENABLE
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	select BR2_PACKAGE_GOOGLE_BREAKPAD
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 4320ad64aa..49d0bc06de 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	select BR2_PACKAGE_LINUX_SYSCALL_SUPPORT
@@ -34,12 +34,12 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 
 	  https://chromium.googlesource.com/breakpad/breakpad
 
-comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
+comment "google-breakpad requires a glibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 if BR2_PACKAGE_GOOGLE_BREAKPAD
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
