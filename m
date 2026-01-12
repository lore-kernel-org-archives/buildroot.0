Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F93D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16CF984435;
	Mon, 12 Jan 2026 08:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skYU0LDb77MU; Mon, 12 Jan 2026 08:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB96E8440F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205865;
	bh=H6mFDrKtPQIkTG1aBlYF/s3NpnQMCf4SkSR5OIZSIuk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kSd/XA7lDUgGrQ0nhwXbY+KC7R9ea5fVe/2woJLUaZUH7RjnO0KFQFCsop/pDdp9p
	 6ebtWcfJR8twdIx4hu0qWDRGf3Hs52T6wzDuKXT5KxvmiLnsWo6I8ybe+KLFZgNPBt
	 NHoq3m69r5HnO/Ecb/vXoLEa/RJJjSMjQL+Ltec2rP6VtvdPE0lp15kWKBnOGcd6vl
	 lNNec7AzbR3J04ZUPfYeBmv/h8Euz3RDW9oYofJ5hi4VxJs189064Z+7ni4Hz7zmmM
	 rzrNORJBBtScQg4M60617DsHUbkTgyGnsv8GO/oA8XT/beVQHU2K+MZUIk7XqyxTb0
	 PGePvRAuJLEVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB96E8440F;
	Mon, 12 Jan 2026 08:17:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68A5512E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FC424031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8QQrvkpv2Je for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48BC54013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48BC54013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48BC54013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C3E4A4C3EC9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuU-000000003M6-0Bfo
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:51 +0100
Message-ID: <20260112080419.2516889-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205141;
 bh=Jvy+LQj5TSXBDDvuI+FT+J2KVhiA3vJurIswL/TfkFY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=G9d0ix2/QhSJXrWWnkwTu3tFwvK3h9gBa6FX/3p1zEvVb6HiWICW3VZriu0MIpCC7
 q82G1zWGwOJzksy5dI7CVmbVRaY+tF2mfHIE04lyCcecHR3uhgDh2q33ZHNNWg1eyW
 Ua1lTXp/+EZyYeqoXY7PvnWbuiFooBgz+vHpCrOIH91GH70gOVv/pJNF64SgLE1tfg
 n7xnzwZGutwU/mwY7yIqiUAy/Kr556kQL0vo+tzkbDSBSSxWAz5Lz+CtPTm1vJdrwu
 H9f4fmIC8E+Cqht8P1wIYW0LpZoTd/XuLZuk+/u5xlkjo/JLMs592y/tJtsDgOcJES
 9TpaVGjvhPMMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=G9d0ix2/
Subject: [Buildroot] [PATCH 016/104] package/x11r7/xdriver_xf86-video-geode:
 bump version to 2.18.2
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

https://lists.x.org/archives/xorg-announce/2025-August/003623.html
https://cgit.freedesktop.org/xorg/driver/xf86-video-geode/tree/NEWS?h=xf86-video-geode-2.18.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash  | 6 +++---
 .../xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
index 7dcb99fe2a..01b05180af 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-May/003393.html
-sha256  8256ac3f14117324d00b7bfa8053645ca92562fe837c542489a502adbb5f9f1e  xf86-video-geode-2.11.21.tar.xz
-sha512  e12f74268ab7d16b57644a9465b4be1ca28d250625a31b8810e19a1f94a17e47e0a258455155fd8f336fa59fd78160cdf3763aa94b85c6ccc2c42edf3b65bc61  xf86-video-geode-2.11.21.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-August/003623.html
+sha256  bdb0fa8154f06be080c88b59e8f7af6b41597161135152aaac84f8ea41853a1f  xf86-video-geode-2.18.2.tar.xz
+sha512  9228db606704494ab4490a676a6d25355d68438fe909b22cba9766040fc92b6484c95ac08a5e7bd09540bff7b37992b37febb4e3de44ec49c026b378836f5478  xf86-video-geode-2.18.2.tar.xz
 # Locally calculated
 sha256  3994ef7cee54f0935a4b57b1c34efd904da567931dd9e1a2d9390d22c8332ea2  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index 8f84e4863f..9dfc991282 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.21
+XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.18.2
 XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_GEODE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
