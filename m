Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F69C25B5F
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CAF561431;
	Sat, 11 May 2024 06:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dT0e2UoAo1p; Sat, 11 May 2024 06:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2360361632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2360361632;
	Sat, 11 May 2024 06:57:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC2E1BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E90E78468E
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6L-PPkW6kZrE for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 224BE8468D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 224BE8468D
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:57:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 193E686E37; Sat, 11 May 2024 06:57:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 08:56:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29c6fe13d37ab1a3305005b42441a49afe4d1895
X-Git-Newrev: 8fa9ad7e4f2212e3ff934695eb36e9dc2cb9c2b8
X-Patchwork-Hint: ignore
Message-Id: <20240511065706.193E686E37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add patch to fix gcc 11 build
 warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fa9ad7e4f2212e3ff934695eb36e9dc2cb9c2b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building GCC 11 with GCC 14 the following error occurs

> ../../../libiberty/simple-object-mach-o.c:1231:17: error: passing argument 1 of 'set_32' from incompatible pointer type [-Wincompatible-pointer-types]

This was fixed upstream in GCC12[1]. It is applied to the GCC 11 release
branch[2], but has not been officially released yet.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=38757aa88735ab2e511bc428e2407a5a5e9fa0be
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=02cd761eb1198df50453b2e39653f48053609ffc

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0009-libiberty-Darwin-Fix-a-build-warning.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch b/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
new file mode 100644
index 0000000000..3c694a89fa
--- /dev/null
+++ b/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
@@ -0,0 +1,37 @@
+From d1fc3505cc09d0ee02abbb732eafc91967c3ac07 Mon Sep 17 00:00:00 2001
+From: Iain Sandoe <iain@sandoe.co.uk>
+Date: Mon, 23 Aug 2021 17:34:43 +0100
+Subject: [PATCH] libiberty, Darwin: Fix a build warning.
+
+r12-3005-g220c410162ebece4f missed a cast for the set_32 call.
+Fixed thus.
+
+Signed-off-by: Iain Sandoe <iain@sandoe.co.uk>
+
+libiberty/ChangeLog:
+
+	* simple-object-mach-o.c (simple_object_mach_o_write_segment):
+	Cast the first argument to set_32 as needed.
+
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=38757aa88735ab2e511bc428e2407a5a5e9fa0be
+Signed-off-by: Brandon Maier <brandon.maier@collins.com>
+---
+ libiberty/simple-object-mach-o.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libiberty/simple-object-mach-o.c b/libiberty/simple-object-mach-o.c
+index 72b69d19c21..a8869e7c639 100644
+--- a/libiberty/simple-object-mach-o.c
++++ b/libiberty/simple-object-mach-o.c
+@@ -1228,7 +1228,7 @@ simple_object_mach_o_write_segment (simple_object_write *sobj, int descriptor,
+       /* Swap the indices, if required.  */
+ 
+       for (i = 0; i < (nsects_in * 4); ++i)
+-	set_32 (&index[i], index[i]);
++	set_32 ((unsigned char *) &index[i], index[i]);
+ 
+       sechdr_offset += sechdrsize;
+ 
+-- 
+2.45.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
