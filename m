Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0B2C3ABB6
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 20:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CAD440511;
	Mon,  5 May 2025 20:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3mmjxcIBUOn; Mon,  5 May 2025 20:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA63F4073D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA63F4073D;
	Mon,  5 May 2025 20:05:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8AD020F9
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99B75404AD
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rvAWqK7JC_3 for <buildroot@buildroot.org>;
 Mon,  5 May 2025 20:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE17B40748
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE17B40748
 for <buildroot@buildroot.org>; Mon,  5 May 2025 20:05:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBF3B86494; Mon,  5 May 2025 20:05:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 May 2025 21:33:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18ecf1c64866e603ad8ff318d93e058b61263d78
X-Git-Newrev: 9a672635a1f6055a022084d45885a9078bbde0d0
X-Patchwork-Hint: ignore
Message-Id: <20250505200514.BBF3B86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: add upstream patch to fix musl
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
Content-Type: multipart/mixed; boundary="===============3641743015498545854=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3641743015498545854==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9a672635a1f6055a022084d45885a9078bbde0d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes the `S_IFMT` undeclared error in `statx.c` when musl
is used.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-fix-S_IFMT-undeclared-at-statx_c.patch    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/zfs/0001-fix-S_IFMT-undeclared-at-statx_c.patch b/package/zfs/0001-fix-S_IFMT-undeclared-at-statx_c.patch
new file mode 100644
index 0000000000..233118f7f6
--- /dev/null
+++ b/package/zfs/0001-fix-S_IFMT-undeclared-at-statx_c.patch
@@ -0,0 +1,36 @@
+From 8e9fcdac6f7bbc4ec92e89b8cdce1dcc404f1999 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
+ <salvador.joseluis@gmail.com>
+Date: Fri, 2 May 2025 08:10:08 +0200
+Subject: [PATCH] tests: fix `S_IFMT` undeclared at `statx.c`
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+`S_IFMT` is declared in `sys/stat.h`, but we cannot include this header
+because it redeclares the `statx` function with different argument
+types. Therefore, we define `S_IFMT` ourselves, in the same way as the
+other definitions.
+
+Closes: #17293
+
+Upstream: https://github.com/openzfs/zfs/commit/634c172ee89f5303493a75dc7ff55e0a355b503a
+Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
+---
+ tests/zfs-tests/cmd/statx.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/zfs-tests/cmd/statx.c b/tests/zfs-tests/cmd/statx.c
+index 89939f6efb40..1acc7e58c5ce 100644
+--- a/tests/zfs-tests/cmd/statx.c
++++ b/tests/zfs-tests/cmd/statx.c
+@@ -109,6 +109,9 @@ _statx(int fd, const char *path, int flags, unsigned int mask, void *stx)
+ #ifndef STATX_DIOALIGN
+ #define	STATX_DIOALIGN	(1<<13)
+ #endif
++#ifndef S_IFMT
++#define	S_IFMT 0170000
++#endif
+ 
+ typedef struct {
+ 	int64_t		tv_sec;

--===============3641743015498545854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3641743015498545854==--
