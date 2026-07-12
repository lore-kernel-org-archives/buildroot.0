Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CE4C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8548780E71;
	Sun, 12 Jul 2026 11:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jD2I-b6eS1v; Sun, 12 Jul 2026 11:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B07F6813AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783855876;
	bh=o2ECATZwjfqQXR42GUWAP61v2IhrG1DrPP5sMNV1Gx0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnoMfUKwvDbIgREGKDiocAc7t1mJkRpB1LuLGhsr+oe2BG98HYa2r00lVTEr109OY
	 iQyWnLkb36lNLZdqzd+kUAN4UhwUNp5lUtd36w5va+wveq4082xANvwI+SkduRdLzE
	 FSyZJ7cQdxzV5bshd75EheSwazugepyb+3/z+KmYcf1NnubTtZkReXu/kSh9kuzen2
	 Ldb73QhIN3ys9bQYBbGv36M1LTlkEXjwR9nqkvhKLXIxRFXDpQl/TSWitmkt2Z3Uxv
	 ODd4ToIYHQu1C4PPY1ahcJ2msNHuyQIS6LMt5PjW6A51S3oqteWfkhIPFouEASEJEG
	 t2saxV0CW1bLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B07F6813AE;
	Sun, 12 Jul 2026 11:31:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F322359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3505B813AE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7dVfO5Qj43M for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:31:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28F2C80E71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F2C80E71
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28F2C80E71
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D882AA4C31F5;
 Sun, 12 Jul 2026 13:30:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35390)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wisOg-000000002jy-29Zg;
 Sun, 12 Jul 2026 11:30:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sun, 12 Jul 2026 13:30:56 +0200
Message-ID: <20260712113058.1579954-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712113058.1579954-1-bernd@kuhls.net>
References: <20260712113058.1579954-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783855858;
 bh=wMHvD+QOwakW1k6yac3r+n0GvahDbUi1+V6uwC8vnAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Y2IGnhZaTAeEOVdQ6D6fX+7LqRIBK0XN92oG2pOxfK6aVwPtSVOtIN7BL+CW0LPXx
 W0aloZ86p++72o0LGiyaXyNSEDIeV90NLg2H5Cf/9WVUR1vd9eU82KHxH90mQZ2YbW
 I7ABc0eegLZ5HJ9O1eERvefIisntgprVXER1HUkTF1r8lXlLHLVpLiuSRGVhH//P5e
 10D1Tdwsw0ew4oLsjRqRHl7YFiv4Jj5YWp0YnlqSXH1nT0CsTxLWqfRcExliJiRb1V
 pSuG+LStGkNShrAckWbdWMxRfWY57sfbshsVU34UocWin9H1c1rY9wZ0cQI8D2xjSm
 xygC4n4uno7Xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Y2IGnhZa
Subject: [Buildroot] [PATCH 2/4] package/x11r7/xserver_xorg-server: security
 bump version to 21.1.24
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

https://lists.x.org/archives/xorg-announce/2026-July/003718.html
https://lists.x.org/archives/xorg-announce/2026-July/003716.html

Fixes
-  CVE-2026-55999: glamor Font Atlas Heap Buffer Overflow
-  CVE-2026-56000: GLX contextTags Use-After-Free in CommonMakeCurrent()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ac5c6561894d41b86a43af13c4a5af16612c9195
https://gitlab.com/bkuhls/buildroot/-/commits/9c78a853c88fa85f7a31404b4ab324370cf049f6

 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 5f10908c8a..1f664e88e4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2026-June/003703.html
-sha256  e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634  xorg-server-21.1.23.tar.xz
-sha512  7eae854af1b5db1f5d1e59cb9d26b86d98fa176d4f80f70935c707f17982d0446a0a8ad8d29c922edbd208435f995b027604fbb72e62a7bf3ba79f2f570aa0bb  xorg-server-21.1.23.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-July/003718.html
+sha256  1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af  xorg-server-21.1.24.tar.xz
+sha512  f51372b04fe21632fc778ff240705161ed2dccc0114dbe3ee25156d8ac85ec945e2ac05d8638bc7d8d54bad4dfc89cb26b6bd2058b7804d54ab7179e1ac2eb13  xorg-server-21.1.24.tar.xz
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index cecbb821ae..d1596a8a3f 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.23
+XSERVER_XORG_SERVER_VERSION = 21.1.24
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
