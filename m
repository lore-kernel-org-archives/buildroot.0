Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9382C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 07:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E519404C8;
	Tue, 21 Jan 2025 07:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Hq44QKmjrz5; Tue, 21 Jan 2025 07:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62FFA41239
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62FFA41239;
	Tue, 21 Jan 2025 07:42:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1572959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 07:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 762DD80302
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 07:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKtWS2_wh6q4 for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 07:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59CE48212D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59CE48212D
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59CE48212D
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 07:42:21 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21680814d42so85906505ad.2
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 23:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737445340; x=1738050140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xcYbg19mPdeY982NbnC/PUTkF6Y3OUaR7f//PkcwC68=;
 b=eXm0ftnopWlaiOTMQt7Je014xg9C6r+qUKGwHbBetlWNy4kARi8yd988icyQiYckn9
 eXcFqzW8HfzqNeUZe4NoeWx8rAFWuDhinfpFaS6nVTzEpqjKNeuLfETRrWRL9L1JeCjI
 WWeLyVLEGXttVZUtiit58x6feBZ8pGLTyrmfjQsiRVU7s6qX4WNuY3MpIk1jCiDDjik6
 xn35jnBRriySNv+ZJ8f4nhn5kgb5vv/ZTD/alyUDU/WL0VY09sp6oGawbBa7UFd2xy5I
 GcPFzQA/MfKB23GdHrUFEToeyEmgeUVzI3TebqleE8eWL7aSGq4EZANQHHRnjlPspRUo
 5FTw==
X-Gm-Message-State: AOJu0YycidbJXnWEj87nD7B+BB8fonnO1EudKWc/Svdlyr8qVHBkpTJT
 Nb+Eaj1M6c17WIE5qF5GoQBkyL9avz7v4TPUvT9dFOZ20ghke69S4AUiadxl
X-Gm-Gg: ASbGnctjZJozMIU/oy16q8Brevs8xU5Ay4dHEZqK0YNm/9PP+GarKE3DSnyEgEQG9P6
 6C121OH3a18jtDNEzXhMg5S3NAvUNL6DGO0gij6mh43SdA6zRgGSkjoOZLMLJbkbQVRdNZIqKla
 HRFaQZE3qUedRQcMOZjW+4Qf2muWmaqIaUGITYTLcqFBfzhout2W2JLXJSaaJCSm68vYpYRiOIP
 8zV26Ib0IkQaxjEZ/u5L4a8GT/Ot7+2jmCLKflSorZqvUGpWYcoiGv0kg1GtRLVvsbQqikX3z90
 0Q578yX0cFO2k/WsMjjAeSpLkuxYFP0PyssaA2Tf0uJ2VOVy1p9gYQ==
X-Google-Smtp-Source: AGHT+IGl3YAL8TuOtpQk+ovsBV4HJRfnxS6QhI6di306fP2wbkItkurYCUue/F+oOPCpTfWsiv3taA==
X-Received: by 2002:a17:902:f689:b0:215:5935:7eef with SMTP id
 d9443c01a7336-21c35549f0fmr204588705ad.22.1737445340250; 
 Mon, 20 Jan 2025 23:42:20 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2ce9e8ccsm71323225ad.27.2025.01.20.23.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 23:42:19 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 20 Jan 2025 23:42:17 -0800
Message-Id: <20250121074217.18241-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737445340; x=1738050140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xcYbg19mPdeY982NbnC/PUTkF6Y3OUaR7f//PkcwC68=;
 b=FJN3sQ0MQ6jbL7d2gmbMCSwCWXQykAzb4J5D5Uw6R3QLUWexX55BdIM0YReuklxWEm
 c9BV27tuCeO7RRQgWHHVat0F67bjh/OZp/oQR3Urk/VPXuGltcf0BZWbEoQAdlygfQEc
 C78KQXsK1/VETc8MyAtbdlscp8YDjc532BQTkZslMD8ByMdzGXzDSUi7BklVH6p6gR7v
 pAqzXiSZ4V4kS5iksc31QZguWRH+7WCWVMnGEJ9k1w/bwQyi3zFOTu0qiXwsVLFcAGHJ
 uIzBST3tU6YL7WItOwOH3ZeMdLscJADUAE2fEBC4Z7PmbiOrcSxxfT4g7TvoAt7ZuIPp
 SnHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FJN3sQ0M
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.13.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog - https://github.com/iproute2/iproute2/compare/v6.12.0...v6.13.0

