Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4780CC47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA3014214B;
	Wed, 17 Jan 2024 22:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA3014214B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTJ7KSX29It4; Wed, 17 Jan 2024 22:51:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 417A442141;
	Wed, 17 Jan 2024 22:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 417A442141
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1271BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 053CE4375E
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 053CE4375E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SyIoppmENtwR for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:51:02 +0000 (UTC)
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 026BE4052F
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 026BE4052F
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-206b77b9f4bso4947468fac.1
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531860; x=1706136660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aHbiT4rCd0nvBHkfYHOHhjEZ1tFSiBM80OTXwZkBV5c=;
 b=HB9+RnF2f7NvMob68UPwtg2JrNahNC0ukZ2bAJiMAe0fEQgXVeZPA9Ppl/6vT22kox
 cuCTqL3DLvtSW3hzViO7SnY3LdokW1OeATEz8lhAooP69v2GWp+irWxCmgWTVw4qzLr/
 4gHEptbJU7XT4ScNDU72lgf5EEshNNYdbY7fvg5T1mRg+th3WKREhaEhNKio11Tf2LXq
 s0qoaPVy4JhZiu2cbAZEZET2DoGFQ1TqTR/+qSj9rMmg61uPCEquG1gwr03h1YgPEWOc
 Gbz1xFj+R12iVmBtio1mIv1JTcO343NgYmvdVlQ23nuIOuOPZdAfK+TObixYuJGOGlgW
 Fl5Q==
X-Gm-Message-State: AOJu0YyLi4wakxJcJsw57JyR4/x+w5hj0XpgGBHZIgSOET0byLTJH0uq
 zpmYLeyJp6fKdiTU+bL7uK0T65HR/sheBgh8EKlmQKmuD2E=
X-Google-Smtp-Source: AGHT+IHU6nNFCvpSuCuLgGFSxlOqJzoyUM5lAPDGkbH/+/Bf2Ei2Bc2zQ8Rr+HrvDjpsk4fA7C5/Ig==
X-Received: by 2002:a05:6871:d08d:b0:206:7e46:f18b with SMTP id
 mw13-20020a056871d08d00b002067e46f18bmr13878014oac.28.1705531860135; 
 Wed, 17 Jan 2024 14:51:00 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:50:59 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:42 -0700
Message-ID: <20240117225049.28443-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531860; x=1706136660;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHbiT4rCd0nvBHkfYHOHhjEZ1tFSiBM80OTXwZkBV5c=;
 b=LLCUgM5NAcxrB1RasqyGNTJvKin2KWbsSNMmIBOKFdX+pJh95Yb/geNGlgl/i9p0DN
 DpS5B/QKmzXrdE0ihkw0LJ/MPBojcjp8A2cHBPSMHHExqtPOoee7wLmOxgI6j+iyMV+w
 pxGbS1CTPN5bCspfOdiphIZM2xmHY5GvdMlPs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LLCUgM5N
Subject: [Buildroot] [PATCH v3 03/10] package/flutter-engine/Config.in: Drop
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
