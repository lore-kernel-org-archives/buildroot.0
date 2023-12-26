Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D32C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 997428130C;
	Tue, 26 Dec 2023 20:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 997428130C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgYe5YLRQXCl; Tue, 26 Dec 2023 20:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D683A81344;
	Tue, 26 Dec 2023 20:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D683A81344
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3B8D1BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9B9560B0D
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9B9560B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLP3c7M0ptUr for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:21:23 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E52B60AFE
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E52B60AFE
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so54513055e9.1
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 12:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703622081; x=1704226881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/i8bsnDSQxhosI1ea0nTYTsRTt7+vMofwqc3/qT7Oo=;
 b=a14+gUWwTVzGziBITZY14Fi9vzg5p/FVqjP4+uFxWUPthXxNM960b0WvYB6UhJZ9xM
 8eobzwOcvjRryEu8n4xEInji0pUao4AOst+zwTaW2dLJWCtk2ErKezIoAwQ+lXwOV3GH
 eKcHH/67J+F7CgEtA/236pLGPvVmoHj3sSf+AVGpsU5/vYm7+eO2xnDEbzOFdA+zHWSh
 y2nh3odCx7VSk5DhkgUTYeNwJvaPQqI7GUiWluuo26eW7ltcvro/rvPHWG/c52LpqXGk
 njBg9SagW10BHKoBhUM9+spYvxjoHgczeYl0lAlpWMJb9+5A/JRyq9PTERRzcvCBtY8Y
 ZLQA==
X-Gm-Message-State: AOJu0Yzf+DyNGMyExXsp3YEa0mj2b+de3oRR3HXc3usgNjzunvcPE9Ai
 qsdAQ4+kOWn3p/N/ORXqsznx8HtFQUg=
X-Google-Smtp-Source: AGHT+IHx62RZprHEZ15PiJVe8WheLXiG8yf4sLkkL5Y818vOD4ZIf5ySe8xoiWS71mrXV1S2wDUQWw==
X-Received: by 2002:a05:600c:2907:b0:40c:709:d924 with SMTP id
 i7-20020a05600c290700b0040c0709d924mr3998583wmd.147.1703622080460; 
 Tue, 26 Dec 2023 12:21:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b0040d4e1393dcsm14205284wmo.20.2023.12.26.12.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 12:21:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 21:21:16 +0100
Message-ID: <20231226202116.1108344-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703622081; x=1704226881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I/i8bsnDSQxhosI1ea0nTYTsRTt7+vMofwqc3/qT7Oo=;
 b=KQyW4a+61HSUfBSiebSTrrH3RIlin1casdtSaM9gwP9QpxIhGbrK/EG3mQwv6phWma
 abRh5JxoOLH2IgBy6vyPelcgjcFBRLthXaMm7ag6rR3UehlJYaJFThKgXbsKWTw1XPY8
 tsMt2/zhQ2ouwY/Zcj4VE6R5iCnK+5wKPqJbFeNN7uPT1nlGxqMbIljib3AosOyOre1Z
 eCJQzKNbhvrMgGfeQs2KDtzw03fql8n+lSgw789GxUghULwP+e8GS59qwbk4gauqJ2oh
 K5qTelAoh1u9l0JQR6LM31Fb/6ui6+kgeYcY1vIgYkWJXec5HlZVT/IOZSQAiSb9HLYm
 W4xQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KQyW4a+6
Subject: [Buildroot] [PATCH 1/1] package/shapelib: bump to version 1.6.0
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update hash of web/license.html because SPDX identifier is used since
  https://github.com/OSGeo/shapelib/commit/6bf68d3086f49245470fc24b121afbbeb8e9c4f2
- COPYING has been replaced by LICENSE-LGPL and LICENSE-MIT since
  https://github.com/OSGeo/shapelib/commit/1638416feefcee4a1eeef9aab573a5ce44be1f3e

https://github.com/OSGeo/shapelib/releases/tag/v1.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...Remove-double-free-in-contrib-shpsrt.patch | 26 -------------------
 package/shapelib/shapelib.hash                |  7 ++---
 package/shapelib/shapelib.mk                  |  7 ++---
 4 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 3100ceb43f..81f18211e8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1250,7 +1250,6 @@ package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch Upstream
 package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch Upstream
 package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch Upstream
 package/shairport-sync/S99shairport-sync Indent Shellcheck Variables
-package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch Upstream
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch Upstream
 package/shellinabox/0001-Makefile-disable-always-building-statically.patch Upstream
 package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch Upstream
diff --git a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch b/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
deleted file mode 100644
index a565874b8c..0000000000
--- a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c75b9281a5b9452d92e1682bdfe6019a13ed819f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Albin=20Eldst=C3=A5l-Ahrens?= <laeder.keps@gmail.com>
-Date: Mon, 3 Jan 2022 12:34:41 +0100
-Subject: [PATCH] Remove double free() in contrib/shpsrt, issue #39
-
-This fixes issue #39
-
-[Retrieved from:
-https://github.com/OSGeo/shapelib/commit/c75b9281a5b9452d92e1682bdfe6019a13ed819f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- contrib/shpsort.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/contrib/shpsort.c b/contrib/shpsort.c
-index e21e9e0..920cd8c 100644
---- a/contrib/shpsort.c
-+++ b/contrib/shpsort.c
-@@ -113,7 +113,6 @@ static char ** split(const char *arg, const char *delim) {
- 	free(result[--i]);
-       }
-       free(result);
--      free(copy);
-       return NULL;
-     }
-     result = tmp;
diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index b016fef5cf..f542ee79ac 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,4 +1,5 @@
 # Locally computed
-sha256  1fc0a480982caef9e7b9423070b47750ba34cd0ba82668f2e638fab1d07adae1  shapelib-1.5.0.tar.gz
-sha256  7eb803a70990017a1c4e38a8342d7413c5dfeec3ed1ac407e15ae2c274e560ff  COPYING
-sha256  a638278f7f1cb7d0cdc73b47a6c87261b882e356a8e79922e90d44d7ef1dd2c7  web/license.html
+sha256  19528b24377241705637320c367943031ad5088665d1fb0e1eaa52a71264a6c4  shapelib-1.6.0.tar.gz
+sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  LICENSE-LGPL
+sha256  67f1348ec73ef6343f0dbb3fa0612c321da4073e1ee68ffc99fcd3f2d2a65813  LICENSE-MIT
+sha256  15e1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb  web/license.html
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 37d2d9ae64..a36a65f80e 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-SHAPELIB_VERSION = 1.5.0
+SHAPELIB_VERSION = 1.6.0
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
-SHAPELIB_LICENSE_FILES = web/license.html COPYING
+SHAPELIB_LICENSE_FILES = LICENSE-LGPL LICENSE-MIT web/license.html
 SHAPELIB_CPE_ID_VENDOR = osgeo
 SHAPELIB_INSTALL_STAGING = YES
 
-# 0001-Remove-double-free-in-contrib-shpsrt.patch
-SHAPELIB_IGNORE_CVES += CVE-2022-0699
-
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
