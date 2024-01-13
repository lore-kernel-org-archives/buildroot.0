Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422F6C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBFE260A9A;
	Sat, 13 Jan 2024 20:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBFE260A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qBKTFCUgqoe; Sat, 13 Jan 2024 20:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EA0560ED5;
	Sat, 13 Jan 2024 20:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EA0560ED5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 712631BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF6A83AA6
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF6A83AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXo7LxE8KIuh for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:29 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB9AB8394A
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB9AB8394A
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6ddf05b1922so2597308a34.2
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177227; x=1705782027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aHbiT4rCd0nvBHkfYHOHhjEZ1tFSiBM80OTXwZkBV5c=;
 b=rPQElLYwsOlrodWIvO1wKvOUnXctYxFghGL6tdLTwTTn1IpJ90JSSfilEn2+AYui7P
 +iBTtBf6IMqGPvCsYgjtVcl78iZ5Uk2leBPsEjCRQlsELcwTN2LazoxPV2DLdLOO8Mp5
 0Y+evoKGcCq9BGpF5I4R4/M0epi0tueEQCd6Xs6s8IFeERL7bKz7dEz+8wsWK11DNQUX
 LQSUOP+5pPrUqN4fVeysaDs+vDyD+8Elol46+MHSe8HBbn0Z94+g0YtR9QFmjF0/LIiV
 ffjk/SukWmdIP9Gf4dT6iGZilxE/tnzZSXNzGmV5huUY7aKdIpkI7pTfx6HMcDfb5qlJ
 q99g==
X-Gm-Message-State: AOJu0YyTpXufCgYTPHuvi0V2o2IRMTOkLR7VuusoixTUdsDHAr9hPffw
 CPEGiRAe1fxgE6EMV5k2hKY2xyW3e4lcpCp1uhBocuG//xM=
X-Google-Smtp-Source: AGHT+IHcl7inPVy0VDG0apVeXtANhjQXfN/uqrVYS7hbEavRztzfOwAbzw2OAR9BAsaWw9oeCxARuQ==
X-Received: by 2002:a05:6830:1bc1:b0:6dd:ddd5:77ae with SMTP id
 v1-20020a0568301bc100b006ddddd577aemr3871713ota.52.1705177227056; 
 Sat, 13 Jan 2024 12:20:27 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:26 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:13 -0700
Message-ID: <20240113202020.21747-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177227; x=1705782027;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHbiT4rCd0nvBHkfYHOHhjEZ1tFSiBM80OTXwZkBV5c=;
 b=EbZhuVeUcKOZYL/YC5s8kGXEF4tkkgnH0vEIlV+0/R97EL0j9YqZS/daq51AJZYNxp
 lqPelc0CaSLfSst6oqeTHGWOwrlJwex81KCcuyrUShSiw/CbuhGqCW1GQixa/F9rJil/
 CWkbpgCsSTcTA2A5Jx5256mMLIdR+avSWcG1U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EbZhuVeU
Subject: [Buildroot] [PATCH v2 03/10] package/flutter-engine/Config.in: Drop
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
