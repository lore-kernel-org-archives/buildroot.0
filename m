Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F12AC4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 08:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB4FC400E4;
	Sat,  4 May 2024 08:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTOzCrVbXl1t; Sat,  4 May 2024 08:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C05764017B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05764017B;
	Sat,  4 May 2024 08:20:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62DEF1BF283
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 08:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E96341F34
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 08:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgqNvtbI3umw for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 08:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98ECC4091C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98ECC4091C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98ECC4091C
 for <buildroot@buildroot.org>; Sat,  4 May 2024 08:20:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34dc8d3fbf1so331187f8f.1
 for <buildroot@buildroot.org>; Sat, 04 May 2024 01:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714810819; x=1715415619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ESmZ1rCa0TK1hNtJd113zMpib/rhHbUVSVtyYansr1o=;
 b=JfU1t9XRcpFV6YPJxVor9qZImfU6xuHeob4+blkqIFuP2iPhXQW3zwYYC7YtlDzEy1
 IUztFaMWiUQVHZ5VTvCZArK+MsFziYfNThrTOerTMHLX1iPfED40Ak/J5DlCIcE3f2xm
 37IZfI/a4lX7wQm5qHx2R7Mu1qz2Li7lHE2whjqwp1lRUbb5uHSBNkYaRAM5Lp4pKtLU
 R+OHYKxl9BDUV1L8nF9B15CSuCP9m7FRwmxKqHrhoCYlmwtOvTpZA7HIbDWy2KMB5jvJ
 aB5qGfANT+OKWYkFMsudfkWfokGTGc4hLU4CyqNb0UiMnV5wqpWSzrH5UOekSig8x0PI
 nNwA==
X-Gm-Message-State: AOJu0YxyEntS8AHYsSNukE8u45dnvQc69Z5o3rirmhGy4Yn+QMbS40qw
 u+WUEZY/rYddp2QOZHM/HdzXsoNfS5/YYykiPR1yh6MSAKAtcf+qAHBcZw==
X-Google-Smtp-Source: AGHT+IEbeoH3wxtl1oHdPPrIFFf5bGUqN/pDy10ngxcGvDAbIpc4+mJQ8Ga9jLo9BsQAWCQJjeR0uA==
X-Received: by 2002:a5d:61cb:0:b0:343:ae9b:36e0 with SMTP id
 q11-20020a5d61cb000000b00343ae9b36e0mr3453757wrv.43.1714810818371; 
 Sat, 04 May 2024 01:20:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 l7-20020a5d5267000000b0034dd13d7a5esm5650744wrc.65.2024.05.04.01.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 01:20:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 10:20:14 +0200
Message-ID: <20240504082014.238310-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714810819; x=1715415619; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ESmZ1rCa0TK1hNtJd113zMpib/rhHbUVSVtyYansr1o=;
 b=bgp0tYlkZoL+gcD/byNjvwp8BUsVz5jHXVpfi3eqGj31MHIMl9QP3W9G/BDjmzTWSa
 TlH4FU6loTA3ylypiUXgD5Xvn5i98YT0ib3UV8ovDaLetsU6wWEmKW5q5p08fFlt2pnh
 0GSO1HsfDKsIF+TkVxV1s3Tid+IaBrUTAgfKkYkdxQ4trPGnB3W5+qPJullgqsUOyCDE
 tDjVbMx1CpYbT05Tx8S3MeRR3cahAdDHA0JCo2YoGuyW2i7OeayyDPGRfbtJcfeLolQ5
 8+eno8f286/dzSfBGMw4uD7XGAewPsUMs4hqngDXxnCJ/mFtMR2cpCmizKpPmDOpsDFn
 2sUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bgp0tYlk
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: fix uclibc-ng build
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc-ng build failure raised since bump to version
0.17.07 in commit 6fb179b906a1755d77bda9e501c5335ac163f3cb and
https://github.com/ColinIanKing/stress-ng/commit/2ad8aff9bc1ab822cf615c72712c6031a8f60bbd:

stress-sock.c: In function 'stress_sock_client':
stress-sock.c:656:35: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
  656 |    if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
      |                                   ^~~~~~~~~~~
      |                                   MSG_ZEROCOPY
stress-sock.c:656:35: note: each undeclared identifier is reported only once for each function it appears in
CC stress-sockfd.c
stress-sock.c: In function 'stress_sock_server':
stress-sock.c:1060:34: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
 1060 |   if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
      |                                  ^~~~~~~~~~~
      |                                  MSG_ZEROCOPY

Fixes: 6fb179b906a1755d77bda9e501c5335ac163f3cb
 - http://autobuild.buildroot.org/results/bcff31bd9820cf0b95f8d8c6de44fd4ab8e2f065

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...sock.c-fix-build-without-SO_ZEROCOPY.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch

diff --git a/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch b/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
new file mode 100644
index 0000000000..88fef900e7
--- /dev/null
+++ b/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
@@ -0,0 +1,56 @@
+From 6a719f95e0547a6dfaa9178b42c2a5dbd931ce1a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 4 May 2024 10:04:20 +0200
+Subject: [PATCH] stress-sock.c: fix build without SO_ZEROCOPY
+
+uclibc-ng defines MSG_ZEROCOPY but not SO_ZEROCOPY resulting in the
+following build failure since version 0.17.04 and
+https://github.com/ColinIanKing/stress-ng/commit/2ad8aff9bc1ab822cf615c72712c6031a8f60bbd:
+
+stress-sock.c: In function 'stress_sock_client':
+stress-sock.c:656:35: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
+  656 |    if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
+      |                                   ^~~~~~~~~~~
+      |                                   MSG_ZEROCOPY
+stress-sock.c:656:35: note: each undeclared identifier is reported only once for each function it appears in
+CC stress-sockfd.c
+stress-sock.c: In function 'stress_sock_server':
+stress-sock.c:1060:34: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
+ 1060 |   if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
+      |                                  ^~~~~~~~~~~
+      |                                  MSG_ZEROCOPY
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bcff31bd9820cf0b95f8d8c6de44fd4ab8e2f065
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/ColinIanKing/stress-ng/pull/381
+---
+ stress-sock.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/stress-sock.c b/stress-sock.c
+index 253730168..880530d04 100644
+--- a/stress-sock.c
++++ b/stress-sock.c
+@@ -649,7 +649,7 @@ retry:
+ 				args->name, errno, strerror(errno));
+ 			goto free_controls;
+ 		}
+-#if defined(MSG_ZEROCOPY)
++#if defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
+ 		if (sock_zerocopy) {
+ 			int so_zerocopy = 1;
+ 
+@@ -1053,7 +1053,7 @@ static int OPTIMIZE3 stress_sock_server(
+ 		goto die;
+ 	}
+ 
+-#if defined(MSG_ZEROCOPY)
++#if defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
+ 	if (sock_zerocopy) {
+ 		int so_zerocopy = 1;
+ 
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
