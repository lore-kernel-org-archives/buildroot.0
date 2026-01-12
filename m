Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB0CD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7126614F5;
	Mon, 12 Jan 2026 08:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSxaB5mxDcty; Mon, 12 Jan 2026 08:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C27A1614E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206643;
	bh=DETtahS64rn8rQ548QiRf2V31DdpvxEndkqiEhC+0Bg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jz8eSkmwzw6CKW0sAHQ+cUGUCtdhP8c0K4nf93XqHUYkBgNR3Zi4aRqYuZAjoJG+6
	 rCvLAKBye8E1E9Oy+uTzdGYzh/c7rZ+5yi2JOTWUXKPf+YugB9+9xWmeMDIkPlfkOC
	 pWfW83pidheJOL0YfT9BeKdzN3hrBVz/8XTUk5aInoKpt9r8eKr7pnmaVtp9Q2OHOo
	 o8dtiFbvvJJBsh6BEQAhyQc6I+3fz8vl2k/TytvF3UVc1hOAyoTqHQotFN68iifR59
	 gmYBplVu8rLnpuYsCJBTEPpsyGMfkmrBhnYxl79eY5GrcAYXm7X1DCCUVuPLBoSf92
	 t36SZ4rN2t5NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27A1614E8;
	Mon, 12 Jan 2026 08:30:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BE161CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3375741528
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMjadvAbPSUz for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:30:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 274CF41527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 274CF41527
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 274CF41527
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A86BCA4C31C5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-1jTS
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:02 +0100
Message-ID: <20260112082950.2528445-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206602;
 bh=v7/3iHBPyEIby6TmbL7HyajPhxh5Iet2amTSE4Ag0mQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=UfQcmrqiwhAgeNnfWa0OQK9sWjjj9E5PKduGCFDELUN+pil17E1gaGe0fCHJIbRCH
 6cRd0lf1j80XYU7Hxy8SSbZVtmtPUYFt/dZVET3YdZnSS9myZGq5bNt3PD1D6HKdva
 67I2Jo7yFY4heiGmJgQu1STUNdJNERi4y6xWoD16cJ65hmrkp3CzCcnXCUxYHJNSx1
 q/vlRL7YFLhMp75tUxE4y+7eg0hbtiqZjOmbB/ZOTPOXBsgApw/3zK3hd7Jhh0/9sw
 dkZivpL2Jpzzi2ufvh5U9v6x73HWTWfptJf8o91ohSjCn9ORoOiC6bmohXrWUcP0LQ
 RS/HvbPu6TyRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UfQcmrqi
Subject: [Buildroot] [PATCH 054/102]
 package/x11r7/xdriver_xf86-video-mach64: bump version to 6.10.0
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

https://lists.x.org/archives/xorg-announce/2024-October/003538.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-mach64.hash                          | 6 +++---
 .../xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
index e33036f4c9..f20c6b754d 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003183.html
-sha256  50d78abffa7c8227e6f187976f23a244ae2095e97f08de275529b70fba9481ba  xf86-video-mach64-6.9.7.tar.xz
-sha512  a511525ceb8eab95d28e815f462897ead8b99ac455c548598cc061907636e1acff8cad66621feeb33558dbfdbf59ca0648422aae8edaab7d1dcd7e386348177b  xf86-video-mach64-6.9.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003538.html
+sha256  d6b96b47a27cd2dc6dea612f5dc51fcc1a8561d5ad1d48d04ec2d47751222724  xf86-video-mach64-6.10.0.tar.xz
+sha512  1f40114062e320aedaeba5e68e08fd747afc45c03cb0cc4445cdc5ba94aa65b71dd63a19741d0e3dab34cc3cd914d991fad4350fadf39192d753817ec2011cdc  xf86-video-mach64-6.10.0.tar.xz
 # Locally computed
 sha256  a7d68021893bced0d709338a59a137c74b11e624880e110e4a2f14ccef475120  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 2e41208ab4..f9ec3e66ff 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.7
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.10.0
 XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.xz
-XDRIVER_XF86_VIDEO_MACH64_SITE = https://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_MACH64_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_MACH64_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
