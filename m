Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DD8C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 13:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C54E40A07;
	Mon,  8 Aug 2022 13:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C54E40A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-0M6to3MEL9; Mon,  8 Aug 2022 13:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D00C409E2;
	Mon,  8 Aug 2022 13:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D00C409E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 264A11BF356
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 13:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 016EA60BF2
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 13:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 016EA60BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uv9jQHaRVAVb for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 13:33:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C22F360ABE
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C22F360ABE
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 13:33:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v3so10988209wrp.0
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 06:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=b/do3Y4NgZAnfhO8IcfqnvWUSH/aqbW4eOp9Bfd6vaA=;
 b=64CiWvb8fe9zMDPIskBhdeiyZyiD5rGyx0F+V8fz2QqWgNvyWWZZpwsT3g/68TraiB
 CyMCDqaVKHC27MdBcXuyukPepNGeTfMpIY0Lf+Nf7dkNOMZkQNKVpDA+kesysY4D1WEp
 uZFrv0hex9jHCq4+KcviBOqrVoB95INZDh42Ts/E2E2eQv3aA3PvslWelzyX2gCzNPAy
 yF7b2dR7E1L4DyQV8dGemQIzgdyEh+SPpWMOkUb+BDlHRhB2y5TKnlxNnNRcDo74F/4T
 0tbBVOQc1AVEOGpZ0Qn/Jb0ZyoUlhfUXVulnGKOMpwfseN6mDpnObwOgE8ei0MHI2w1F
 JHAA==
X-Gm-Message-State: ACgBeo3xwprLExAx+6dp2u10wPlQNoZ1UEQuLbmNZvCQ2KQr7ZdyoS+w
 9cEP/KkyRsEbLHlBYDW0eVPDoAUw48Q=
X-Google-Smtp-Source: AA6agR4zr6UO5tZddu0o19pPgXT0B9cf8s1Ic3Qq7w4C6Ju+Zl9pUklsZjD5P6UXbH0zByFNo+m+Xg==
X-Received: by 2002:a5d:5a99:0:b0:220:68c4:d7cb with SMTP id
 bp25-20020a5d5a99000000b0022068c4d7cbmr11259924wrb.565.1659965588693; 
 Mon, 08 Aug 2022 06:33:08 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a5-20020adffb85000000b0021e45afa7b0sm11163895wrr.109.2022.08.08.06.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 06:33:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 15:33:04 +0200
Message-Id: <20220808133304.965683-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=b/do3Y4NgZAnfhO8IcfqnvWUSH/aqbW4eOp9Bfd6vaA=;
 b=XqzBZvM0WqrejAxeQANIm9USU2p4IOWranqh0rNCy/u+x6CJEUN0TG4k0PMxntHbjO
 2faZjYpg4z3WOZ4TEobWA+toF6cgAh+kKym8jqmwXsD6XhuqjcSNeioC/CC/J3RgOFGh
 Hv6lMEMXjUiFiz9FoUcMfhvBjfdRmtHRPeTWvX3CBo9WECwLYv3LKJqOrYFNLRXRNKwb
 SSjKMf2Pjag/oJb8b3/aeqsFAy8SKZpCRrbioKLKzrhOUTBoVn/3SbDjyC3fM4ZlDOFY
 Vg3hZQEczlLxvWYluL/0LmZ44fH1069CfgkxcT/K4EtVbm7AJ6+QIJiMLb0VQa34GhvZ
 VD1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XqzBZvM0
Subject: [Buildroot] [PATCH v2,1/1] package/bayer2rgb-neon: replace patch
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace patch by upstream patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix title

 ...add-some-_always_inline_-annotations.patch | 75 +++++++++++++++++++
 ...-src-convert.c-remove-have_cplusplus.patch | 56 --------------
 2 files changed, 75 insertions(+), 56 deletions(-)
 create mode 100644 package/bayer2rgb-neon/0001-add-some-_always_inline_-annotations.patch
 delete mode 100644 package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch

