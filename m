Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494A2C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC412400DD;
	Sat, 13 Jul 2024 12:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HYPQ1nI-fHd; Sat, 13 Jul 2024 12:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9799140105
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9799140105;
	Sat, 13 Jul 2024 12:03:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 330291BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20207605CA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6m5Nx7Y02Pe for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5209D605C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5209D605C9
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:03:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 378CE8640C; Sat, 13 Jul 2024 12:03:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 14:03:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7169c9412d11cb0ce22950ae726445018937a65d
X-Git-Newrev: a882426e37181cc36cd59c2a4fbf93d43fa975e4
X-Patchwork-Hint: ignore
Message-Id: <20240713120344.378CE8640C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zstd: fix build following bump to
 1.5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a882426e37181cc36cd59c2a4fbf93d43fa975e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit f7f2903f3ed88ef5c2f10171c93e90bd9ad5d83e, the zstd package
was bumped to 1.5.6. Since then, the zstd has been failing to build in
our autobuilders, causing over 1400+ build failures.

The issue turned out to be a one character typo introduced in an
upstream commit. This commit fixes that by introducing a patch, which
has been submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/df983da15a5918566c89a87038d0bdc6cb530485/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ....mk-fix-typo-in-the-definition-of-LIB_BIN.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/zstd/0001-lib-libzstd.mk-fix-typo-in-the-definition-of-LIB_BIN.patch b/package/zstd/0001-lib-libzstd.mk-fix-typo-in-the-definition-of-LIB_BIN.patch
new file mode 100644
index 0000000000..5fc930128a
--- /dev/null
+++ b/package/zstd/0001-lib-libzstd.mk-fix-typo-in-the-definition-of-LIB_BIN.patch
@@ -0,0 +1,47 @@
+From 4de25344f7c01f00d99bc467e76bc6f9b6971dd7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 13 Jul 2024 13:53:53 +0200
+Subject: [PATCH] lib/libzstd.mk: fix typo in the definition of LIB_BINDIR
+
+Commit f4dbfce79cb2b82fb496fcd2518ecd3315051b7d ("define LIB_SRCDIR
+and LIB_BINDIR") significantly reworked the build logic, but in its
+introduction of LIB_BINDIR a typo was made.
+
+It was introduced as such:
+
++LIB_SRCDIR ?= $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
++LIB_BINDIR ?= $(LIBSRC_DIR)
+
+But the definition of LIB_BINDIR has a typo: it should use
+$(LIB_SRCDIR) not $(LIBSRC_DIR).
+
+Due to this, $(LIB_BINDIR) is empty, therefore in programs/Makefile,
+-L$(LIB_BINDIR) is expanded to just -L, and consequently when trying
+to link the "zstd" binary with the libzstd library, it cannot find it:
+
+host/lib/gcc/powerpc64-buildroot-linux-gnu/13.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lzstd: No such file or directory
+
+This commit fixes the build by fixing this typo.
+
+Upstream: https://github.com/facebook/zstd/pull/4096
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ lib/libzstd.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/libzstd.mk b/lib/libzstd.mk
+index a308a6ef..c7ae2ff4 100644
+--- a/lib/libzstd.mk
++++ b/lib/libzstd.mk
+@@ -22,7 +22,7 @@ LIBZSTD_MK_INCLUDED := 1
+ 
+ # By default, library's directory is same as this included makefile
+ LIB_SRCDIR ?= $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
+-LIB_BINDIR ?= $(LIBSRC_DIR)
++LIB_BINDIR ?= $(LIB_SRCDIR)
+ 
+ # ZSTD_LIB_MINIFY is a helper variable that
+ # configures a bunch of other variables to space-optimized defaults.
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
