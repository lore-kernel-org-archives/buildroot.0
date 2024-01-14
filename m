Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57B5C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 13:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57A3B40466;
	Sun, 14 Jan 2024 13:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57A3B40466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9IXNYwnN36sP; Sun, 14 Jan 2024 13:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27CFD4054B;
	Sun, 14 Jan 2024 13:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27CFD4054B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12BDE1BF372
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 13:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECE0160AB1
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 13:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE0160AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0FWq3JRAB_1 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 13:54:52 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C687C60A9F
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 13:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C687C60A9F
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e779f030aso676145e9.0
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 05:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705240489; x=1705845289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j0dShVezCM7KQHKzaicxaNvThupGiLer31M6NSyJcdE=;
 b=OgXWsmAi9OyXySlTVCB8CuR6fYYEhnzte97oYlbcoXFcKkFDgNDb8VUKE32iFbIWa8
 zymmvJDbt/LCWpsPNFBx+i62SxesBCnhhes+CoIfxgugqK93+AFnlZa1bRnAo+Q4GWDm
 SqV0JUlScW6PuUw9FmYJhs80fIjY4ur9OThWrw760B/PCD94SJd9SoSOgO2IvEOubrA2
 GOO50KYo5kgmDGU7dcX5pqfirGGKSFfJNnT3oGJZn4prp9urhYdgWVZQkkMxToZ3uLOn
 mdRvEXsJZmrMpAsXVIvw8jzmRQReAEyz2ffT+K0TTPqMa6UenSj0pd6N9EmlktUSjOMj
 OiPg==
X-Gm-Message-State: AOJu0Yzyf42O74PQVHXyTRxqu26iSqfArFQkUyaS50+Wuqd0CuED92vT
 P2TtTvqMxSyYkqfva018YO5VOrYWn7U=
X-Google-Smtp-Source: AGHT+IF5ORl9gSjAJv0wEXZ5x57fP1jCMpFY4BQ1QSlKaa1PRa0AtmE/Jy+Zv7XrZDKhvfAreorqbQ==
X-Received: by 2002:a05:600c:4fcb:b0:40e:45c0:ad64 with SMTP id
 o11-20020a05600c4fcb00b0040e45c0ad64mr2039206wmq.14.1705240488573; 
 Sun, 14 Jan 2024 05:54:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b00336b8461a5esm9192303wrn.88.2024.01.14.05.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 05:54:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 14:54:46 +0100
Message-ID: <20240114135446.1156025-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705240489; x=1705845289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j0dShVezCM7KQHKzaicxaNvThupGiLer31M6NSyJcdE=;
 b=FlNSXZafPdWIBEVBMaShFSeA/SlFkNYtrh3IuYx+1MxQY3SGS8MyKM4gzaaN7MiepE
 kuKMPgfWu/oo0Ik+Pp/FweAFIxSwUn47aSRdUJ6zx2koW9BYHY9rLlTk0WG2UBeH1KqB
 OipHPMGatc1b4EOUZB7RY1hfaHwcRRqERrPoFja022HcqyYZEfudp4LVhsBzvfH8JxY0
 uINWfF/J9N5hyVbKLy0hldGrMcrXj39LwC+qDYEriXtf2mZz4u2+JYTQOaG0H8UBb3g5
 +GLcOa6eVUwOOlhkGMYCFv42/PFxuhI2P0OnV11XJNYqHvj28RpAxXppDNazTJRFIzUS
 Sprw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FlNSXZaf
Subject: [Buildroot] [PATCH v2,
 1/1] package/tinymembench: force arm mode instead of Thumb mode
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

Fix the following build failure in Thumb mode:

/tmp/ccaZHrla.s:40: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
/tmp/ccaZHrla.s:43: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
main.c:45: Error: selected processor does not support `mla r2,r10,r2,r5' in Thumb mode
main.c:46: Error: unshifted register required -- `and r8,r7,r2,lsr#16'
main.c:47: Error: selected processor does not support `mla r2,r10,r2,r5' in Thumb mode
main.c:48: Error: unshifted register required -- `and r9,r6,r2,lsr#8'
main.c:49: Error: selected processor does not support `mla r2,r10,r2,r5' in Thumb mode

While at it, add upstream tag to first patch

Fixes:
 - http://autobuild.buildroot.org/results/1e359c294a8d71fb1833e5d04a6bc7d4fd533510
 - http://autobuild.buildroot.org/results/c06010d7a2bdb33a1707266133a3880e14be7657

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Keep patch

 .checkpackageignore                                      | 1 -
 .../0001-arm-fix-build-on-Thumb-only-architectures.patch | 1 +
 package/tinymembench/tinymembench.mk                     | 9 ++++++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4051805c33..09a1bf35e0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1296,7 +1296,6 @@ package/tinyalsa/0001-include-time.h-before-asound.h.patch Upstream
 package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch Upstream
-package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch Upstream
 package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
diff --git a/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch b/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
index 88559ec012..cefa4e995f 100644
--- a/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
+++ b/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
@@ -11,6 +11,7 @@ architecture supports the ARM instruction set, by testing the
 __ARM_ARCH_ISA_ARM compiler define.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream: https://github.com/ssvb/tinymembench/pull/13
 ---
  arm-neon.S | 2 +-
  asm-opt.c  | 2 +-
diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
index 016d680ce7..bc84595e24 100644
--- a/package/tinymembench/tinymembench.mk
+++ b/package/tinymembench/tinymembench.mk
@@ -9,8 +9,15 @@ TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,v$(TINYMEMBENCH_VERSION))
 TINYMEMBENCH_LICENSE = MIT
 TINYMEMBENCH_LICENSE_FILES = LICENSE
 
+# tinymembench has some assembly function that is not present in Thumb mode:
+# Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+TINYMEMBENCH_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 define TINYMEMBENCH_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(TINYMEMBENCH_MAKE_OPTS) -C $(@D)
 endef
 
 define TINYMEMBENCH_INSTALL_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
