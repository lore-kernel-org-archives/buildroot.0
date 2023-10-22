Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DBDCDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 20:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13FF4401E1;
	Sun, 22 Oct 2023 20:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13FF4401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18fGoGrzL7ZX; Sun, 22 Oct 2023 20:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E35E740338;
	Sun, 22 Oct 2023 20:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E35E740338
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12AFB1BF8C7
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 20:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC2AA60AC0
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 20:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC2AA60AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urWFBAyv_LzG for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 20:24:40 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94D1060675
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 20:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D1060675
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507973f3b65so4046989e87.3
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 13:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698006278; x=1698611078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BV2etZyDWNB0f7NQ6EekszDnkD1QPyVwBLnEnkWMjf8=;
 b=KRHuhx+NivZ65ve6rBZhKRElnSajk4chpkG2rdIgIRn2pa0bxWGHvCPH4zo9+9bTmR
 rMTuGardt1ETB93S0hn56X7rEhFTQwhJX6JO00DoXoBVPGdrEJBJtQv8iGkHsxOhN+2F
 SdceTXeQZ9h3bN9pycusGsGd2XPUlA8p8h6SFhC3n0fIff/mDfFfXYS+NdiMKoaSw7+J
 NzmC5XH4JIlRyy+RIMS4khbEZVuqmJ7DuZ8BiW9y1wHRzIDKT36hvzuI9q8WPcRWdY2C
 QcL1wvP3A7jChwDd813LQQwon5hJTMUcHx1LPUFSK0Vu8NhzeNCNDijrI4T6exSlNzmS
 42nw==
X-Gm-Message-State: AOJu0YxxBYQMzalfeuHFldrdQsfyt45LnzYyjFsE4EClNQBeYt3TTbq3
 MN3r08ekypkPgleY5M+1Lxw0Em4XI5A=
X-Google-Smtp-Source: AGHT+IGB9AFQ+R7ZtdZdVR5Al4kmCBtIHctLVzoIisfJV4GgDTDqzxAxv7JyJDFubLWc4Xf2hB6iUQ==
X-Received: by 2002:ac2:46c6:0:b0:503:256a:80cc with SMTP id
 p6-20020ac246c6000000b00503256a80ccmr4702581lfo.42.1698006277669; 
 Sun, 22 Oct 2023 13:24:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o1-20020a5d6841000000b0031ad5fb5a0fsm6282888wrw.58.2023.10.22.13.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 13:24:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 22:24:33 +0200
Message-ID: <20231022202433.33149-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698006278; x=1698611078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BV2etZyDWNB0f7NQ6EekszDnkD1QPyVwBLnEnkWMjf8=;
 b=m9iq8R2iJ66zfxU7Q0RNmlYgEzv0ysjcO6tHtUTdp1ET4ormI600SJ+Wput25YX2Gi
 AQvXsLJPp0uKgcJxDTKa8LDc2Kh7m9CLHBsGbY1SFpezTAh5JPnVZDKJVKCoj+R3jJTN
 Zm4rWHCkVKWGZr2mNAOvyvqfIfNbBqd4lPElrvYvlS59bwyIb5NTboLl8wnYrgF2QCwI
 5eiNm3mzfd56C8KyeAYe9zLDdLP9o7NXA1ua0viUou6CcV0N/3PGLUw5S2m6tPbVq8eq
 G+cgnL3GEYl2EhtRvVKc8OeNf72N7XwuP2j1JP7pEZg3AmarJ+HI1ZDKhVrnnMhpc1mD
 UqAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m9iq8R2i
Subject: [Buildroot] [PATCH 1/1] package/reproc: fix build with gcc >= 13
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 13:

In file included from /home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/src/reproc.cpp:1:
/home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/include/reproc++/reproc.hpp:95:5: error: declaration of 'reproc::options::<unnamed struct> reproc::options::env' changes meaning of 'env' [-Wchanges-meaning]
   95 |   } env = {};
      |     ^~~
