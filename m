Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314A6C4450A
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 06:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D6681165;
	Sat, 18 Jul 2026 06:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lm71nNNeZkDR; Sat, 18 Jul 2026 06:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E997D81170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784357557;
	bh=ld9rbIORrzPltWPi5NIDSUQe314IVbuvEkV6HDc5n3M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OQfKZRI1R/bC0XoE6vrPqmpDBYU5HjrimBc46g31vcExTQDl/Ga0b8T+0OOIpn/Ny
	 MN0BRvy9wL9UvOvIuxciDYAzuHZUZ2DJb+NoMItWDdz2+VKGuudm8K9h6QlEMcd2cI
	 iPq017yV/iUfKY6JLzCavnuoIK0cxNOF0lp6KHx849R+UR+UK61bBEClKSNSv16V03
	 3V3tgWvHYpgpPIeNF6mSLcyMR82rF57uSDy51/zyf8WqEy2aF2O6RdqKl0otMyfYV2
	 heuJIr9KczR6EKNBZRzTfAemH9hfskNKPOUyHqXR3ACgeAoxGnThD/wP0pRNHZ8Wq7
	 2owKWvWvxu2sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E997D81170;
	Sat, 18 Jul 2026 06:52:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 547B41F6
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 06:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC7B40149
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 06:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8JCN0NRecLp for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 06:52:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 267C340083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 267C340083
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 267C340083
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 06:52:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b33e.dip0.t-ipconnect.de [84.161.179.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60AE7A4C3E12;
 Sat, 18 Jul 2026 08:52:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wkyuG-000000006Pt-09zy;
 Sat, 18 Jul 2026 06:52:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Fabio Urquiza <fabiorush@gmail.com>
Date: Sat, 18 Jul 2026 08:52:13 +0200
Message-ID: <20260718065215.928877-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784357536;
 bh=CFkpVlViqOclbDj1lAI61aDquMasO94PGPPkAv8S8SI=;
 h=From:To:Cc:Subject:Date:From;
 b=CDnQ4TBBf1uVbADnoV/fsd1/7lJoCDheyYmebB9kjtL/HlGtObNrUu0j5eURERegA
 kj0Gwby5x4u5LiaiDODtNU2tqg2czMW6g1WxCKjWYAbOnyao534FOlPe4zUVsW8PSO
 NbpKObv9sMkPIJaqikK3XtNbItubw3mUXOTOnGAuq7MQcIEcRTGma9SAdt8cda8J5T
 Wby8x90a3A0+3Ya7WWvpsTikOVA5Gm7JNnjy8tFHrgn6rh4ls8sxWa0qfNyyDCUONm
 aOHKVhbdBYoYDJEiemo/2L6A/Aq3ksxmWkCthL8wREn16PJrOXu6WtwMdeJmor4k/L
 dK3aWbPr5ThDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CDnQ4TBB
Subject: [Buildroot] [PATCH 1/3] package/bitcoin: Fix static link of libevent
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

Buildroot commit fabcd7c8cc44e7e03c68bfcd2b4e2d10331a93f6 bumped the
package from 28.0 to 30.0 which includes upstream commit
https://github.com/bitcoin/bitcoin/commit/b619bdc3303217f4415342fe60e586e18fa48308
that was first included in version 29.0 and changed the linking of
libevent libraries.

This causes build errors when linked statically due to the wrong order
of libraries. To fix the problem we add a patch to change the order of
the libevent libraries.

The patch was not sent upstream because libevent support was removed
from the master branch with upstream commit:
https://github.com/bitcoin/bitcoin/commit/35d2d0679782581cbbf05babc59f0f28858a9b72

Fixes:
https://autobuild.buildroot.org/results/80e05370b6542ba2f5d2908bad7f420f76dc6831/

The oldest build error of this kind dates back to Dec 2025:
https://autobuild.buildroot.net/results/6bb/6bbd822d55dfcf3862e8b713323e0f34f65990ee/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/8d17d8107a074b94d628061a3c18917987141483

 .../0001-Fix-static-link-of-libevent.patch    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/bitcoin/0001-Fix-static-link-of-libevent.patch

diff --git a/package/bitcoin/0001-Fix-static-link-of-libevent.patch b/package/bitcoin/0001-Fix-static-link-of-libevent.patch
new file mode 100644
index 0000000000..8c8e95bd0f
--- /dev/null
+++ b/package/bitcoin/0001-Fix-static-link-of-libevent.patch
@@ -0,0 +1,36 @@
+From 28c3533e5fb350fe1c27cf06dee6928825bc7bf2 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 18 Jul 2026 07:46:09 +0200
+Subject: [PATCH] Fix static link of libevent
+
+Change link order to fix build error
+
+/home/thomas/autobuild/instance-2/output-1/host/lib/gcc/i686-buildroot-linux-musl/14.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
+ /home/thomas/autobuild/instance-2/output-1/host/i686-buildroot-linux-musl/sysroot/usr/lib/libevent_extra.a(http.o):
+ in function `evhttp_connection_retry':
+http.c:(.text+0x1f7b): undefined reference to `bufferevent_socket_get_conn_address_'
+
+Upstream: Not applicable (libevent support was removed in master branch)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index ad18115bbc..8e2a7bfcce 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -355,8 +355,8 @@ if(BUILD_CLI)
+     bitcoin_cli
+     bitcoin_common
+     bitcoin_util
+-    libevent::core
+     libevent::extra
++    libevent::core
+   )
+   install_binary_component(bitcoin-cli HAS_MANPAGE)
+ endif()
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
