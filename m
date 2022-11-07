Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F761C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A39460BF1;
	Mon,  7 Nov 2022 22:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A39460BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BXr4bf2J1on; Mon,  7 Nov 2022 22:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4460B60B30;
	Mon,  7 Nov 2022 22:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4460B60B30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B77501BF954
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 938EC60742
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938EC60742
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1rXyLn41goO for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAF58606E6
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF58606E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 994F1880D0; Mon,  7 Nov 2022 22:10:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:09:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68c143419336139fcf5dccd8289f410be4285550
X-Git-Newrev: 21747875f90cb3345b6927ded9fffb7582cf06a1
X-Patchwork-Hint: ignore
Message-Id: <20221107221006.994F1880D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkcapi: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=21747875f90cb3345b6927ded9fffb7582cf06a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since bump to version
1.4.0 in commit 06a9dc3528847ec6c12a9b6188d4106e086eabe5 and
https://github.com/smuellerDD/libkcapi/commit/12f19b9a1dd308117f83e8cb33e28e3c040710a0:

lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
lib/kcapi-kernel-if.c:196:26: error: conversion to 'int' from 'size_t' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
  196 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
      |                          ^~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/eccf4b84670b5ef0fdd68b46338edf5043c7cc0d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-lib-kcapi-kernel-if.c-fix-uclibc-build.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch b/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch
new file mode 100644
index 0000000000..818150dafb
--- /dev/null
+++ b/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch
@@ -0,0 +1,55 @@
+From 4d9bbc866682bdf46c78047dca02230372620295 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 6 Nov 2022 17:05:14 +0100
+Subject: [PATCH] lib/kcapi-kernel-if.c: fix uclibc build
+
+Fix the following uclibc build failure raised since version 1.4.0 and
+https://github.com/smuellerDD/libkcapi/commit/12f19b9a1dd308117f83e8cb33e28e3c040710a0:
+
+lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
+lib/kcapi-kernel-if.c:196:26: error: conversion to 'int' from 'size_t' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
+  196 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
+      |                          ^~~~~~~~~~~~~~~~~~
+
+Indeed, uclibc has the same behavior than musl when __WORDSIZE != 32
+even if it defines __GLIBC__:
+https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e887182948f627be/libc/sysdeps/linux/common/bits/socket.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eccf4b84670b5ef0fdd68b46338edf5043c7cc0d
+
+Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+[Retrieved from:
+https://github.com/smuellerDD/libkcapi/commit/4d9bbc866682bdf46c78047dca02230372620295]
+---
+ lib/kcapi-kernel-if.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
+index d7b10bf..b4d7f74 100644
+--- a/lib/kcapi-kernel-if.c
++++ b/lib/kcapi-kernel-if.c
+@@ -119,7 +119,7 @@ int _kcapi_common_accept(struct kcapi_handle *handle)
+ 	return 0;
+ }
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !(defined(__UCLIBC__) && __WORDSIZE == 32)
+ static inline size_t kcapi_downcast_int(size_t in)
+ {
+ 	return in;
+@@ -564,11 +564,7 @@ ssize_t _kcapi_common_recv_data(struct kcapi_handle *handle,
+ 	msg.msg_controllen = 0;
+ 	msg.msg_flags = 0;
+ 	msg.msg_iov = iov;
+-#ifdef __GLIBC__
+-	msg.msg_iovlen = iovlen;
+-#else
+-	msg.msg_iovlen = (int)iovlen;
+-#endif
++	msg.msg_iovlen = kcapi_downcast_int(iovlen);
+ 	ret = recvmsg(*_kcapi_get_opfd(handle), &msg, 0);
+ 	if (ret < 0)
+ 		ret = -errno;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
