Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1D6C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 13:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E708B82AB9;
	Mon,  8 Aug 2022 13:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E708B82AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9mncqAgNwAv; Mon,  8 Aug 2022 13:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBC978268F;
	Mon,  8 Aug 2022 13:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBC978268F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7771BF356
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 13:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6F5360E4F
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 13:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F5360E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxvB_UP-L5vb for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 13:31:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FECC60E67
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FECC60E67
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 13:31:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q30so10877589wra.11
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 06:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=rboVx9cFlIqUK0wbdPIV9FSz+WDBXhNfmB4fx35QKEg=;
 b=f0/zvA55tRYxwhSD3kEQOwW7QU3BMfTUPsZ83q/KDQXm7v7AqHM8SlUUYevt8ZMZam
 XvOnf7sniDRIpyYraaLgHP6kWuJ/93TORkkumBg6ATNnIczgRUhi58//nWr26+034lMD
 E5M7Mbt3KFtJ4F/D9c4SWljuXink4/x99zZ/UA6n5yuGXXIjedk+AKmP9kcQJ4ZIldvR
 iReB5759h9n4170uOw3cT1Mk8AeVS2CgZ76XP40O7LA8GDv1wWjUd59GxJduAQ4nxFpE
 dfDbJ7HOhz9RkrFqVlWhZjoL3hNZeC4/lmt2D/2NgdCYrH8Cfliqlqls5bFium/xKJw3
 3b+Q==
X-Gm-Message-State: ACgBeo1UldVfdANPkl4Rn6lOY4Ctbcp/8P+XHOieFTUsnkDSYFr41+8c
 G4qgMkPd7o/5XesWtq830bIoOqJC7Yk=
X-Google-Smtp-Source: AA6agR6FbYImOnpaQcsbxlfOZpsO3L/qdZ59jg7GbHhG3XB/WFPi7k1zRy8ml/FFN9rlGrUAlkAKVw==
X-Received: by 2002:a5d:6608:0:b0:21f:127d:6f8c with SMTP id
 n8-20020a5d6608000000b0021f127d6f8cmr11644920wru.75.1659965496610; 
 Mon, 08 Aug 2022 06:31:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d5290000000b0021e6c52c921sm13576265wrv.54.2022.08.08.06.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 06:31:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 15:31:22 +0200
Message-Id: <20220808133122.965563-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=rboVx9cFlIqUK0wbdPIV9FSz+WDBXhNfmB4fx35QKEg=;
 b=gyWvp1OAD7bjc2ojS4PnL/Xov48roX+R6g7z3/eDDAI0QgLWz/127sJm6pYiUdVov9
 R/1efz2eYkaEoDm+3TUZ7btj1cxAVxjTxjlYMU12S8RouDW0b/aKSyEK2xImjIjF4JMP
 7mvZI0Ys+LXWp4+mTVw2fe9DX9qDBa275XVuaZDBq1U0Qn+Aq+E34LTL3KXXUD8G3yI+
 QSJYtt7hnBS/+F78QXMiGfBCzgR71qD6BDCxqeSysCCigf31Jj8XLzFuGngzevuuiHFq
 cN7/+DoBNj8yROJ5JNs6Y3Fm9A/aDn7pI8eiEFThF2u4fQXrSYVJcCWAQR6NBPFRqKV+
 +1NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gyWvp1OA
Subject: [Buildroot] [PATCH 1/1] package/bayer2rgb-neon: replace second patch
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

Replace second patch by upstream patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
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
