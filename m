Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2E6D25047
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E99D1809A1;
	Mon, 12 Jan 2026 08:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVbGdhbjIt8J; Mon, 12 Jan 2026 08:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EBA180DAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205637;
	bh=fFlcxD9g4vJVneq3VndF5B7gVQcyMyy9VKQf/MNxNK8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+ZeU4Ast594n8LLth9xtWv575iZYtBdXZBzv5buqw1xyh7/tPf+LpKNVfU2wpIg1
	 XCc/sNK40HYOBuNtxB46JP4Au+OgG9U9HPnWvd/Z37ArV4U35zSmU8NUR2adgn5Sgz
	 3ya+vMqHjKBukzmTEmfLaiyniNbazrYA9GXYGfkIR5uWSjwC8DPI1TyTauDJ9o9m0S
	 vXeUGQBNhGJ72D9Cb2THy68LTepPW7MDXPWOMouOYNbBMjT0YL1V4tmapywembf+jo
	 SzIAMrEzmbNYZJOJH8kraNFbHRGwXkJ8KXXUyR8NQmDllN7h7W/95qBXUUJfdVNgfU
	 72j6PYsi4y9FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EBA180DAA;
	Mon, 12 Jan 2026 08:13:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 401C512E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32B684031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLcoRq7mS-SH for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:13:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 297814013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 297814013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 297814013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94767A4C3C35
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-052S
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:07 +0100
Message-ID: <20260112080419.2516889-92-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205127;
 bh=Jyhz8iZq7CUujRofdTKBWf3JGpGqED/EaCYs1PrDcOY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=k4TUSaNnN1JFkWHQKEZZ10u5zQI+uev9qMxb61YrdvfFFxYKUFsQpb6AD5zKb6kcN
 QCOJ5QJFpS1VU/sC7Z77z+DVF1FmvK/XeHuEvBtm+lscl8OTxtWhZoe1lKdRZthQhU
 D2OyUyCxK4moFXVABv2k5XuxhbjnJXhta52a07jYLgK0s5GM7Q606ELJ83fjcsb0en
 hUquSJm6uzY1YDyPTCX0Sm5RkqqNJol+gYx2d/Ioo4LGJBzA8dkeVv9ZfmhTo/zRK5
 SFTaO6VZk/Sdr0AM1jb2THM2rTyn3gpenngOKqKA/6zIVDdn8HnktAjfUA2Ck4aeRr
 Z+eA4RkOiBWvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=k4TUSaNn
Subject: [Buildroot] [PATCH 092/104] package/x11r7/xapp_xditview: bump
 version to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-February/003449.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xditview/xapp_xditview.hash | 6 +++---
 package/x11r7/xapp_xditview/xapp_xditview.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xditview/xapp_xditview.hash b/package/x11r7/xapp_xditview/xapp_xditview.hash
index dbaf5e42b7..93ddc10e0f 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.hash
+++ b/package/x11r7/xapp_xditview/xapp_xditview.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003220.html
-sha256  517700df205d4fdf65db182698157c959f1e7c10597670a7f45b1fcb2319819f  xditview-1.0.6.tar.xz
-sha512  249769d27980e9a69ac8f056f329dfa514f3ab6267d6ed69814c5695f315d2a7021c560a0e26fdd2568290a071793d7f2eafdd92f9981ed556047deb244ebf5a  xditview-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003449.html
+sha256  039e2d447fa409d4bb25c4e87cf09b4d4b3eff2d3af5aee8e7e52165a3259fd7  xditview-1.0.7.tar.xz
+sha512  da7e80cd9fbb5da0ec4949c6fed0bad135a2490767f030e60f1c51a9f5a62379572bf8b4dd6dec2fe824152d090470e62fce12c9144aaa1be1b48ddbc3b2910b  xditview-1.0.7.tar.xz
 # Locally computed
 sha256  023d879308a49249181f78bbb567e93c45138ad847fe969d191e4802e7a1a005  COPYING
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 8655bd3e92..5459853ef7 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDITVIEW_VERSION = 1.0.6
+XAPP_XDITVIEW_VERSION = 1.0.7
 XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.xz
 XAPP_XDITVIEW_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDITVIEW_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
