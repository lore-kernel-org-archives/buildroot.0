Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF55C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 19:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50ECF80BE9;
	Thu,  6 Feb 2025 19:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k74uYwyiurHn; Thu,  6 Feb 2025 19:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47F8D84015
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47F8D84015;
	Thu,  6 Feb 2025 19:16:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9408AE2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77CE06FAD0
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ii9YeUUKEJe for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 19:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 416C56FAD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 416C56FAD8
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 416C56FAD8
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:16:19 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2166360285dso24733795ad.1
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 11:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738869378; x=1739474178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTYyzqJGbfOssg3veJV9/DZc+zpntanW4lPPgctarBg=;
 b=wwBGNWLTKjK12SZm8iKpUcJ2tKCRmQx8ogP1Hxn3a3nlPWb9XetPfYoSLzcfM6Qery
 PqUpSfE2o7fY+PaCAF4/vHa69lMmMHdxvOg0ozHmLA9lBiDShc3CuhlULaQMMxY/1L3y
 rP+IfHdVR+3Nd8pVAF12Wz4T92a1E/dqM5GFQpxzrn+B/0+Iu2Ml+odDrbdsTb6XGAy1
 UQmAB2Kr25eImz/3ZYss+y9x7B3GpK+4xBVEhiQEiz6VGt/xkm16Gd6LPYH5nYfW9+BX
 BBypkLhzXNkfMxr+Y1LxA0aXww1z91xZJSiUQEcq7MAutMhbvucZZYcHyMYDAGJfbesT
 khtA==
X-Gm-Message-State: AOJu0YzmtCaZgZTEikdWgXYIfkYvb2sOgVHEtJ9pxbsB51eVy0TdrQ69
 AJxfIWBHOzW4UqHBg2CwkGcjYcP68sanItXJx6v+sd56em6ezJtXXl0O5upR
X-Gm-Gg: ASbGncsIPG6fSthHxNmUClErVueW+506qUGuAo5J0dGvqvT+sGKk9HdtVNs7gVavBGw
 odenWJiWJJuGMS7cwHEwsnY0YKWSE53jFMPxXFYmPowN41OdyuBIyKWkN9ofurNhRyWyqCTE1aU
 oZtmzWsxTz5sKSlVgjR1QikDxQAfLHHNpWgd2O/lB883JYsgCWGJrVIwGq5mUAn+a0j9Pgy2Kyl
 Vpu93EUvpY+bygoUi+vKE9+Nne2p2UFLCs4XPYqspvMUB0yV7ZIq/N9KhGk0mqdolThg1iGaKZo
 cQx0ssJ53iSyp3y5BVZTne4e5AFATAM9Jzab7eXJ1Hp3+fMHZlwv4IHr7fTMJhDO/HoezarpMQc
 =
X-Google-Smtp-Source: AGHT+IG8JB4vX/oFeQD39hoPwEP5yxXt/OxUEdHr81jCvJpwVomad3Uu4BeYkO9gtecCQyoJFOU1/Q==
X-Received: by 2002:a17:903:2309:b0:21a:8382:fcbb with SMTP id
 d9443c01a7336-21f4e700f9bmr4093705ad.25.1738869378180; 
 Thu, 06 Feb 2025 11:16:18 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f368db022sm16416375ad.259.2025.02.06.11.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:16:17 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Feb 2025 11:16:13 -0800
Message-Id: <20250206191613.8492-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738869378; x=1739474178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nTYyzqJGbfOssg3veJV9/DZc+zpntanW4lPPgctarBg=;
 b=KaLOhAUk9DbUYep+RBucOr4yjWUxETNPnROlnUbPQbIdaGlmXq5bsM/4b7ZVnQr6wR
 +4bOQCQmEbn5JnCL33eaotkeR40si5uGVqaGE4zuAPkKTzJKNqcTI1ClrzvI0b1klSop
 EuXPITP8QbxAk9SlzyqkzNTGsdTvk+utraqKB677UHfesYdwJzDt3eetsbobYq6f7aZj
 7D/X8pox9o1OTY4olD1iIWX3zpTFtre+mIcdueHeIUpk5HewbxXlSlBEzzv+QzxzkyK2
 4JP5uI/VebazCg5ppYcYfp6CgWi6kL7pURzBadzPtYFdFZBAdbD5zCFZFP9ThNQqFbwx
 jEeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KaLOhAUk
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump to version
 8.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://curl.se/ch/8.12.0.html

