Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BFAC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 22:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94DB940114;
	Tue, 26 Dec 2023 22:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94DB940114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5Gw_RJTNwTI; Tue, 26 Dec 2023 22:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71D28409F3;
	Tue, 26 Dec 2023 22:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D28409F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9E871BF95D
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87B6A60FCD
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87B6A60FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljvryGv3V2CA for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 22:20:09 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 858CB60FC6
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 22:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 858CB60FC6
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3367a304091so4690020f8f.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 14:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703629206; x=1704234006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cCZ9t5wgpQjaMay729im7vi2OQETm8tTq1BZ17d98Kc=;
 b=m7/FQh+3rKn0DsCg9nMjtCohvZIDsNAtJbxiDziPjGJsxwq6QDHteAxIQ3DhDfORV5
 Bz/kT3FAmvDBeE488/2J2CxPGGcUAuNUISNII+wrcuai0DHsyj69ieIzXSnyBESNQY28
 STPikreQi7V4UVd7udP1lc/n6HQZvNhQ2PjM8fy3Wz7M1d74KFeTWiajL7QiCIPS3Ak6
 Se/0WRC/agld3u0FLGAYB4vKahl4r/E6zY8/ZhYvMoYdYzyhSKeatHUkge3IDJAjKJFA
 nB+XaDtgzA9vHjS0Z4UMd4NSyCqMiluv7ObVg2wNQvtthVwFwMkTPTO61D4C+Xed9/L2
 sOog==
X-Gm-Message-State: AOJu0YxCmiU8WVvUB3mqhqFWZIeznSWcVERqlVKKJ3JMoqW64bQOKPtS
 6qGv7/TWIN90oKoCzEdBFu/8t00whbs=
X-Google-Smtp-Source: AGHT+IE/HcHEmMvLIxkWGz0ZmoRADTNadpSAYvoF7Ipy7wNn/DrmyHOP5G0l+32zl0/gTUjBGNt5jg==
X-Received: by 2002:adf:9b8f:0:b0:336:7bcd:3bdb with SMTP id
 d15-20020adf9b8f000000b003367bcd3bdbmr2224680wrc.11.1703629206362; 
 Tue, 26 Dec 2023 14:20:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b7-20020a5d45c7000000b00336c6b77584sm4432438wrs.91.2023.12.26.14.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 14:20:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 23:19:52 +0100
Message-ID: <20231226221952.2006884-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703629206; x=1704234006; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cCZ9t5wgpQjaMay729im7vi2OQETm8tTq1BZ17d98Kc=;
 b=U3X/3Ol5j2x3BVHZPOo5HNahfFZCQ6x0ls0oCAt87JYzTCgaOGJ0FVfp+D6+NPa4Ya
 9gE2zqL4NQ4SC5V4MsoIHBvOfHjDLNDgiAV12Ynkfa9U5wWbntAt30YnXv/35wnMzv9M
 ATLcXWL/9od7/2DJtg90ewuhYiZcMXKMtvzPo/tTIjk2R9FBGMThkOK5LPHrQ+D3Cy+W
 8hpsXvY0kUFlZ0ONyWRraAZuKDeEUudyPOFJBvC4rAQCaz/YkoB1eMRFr8McAeuFHKqz
 9zQ1sVHNwRCyQQLhGKpLhUzyWYBilGFQ+n7xuLACFBabPIxLO5+n3Ne5BDz0bXDl1Eaj
 p5/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U3X/3Ol5
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix wolfssl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following wolfssl build failure raised since commit
d6319d97a7864314088dcc6d1199f35029cfcecb:

-- Checking for one of the modules 'wolfssl'
CMake Error at lib/tls/CMakeLists.txt:79 (message):
  You must set LWS_WOLFSSL_LIBRARIES and LWS_WOLFSSL_INCLUDE_DIRS when
  LWS_WITH_WOLFSSL is turned on.

Fixes:
 - http://autobuild.buildroot.org/results/fe062b9f0b330e71309334d7605d64ea73761b59

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eLists.txt-fix-build-with-pkg-config.patch | 46 +++++++++++++++++++
 package/libwebsockets/libwebsockets.mk        |  2 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch

diff --git a/package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch b/package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
new file mode 100644
index 0000000000..06df61abf5
--- /dev/null
+++ b/package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
@@ -0,0 +1,46 @@
+From 786ec9231e402cd4e7621483be6f1837de724e3c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 26 Dec 2023 22:38:18 +0100
+Subject: [PATCH] lib/tls/CMakeLists.txt: fix build with pkg-config
+
+Fix the following wolfssl build failure raised since
+https://github.com/warmcat/libwebsockets/commit/079726c4b252e795b208209752077c1ae4504b5b:
+
+-- Checking for one of the modules 'wolfssl'
+CMake Error at lib/tls/CMakeLists.txt:79 (message):
+  You must set LWS_WOLFSSL_LIBRARIES and LWS_WOLFSSL_INCLUDE_DIRS when
+  LWS_WITH_WOLFSSL is turned on.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fe062b9f0b330e71309334d7605d64ea73761b59
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/tls/CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
+index 80b46203..230b0d29 100644
+--- a/lib/tls/CMakeLists.txt
++++ b/lib/tls/CMakeLists.txt
+@@ -72,12 +72,16 @@ if (LWS_WITH_SSL AND LWS_WITH_WOLFSSL)
+ 		include (FindPkgConfig)
+ 		PKG_SEARCH_MODULE(LWS_WOLFSSL wolfssl)
+ 
+-		if (NOT WOLFSSL_FOUND)
++		if (NOT LWS_WOLFSSL_FOUND)
+ 			if (LWS_WITH_CYASSL)
+ 				message(FATAL_ERROR "You must set LWS_CYASSL_LIBRARIES and LWS_CYASSL_INCLUDE_DIRS when LWS_WITH_CYASSL is turned on.")
+ 			else()
+ 				message(FATAL_ERROR "You must set LWS_WOLFSSL_LIBRARIES and LWS_WOLFSSL_INCLUDE_DIRS when LWS_WITH_WOLFSSL is turned on.")
+ 			endif()
++		else()
++			set(WOLFSSL_LIBRARIES ${LWS_WOLFSSL_LIBRARIES})
++			set(WOLFSSL_INCLUDE_DIRS ${LWS_WOLFSSL_INCLUDE_DIRS})
++			set(WOLFSSL_FOUND 1)
+ 		endif()
+ 	else()
+ 		set(WOLFSSL_LIBRARIES ${LWS_WOLFSSL_LIBRARIES})
+-- 
+2.43.0
+
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 86756ca612..daf481b3bc 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -42,7 +42,7 @@ LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=ON \
 	-DLWS_WITH_MBEDTLS=ON \
 	-DLWS_WITH_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 LIBWEBSOCKETS_DEPENDENCIES += host-pkgconf wolfssl
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=ON \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
