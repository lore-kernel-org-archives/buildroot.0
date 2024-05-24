Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110D9C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB0AF833D3;
	Fri, 24 May 2024 12:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EjIJ16_m49S; Fri, 24 May 2024 12:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA048833FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA048833FB;
	Fri, 24 May 2024 12:55:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 018D61CF9AB
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E25C160B0E
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvtki60dT_Xf for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:55:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=alexander.i.mukhin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC99F605F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC99F605F4
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC99F605F4
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:55:25 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e6f33150bcso90761691fa.2
 for <buildroot@buildroot.org>; Fri, 24 May 2024 05:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716555323; x=1717160123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKYuXjquph8O/mRMVOMrwpzc5bxFrPCXJS8ZRol3Qo4=;
 b=qgQ6+Z1V2wQTkuAXkrP3DrLbK8ZnzQWoR1/xsKWXLBWxhf+rHev2KflLsPmvQf60Bc
 sRGtykNBoCSgeo7kGcQ8Qh3ehlDBxKhy6Gcp9/aRIzA9P/R/dB/2OcJrFv33zDUu1ONa
 017nQk0c+OWNgjgpg39bY+oW6YG1yODjDdNG0GkPZWtsTvdH3ee0yiSuMSfgRFxv2xw9
 GUIqGK+1eCNfywe5Bnt//0A3ZtB6iIo9dc4wVdGBPv2NQBf5A0atUcFPfMe4IXF6l8hF
 NDCZPgD5iAcikzfRv2z2jKpFMO/7X1HqpknSa/7ywJIBOe7YO0lXQTQHliyfylkYA2EP
 Dq3A==
X-Gm-Message-State: AOJu0YwWqJtjX2wLlQYHXBGio1BsK8KVaZT7YnuZqKGmjc+ooY9EOuKx
 h1zeTPnY7HEUCwqWsWLlRuJGsl4m8RICTp1p/h9xJFrPKxBGDYHQL4sWhQ==
X-Google-Smtp-Source: AGHT+IFp8weEegUx2p41/CjyOMFvouCxGFTgXNcW1fj1zA48rc6ffkpibWO8aXelGwNQKJZ62pwFRA==
X-Received: by 2002:a2e:9797:0:b0:2da:d2b8:ffb0 with SMTP id
 38308e7fff4ca-2e95b25ec58mr14161881fa.41.1716555322672; 
 Fri, 24 May 2024 05:55:22 -0700 (PDT)
Received: from hs.. ([213.87.144.54]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bdd228bsm1881581fa.78.2024.05.24.05.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 05:55:22 -0700 (PDT)
From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 15:54:48 +0300
Message-ID: <20240524125448.3566-1-alexander.i.mukhin@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716555323; x=1717160123; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LKYuXjquph8O/mRMVOMrwpzc5bxFrPCXJS8ZRol3Qo4=;
 b=UceTlffhfFa/EcXMtS4XEQOHTO7pqGBPH88eFyjBjsBuyh6Be9lw246REYprqJ9UKH
 NHSHvkl0aVeQ3CtqDu+LxQ+wApCBNQ+K+T4VH+Cy03YFs5zYZUU3GKvBM9G3s+XPm+pC
 eSs4P6a4HYD6VAIFgDlORzVrh9pPEd0ZmFC7h6NWGV8gcYFDA9Syk2EzeXTelFmjwH3g
 HekTRdQuEHWYOVqZRKoRGxHFodxwa0iAnW1yPW+atutk7i4GWR6Xzq8qvS+Xo0z1xXvR
 UV75P8PUVVN0HGrhAjt5oelvXkfaBKn2mg9EaMmgisMyUar6Zv+sTCgnQuFh58r0mjNI
 u5bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UceTlffh
Subject: [Buildroot] [PATCH 1/1] package/tinyproxy: bump version to 1.11.2
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
Cc: alexander.i.mukhin@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 ...up-in-error-page-in-invalid-requests.patch | 32 -------------------
 package/tinyproxy/tinyproxy.hash              |  4 +--
 package/tinyproxy/tinyproxy.mk                |  5 +--
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch

diff --git a/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch b/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
deleted file mode 100644
index da9c21a4..00000000
--- a/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3764b8551463b900b5b4e3ec0cd9bb9182191cb7 Mon Sep 17 00:00:00 2001
-From: rofl0r <rofl0r@users.noreply.github.com>
-Date: Thu, 8 Sep 2022 15:18:04 +0000
-Subject: [PATCH] prevent junk from showing up in error page in invalid
- requests
-
-fixes #457
-
-[Retrieved from:
-https://github.com/tinyproxy/tinyproxy/commit/3764b8551463b900b5b4e3ec0cd9bb9182191cb7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/reqs.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/reqs.c b/src/reqs.c
-index bce69819..45db118d 100644
---- a/src/reqs.c
-+++ b/src/reqs.c
-@@ -343,8 +343,12 @@ static struct request_s *process_request (struct conn_s *connptr,
-                 goto fail;
-         }
- 
-+        /* zero-terminate the strings so they don't contain junk in error page */
-+        request->method[0] = url[0] = request->protocol[0] = 0;
-+
-         ret = sscanf (connptr->request_line, "%[^ ] %[^ ] %[^ ]",
-                       request->method, url, request->protocol);
-+
-         if (ret == 2 && !strcasecmp (request->method, "GET")) {
-                 request->protocol[0] = 0;
- 
diff --git a/package/tinyproxy/tinyproxy.hash b/package/tinyproxy/tinyproxy.hash
index 84e98a84..8d4bb695 100644
--- a/package/tinyproxy/tinyproxy.hash
+++ b/package/tinyproxy/tinyproxy.hash
@@ -1,4 +1,4 @@
-# From https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.1
-sha512  2e3435bbfece3797c11ccce222eef494ed92e00dd82bea2c40a54e454b7e03c8abc8e09b244f2da7192209c39047369439d08974b79eebc996fb3095230d0374  tinyproxy-1.11.1.tar.xz
+# From https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.2
+sha512  008e43b770f946965d5a3fbad1881859e30b66a3a4a97cf9982e63d81139da7a8f23937601b72f32276166cd170008cafec9231b616fc840f05cae3c1329be35  tinyproxy-1.11.2.tar.xz
 # locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index e989f70a..6656a752 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-TINYPROXY_VERSION = 1.11.1
+TINYPROXY_VERSION = 1.11.2
 TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINYPROXY_VERSION)
 TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.xz
 TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
 TINYPROXY_CPE_ID_VALID = YES
 
-# 0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
-TINYPROXY_IGNORE_CVES += CVE-2022-40468
-
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
