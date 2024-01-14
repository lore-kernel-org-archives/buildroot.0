Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C344C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 11:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D9EF4187F;
	Sun, 14 Jan 2024 11:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D9EF4187F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKBw2cKW5DBL; Sun, 14 Jan 2024 11:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A400541876;
	Sun, 14 Jan 2024 11:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A400541876
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 545711BF2A3
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CD5E41876
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD5E41876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAnZhNwQZLBv for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 11:16:29 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C936A41860
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 11:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C936A41860
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e68dc8c2fso14506805e9.2
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 03:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705230986; x=1705835786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KiVgJhQ/bro2eiv1+Rvx0dyyyMbsWWeNOBaY6FzN79s=;
 b=HBreU6IY2DmzW8eBjiuxrsiR1DHGPUH++bu0JAtHVqgJ8K9u3mdz+bcMH4HmrOdz+U
 EMVn6eOOegFRBqIAMinJVw4vPkwZrqzpVnSl14gwmBqglOeuKUPg/OOhhLuC/NBlBeU0
 fQdujZ5kGypu84paODwctxXwgnx6YXG0+YJD2LzwppF5qNvDAELx46MIwBhOZcwwvvIW
 OjuszHnLA3dDVpsslYFKf2UuAWf0NR+4J8sC51SMGQXlSGCA+k9CnabJ6r4OAoPYFD6E
 2w8Mfo+bpOakVGp7exRS2KYcn2tqlNz+CF2OtqnKcZ/5mAlFGeKIbjrEcmkueoene38I
 OYLw==
X-Gm-Message-State: AOJu0YxcbRujSU/BLXhyKD6Hvo7WiMGjvdTTN9fhC3n8LgPIEg3tAaoc
 R2Zx1jsmmVhHUJlf8Jy2pQYGhjbEtvk=
X-Google-Smtp-Source: AGHT+IG5uOS1/CcX8lzYWs9ZZhBmsSU+10ctORtdqvkyb9hXDY/a9HMPeyL97pS0hpBGHIlpqtl9aA==
X-Received: by 2002:a05:600c:993:b0:40e:69c0:4874 with SMTP id
 w19-20020a05600c099300b0040e69c04874mr1493311wmp.48.1705230985620; 
 Sun, 14 Jan 2024 03:16:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c351000b0040e4914f28dsm15952231wmq.18.2024.01.14.03.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 03:16:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 12:16:19 +0100
Message-ID: <20240114111619.310101-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705230986; x=1705835786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KiVgJhQ/bro2eiv1+Rvx0dyyyMbsWWeNOBaY6FzN79s=;
 b=jetxtPxXZPf1zmzXNaK6wLG/rV07sF1ZtTKpEHh4fitqz5i9IllHiYpqTp5Ksi9YYN
 mk0HkNE/14Io/JzRcuJnqjnmbNRP+chWqaCDV63UyB7+YryORPKAxGXtX5Um8Kn+Q6qv
 GK7pjzp6rWezcdJ5KKBlQw44/r0fshwG3T43be+rKpdjc4DjblyO27uoJGxV+d+UoVvg
 Tww1SH3bF8DLfhMYptt0+qY5gUMHM2WQhcv4cuzmuD09ctJC8NJF47AUILeSfbb7j4eE
 02YmB6oB8RN/gxl12PDa9/07fbqAwCpSkAiA4SXgD6O29dzVevRgar4ifZVkNRGPYSom
 AACA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jetxtPxX
Subject: [Buildroot] [PATCH 1/1] package/tinymembench: force arm mode
 instead of Thumb mode
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

While at it, drop patch which is not needed anymore. This patch has been
submitted in 2016: https://github.com/ssvb/tinymembench/pull/13. But
upstream seems dead (no commit since 2017).

Fixes:
 - http://autobuild.buildroot.org/results/1e359c294a8d71fb1833e5d04a6bc7d4fd533510
 - http://autobuild.buildroot.org/results/c06010d7a2bdb33a1707266133a3880e14be7657

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...ix-build-on-Thumb-only-architectures.patch | 47 -------------------
 package/tinymembench/tinymembench.mk          |  9 +++-
 3 files changed, 8 insertions(+), 49 deletions(-)
 delete mode 100644 package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch

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
deleted file mode 100644
index 88559ec012..0000000000
--- a/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 034a3552e9700c6d424bd706db106f5bce1f5a5e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 11 Nov 2016 21:49:39 +0100
-Subject: [PATCH] arm: fix build on Thumb-only architectures
-
-Building tinymembench for ARM Cortex-M currently fails, because the
-arm-neon.S file contains ARM code that doesn't build on Thumb-only
-architectures. To account for this and fix the build for Cortex-M,
-this patch adjusts the compile time condition to also verify that the
-architecture supports the ARM instruction set, by testing the
-__ARM_ARCH_ISA_ARM compiler define.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- arm-neon.S | 2 +-
- asm-opt.c  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arm-neon.S b/arm-neon.S
-index 4db78ce..19c30ad 100644
---- a/arm-neon.S
-+++ b/arm-neon.S
-@@ -21,7 +21,7 @@
-  * DEALINGS IN THE SOFTWARE.
-  */
- 
--#ifdef __arm__
-+#if defined(__arm__) && defined(__ARM_ARCH_ISA_ARM)
- 
- .text
- .fpu neon
-diff --git a/asm-opt.c b/asm-opt.c
-index 9da4596..eba1183 100644
---- a/asm-opt.c
-+++ b/asm-opt.c
-@@ -202,7 +202,7 @@ bench_info *get_asm_framebuffer_benchmarks(void)
-         return empty;
- }
- 
--#elif defined(__arm__)
-+#elif defined(__arm__) && defined(__ARM_ARCH_ISA_ARM)
- 
- #include "arm-neon.h"
- 
--- 
-2.7.4
-
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