Drop 0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=c8b3ecc22ed0edaf0259eaf7d1a5c04f300ad6e4

Drop 0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=fa3949b792e275f75d7d6200dc2036ef7fff8816

Fixes:
https://autobuild.buildroot.org/?reason=iproute2-6.12.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 ...laration-of-function-htobe64-in-gcc-.patch | 43 -------------------
 ...laration-of-function-basename-in-gcc.patch | 33 --------------
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 4 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
 delete mode 100644 package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch

diff --git a/package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch b/package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
deleted file mode 100644
index 318701e725..0000000000
--- a/package/iproute2/0001-Fix-implicit-declaration-of-function-htobe64-in-gcc-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ea78477cba25b50e7f63f02635e6870d72dcf68e Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 14 Aug 2024 19:10:09 +0200
-Subject: [PATCH] Fix implicit declaration of function 'htobe64' in gcc 14 on
- musl systems
-
-On musl systems with GCC 14 and above, the htobe64 function cannot be
-found by default. From the man page[0], the function is from endian.h
-header file. If the file is not included in, then we get the following
-error message. The issue however cannot be reproduced on glibc systems.
-
-In file included from ../include/libgenl.h:5,
-                 from libgenl.c:12:
-../include/libnetlink.h: In function 'rta_getattr_be64':
-../include/libnetlink.h:281:16: error: implicit declaration of function 'htobe64' [-Wimplicit-function-declaration]
-  281 |         return htobe64(rta_getattr_u64(rta));
-      |                ^~~~~~~
-make[1]: *** [../config.include:24: libgenl.o] Error 1
-
-[0]: https://linux.die.net/man/3/htobe64
-
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://lore.kernel.org/netdev/20240514084335.19f5b280@hermes.local/T/
----
- include/libnetlink.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/libnetlink.h b/include/libnetlink.h
-index 30f0c2d2..77e81815 100644
---- a/include/libnetlink.h
-+++ b/include/libnetlink.h
-@@ -12,6 +12,7 @@
- #include <linux/neighbour.h>
- #include <linux/netconf.h>
- #include <arpa/inet.h>
-+#include <endian.h>
- 
- struct rtnl_handle {
- 	int			fd;
--- 
-2.39.2
-
diff --git a/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch b/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
deleted file mode 100644
index 3bce4b15bb..0000000000
--- a/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 482b7362dedc57d0c9783bd83084919ccaa79e77 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 14 Aug 2024 19:43:44 +0200
-Subject: [PATCH] Fix implicit declaration of function basename in gcc-14.x
-
-From Alpine Linux.
-https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/iproute2/basename.patch?ref_type=heads
-
-But also reported Upstream via netdev mailinglist by Gentoo people.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://marc.info/?l=linux-netdev&m=172278781323421&w=2
----
- rdma/rdma.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/rdma/rdma.c b/rdma/rdma.c
-index 131c6b2a..1e7db382 100644
---- a/rdma/rdma.c
-+++ b/rdma/rdma.c
-@@ -8,6 +8,9 @@
- #include "version.h"
- #include "color.h"
- 
-+/* For basename(3) prototype */
-+#include <libgen.h>
-+
- /* Global utils flags */
- int json;
- 
--- 
-2.39.2
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 97be9bb765..fad4debeab 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  bbd141ef7b5d0127cc2152843ba61f274dc32814fa3e0f13e7d07a080bef53d9  iproute2-6.12.0.tar.xz
+sha256  a43aa43338d882b44d01e549f3f105a92ae9feea32a82fae45a88e7a49302819  iproute2-6.13.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index d609a28c0c..016b235469 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.12.0
+IPROUTE2_VERSION = 6.13.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