Fixes the following security issues:
- CVE-2025-0167: netrc and default credential leak.
  https://curl.se/docs/CVE-2025-0167.html
- CVE-2025-0665: eventfd double close.
  https://curl.se/docs/CVE-2025-0665.html
- CVE-2025-0725: gzip integer overflow.
  https://curl.se/docs/CVE-2025-0725.html

Drop upstream patch - 0001-curl_trc-fix-build-with-verbose-messages-disabled.patch
see https://github.com/curl/curl/commit/80257779179ce994b647daca60d7b1c4980b130b

Updated hash of the COPYING file (copyright year bump)

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 ...build-with-verbose-messages-disabled.patch | 44 -------------------
 package/libcurl/libcurl.hash                  |  6 +--
 package/libcurl/libcurl.mk                    |  2 +-
 3 files changed, 4 insertions(+), 48 deletions(-)
 delete mode 100644 package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch

diff --git a/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch b/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch
deleted file mode 100644
index ffa44b87b6..0000000000
--- a/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 58d490091d097ba2ad108cc66c97e242e5aacb9c Mon Sep 17 00:00:00 2001
-Message-ID: <58d490091d097ba2ad108cc66c97e242e5aacb9c.1727153835.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 24 Sep 2024 07:52:13 +0300
-Subject: [PATCH] curl_trc: fix build with verbose messages disabled
-
-Add empty definition of Curl_trc_ws() to fix this following build error:
-
-In file included from sendf.h:29,
-                 from ws.c:35:
-ws.c: In function 'Curl_ws_accept':
-curl_trc.h:100:10: error: implicit declaration of function 'Curl_trc_ws'; did you mean 'Curl_trc_ftp'? [-Wimplicit-function-declaration]
-  100 |          Curl_trc_ws(data, __VA_ARGS__); } while(0)
-      |          ^~~~~~~~~~~
-ws.c:779:5: note: in expansion of macro 'CURL_TRC_WS'
-  779 |     CURL_TRC_WS(data, "WS, using chunk size %zu", chunk_size);
-      |     ^~~~~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Upstream: https://github.com/curl/curl/pull/15026
----
- lib/curl_trc.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/lib/curl_trc.h b/lib/curl_trc.h
-index 5f675b453fd3..1801d33cea7c 100644
---- a/lib/curl_trc.h
-+++ b/lib/curl_trc.h
-@@ -226,6 +226,12 @@ static void Curl_trc_smtp(struct Curl_easy *data, const char *fmt, ...)
-   (void)data; (void)fmt;
- }
- #endif
-+#if defined(USE_WEBSOCKETS) && !defined(CURL_DISABLE_HTTP)
-+static void Curl_trc_ws(struct Curl_easy *data, const char *fmt, ...)
-+{
-+  (void)data; (void)fmt;
-+}
-+#endif
- 
- #endif /* !defined(CURL_DISABLE_VERBOSE_STRINGS) */
- 
--- 
-2.45.2
-
diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index c2ddee2cc2..a79635ed21 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.11.1.tar.xz.asc
+# https://curl.se/download/curl-8.12.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  c7ca7db48b0909743eaef34250da02c19bc61d4f1dcedd6603f109409536ab56  curl-8.11.1.tar.xz
-sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
+sha256  9a4628c764be6b1a9909567c13e8e771041609df43b2158fcac4e05ea7097e5d  curl-8.12.0.tar.xz
+sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 845bf43418..56a5761d68 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.11.1
+LIBCURL_VERSION = 8.12.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
