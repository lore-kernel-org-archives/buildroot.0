Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA93C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 15:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DFB641092;
	Thu, 29 Sep 2022 15:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DFB641092
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeFJ5X9aV9xx; Thu, 29 Sep 2022 15:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05B5C41085;
	Thu, 29 Sep 2022 15:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05B5C41085
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2275D1BF334
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 15:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F7FD408E6
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 15:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F7FD408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1z1Nv6guk9v for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 15:30:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E3B2408E9
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 15:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E3B2408E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F005286512; Thu, 29 Sep 2022 15:30:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 17:28:50 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ef6101b71db28d540249520a20892e2966d2c2ff
X-Git-Newrev: 5ab33da19e17a59904e00e2cc75d1423da4793ec
X-Patchwork-Hint: ignore
Message-Id: <20220929153000.F005286512@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/busybox: fix
 CVE-2022-30065
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ab33da19e17a59904e00e2cc75d1423da4793ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This fixes CVE-2022-30065 by backporting a patch from the master branch.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c367b2dc867a99d7f5d3579d4a67112e80197f1d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...003-awk-fix-use-after-free-CVE-2022-30065.patch | 52 ++++++++++++++++++++++
 package/busybox/busybox.mk                         |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch b/package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch
new file mode 100644
index 0000000000..f9bfee328e
--- /dev/null
+++ b/package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch
@@ -0,0 +1,52 @@
+From e06b1f0839972cc3f5b432849d574d14a8f17613 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Fri, 17 Jun 2022 17:45:34 +0200
+Subject: [PATCH] awk: fix use after free (CVE-2022-30065)
+
+fixes https://bugs.busybox.net/show_bug.cgi?id=14781
+
+function                                             old     new   delta
+evaluate                                            3343    3357     +14
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Backport: https://git.busybox.net/busybox/commit/?id=e63d7cdfdac78c6fd27e9e63150335767592b85e
+[straightforward conflict resolution in testsuite/awk.tests]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ editors/awk.c       | 3 +++
+ testsuite/awk.tests | 6 ++++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index f6314ac72..654cbac33 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -3114,6 +3114,9 @@ static var *evaluate(node *op, var *res)
+ 
+ 		case XC( OC_MOVE ):
+ 			debug_printf_eval("MOVE\n");
++			/* make sure that we never return a temp var */
++			if (L.v == TMPVAR0)
++				L.v = res;
+ 			/* if source is a temporary string, jusk relink it to dest */
+ 			if (R.v == TMPVAR1
+ 			 && !(R.v->type & VF_NUMBER)
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index bcaafe8fd..156aa65eb 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -469,4 +469,10 @@ testing 'awk printf %% prints one %' \
+ 	"%\n" \
+ 	'' ''
+ 
++testing 'awk assign while test' \
++	"awk '\$1==\$1=\"foo\" {print \$1}'" \
++	"foo\n" \
++	"" \
++	"foo"
++
+ exit $FAILCOUNT
+-- 
+2.37.3
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 920f55c7fc..0f887c9734 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -11,6 +11,9 @@ BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
 BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 BUSYBOX_CPE_ID_VENDOR = busybox
 
+# 0003-awk-fix-use-after-free-CVE-2022-30065.patch
+BUSYBOX_IGNORE_CVES += CVE-2022-30065
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
