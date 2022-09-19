Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC04BC54EE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 11:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AF0083EC2;
	Mon, 19 Sep 2022 11:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF0083EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eprPl-T6nNwM; Mon, 19 Sep 2022 11:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6063D83E5D;
	Mon, 19 Sep 2022 11:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6063D83E5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CACE61BF3FB
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 11:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F89141864
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 11:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F89141864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0UyrWCOsFQzY for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 11:48:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22A0241854
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22A0241854
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 11:48:16 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id E93A4200003;
 Mon, 19 Sep 2022 11:48:13 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: 
Date: Mon, 19 Sep 2022 13:47:57 +0200
Message-Id: <20220919114757.1076737-1-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/busybox: fix CVE-2022-30065
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

This fixes CVE-2022-30065 by backporting a patch from the master branch.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

Cc'ing Peter for backport to stable releases
Only build tested

 ...wk-fix-use-after-free-CVE-2022-30065.patch | 52 +++++++++++++++++++
 package/busybox/busybox.mk                    |  3 ++
 2 files changed, 55 insertions(+)
 create mode 100644 package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch

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
 
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
