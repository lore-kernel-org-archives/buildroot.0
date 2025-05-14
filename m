Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED5BC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2D7D6130B;
	Fri, 16 May 2025 11:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojOZcikJTWZ7; Fri, 16 May 2025 11:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B69E561047
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B69E561047;
	Fri, 16 May 2025 11:22:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D9FA1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A71081266
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHegr9AHS2kI for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FD428128D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FD428128D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C84286A00; Fri, 16 May 2025 11:21:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 20:59:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ee918fbfea88a50573a6a0b860e1254b763485d9
X-Git-Newrev: 13dfeece138a3a24b84fa495d2a6cb62e32be160
X-Patchwork-Hint: ignore
Message-Id: <20250516112154.6C84286A00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/yasm: add patch
 for CVE-2021-33454
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=13dfeece138a3a24b84fa495d2a6cb62e32be160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes a potential NULL pointer dereference

As a side note, this package has many opened CVEs, but upstream doesn't seem
to really consider them as security issues, see their disclaimer here:
https://github.com/yasm/yasm/blob/master/SECURITY.md

We could speculate that this disclaimer has been written as a consequence of
the many small CVEs opened in a short time, that don't have a substantial
security impact (besides the command line tool crashing). All of these small
CVEs have been opened for bug reports issued by a third party who used a
fuzzy tester to manipulate the assembler input

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 875f5670aa93a2a8559666985299aee6019bd902)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...inter-dereference-in-yasm_expr_get_intnum.patch | 32 ++++++++++++++++++++++
 package/yasm/yasm.mk                               |  3 ++
 2 files changed, 35 insertions(+)

diff --git a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
new file mode 100644
index 0000000000..976c2f7a13
--- /dev/null
+++ b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
@@ -0,0 +1,32 @@
+From 48ced849ed621a05cec4c04d4567323af3a76e81 Mon Sep 17 00:00:00 2001
+From: dataisland <dataisland@outlook.com>
+Date: Fri, 15 Sep 2023 18:20:49 +0000
+Subject: [PATCH] Fix null-pointer-dereference in yasm_expr_get_intnum
+
+Fixes the following CVE:
+  - CVE-2021-33454: NULL pointer dereference in yasm_expr_get_intnum() in libyasm/expr.c
+
+For more info see:
+  - https://nvd.nist.gov/vuln/detail/CVE-2021-33454
+  - https://github.com/yasm/yasm/pull/244
+
+Upstream: https://github.com/yasm/yasm/pull/244
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libyasm/expr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libyasm/expr.c b/libyasm/expr.c
+index c2c868ede..6838eca56 100644
+--- a/libyasm/expr.c
++++ b/libyasm/expr.c
+@@ -1260,7 +1260,7 @@ yasm_expr_get_intnum(yasm_expr **ep, int calc_bc_dist)
+ {
+     *ep = yasm_expr_simplify(*ep, calc_bc_dist);
+ 
+-    if ((*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
++    if (*ep && (*ep)->op == YASM_EXPR_IDENT && (*ep)->terms[0].type == YASM_EXPR_INT)
+         return (*ep)->terms[0].data.intn;
+     else
+         return (yasm_intnum *)NULL;
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index cdb8e15bee..766d29df3b 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -10,6 +10,9 @@ YASM_LICENSE = BSD-2-Clause, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
 YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
 YASM_CPE_ID_VENDOR = tortall
 
+# 0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
+YASM_IGNORE_CVES += CVE-2021-33454
+
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
 # that are only of use on Microsoft Windows.
 define YASM_PRE_CONFIGURE_FIXUP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