diff --git a/package/bayer2rgb-neon/0001-add-some-_always_inline_-annotations.patch b/package/bayer2rgb-neon/0001-add-some-_always_inline_-annotations.patch
new file mode 100644
index 0000000000..281f90c875
--- /dev/null
+++ b/package/bayer2rgb-neon/0001-add-some-_always_inline_-annotations.patch
@@ -0,0 +1,75 @@
+From 4e5d8be1b0d18453b76fca2c5139222a071dd207 Mon Sep 17 00:00:00 2001
+From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+Date: Mon, 4 Jul 2022 12:05:30 +0200
+Subject: [PATCH] add some _always_inline_ annotations
+
+enforce inlining to fix build errors with '-Og'
+
+fixes #1
+
+Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+[Retrieved from:
+https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb/-/commit/4e5d8be1b0d18453b76fca2c5139222a071dd207]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/convert.c | 5 +++--
+ src/main.c    | 5 +++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index c852a14..ec77040 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -17,8 +17,9 @@
+ #include <stdbool.h>
+ #include <assert.h>
+ #include "bayer2rgb.h"
++#include "compiler.h"
+ 
+-static bool have_neon()
++inline static  _always_inline_ bool have_neon()
+ {
+ #ifdef HAVE_NEON
+ 	return true;
+@@ -27,7 +28,7 @@ static bool have_neon()
+ #endif
+ }
+ 
+-static bool have_cplusplus()
++inline static  _always_inline_ bool have_cplusplus()
+ {
+ #ifdef HAVE_CPLUSPLUS
+ 	return true;
+diff --git a/src/main.c b/src/main.c
+index 841a142..087e8e5 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -33,6 +33,7 @@
+ 
+ #include "src/bayer2rgb.h"
+ #include "src/bayer2rgb-cmdline.h"
++#include "src/compiler.h"
+ 
+ #define BPP_TO_BYTE(_bpp)	(((_bpp) + 7) / 8)
+ 
+@@ -68,7 +69,7 @@ struct x_image_out {
+ 	size_t			total_size;
+ };
+ 
+-inline static bool have_neon(void)
++inline static  _always_inline_ bool have_neon(void)
+ {
+ #ifdef HAVE_NEON
+ 	return true;
+@@ -77,7 +78,7 @@ inline static bool have_neon(void)
+ #endif
+ }
+ 
+-static bool have_cplusplus()
++inline static  _always_inline_ bool have_cplusplus()
+ {
+ #ifdef HAVE_CPLUSPLUS
+ 	return true;
+-- 
+GitLab
+
diff --git a/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch b/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch
deleted file mode 100644
index 71a6291a3c..0000000000
--- a/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ca68dadf585aadb8adf582cd94f8fcdd4592e09f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 26 Jun 2022 10:31:49 +0200
-Subject: [PATCH] src/convert.c: remove have_cplusplus
-
-Remove have_cplusplus function for simplicity and to avoid the following
-build failure:
-
-/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/10.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: ./.libs/libbayer2rgb3.so: undefined reference to `__bayer2rgb_missing_convert_dumb_implementation'
-
-Fixes:
- - http://autobuild.buildroot.org/results/69a637b7f1422ce2bf04dda573abb09388b9a02d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/convert.c | 19 +++++--------------
- 1 file changed, 5 insertions(+), 14 deletions(-)
-
-diff --git a/src/convert.c b/src/convert.c
-index c852a14..83d631d 100644
---- a/src/convert.c
-+++ b/src/convert.c
-@@ -27,25 +27,16 @@ static bool have_neon()
- #endif
- }
- 
--static bool have_cplusplus()
--{
--#ifdef HAVE_CPLUSPLUS
--	return true;
--#else
--	return false;
--#endif
--}
--
- void bayer2rgb_convert_dumb(struct image_in const *input,
- 			    struct image_out const *output,
- 			    struct image_conversion_info *info)
- {
-+#ifdef HAVE_CPLUSPLUS
-+	return bayer2rgb_convert_cc(input, output, info);
-+#else
- 	extern void __bayer2rgb_missing_convert_dumb_implementation();
--
--	if (have_cplusplus())
--		return bayer2rgb_convert_cc(input, output, info);
--	else
--		__bayer2rgb_missing_convert_dumb_implementation();
-+	__bayer2rgb_missing_convert_dumb_implementation();
-+#endif
- }
- 
- void bayer2rgb_convert(struct image_in const *input,
--- 
-2.35.1
-
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