/home/buildroot/autobuild/instance-1/output-1/build/reproc-14.2.4/reproc++/include/reproc++/reproc.hpp:91:5: note: used here to mean 'class reproc::env'
   91 |     env::type behavior;
      |     ^~~

Fixes:
 - http://autobuild.buildroot.org/results/11feca3698154c255938ab3b25a34429135c31f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-reproc-Try-to-fix-gcc-13-build.patch | 37 +++++++++++++++++++
 package/reproc/0002-Fix-gcc-13-build.patch    | 28 ++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 package/reproc/0001-reproc-Try-to-fix-gcc-13-build.patch
 create mode 100644 package/reproc/0002-Fix-gcc-13-build.patch

diff --git a/package/reproc/0001-reproc-Try-to-fix-gcc-13-build.patch b/package/reproc/0001-reproc-Try-to-fix-gcc-13-build.patch
new file mode 100644
index 0000000000..22b21bcbc7
--- /dev/null
+++ b/package/reproc/0001-reproc-Try-to-fix-gcc-13-build.patch
@@ -0,0 +1,37 @@
+From 0b23d88894ccedde04537fa23ea55cb2f8365342 Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Sat, 18 Mar 2023 19:38:19 +0100
+Subject: [PATCH] reproc++: Try to fix gcc 13 build
+
+Upstream: https://github.com/DaanDeMeyer/reproc/commit/0b23d88894ccedde04537fa23ea55cb2f8365342
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ reproc++/include/reproc++/reproc.hpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/reproc++/include/reproc++/reproc.hpp b/reproc++/include/reproc++/reproc.hpp
+index ab6f1394..e883ecec 100644
+--- a/reproc++/include/reproc++/reproc.hpp
++++ b/reproc++/include/reproc++/reproc.hpp
+@@ -88,7 +88,7 @@ struct redirect {
+ 
+ struct options {
+   struct {
+-    env::type behavior;
++    enum env::type behavior;
+     /*! Implicitly converts from any STL container of string pairs to the
+     environment format expected by `reproc_start`. */
+     class env extra;
+@@ -97,9 +97,9 @@ struct options {
+   const char *working_directory = nullptr;
+ 
+   struct {
+-    redirect in;
+-    redirect out;
+-    redirect err;
++    struct redirect in;
++    struct redirect out;
++    struct redirect err;
+     bool parent;
+     bool discard;
+     FILE *file;
diff --git a/package/reproc/0002-Fix-gcc-13-build.patch b/package/reproc/0002-Fix-gcc-13-build.patch
new file mode 100644
index 0000000000..3e06a2a396
--- /dev/null
+++ b/package/reproc/0002-Fix-gcc-13-build.patch
@@ -0,0 +1,28 @@
+From 9f399675b821e175f85ac3ee6e3fd2e6056573eb Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Fri, 21 Apr 2023 19:36:45 +0200
+Subject: [PATCH] Fix gcc 13 build
+
+Upstream: https://github.com/DaanDeMeyer/reproc/commit/9f399675b821e175f85ac3ee6e3fd2e6056573eb
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ reproc++/include/reproc++/reproc.hpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/reproc++/include/reproc++/reproc.hpp b/reproc++/include/reproc++/reproc.hpp
+index b52f495e..7b614a94 100644
+--- a/reproc++/include/reproc++/reproc.hpp
++++ b/reproc++/include/reproc++/reproc.hpp
+@@ -88,10 +88,10 @@ struct redirect {
+ 
+ struct options {
+   struct {
+-    enum env::type behavior;
++    reproc::env::type behavior;
+     /*! Implicitly converts from any STL container of string pairs to the
+     environment format expected by `reproc_start`. */
+-    class env extra;
++    reproc::env extra;
+   } env = {};
+ 
+   const char *working_directory = nullptr;
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
