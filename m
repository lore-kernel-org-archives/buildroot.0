Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94421C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AAD780C7E;
	Mon, 29 Jul 2024 21:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zd4KhgGRTRwL; Mon, 29 Jul 2024 21:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4478380C8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4478380C8B;
	Mon, 29 Jul 2024 21:15:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5721BF426
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 068B0607FB
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEGbCTlPJolZ for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 21:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A50460760
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A50460760
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:14:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01776831CA; Mon, 29 Jul 2024 21:14:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 23:14:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bded368221e1aaf69a316565101e6ef109c49db
X-Git-Newrev: 1eeea445f803b6509205a244ad07b19fc72456fb
X-Patchwork-Hint: ignore
Message-Id: <20240729211459.01776831CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: add -D_GNU_SOURCE in
 liburing.pc.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=1eeea445f803b6509205a244ad07b19fc72456fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -D_GNU_SOURCE to CFLAGS as liburing.h doesn't define it anymore
since bump of liburing to version 2.6 in commit
da45ae33040a55d9eaa6a05c75c5e7f24fe73cf4 and
https://github.com/axboe/liburing/commit/c427ed678f39fd144d784f2e970bd8c52f425e14
resulting in the following musl build failure since the addition of
libdex in commit 70319b47f646f74f407ed3355baf5b581a10518a:

In file included from ../src/dex-uring-aio-backend.c:29:
/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:224:39: error: unknown type name 'cpu_set_t'
  224 |                                 const cpu_set_t *mask);
      |                                       ^~~~~~~~~
/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:1212:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
 1212 |                                        int fd, loff_t len)
      |                                                ^~~~~~
      |                                                off_t

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/276646bf224d5927cf0311cf978571a7f8774116

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...liburing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/liburing/0001-liburing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch b/package/liburing/0001-liburing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch
new file mode 100644
index 0000000000..8fec4015b2
--- /dev/null
+++ b/package/liburing/0001-liburing.pc.in-add-D_GNU_SOuRCE-to-Cflags.patch
@@ -0,0 +1,38 @@
+From 9485c21f8f36a78a754ccba3c4ce30867af9655d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 26 Jul 2024 09:13:16 +0200
+Subject: [PATCH] liburing.pc.in: add -D_GNU_SOuRCE to Cflags
+
+Add -D_GNU_SOURCE to Cflags to avoid the following musl build failure
+with applications using liburing (e.g. libdex) raised since version 2.6
+and c427ed678f39fd144d784f2e970bd8c52f425e14 which reverted
+c34070e08199491fe9653617364f4aea9b9b22be:
+
+In file included from ../src/dex-uring-aio-backend.c:29:
+/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:224:39: error: unknown type name 'cpu_set_t'
+  224 |                                 const cpu_set_t *mask);
+      |                                       ^~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:1212:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
+ 1212 |                                        int fd, loff_t len)
+      |                                                ^~~~~~
+      |                                                off_t
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/axboe/liburing/commit/9485c21f8f36a78a754ccba3c4ce30867af9655d
+---
+ liburing.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/liburing.pc.in b/liburing.pc.in
+index 2c879b2..790c22e 100644
+--- a/liburing.pc.in
++++ b/liburing.pc.in
+@@ -9,4 +9,4 @@ Description: io_uring library
+ URL: https://git.kernel.dk/cgit/liburing/
+ 
+ Libs: -L${libdir} -luring
+-Cflags: -I${includedir}
++Cflags: -I${includedir} -D_GNU_SOURCE
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
