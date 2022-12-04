Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238D7C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 13:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF5F8145F;
	Sun,  4 Dec 2022 13:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF5F8145F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPybZSm_RtXm; Sun,  4 Dec 2022 13:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2BD2814B5;
	Sun,  4 Dec 2022 13:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2BD2814B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC421BF239
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 887A6814B5
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 887A6814B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1LTbzakfPAW for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 13:24:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9536B8145F
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 13:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9536B8145F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7832C854A5; Sun,  4 Dec 2022 13:24:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Dec 2022 14:16:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3341ceb1e58536cf43a4c000e4bb3cdbff3f6de5
X-Git-Newrev: bdc9f8a247309f1bf007a77576480091d20e2d1d
X-Patchwork-Hint: ignore
Message-Id: <20221204132446.7832C854A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scipy: fix sh4 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdc9f8a247309f1bf007a77576480091d20e2d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following sh4 build failure raised since the addition of the
package in commit e10431db29e08c3ae56c145165bf110bd17f2a6c:

INFO: sh4aeb-linux-gcc: scipy/special/_test_round.c
scipy/special/_test_round.c: In function '__pyx_pf_5scipy_7special_11_test_round_have_fenv':
scipy/special/_test_round.c:2353:30: error: 'FE_UPWARD' undeclared (first use in this function)
 2353 |     __pyx_t_1 = ((fesetround(FE_UPWARD) != 0) != 0);
      |                              ^~~~~~~~~

Retrieve debian patch as upstream doesn't want to fix this SH4 specific
issue: https://github.com/scipy/scipy/issues/15584

Fixes:
 - http://autobuild.buildroot.org/results/b82d8ed02ba5d094a0d4054e0de28e95c9d3554d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-scipy/0001-build-sh4-FE.patch | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/python-scipy/0001-build-sh4-FE.patch b/package/python-scipy/0001-build-sh4-FE.patch
new file mode 100644
index 0000000000..d50dd84462
--- /dev/null
+++ b/package/python-scipy/0001-build-sh4-FE.patch
@@ -0,0 +1,36 @@
+From aae8b63ddffe014e9353c3e8d2604628433eb7d7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 4 Dec 2022 14:14:21 +0100
+Subject: [PATCH] build sh4 FE
+
+ensures FE_UPWARD and FE_DOWNWARD are defined for sh4 architecture.
+
+Closes: #1007769.
+
+[Retrieved from:
+https://salsa.debian.org/python-team/packages/scipy/-/blob/master/debian/patches/build_sh4_FE.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ scipy/special/_round.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/scipy/special/_round.h b/scipy/special/_round.h
+index 013a25620..c321a1939 100644
+--- a/scipy/special/_round.h
++++ b/scipy/special/_round.h
+@@ -69,5 +69,12 @@ int fegetround()
+ 
+ #endif
+ 
++/* SH4 is not C99 compliant, see https://github.com/scipy/scipy/issues/15584 */
++#ifndef FE_UPWARD
++#define FE_UPWARD -1
++#endif
++#ifndef FE_DOWNWARD
++#define FE_DOWNWARD -1
++#endif
+ 
+ #endif /* _round.h */
+-- 
+2.38.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
