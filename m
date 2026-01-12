Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FFBD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64576610F2;
	Mon, 12 Jan 2026 08:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1OO2A5XqXIv; Mon, 12 Jan 2026 08:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27ADF614FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206716;
	bh=ukIQ8iD3VlxoS+AzQFG5qmyPsYZCWm8w4zxnuDzjrK8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mwnu/lHb4FB4k55BKU14heRPkIuP0viI698edmHdWSoN0QHPh9NOVXmXnr3mR7JVq
	 GT2hp4+8EJCbFUC+pBI3gDd2ojE1GxvUwzfvTrUlTAP5SL0Mt8G6qnazV4mV6/GtlQ
	 us15MhZdjzLjZgSz+dZ6K5KbOHN0d1+hWcOx/n+6SOLQh7INiaS2djqVdryOXlAnNK
	 4qCUAe78uksICz/gr/sJEBGAGGIoPrLDN9iOWK+f/GAYljYSJorKIV0uUmjJnuf8BE
	 a17p4ziFl1GGSBx3LwoXnecl71qVLWi8LXCEIvETng0by0ibqpep8MkMxo4PUbJZqy
	 D2JBNXb1FkHKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27ADF614FE;
	Mon, 12 Jan 2026 08:31:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D8C618D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F7D1614FE
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHmURWdSLmao for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32A52614F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32A52614F3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32A52614F3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:31:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81B0DA4C3B35
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-3RRu
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:08 +0100
Message-ID: <20260112082950.2528445-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206608;
 bh=gD09A7FOHukksZ5ZEAWPFpihrLBUil3GvuhuWPoI7BM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=IHDs+N6fzQcjM5GkPYdHfBNmkO4IaamjbXPnjcQJOMx31TlDSuMHBXJVdmIbnXjvv
 Zc322NZClr4tCHkZnvGm990VYi89TB3rxMlmdfKNjgpDwJT2ZDdDl6OuD08wLdohw0
 uq0th23dxEXoBBYiNstfJBtZXX+IyqA189r4MEPfxNL4YRg3fG8P6GwrfuysFl5E+/
 LKFabx5DyD9Y5jB6y5qU5JCUM2dWH2T4c520ABfcSQQ6GJuLAzYr+SmJF+92Bj46XW
 4820i4Ejno0ZLv5yNUF5iKSbdeH4FJI164hc+MnAnVzJRxZbCdmTNkKYmZYXbe/GIn
 WgJMbbp9fJKDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IHDs+N6f
Subject: [Buildroot] [PATCH 060/102] package/x11r7/xapp_xclipboard: bump
 version to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2024-August/003529.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.hash | 6 +++---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
index d848a47342..9d78920389 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003171.html
-sha256  f43d4560d1464e8ff58e850212f6bdb703989b66d599fb61f351b5f9e077f253  xclipboard-1.1.4.tar.xz
-sha512  efa7800e0c4fb0242362c4263d80182d591bded07d1064a36b157b6202b15b0c82f083658ced2b82392eca905fb57c04a537d67e75c1237a1667ed2ce0cb09fe  xclipboard-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003529.html
+sha256  8e47a4e18a88d47b14e8eb61a5f298687624a38f9decee9988d8b51a20514c45  xclipboard-1.1.5.tar.xz
+sha512  9962b8d19e6387c9af87a47d66d81577ec3e2ba1d0aa6f6ca8fa89664ccfb0dd20906e143a4d19a303a4eded4f29c4bd40868477fbf754a79cdb48256846a8d3  xclipboard-1.1.5.tar.xz
 # Locally computed
 sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index c76d5ded3c..a49cee930a 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCLIPBOARD_VERSION = 1.1.4
+XAPP_XCLIPBOARD_VERSION = 1.1.5
 XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.xz
-XAPP_XCLIPBOARD_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLIPBOARD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCLIPBOARD_LICENSE = MIT
 XAPP_XCLIPBOARD_LICENSE_FILES = COPYING
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw xlib_libXmu xlib_libXt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
