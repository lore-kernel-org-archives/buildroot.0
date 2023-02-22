Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C67C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 18:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE69A813C9;
	Wed, 22 Feb 2023 18:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE69A813C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idJkwR6hAXFv; Wed, 22 Feb 2023 18:13:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250A98139A;
	Wed, 22 Feb 2023 18:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 250A98139A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83B921BF334
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 18:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D7D940191
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 18:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D7D940191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDKTj8OYg5Gz for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 18:12:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C75540486
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C75540486
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 18:12:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so4172329wmi.3
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 10:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+goOlcvu7njiSnUFxp9lrUZja3M0CLxpDqZoCoDgET0=;
 b=6cgjOkCeieWazxzoPZKc5EktPFMiDiOsdAmpAom1Xua/pSU3RoO/mgp9lEIuelNrAr
 /OuytS79sR84mbUW983rnGsvmFyYK8FjL2mLllLumRFqCoPy0+gjmBbnR3Y/A9wQof5w
 ebk16cXjGRdQxl1jV7i3XlHezNeJ4MpVTyZwKlJ3/Wv5bmGHqHfqaUSfn8oER/L5ioAq
 ar9WhWdoxRLg39aie64q+r/PH0FJcxkx3DEe4EjTvxfo91+0cOEnv7sonQA60DcZpxNx
 ObHGm5Bbpwotayf1GcXom9oI35o2ObuS1zsLia4rdlNBk6NvX/WTTKA9Vl1L9gwTvMEJ
 o8Fg==
X-Gm-Message-State: AO0yUKUAleny6qmlab2PKqMOMeKZjLDZdy0JciugR3AmaDOgq2s3KdqB
 sxZItQduEZn+i0C6QREfp8dNpaGvQ1M=
X-Google-Smtp-Source: AK7set/iWnvDYyip55+nx8dGcE3t0eXFx+LC0kTXCi+3cogA/5iSM2cpVAggYsD+BXkhUG/YWcDyBg==
X-Received: by 2002:a05:600c:30d3:b0:3df:f7e7:5f01 with SMTP id
 h19-20020a05600c30d300b003dff7e75f01mr1621282wmn.15.1677089577093; 
 Wed, 22 Feb 2023 10:12:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c45ca00b003e8dcc67bdesm3413416wmo.30.2023.02.22.10.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:12:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 19:12:54 +0100
Message-Id: <20230222181254.2533041-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+goOlcvu7njiSnUFxp9lrUZja3M0CLxpDqZoCoDgET0=;
 b=fDjgRUPU3pIHJXXwv9CKmXh67u27YIEpKrSpXS4dJgDClX63X7UTq6YwCgvWmnhlES
 9iH3rwO+5Cg4bmYCdoe9F4yn4lCcFHsr4DNjxGPnuoNjWvAEaXEtvmIpUlbwapS2acFY
 tTqcU+/yGoR4mF+xvZfmrvCCtTwRGQDHwEZL/lhrgFeItFe19KPI6m/zGe+4SDBnLZfW
 y6Jk9hPrh2maPrLlFEv8ffg5Ov45NHb+KxYUSLhAqJfPaP9RQjjbBoBM2/mrJbXWm/es
 /zpJDoltdCgBoujChKJU5zmdK1DZdQ7JsLjK38DgWdHJI+8DqHeUjfoMeFORjGeEyQM3
 F1fQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fDjgRUPU
Subject: [Buildroot] [PATCH 1/1] package/xerces: drop patch
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

Drop patch which is not needed since commit
62cab101356c97432da482e168adaf065de65c4f. This patch is actually raising
a build failure since bump to version 3.2.4 in commit
d2d8f146a9f0ed3b66c4dd470bb76efdbb630a75 and
https://github.com/apache/xerces-c/commit/af1935b567c18c8b2de71d6ea97239be60876335:

CMake Error at src/CMakeLists.txt:1271 (add_library):
  Target "xerces-c" links to target "CURL::libcurl" but the target was not
  found.  Perhaps a find_package() call is missing for an IMPORTED target, or
  an ALIAS target is missing?

Fixes:
 - http://autobuild.buildroot.org/results/c62856a5eeb34714f26235b2d6f8adc4ea612686

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-static-linking-with-curl.patch   | 39 -------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 package/xerces/0001-fix-static-linking-with-curl.patch

diff --git a/package/xerces/0001-fix-static-linking-with-curl.patch b/package/xerces/0001-fix-static-linking-with-curl.patch
deleted file mode 100644
index db38de79fc..0000000000
--- a/package/xerces/0001-fix-static-linking-with-curl.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 26e3f1440bbc75c704fc93ff43a2abbfbe4c0203 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 11 Oct 2018 22:56:50 +0200
-Subject: [PATCH] fix static linking with curl
-
-When curl is statically built with openssl support, xerces needs to
-link with openssl libraries so use pkg_check_modules to get any
-needed dependencies
-
-Fixes:
- - http://autobuild.buildroot.org/results/29ca90fff2c8e38f2edf7240eca3aa3fe7397c45
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cmake/XercesNetAccessorSelection.cmake | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/XercesNetAccessorSelection.cmake b/cmake/XercesNetAccessorSelection.cmake
-index 7a63f1f6b..e90fcf034 100644
---- a/cmake/XercesNetAccessorSelection.cmake
-+++ b/cmake/XercesNetAccessorSelection.cmake
-@@ -31,7 +31,13 @@ if(network)
- 
-   # Requires select() which is UNIX only
-   if(UNIX)
--    find_package(CURL)
-+    find_package(PkgConfig)
-+    if (PkgConfig_FOUND)
-+      pkg_check_modules(CURL libcurl)
-+      if (NOT CURL_FOUND)
-+        find_package(CURL)
-+      endif()
-+    endif()
-     if(CURL_FOUND)
-       list(APPEND netaccessors curl)
-     endif()
--- 
-2.17.1
-
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
