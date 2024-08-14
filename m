Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CCCC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 18:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBF9081264;
	Wed, 14 Aug 2024 18:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ohk2dY5_GjLm; Wed, 14 Aug 2024 18:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C1A8126D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C1A8126D;
	Wed, 14 Aug 2024 18:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48FD51BF97A
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36B788126D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZ94PaorP4Br for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 18:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06A4D81264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06A4D81264
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06A4D81264
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 18:57:43 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B90743520C9B; Wed, 14 Aug 2024 20:57:41 +0200 (CEST)
Date: Wed, 14 Aug 2024 20:57:41 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zrz+JUwTsNaKI8sK@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723661861; bh=Zt7P6hNyZSzitky5QC1zVplllLEQLJrXP8A0xUPFWgk=;
 h=Date:From:To:Subject:From;
 b=Lc4mbQ9soB0uVAu+BlJBVFptNgk9kSkuryCaqjZVfS3pZPYoDg3T4ffGm8SzDi2uY
 DBYkQTzYY9HY4mE/QV7rf/yydMEKbv2aa4b7Wg2tuR+GE72VXpwvyOfAcRBaN6zTw9
 hppK1MiwshDNndRm/hT/MVlMWrvoeEZlJ1bMf4NGl9IaBSytC8N3aqnmj3httYLHqK
 MlhPVYsUKLVPDE/7Fzo0/kfiS6lMTUXKVY6rqsF7Kbr6wI6X8Nhr5qjatBz/S+g58H
 m2A3C1Q6KHR6AtG/fZZly5O0dIWtwINLSMCQLMzJms56Zypv391bdBC5h1I2GOCxKt
 ksVpMr1votB3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Lc4mbQ9s
Subject: [Buildroot] [PATCH] package/iproute2: fix musl compile errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add two patches to fix musl compile errors.

Fixes:
 - http://autobuild.buildroot.net/results/8d7/8d713bd911f8d6b97272a7bb5dc2c188aeb99b05
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...laration-of-function-htobe64-in-gcc-.patch | 43 +++++++++++++++++++
 ...laration-of-function-basename-in-gcc.patch | 30 +++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
 create mode 100644 package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch

diff --git a/package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch b/package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
new file mode 100644
index 0000000000..318701e725
--- /dev/null
+++ b/package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
@@ -0,0 +1,43 @@
+From ea78477cba25b50e7f63f02635e6870d72dcf68e Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 14 Aug 2024 19:10:09 +0200
+Subject: [PATCH] Fix implicit declaration of function 'htobe64' in gcc 14 on
+ musl systems
+
+On musl systems with GCC 14 and above, the htobe64 function cannot be
+found by default. From the man page[0], the function is from endian.h
+header file. If the file is not included in, then we get the following
+error message. The issue however cannot be reproduced on glibc systems.
+
+In file included from ../include/libgenl.h:5,
+                 from libgenl.c:12:
+../include/libnetlink.h: In function 'rta_getattr_be64':
+../include/libnetlink.h:281:16: error: implicit declaration of function 'htobe64' [-Wimplicit-function-declaration]
+  281 |         return htobe64(rta_getattr_u64(rta));
+      |                ^~~~~~~
+make[1]: *** [../config.include:24: libgenl.o] Error 1
+
+[0]: https://linux.die.net/man/3/htobe64
+
+Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://lore.kernel.org/netdev/20240514084335.19f5b280@hermes.local/T/
+---
+ include/libnetlink.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/libnetlink.h b/include/libnetlink.h
+index 30f0c2d2..77e81815 100644
+--- a/include/libnetlink.h
++++ b/include/libnetlink.h
+@@ -12,6 +12,7 @@
+ #include <linux/neighbour.h>
+ #include <linux/netconf.h>
+ #include <arpa/inet.h>
++#include <endian.h>
+ 
+ struct rtnl_handle {
+ 	int			fd;
+-- 
+2.39.2
+
diff --git a/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch b/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
new file mode 100644
index 0000000000..e898ee3a79
--- /dev/null
+++ b/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
@@ -0,0 +1,30 @@
+From 482b7362dedc57d0c9783bd83084919ccaa79e77 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 14 Aug 2024 19:43:44 +0200
+Subject: [PATCH] Fix implicit declaration of function basename in gcc-14.x
+
+From Alpine Linux.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/iproute2/basename.patch?ref_type=heads
+---
+ rdma/rdma.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/rdma/rdma.c b/rdma/rdma.c
+index 131c6b2a..1e7db382 100644
+--- a/rdma/rdma.c
++++ b/rdma/rdma.c
+@@ -8,6 +8,9 @@
+ #include "version.h"
+ #include "color.h"
+ 
++/* For basename(3) prototype */
++#include <libgen.h>
++
+ /* Global utils flags */
+ int json;
+ 
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
