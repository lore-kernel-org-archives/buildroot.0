Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F8ECE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 11:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29D3401D3;
	Sun, 24 Sep 2023 11:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29D3401D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGA0U2o36Z6b; Sun, 24 Sep 2023 11:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A04F6417DC;
	Sun, 24 Sep 2023 11:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04F6417DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4111BF33E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59DF360BE3
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59DF360BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEYJz_9Ixvqr for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 11:25:18 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A6EF60AE6
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 11:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A6EF60AE6
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-405361bba99so42102445e9.2
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 04:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695554716; x=1696159516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8c2EEVosjs7ekZZH1vu9z/mhmKeO7Ne4N9Rn8xFRC/4=;
 b=WI/uWkp5wJAbEEMEMLAxsCJykbU5B7blPgoW1dWLbmRrD0qVvEqOBQeVg6/zyxEpxl
 cReL9zmXYqleiboal85Un1QZmbm4wp2lWGpIOp7jQFveB7C96FtCIoBjGSyS4sWxX2jl
 URQuoo8B13vz3K3T71pf2bH3aXuoTctexr3HV1JWeC9xGE83ztFkUSGiFgrCvkL9ZUtJ
 ZiZgN35COpVeGOgJvs1PHjeFwouu56Ckrgg/ZQVd9Twzu0Nyksu9Ms3rpLvOImIuD+MU
 rY9sY0ulPnrR2GWYQ7rImgC3KQWS+dUrtr9379+aAWx/rVCj5QtcKfRiZub5lOqd/B9A
 YHJw==
X-Gm-Message-State: AOJu0Yx+2/dAMtcLaztMT6/TnmcRuMeDw++o5yFCRr1a6sfuCAzNELDk
 2tuHvWPZzeVhhQDzInSoaAAQYG0sV/o=
X-Google-Smtp-Source: AGHT+IEvlLRJSyTmLINz3GqeiAmBHD/hzCGh+dlWmzo2fSJeekoVucXWuvGgOnB3NzZ/ha1JS28U9g==
X-Received: by 2002:a05:600c:3781:b0:405:a30:151e with SMTP id
 o1-20020a05600c378100b004050a30151emr3242675wmr.12.1695554715374; 
 Sun, 24 Sep 2023 04:25:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c20d500b00403c8dde953sm12043771wmm.22.2023.09.24.04.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 04:25:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 13:25:12 +0200
Message-Id: <20230924112512.4611-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695554716; x=1696159516; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8c2EEVosjs7ekZZH1vu9z/mhmKeO7Ne4N9Rn8xFRC/4=;
 b=WmJTvbMyXwJdPU+YQzrzkKpfX2MerleagMWEyXcZy4Dk+F5S/Na1h5weXI2flB23zb
 h6WVjlZRJOdFA5VyIXe9p6PRuaUpk3b6KGMVfeXRUCz7vVyYXlZFsg/NknlaENPOIcGQ
 3KhVh+7Eju8IKA3QSBKWdkT6Sa04TdQZp+ZNmtvz7MZRVskcTWhZE+Ze/tvYIo0GF68y
 /C6JCRw//T2StnA6yKKBdCk2SnLwsP9QbPGa7Jfi5OUjENM3LqjE7qxCMm6OyjirsV//
 gloxGMKWrPnTUHj2nh45aNJd1Qv4S0okUnxo0YVs9t/m+CWub6BaCD8CCcQGH9wgIJxi
 c4Mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WmJTvbMy
Subject: [Buildroot] [PATCH 1/1] package/proj: bump to version 9.3.0
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to cmake-package as autotools has been removed since version
  9.0.0
- This bump will fix the following build failure with gcc 13 thanks to
  https://github.com/OSGeo/PROJ/pull/3459/commits/b0b8937c56ced8eb0ffef532b9c691a1a5fc8634:

In file included from proj_json_streaming_writer.cpp:34:
proj_json_streaming_writer.hpp:42:14: error: 'int64_t' in namespace 'std' does not name a type
   42 | typedef std::int64_t GIntBig;
      |              ^~~~~~~

https://github.com/OSGeo/PROJ/blob/9.3.0/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/68416dcbed1ece589a7438b085f57064fc20f87d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proj/proj.hash |  6 +++---
 package/proj/proj.mk   | 19 ++++++++++---------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 96d94e458e..22e6a43bf7 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-8.1.1.tar.gz.md5
-md5  f017fd7d35311b0d65b2cf0503844690  proj-8.1.1.tar.gz
+# Fetched from http://download.osgeo.org/proj/proj-9.3.0.tar.gz.md5
+md5  f1d70cb8873bb4429a03c437c65c41c4  proj-9.3.0.tar.gz
 # Locally calculated
-sha256  82f1345e5fa530c407cb1fc0752e83f8d08d2b98772941bbdc7820241f7fada2  proj-8.1.1.tar.gz
+sha256  91a3695a004ea28db0448a34460bed4cc3b130e5c7d74339ec999efdab0e547d  proj-9.3.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index bc924b41fb..0e913fa335 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 8.1.1
+PROJ_VERSION = 9.3.0
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
@@ -19,22 +19,23 @@ PROJ_CFLAGS += -O0
 PROJ_CXXFLAGS += -O0
 endif
 
-PROJ_CONF_ENV = \
-	CFLAGS="$(PROJ_CFLAGS)" \
-	CXXFLAGS="$(PROJ_CXXFLAGS)"
+PROJ_CONF_OPTS = \
+	-DBUILD_APPS=OFF \
+	-DCMAKE_C_FLAGS="$(PROJ_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(PROJ_CXXFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 PROJ_DEPENDENCIES += libcurl
-PROJ_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr/bin/curl-config
+PROJ_CONF_OPTS += -DENABLE_CURL=ON
 else
-PROJ_CONF_OPTS += --without-curl
+PROJ_CONF_OPTS += -DENABLE_CURL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 PROJ_DEPENDENCIES += tiff
-PROJ_CONF_OPTS += --enable-tiff
+PROJ_CONF_OPTS += -DENABLE_TIFF=ON
 else
-PROJ_CONF_OPTS += --disable-tiff
+PROJ_CONF_OPTS += -DENABLE_TIFF=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
