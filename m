Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE41FEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 18:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 685D0610C9;
	Fri, 21 Jul 2023 18:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 685D0610C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70z6fCLASljk; Fri, 21 Jul 2023 18:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD9E6070A;
	Fri, 21 Jul 2023 18:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BD9E6070A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 764381BF5B4
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55BED83B0F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55BED83B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nc9wdzncb1mP for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 18:47:51 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C5DE83B05
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 18:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C5DE83B05
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99357737980so351815366b.2
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 11:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689965269; x=1690570069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=03K0yQd5TC+R1336mkhJGlI1q4l8CmN22PD3KtvXBqg=;
 b=Xtwa3S46/+ulUvB57q5Qz5zRHG5S7Rd74tIYSX/ZaPbDyxSTvUl5Jr6Q+LMpS7kcHE
 2k8TMmWpNPVy+TVvphNDF+BX8UOmOp/LSIQp+YYsl/b/6Tx2Z0TYi1BDhk57dnw4/Ata
 Zp1zFF5mEvxGgkxhJGuccwjq2jJwi56ybxws+2+acbSZSaaX1g09QL9DNtfDK5cpKfwO
 Wke925eDxi5FSuQLCDNV6wCwpalbyiHbIpa7DWFClgXmB7S7kXJ64e88+Y9tblIHJ61z
 V3HxHU3cL4tclwgVTMaoq0DtUwexAl70OjeDbOmq437m8AmMogXuiC5XnwLQq72u489M
 QPqg==
X-Gm-Message-State: ABy/qLZuD2YpQ+5DvCu9yj40nT7Y0H3V03r+VkaYucpxwXk+XfC0eMvt
 Yx8BUMODOGjQL/0fK8GQbX1JOkZ9QOQ=
X-Google-Smtp-Source: APBJJlFFkq1orCur4tGGs2UISAQahxCJJCbLF4VSrZGHJVdwJf8dJYcBMwWZhaH/AAUqMJHoE1YVeA==
X-Received: by 2002:a17:906:224c:b0:993:e752:1a70 with SMTP id
 12-20020a170906224c00b00993e7521a70mr2634680ejr.19.1689965269210; 
 Fri, 21 Jul 2023 11:47:49 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 e27-20020a170906045b00b0098e38d2e584sm2523781eja.43.2023.07.21.11.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 11:47:48 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jul 2023 20:47:44 +0200
Message-Id: <20230721184744.819031-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689965269; x=1690570069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=03K0yQd5TC+R1336mkhJGlI1q4l8CmN22PD3KtvXBqg=;
 b=nEIkTpuBr07dyRSACXuIdjsMHOp3pp5P5ooP09ytn3RysHtN2EQJNdGqKsqBLlXiJi
 DzGGOx/rAQFxcugJiKfJ9EGLfMqzUqXqi/mSLF9JzWSJiIKsEuT9WCW6EaGSOLCPaVcT
 a9hjRSQdg7Vsix8OaRHOuWAtLQiUdqEq9t0yU9PJ8VumbUlY5NtPxIpWoJDehz/HrQsl
 XsvuVj52zC+zcE126o8w/VBe4ARt/wL4QwvMDZTF4k4jjOnjS8xPkZuNYpQVol/Q2NHx
 IyekSCk8Fhm4KNB3RIqJBe6l6uQEywpbNx0snTzccUvBzgsj6/7uTZC8MJ+jPDl5Ipuk
 R72w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nEIkTpuB
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.29.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-Update-for-more-minimal-builds.patch | 29 -------------------
 package/janet/janet.hash                      |  2 +-
 package/janet/janet.mk                        |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 package/janet/0001-Update-for-more-minimal-builds.patch

diff --git a/package/janet/0001-Update-for-more-minimal-builds.patch b/package/janet/0001-Update-for-more-minimal-builds.patch
deleted file mode 100644
index ba36a9beb..000000000
--- a/package/janet/0001-Update-for-more-minimal-builds.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 746ff5307d309536984b648460e7b5c5dac44453 Mon Sep 17 00:00:00 2001
-From: Calvin Rose <calsrose@gmail.com>
-Date: Sun, 12 Feb 2023 12:14:11 -0600
-Subject: [PATCH] Update for more minimal builds.
-
-[Retrieved (and backported) from:
-https://github.com/janet-lang/janet/commit/746ff5307d309536984b648460e7b5c5dac44453]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/core/ffi.c   | 4 ++++
- src/core/marsh.c | 2 ++
- 2 files changed, 6 insertions(+)
-
-diff --git a/src/core/ffi.c b/src/core/ffi.c
-index 45a498c7..b453f1f6 100644
---- a/src/core/ffi.c
-+++ b/src/core/ffi.c
-@@ -1311,7 +1311,11 @@ JANET_CORE_FN(cfun_ffi_jitfn,
-     size_t alloc_size = ((size_t) bytes.len + FFI_PAGE_MASK) & ~FFI_PAGE_MASK;
- 
- #ifdef JANET_FFI_JIT
-+#ifdef JANET_EV
-     JanetFFIJittedFn *fn = janet_abstract_threaded(&janet_type_ffijit, sizeof(JanetFFIJittedFn));
-+#else
-+    JanetFFIJittedFn *fn = janet_abstract(&janet_type_ffijit, sizeof(JanetFFIJittedFn));
-+#endif
-     fn->function_pointer = NULL;
-     fn->size = 0;
- #ifdef JANET_WINDOWS
diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 47e0de4a0..15eaafc48 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c95dab93e8e4ebcab5c293d5ee448fb43ab8bd2f6391fd66a6ca92fe1ec72c03  janet-1.26.0.tar.gz
+sha256  2ac3f69842f3e805a8d072a9e36f207f6287f063654c51cb3cd2b6e73b1cadf6  janet-1.29.1.tar.gz
 
 # Locally calculated
 sha256  95fca700e8dce9699248e7cc80ac88ce2357874c8352cd2be4d18f183dc9710b  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index db1eb2a5c..9c87ba79f 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.26.0
+JANET_VERSION = 1.29.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
