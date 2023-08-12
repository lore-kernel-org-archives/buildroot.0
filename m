Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B85EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2181540B82;
	Mon, 21 Aug 2023 20:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2181540B82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nH6sfy-0Ytx9; Mon, 21 Aug 2023 20:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5667140B61;
	Mon, 21 Aug 2023 20:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5667140B61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 141711BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA2104063C
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA2104063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Twky-QJRGstg for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7A2840B31
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A2840B31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3CBD86026; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 12:37:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 27dc49378071a82688d44a5cc592c0200b3991b4
X-Git-Newrev: fe42fa8017b10602ed57ee066f8a9710f0f8e7ca
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.D3CBD86026@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libedit: fix compile
 error with uClibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe42fa8017b10602ed57ee066f8a9710f0f8e7ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In Buildroot commit cc69dbf8fdef6619c4ea09a4aaa97cd5ad3ee423
("package/libedit: bump version to 20221030-3.1"), the version of
libedit was bumped from 20210910-3.1 to 20221030-3.1. This broke the
build with uClibc:

./sys.h:96:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?

Header file uses ssize_t so sys/types.h must be included.

This commit adds a patch that fixes this issue.

Fixes:

  http://autobuild.buildroot.net/results/439538b23776a58ff81c38754a19ee92c3590a1f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libedit/0002-add-sys-types_h.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/libedit/0002-add-sys-types_h.patch b/package/libedit/0002-add-sys-types_h.patch
new file mode 100644
index 0000000000..26aa906ee3
--- /dev/null
+++ b/package/libedit/0002-add-sys-types_h.patch
@@ -0,0 +1,15 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A only reachable via mail
+
+diff -Nur libedit-20221030-3.1.orig/src/sys.h libedit-20221030-3.1/src/sys.h
+--- libedit-20221030-3.1.orig/src/sys.h	2022-10-30 06:35:40.000000000 +0100
++++ libedit-20221030-3.1/src/sys.h	2023-08-12 09:52:28.137223311 +0200
+@@ -40,7 +40,7 @@
+ #ifndef _h_sys
+ #define	_h_sys
+ 
+-#if defined(HAVE_SYS_TYPES_H) && defined(__sun)
++#if defined(HAVE_SYS_TYPES_H)
+ #include <sys/types.h>
+ #endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
