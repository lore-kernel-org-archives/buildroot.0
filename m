Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAFDD25046
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85DFC84466;
	Mon, 12 Jan 2026 08:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnFsHKpeOXvu; Mon, 12 Jan 2026 08:14:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0E2A8448D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205649;
	bh=anTH/SWytsy6/GXB2MkOPfxVWr05KLaOXh8XAWQx5YQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6gD+4y3cOCeLzwhPKZduSPPTpihzKCZdWi11e5C8vmW+YErQfy/3WN6pFFt/bo5B
	 2lc+px2tYEIR/qbvbjsMyJ8FVDirzcW9xBANEXdtU3t6ynJE4pGFxYBejGG9Uqm4Li
	 aOvxFd9AOe2l3SHLUC0Er+lKijyx1aclD1MjTfh94gjDAVXyqfCNwr6fXGFsYo6TFE
	 mbpF+QRnlyMjRUiV2Z1mx7kBSPsBev2NbUljIFyQBF3sFD87EQSSB04DhdrGewILc9
	 r6cQXU5TpM4GPt5iCDXbZeKiwCe1ucWEKtjkCBj8ATLvHJ0II0XKJCFChzJhY0F5xP
	 HpqyUOUr185LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0E2A8448D;
	Mon, 12 Jan 2026 08:14:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C704412E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B92CB6119A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PB67IHo0ItX9 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:14:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4441060792
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4441060792
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4441060792
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 524C0A4C3C75
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-1FgE
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:11 +0100
Message-ID: <20260112080419.2516889-96-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205132;
 bh=QMKc3dXK+ggr3YIpAyfE50oEyacHW9ArwWn/S/vqrUM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=MdYYVEHqRskqIyH4cDtR0sCbvCOh/Zyr1cOFR47WFVyYR7LreyqbqiWDEkpJ3FMGZ
 K1O1/lnlOVDoLoy7mMgFfitlYmWfkG5WiT88n387zNTFsEtSUR+zXz1TLLjwD0vmgG
 rSI+pbxLyFHAiCu5NT6eMlTlaC5LbZhcOsfk8gw0SVKaAEBmXRrSTwtBJl60xobX4n
 KkQ6hwQP3I1qPATEIc0Qqk+EKKntOPfL1SADcZEga1bdrLEuTJN9cq2Kp5XQ4T9xy0
 NkgRiwKce55b0lEV+WkZqzVfnjYM2LAk4sShr/oceX4oh/nCM7zmz50a+fcynaNqRC
 ALYTuSMF/321A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=MdYYVEHq
Subject: [Buildroot] [PATCH 096/104]
 package/x11r7/xdriver_xf86-video-siliconmotion: bump version to 1.7.10
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

https://lists.x.org/archives/xorg-announce/2023-September/003421.html

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-siliconmotion.hash                   | 5 +++--
 .../xdriver_xf86-video-siliconmotion.mk                     | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
index eeff39fed1..bc664d85d6 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002763.html
-sha256  d0f3c691e71108d27a061beb62bf78b36ec35bd755905692734dd68cfb3359bc  xf86-video-siliconmotion-1.7.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-September/003421.html
+sha256  16059c7833a288da43b1d179f5edd2b633e3b102bc5113488c5d41dd71158fc0  xf86-video-siliconmotion-1.7.10.tar.xz
+sha512  d8bb90e636598ed20a32bdc049fe42420d9e6093429f09c3a886a7e78d3813c8533abf67c4fed084be97dd7553a1934c49aa9f94d1083dfa64ab36867ae55fca  xf86-video-siliconmotion-1.7.10.tar.xz
 # Locally calculated
 sha256  e1e3ce7ce1f63fff96444206e09c8490ad7a4af7457c81ea6cdee4f1fee1f960  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 65fd846535..e84173d120 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.9
-XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.10
+XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
