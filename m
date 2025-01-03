Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31572C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03EEE6FA70;
	Fri, 28 Feb 2025 16:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6wqfaBKrijG; Fri, 28 Feb 2025 16:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC8D16FAEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC8D16FAEA;
	Fri, 28 Feb 2025 16:49:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2BF68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C4542E8D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjMv6O1oq2Fs for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A716427E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A716427E8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 033DE87C34; Fri, 28 Feb 2025 16:29:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 3 Jan 2025 22:15:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 75d418b59d4ffe251ffcd49c06ccf0f1d0b86e04
X-Git-Newrev: 696de595e028daaec4d66792bb2d3db74c72f07e
X-Patchwork-Hint: ignore
Message-Id: <20250228162957.033DE87C34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pixman: backport patch
 to fix inlining issue
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
Content-Type: multipart/mixed; boundary="===============4093629148476165659=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4093629148476165659==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=696de595e028daaec4d66792bb2d3db74c72f07e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============4093629148476165659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4093629148476165659==--
