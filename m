Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72D1C47077
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2634028E;
	Fri, 12 Jan 2024 00:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F2634028E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EaIWmAJbnpLM; Fri, 12 Jan 2024 00:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A69F640328;
	Fri, 12 Jan 2024 00:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A69F640328
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 965A51BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D1D784442
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D1D784442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukcvMgRY-IIN for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:29 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C5CC8443F
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C5CC8443F
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso4230743a12.3
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021048; x=1705625848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aHbiT4rCd0nvBHkfYHOHhjEZ1tFSiBM80OTXwZkBV5c=;
 b=bdwXskuWOLSF6ga3+vp0Wr2F4GdrsrsbjQidiinJWmU+iZxzZiOM+2/D0s1tEqV104
 QgrLhf6TAnSQkjWdQX6F+bsn411AMpGSczpQ/Myl6FVhV8w//a/1Go697uiivTkBjl5X
 XLkfLRycQ5YL+KfhcDDNlNsl9T1BKvvbnh9g66D7ZOroDSGsNjoi5GmG/Fq2JVUQo34b
 aOlQsjHgGhPjzsio/3wlVn8KeFHVU50HF2wWMXzSXvLwDqggvnlYeaQR0P9sDnjT/wgb
 xY47LV+4Q4OJcD3EOy0Qlllr8+tLY9jA3iOE3RAbWgU6yFyETA5nlsrMXFyiBfAfzwQm
 hyeQ==
X-Gm-Message-State: AOJu0Yylg3dfBDDDoJPtr46eycldEKDHQFWhIZsTLfb+tb+O0ExTDzD0
 rLk00mWcY6ewrVuw9kId2heHs3ZyTTOBCTFEin+2YNiDzi0=
X-Google-Smtp-Source: AGHT+IGXXhsS1C21jdkEWTQYz+gH1rz3IgP+5gWm56RhjB2u8gejFsmCOllrS2khChFi/q/Pb+moew==
X-Received: by 2002:a05:6a20:1e48:b0:19a:3bc5:6166 with SMTP id
 cy8-20020a056a201e4800b0019a3bc56166mr186592pzb.61.1705021048116; 
 Thu, 11 Jan 2024 16:57:28 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:27 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:12 -0700
Message-ID: <20240112005719.1082305-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021048; x=1705625848;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHbiT4rCd0nvBHkfYHOHhjEZ1tFSiBM80OTXwZkBV5c=;
 b=ZwOeDKQwJNkz9j6Df1/BZf4tie/pa/syDTuCyNuWr6IJXZ20rWxSosJSj4iTNZgvn9
 IkXG3Vj4du+OFyO4XQEgnqfU8kmshqrFMkrvHspMFCtsbZR2fDDtKHxYpHls3BNNMzfz
 +0bXuOGTJCd82LbRXpFqNg0M+ERbsStQFxrtw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZwOeDKQw
Subject: [Buildroot] [PATCH 03/10] package/flutter-engine/Config.in: Drop
 nptl dependency
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

As Yann mentioned in commit 9d8497e79de3ced144877ba6ee38cc5b7181aaeb, a
dependency on a glibc toolchain implies a dependency on
BR2_TOOLCHAIN_HAS_THREADS_NPTL. As such, remove the dependency from
package/flutter-engine/Config.in.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/Config.in | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/flutter-engine/Config.in b/package/flutter-engine/Config.in
index 3c92e40f74..00bcd05cd4 100644
--- a/package/flutter-engine/Config.in
+++ b/package/flutter-engine/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_FLUTTER_ENGINE
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthreads
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	depends on !BR2_STATIC_LIBS
@@ -68,12 +67,11 @@ comment "flutter-engine needs an OpenGL or OpenGLES backend"
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
 
-comment "flutter-engine needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5, NPTL"
+comment "flutter-engine needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5"
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
-		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_HOST_GCC_AT_LEAST_5
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS \
+		|| !BR2_USE_WCHAR || !BR2_HOST_GCC_AT_LEAST_5
 
 comment "flutter-engine needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
