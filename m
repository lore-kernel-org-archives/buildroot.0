Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CA1C4332F
	for <buildroot@archiver.kernel.org>; Mon, 10 Oct 2022 08:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E8F41673;
	Mon, 10 Oct 2022 08:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9E8F41673
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ncjBpwJj1Uv; Mon, 10 Oct 2022 08:50:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7688E41625;
	Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7688E41625
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81FFA1BF40B
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 08:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D95D405D8
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 08:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D95D405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8aN-idGPiUiy for <buildroot@lists.busybox.net>;
 Mon, 10 Oct 2022 08:49:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2C6040241
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2C6040241
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 08:49:49 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id q18so2582293ils.12
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 01:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u7vpZ4NezRGYyowvR6u5I4/UHUEx0Y9SszsvALFWbG0=;
 b=pGfyj8PwF7NF85bE8EpMo68nFnuddK1wz9vYZplCWh1CBFLDZr5H1fQFs5FoQtqv7O
 /PmxyQ4qNNsUvvf/II3+u66A7GNt1tE5LcKEtIbNOte0m7HiS3Ec6PQijNZNJgrAVEBd
 NY93IVEaz+8RbWmrB47t4mBWl1oPe6S/WnOqfKEgJGlg/HH5z07isx+sMNknJTBA9jKw
 xMu9AlLbhfJwkBBHWMejtPwHpxhWExHme8ojjlqowf49GxNl/4+RP/zDMGf1XwDWZik2
 PuYWS1Hjy+rM9z1gx3Q1IViyJIhdekWufcrylY8gvOrd1HSzln2QfoWcDM8ymNTFrZIY
 SY9Q==
X-Gm-Message-State: ACrzQf2n+wXmPLGIzTlB2DSvoi9fF6igtYTCetZ225eWtFNSTqas+/aP
 UaBh2Js4/AMlvLjypg8OxWyldfisMzqAaQ==
X-Google-Smtp-Source: AMsMyM4NjKA1H3NM0G1lZQZH1uxPXDaXIUsUVVKEMwMG7CR9AhnorWt42UPgs0sWt8rALG8ypkKKbA==
X-Received: by 2002:a05:6e02:194b:b0:2fa:7219:34e2 with SMTP id
 x11-20020a056e02194b00b002fa721934e2mr8367532ilu.282.1665391788655; 
 Mon, 10 Oct 2022 01:49:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f4-20020a056e020c6400b002fadf9505b4sm2886311ilj.16.2022.10.10.01.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 01:49:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Oct 2022 02:49:44 -0600
Message-Id: <20221010084944.685684-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010084944.685684-1-james.hilliard1@gmail.com>
References: <20221010084944.685684-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7vpZ4NezRGYyowvR6u5I4/UHUEx0Y9SszsvALFWbG0=;
 b=ory9vAbhkjYqVS+pN/6Skct/NcITz/LlUyuZJD/HOzI6MufaVR5n3kdYRxxn+uOCaw
 7vPr56faw6wU4mbgRV/8pbMKcw/Ya6JcdVC+qo7xl4WX9cybnT2Jfrw6jz4J+V6hydio
 yctyGG4h1vHq97683KupY/C9CvXSz5K+auNn7AJpA60T6lSrA9T0uwJ+fsW0KkC8PS1/
 kNKhhVXZmJNifjUBQQt2AOGmM7vbwxwaXM73FqdqEp7Vwkkv7Cy1I2xEn5ZNARtDtFj0
 EFieBdUYm7pSmsHf0QLd+deoU2j+bt9g+Sa6ebFIVlUd7O/9Cw1A68e4PVKl5Jeiu0WG
 b7cQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ory9vAbh
Subject: [Buildroot] [PATCH 2/2] package/iwd: bump to version 1.30
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-src-storage.c-fix-build-with-uclibc.patch | 37 -------------------
 package/iwd/iwd.hash                          |  2 +-
 package/iwd/iwd.mk                            |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch

diff --git a/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch b/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
deleted file mode 100644
index 55fdaa86fd..0000000000
--- a/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 99e74ade2ea892e6d0b070bec1df6a135ce2c8b3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 25 Mar 2022 16:35:49 +0100
-Subject: [PATCH] src/storage.c: fix build with uclibc
-
-explicit_bzero is used in src/storage.c since commit
-01cd8587606bf2da1af245163150589834126c1c but src/missing.h is not
-included, as a result build with uclibc fails on:
-
-/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/storage.o: in function `storage_init':
-storage.c:(.text+0x13a4): undefined reference to `explicit_bzero'
-
-Fixes:
- - http://autobuild.buildroot.org/results/2aff8d3d7c33c95e2c57f7c8a71e69939f0580a1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://lists.01.org/hyperkitty/list/iwd@lists.01.org/thread/WB2XXRBUDHC5IVFDEOJBK23JHPURL427]
----
- src/storage.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/storage.c b/src/storage.c
-index 82a72443..aa8066b1 100644
---- a/src/storage.c
-+++ b/src/storage.c
-@@ -44,6 +44,7 @@
- #include <ell/ell.h>
- #include "ell/useful.h"
- 
-+#include "src/missing.h"
- #include "src/common.h"
- #include "src/storage.h"
- #include "src/crypto.h"
--- 
-2.35.1
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 1c34aa0a90..e7971cd637 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  3f138e03301beb2afc7b385a62f56db17059137857ab579f269c4e441783e760  iwd-1.25.tar.xz
+sha256  9fd13512dc27d83efb8d341f7df98f5488f70131686021fcd0d93fc97af013b8  iwd-1.30.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index fc10c5f1d4..4a818f0b82 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.25
+IWD_VERSION = 1.30
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
