Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA687D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA3A81871;
	Mon, 12 Jan 2026 08:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxyLIVFkFT5w; Mon, 12 Jan 2026 08:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDF42818A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206656;
	bh=+hGB14t7ojGlYyP3SSUfCG7W9Rs2yoYeh6ygeGqP0F8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eR8alIBUR+r9ohkjrTcESSzUMnsktl6ftHm/cHY0oyja+Kh4mGe/30j/uFeQ5kHC/
	 VycrGXCSLnidVzU5X5Kzehg3yhyjKMfhWGqqhFCgdhLIdkt91KKf7EWgKQOuOphSH1
	 XyKi6jmsFJexDYe7sjAgDyrdidUwFpnbdARo97lTyMxBNrhHbbG7bkAnCJVNL1b4iB
	 jmb/drttxGMmee+pUE4hCxqe/0eiPAVCtiwnOewpcpfMF1usroqTiC5mR0holMqtB5
	 Z8pCIUA1MIkcEQzpqFwfUOd3QWrBk/ZTuaNDjrWIcLyFvTV0g9YOrhAk60lnnitLQ7
	 L0u7TtM/+5mbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDF42818A2;
	Mon, 12 Jan 2026 08:30:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 893361CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70A6480BB3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-NPCLOJPT4a for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6037780BAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6037780BAF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6037780BAF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 849D9A4C3AF0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-22I3
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:03 +0100
Message-ID: <20260112082950.2528445-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206603;
 bh=7pCL587MKOgxUmgXeoQdNZsVx3r4o3ClqVPnjeWGjZ8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=OPXVl47bm4eKEU0RpCVOT9rOTscWOq26qRZXa2EdRcvsbdy2eD28Om9wc5FY10+Qt
 vW1wOHUgB6sQlUixa0x+TkSHm/kFexBoHj4X+t7lioRCzJmONbkKJz04uop2iBQhF/
 TQL1hO0oUohiHe6ap4YCuDhGYSTTsKM1SOifw6vQ0Qnyv896Y5I5Pl6godaoTkfrrw
 NEtIfThfplHByKK367KkTAdZlHfEJLRHeCc7CQXli6+xfjpnODqeNa3KdtdogTJPp9
 a85YAaG+MkqhicnX7BoTV6Id6XiBO/PwQtoxdKwwf+ewCr578pYlyIhRtVKDoZZnVt
 r/8nXdpBizjvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=OPXVl47b
Subject: [Buildroot] [PATCH 055/102] package/x11r7/xapp_xwud: bump version
 to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-October/003537.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xwud/xapp_xwud.hash | 6 +++---
 package/x11r7/xapp_xwud/xapp_xwud.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xwud/xapp_xwud.hash b/package/x11r7/xapp_xwud/xapp_xwud.hash
index c47d6d881e..45bfe2710e 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.hash
+++ b/package/x11r7/xapp_xwud/xapp_xwud.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003179.html
-sha256  64048cd15eba3cd9a3d2e3280650391259ebf6b529f2101d1a20f441038c1afe  xwud-1.0.6.tar.xz
-sha512  a7b964d9ef13e4726b2ef84dcc1040cdf510c8031c3e6e1dc1c711e65d9e56f1fc5921a7af3dbbd898b861c79e9da6242da23c2e73816e39152ae719052293e9  xwud-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003537.html
+sha256  e55cbedab36d7a5f671abf8e594888afc48caa116d51d429ea53ea317ec0c61e  xwud-1.0.7.tar.xz
+sha512  3c910fc170f6f6373d426aa5532bd3ede6d83efab06a77c3a43a92aa9cfae9a5324d5a6ca1dfcc8941be6895b6769b3a7beee8081815000b57f93aa1b4e7c420  xwud-1.0.7.tar.xz
 # Locally computed
 sha256  be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e  COPYING
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 0ad001d970..8926576acf 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XWUD_VERSION = 1.0.6
+XAPP_XWUD_VERSION = 1.0.7
 XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.xz
-XAPP_XWUD_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XWUD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XWUD_LICENSE = MIT
 XAPP_XWUD_LICENSE_FILES = COPYING
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
