Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DCDC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 15:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B88F83689;
	Thu, 29 Sep 2022 15:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B88F83689
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKeK3IK1Dxhi; Thu, 29 Sep 2022 15:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 631C3833A8;
	Thu, 29 Sep 2022 15:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 631C3833A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 225991BF973
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 15:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F26BC6079D
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 15:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26BC6079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_oIpp3uIyRc for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 15:28:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22BE8606F9
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 15:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BE8606F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FAA2864FF; Thu, 29 Sep 2022 15:28:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 17:28:31 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 7e7cf7aa7a4a41d4fcfd9a4667d4786078ae49e8
X-Git-Newrev: c9d37a004ed9ca814657dcb7e58882883851ae32
X-Patchwork-Hint: ignore
Message-Id: <20220929152839.0FAA2864FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/busybox: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9d37a004ed9ca814657dcb7e58882883851ae32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
