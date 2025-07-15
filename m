Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A772DC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3350141165;
	Thu, 17 Jul 2025 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNEn-tWmpP0H; Thu, 17 Jul 2025 20:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FA1A413E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA1A413E7;
	Thu, 17 Jul 2025 20:33:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7FD1DE6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA39460A5C
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsI9psTcGB7t for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1708360790
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1708360790
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E19FA86682; Thu, 17 Jul 2025 20:32:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 22:48:29 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 2b23a3bc199ca3156713530d0a108b27bd11977b
X-Git-Newrev: 4cce71330e9496ba0c2c2b6e5a7c14e89db45525
X-Patchwork-Hint: ignore
Message-Id: <20250717203255.E19FA86682@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/parted: fix
 compilation with gcc-15
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cce71330e9496ba0c2c2b6e5a7c14e89db45525
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

With gcc 15-20241117 compile fails with the below error, update the
do_version declaration to match the header in command.h

../../parted/parted.c: In function '_init_commands':
../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
 2469 |         do_version,
      |         ^~~~~~~~~~
      |         |
      |         int (*)(void)
In file included from ../../parted/parted.c:28:
../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271

Fixes:
https://autobuild.buildroot.org/results/283f52d50ffef91d82a1bdc1f4dde1d54c5ffc23/build-end.log

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: reword commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 14b5a19486f80d06a4057092625309587737bebb)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...4-PATCH-parted-fix-do_version-declaration.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
new file mode 100644
index 0000000000..78709e07ad
--- /dev/null
+++ b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
@@ -0,0 +1,44 @@
+From 16343bda6ce0d41edf43f8dac368db3bbb63d271 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 12:22:22 +0000
+Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
+
+With gcc 15-20241117 compile fails with the below error, update the
+do_version declaration to match the header in command.h
+
+../../parted/parted.c: In function '_init_commands':
+../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
+ 2469 |         do_version,
+      |         ^~~~~~~~~~
+      |         |
+      |         int (*)(void)
+In file included from ../../parted/parted.c:28:
+../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
+   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
+      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Brian C. Lane <bcl@redhat.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ parted/parted.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parted/parted.c b/parted/parted.c
+index 3abb52f..fc2aeba 100644
+--- a/parted/parted.c
++++ b/parted/parted.c
+@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
+ }
+ 
+ static int
+-do_version ()
++do_version (PedDevice** dev, PedDisk** diskp)
+ {
+     printf ("\n%s\n%s",
+             prog_name,
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
