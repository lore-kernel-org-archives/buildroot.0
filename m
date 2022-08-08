Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EC0C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 882E840979;
	Mon,  8 Aug 2022 20:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882E840979
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNJOVhW7Yjyc; Mon,  8 Aug 2022 20:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C98FA4097A;
	Mon,  8 Aug 2022 20:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C98FA4097A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41ADC1BF283
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21E70812FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E70812FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6m5JJrXRMDK for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:48:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F0B2812C1
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F0B2812C1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E5A6D8386E; Mon,  8 Aug 2022 20:34:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 22:48:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f3115b2ca9fbdcf7a4e02aba45104f2d423fdb8
X-Git-Newrev: 95507a3ea712901694cb65132b42529cf4913d59
X-Patchwork-Hint: ignore
Message-Id: <20220808203433.E5A6D8386E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: replace patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=95507a3ea712901694cb65132b42529cf4913d59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace patch by upstream patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-add-some-_always_inline_-annotations.patch | 75 ++++++++++++++++++++++
 .../0001-src-convert.c-remove-have_cplusplus.patch | 56 ----------------
 2 files changed, 75 insertions(+), 56 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
