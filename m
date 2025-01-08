Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493C6E77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B0A81BCF;
	Wed,  8 Jan 2025 22:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQBIbyxq0PUO; Wed,  8 Jan 2025 22:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4547381B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4547381B70;
	Wed,  8 Jan 2025 22:06:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02DC07AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E39040302
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEw1FDJwkKe8 for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2808740309
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2808740309
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24F1A83F9A; Wed,  8 Jan 2025 22:05:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 22:45:50 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d1b481bf80eaca2197f511444b04a76430f70f60
X-Git-Newrev: 138e4b2d1409815dd0212ee04b91976477cf8470
X-Patchwork-Hint: ignore
Message-Id: <20250108220554.24F1A83F9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pixman: backport
 patch to fix inlining issue
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5971613773368533860=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5971613773368533860==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=138e4b2d1409815dd0212ee04b91976477cf8470
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

pixman fails to build with -Og or -O3 due to forced inlining
statements:

pixman-combine-float.c:370:5: error: inlining failed in call to 'always_inline' 'combine_soft_light_c': function not considered for inlining

The first occurence in the autobuilders is on May 12, 2024, but the
problem already existed before as we haven't updated pixman in a long
time. Therefore, the issue started occurring because we started
testing more random configurations.

Fixes:

  https://autobuild.buildroot.org/results/2f3df7961b3181d9eef79893439ae7ebbe4415ad/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 696de595e028daaec4d66792bb2d3db74c72f07e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...combine-float.c-fix-inlining-failed-error.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/pixman/0003-pixman-combine-float.c-fix-inlining-failed-error.patch b/package/pixman/0003-pixman-combine-float.c-fix-inlining-failed-error.patch
new file mode 100644
index 0000000000..1c4b153fc5
--- /dev/null
+++ b/package/pixman/0003-pixman-combine-float.c-fix-inlining-failed-error.patch
@@ -0,0 +1,56 @@
+From 643f098a3922592c82f3ea19668a1596d92a3e7b Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 16 Jul 2024 15:31:16 +0800
+Subject: [PATCH] pixman-combine-float.c: fix inlining failed error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Refer [1], always-inline is not suggested to be used if you have indirect
+calls. so replace force_inline with inline to fix error like:
+In function ‘combine_inner’,
+    inlined from ‘combine_soft_light_ca_float’ at ../pixman/pixman-combine-float.c:655:511:
+../pixman/pixman-combine-float.c:655:211: error: inlining failed in call to ‘always_inline’ ‘combine_soft_light_c’: function not considered for inlining
+
+Test with gcc-9 and gcc-14, both works well
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115679
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Upstream: https://gitlab.freedesktop.org/pixman/pixman/-/commit/643f098a3922592c82f3ea19668a1596d92a3e7b
+---
+ pixman/pixman-combine-float.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float.c
+index e1f8030..230164f 100644
+--- a/pixman/pixman-combine-float.c
++++ b/pixman/pixman-combine-float.c
+@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, float da)
+ }
+ 
+ #define MAKE_PD_COMBINERS(name, a, b)					\
+-    static float force_inline						\
++    static float							\
+     pd_combine_ ## name (float sa, float s, float da, float d)		\
+     {									\
+ 	const float fa = get_factor (a, sa, da);			\
+@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor,		ONE_MINUS_DA_OVER_SA,		ONE_MINUS_SA_OVER_DA)
+  */
+ 
+ #define MAKE_SEPARABLE_PDF_COMBINERS(name)				\
+-    static force_inline float						\
++    static float							\
+     combine_ ## name ## _a (float sa, float s, float da, float d)	\
+     {									\
+ 	return da + sa - da * sa;					\
+     }									\
+     									\
+-    static force_inline float						\
++    static float							\
+     combine_ ## name ## _c (float sa, float s, float da, float d)	\
+     {									\
+ 	float f = (1 - sa) * d + (1 - da) * s;				\
+-- 
+2.47.1
+

--===============5971613773368533860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5971613773368533860==--
