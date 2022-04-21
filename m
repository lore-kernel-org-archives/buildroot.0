Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A31C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E60B40A09;
	Thu, 21 Apr 2022 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qg6jHddfz1UU; Thu, 21 Apr 2022 18:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DC62409F3;
	Thu, 21 Apr 2022 18:01:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7F331C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2FE183F1A
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55N-jS-gqm2q for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B67F83148
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2193483F7D; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:31:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb952597c373ef11ea396df473c145a41adc742f
X-Git-Newrev: bd1dfdf69a9939039c0a45ed97fb96a600752db7
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.2193483F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd1dfdf69a9939039c0a45ed97fb96a600752db7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure when using an external zlib:

/home/autobuild/autobuild/instance-11/output-1/host/bin/i686-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0  -static -DHAVE_CONFIG_H -Wall -W -Wno-unused-parameter -static -o rsync flist.o rsync.o generator.o receiver.o cleanup.o sender.o exclude.o util.o util2.o main.o checksum.o match.o syscall.o log.o backup.o delete.o options.o io.o compat.o hlink.o token.o uidlist.o socket.o hashtable.o usage.o fileio.o batch.o clientname.o chmod.o acls.o xattrs.o progress.o pipe.o   params.o loadparm.o clientserver.o access.o connection.o authenticate.o lib/wildmatch.o lib/compat.o lib/snprintf.o lib/mdfour.o lib/md5.o lib/permstring.o lib/pool_alloc.o lib/sysacls.o lib/sysxattrs.o    -lz -lpopt -liconv
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-uclibc/9.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-11/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libz.a(deflate.c.o): in function `read_buf':
deflate.c:(.text+0xb93): multiple definition of `read_buf'; io.o:io.c:(.text+0x2bf4): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/488453197da880dda8f47b71ff302192bcbb6679

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...inking-with-a-zlib-with-external-read_buf.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
new file mode 100644
index 0000000000..0af090732c
--- /dev/null
+++ b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
@@ -0,0 +1,27 @@
+From 60dd42be603a79cd57cec076fe1680e9037be774 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Mon, 11 Apr 2022 08:29:54 -0700
+Subject: [PATCH] Handle linking with a zlib with external read_buf.
+
+[Retrieved from:
+https://github.com/WayneD/rsync/commit/60dd42be603a79cd57cec076fe1680e9037be774]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ rsync.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/rsync.h b/rsync.h
+index 4b30570b..e5aacd25 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -1172,6 +1172,10 @@ struct name_num_obj {
+ 	struct name_num_item list[10]; /* we'll get a compile error/warning if this is ever too small */
+ };
+ 
++#ifdef EXTERNAL_ZLIB
++#define read_buf read_buf_
++#endif
++
+ #ifndef __cplusplus
+ #include "proto.h"
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
