Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB1BC636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 14:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB4EF415FA;
	Sat, 11 Feb 2023 14:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB4EF415FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnuFUqENKYOZ; Sat, 11 Feb 2023 14:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89FA8416B5;
	Sat, 11 Feb 2023 14:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89FA8416B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDF7B1BF369
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 14:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8177416B5
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 14:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8177416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id In9Gyw_haOSM for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 14:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC19415FA
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AC19415FA
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 14:34:03 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id u10so5796825wmj.3
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 06:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jkugv0pgXLfV0KvGHWIRneCCv6uJYIgz1WN7ivdzam8=;
 b=NX18atE+o6xD+dsi16U1evoKenTURzIMWuLXP8Ytq8IXgiLTsEQK8xjS9MkmogXIrf
 JWvkTjBAqoaCH5WBz6kMXzPTpMHqlTDEQpkbPM1GMHkFcB8nw62n5DxLiPvZbZOJeT9o
 b0T5tqEPjLqgGIbU95YK+j1WXipd9LWXK3KtylBUortX8KDqhRbkrfije72mTzxkyMWc
 y8PTklXto797oHWpwCV4FFStYpWCcIJygf9vzpeAO7VbtWRhMZqVXbGAh1lLT+tcqgj3
 KRUYDTcD0O1z5/jrBn9sOz7Vpe0EANVDobVx6SJ4g922Wl1PTcHDVaVCF8vKHcIS1lop
 LCfA==
X-Gm-Message-State: AO0yUKWWhD5UsoqeLDVG3QtnfOgNYVeJpCQrc50dhWddUMkzT9D6vVVx
 RhBo8FBKUcNN03zcVbCUkHycx9Jng0U=
X-Google-Smtp-Source: AK7set+zU/5MyI9a/Eerp8WEd5GWM3uxrFHfATb4wWm5lbYiedchiafz8tH4t9uDh4i6U28LfBVBLg==
X-Received: by 2002:a05:600c:16d6:b0:3e1:541:2b55 with SMTP id
 l22-20020a05600c16d600b003e105412b55mr10875155wmn.16.1676126041142; 
 Sat, 11 Feb 2023 06:34:01 -0800 (PST)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003dc59d6f2f8sm8652879wmq.17.2023.02.11.06.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 06:34:00 -0800 (PST)
From: thomas@devoogdt.com
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 15:33:56 +0100
Message-Id: <20230211143356.173296-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/fluent-bit: bump to version 2.0.9
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

- Release Notes:

    https://fluentbit.io/announcements/v2.0.9/

- Patch dropped, as it is upstream:

    https://github.com/fluent/fluent-bit/commit/7bcb502ebdcd647d6b83c972805e734ad522eb1a

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 ...eLists.txt-only-require-a-C-compiler.patch | 27 -------------------
 package/fluent-bit/fluent-bit.hash            |  2 +-
 package/fluent-bit/fluent-bit.mk              |  2 +-
 3 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch

diff --git a/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch b/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch
deleted file mode 100644
index e71bcf0c0d..0000000000
--- a/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7bcb502ebdcd647d6b83c972805e734ad522eb1a Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Mon, 30 Jan 2023 09:10:37 +0100
-Subject: [PATCH] CMakeLists.txt: only require a C compiler
-
-Fluent-bit is mostly written in C,
-so don't require CXX in the top-level project.
-
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a7adb02de..3ff7360d8 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 3.12)
--project(fluent-bit)
-+project(fluent-bit C)
- 
- # CMP0069 ensures that LTO is enabled for all compilers
- cmake_policy(SET CMP0069 NEW)
--- 
-2.30.2
-
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index ce7cea7b59..0caadcd56f 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ff5566389033669feabc9c69a5c6f417dad5c8b066454388e6a706507262acf  fluent-bit-2.0.8.tar.gz
+sha256  393ad4a6ced48c327607653d610ef273843085a17b6e5c8013877abdf31e6945  fluent-bit-2.0.9.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 13077e53cc..c10ef613d7 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 2.0.8
+FLUENT_BIT_VERSION = 2.0.9
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
