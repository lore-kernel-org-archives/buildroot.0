Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADF3C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 09:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A1A6835EF;
	Sat,  4 May 2024 09:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY76cWMZPntV; Sat,  4 May 2024 09:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5121983870
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5121983870;
	Sat,  4 May 2024 09:34:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36C621BF2BF
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 09:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 226754083B
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 09:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gg70NK_4Dpza for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 09:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B4784082E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4784082E
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B4784082E
 for <buildroot@buildroot.org>; Sat,  4 May 2024 09:34:52 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2dd6a7ae2dcso6867831fa.1
 for <buildroot@buildroot.org>; Sat, 04 May 2024 02:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714815290; x=1715420090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XGCe6+bolM4mpNsAjXowz468WuBuy0Qms/KJPWyTKTQ=;
 b=OKOd5jfzjKS4g1BV/yv+g872hsW2SXRuI3746Lc6KNHWm2g+dZBEr5kOq98jsDT03P
 p2lWE/R5J+WvVvqTq6fKwfyzuXTKeQuOovRJOG3Zaq2rAn6FekZG+Owxf7IPPEJ/HCuh
 jrjHKVlcEhOiLaUnnnpyQIXvVSaKzPygA3hM6igplrASNJbtaZOXBUfw/VJBCcd636xc
 cH24RP1Gzh13PAA9a1+UOZPJUiXslFyDLQgSwlX/sSb6tWUbsyzW31aLkdiflTPMqtaV
 oXF+WwygBBZGTCyrVoM10rgS9Uwqq4FBuOwazFy0Hi9n38pO6iU8+YmGY12MV+OcoZ5t
 ZwrQ==
X-Gm-Message-State: AOJu0YzneSnb4V8jpZftaOiumiHj0U9xzYlk0bkWZWps0U0C0FpdTfFy
 rIB8KCKA7lNHeu84ssm4J1ElkshhtFNCXWzDRIev87GgTr052opfCNks8w==
X-Google-Smtp-Source: AGHT+IFiTaujBbirq3Mh+Wa2ZopsPGX1XHyEt3Q1T1BBgHdkQelwPmuGsuLrzLxEgH5tGlTypHQtOQ==
X-Received: by 2002:a2e:a488:0:b0:2e1:a747:532d with SMTP id
 h8-20020a2ea488000000b002e1a747532dmr4442842lji.8.1714815289596; 
 Sat, 04 May 2024 02:34:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b004186f979543sm12508419wms.33.2024.05.04.02.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 02:34:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 11:34:46 +0200
Message-ID: <20240504093446.376426-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714815290; x=1715420090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XGCe6+bolM4mpNsAjXowz468WuBuy0Qms/KJPWyTKTQ=;
 b=GXL48IYoG/9zLcr1EzCt7zc047r0Uans4owoLd9R8D7H7sS/XYUV/gZVDkrtxEq0IC
 +5kzCes4APNJf97gOJzDLueIONchUAKYyzILbvW44GlX3tGxFTL4WfGytrdcLY9THDEG
 t6gyvIuJesurnHSu1xN3/QzIY+mJPSskbUm5ttF/3I6FoW6sWEMBEWrLOfDIpizyVZgZ
 yl7Pv1Ys7zyKhVl23aG6NRYYX7Edo2fI7z4Yf3v5VBJQvgyKJhksQl2st6Pb+xhPSRPQ
 W0Wpr5DPMPBDZn94s13O0CFnzEnxwHMBoaMVthbyAk8QlvoaCzBmIlieGP+VRV9ZD9qT
 CnKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GXL48IYo
Subject: [Buildroot] [PATCH 1/1] package/proj: needs NPTL
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
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NPTL is mandatory since bump to version 9.3.0 in commit
57aba033e6cc81b95d006227c45a15eb3fc77d07 and
https://github.com/OSGeo/PROJ/commit/ce080251225d16e11e139a5ebe07cf608fe022b2:

/home/buildroot/instance-0/output-1/build/proj-9.3.0/src/iso19111/factory.cpp: In member function 'std::shared_ptr<osgeo::proj::io::SQLiteHandle> osgeo::proj::io::SQLiteHandleCache::getHandle(const std::string&, PJ_CONTEXT*)':
/home/buildroot/instance-0/output-1/build/proj-9.3.0/src/iso19111/factory.cpp:622:9: error: 'pthread_atfork' was not declared in this scope; did you mean 'pthread_attr_t'?
  622 |         pthread_atfork(nullptr, nullptr,
      |         ^~~~~~~~~~~~~~
      |         pthread_attr_t

Fixes: 57aba033e6cc81b95d006227c45a15eb3fc77d07
 - http://autobuild.buildroot.org/results/392664375c5bc5f047d39bff31534a226e8ea526

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdal/Config.in       | 6 +++---
 package/libgeotiff/Config.in | 6 +++---
 package/postgis/Config.in    | 6 +++---
 package/proj/Config.in       | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 839a1bd7ea..6ee088ce0c 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GDAL
 	# configure can't find proj, when linking statically
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
-	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_GIFLIB
 	select BR2_PACKAGE_JPEG
@@ -25,8 +25,8 @@ config BR2_PACKAGE_GDAL
 
 	  https://gdal.org/
 
-comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
+comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, NPTL, wchar"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
index 7ed296fb25..f07c994361 100644
--- a/package/libgeotiff/Config.in
+++ b/package/libgeotiff/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBGEOTIFF
 	bool "libgeotiff"
 	depends on BR2_INSTALL_LIBSTDCPP # proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # proj
-	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_TIFF
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBGEOTIFF
 
 	  https://github.com/OSGeo/libgeotiff
 
-comment "libgeotiff needs a toolchain w/ C++, gcc >= 4.7, threads, wchar"
+comment "libgeotiff needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 78569d63be..593c0dc1f3 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	select BR2_PACKAGE_LIBGEOS
 	select BR2_PACKAGE_PROJ
@@ -17,6 +17,6 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
+comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
diff --git a/package/proj/Config.in b/package/proj/Config.in
index 1952fc7d9a..6d172e2ee9 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PROJ
 	bool "proj"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_SQLITE
 	help
@@ -14,7 +14,7 @@ config BR2_PACKAGE_PROJ
 
 	  http://proj4.org/
 
-comment "proj needs a toolchain w/ C++, gcc >= 4.7, threads, wchar"
+comment "proj needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
