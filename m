Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779F0D25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46B85614D4;
	Mon, 12 Jan 2026 08:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhmT-IV_Qd3v; Mon, 12 Jan 2026 08:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 591C8614C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205262;
	bh=40Sq7EPCrGlfbqSmDHtAbYPHjzIqTwRlD4hr7tQRUH8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fZ7MVTUj0qjlQw811IxQAcBD+/pjdcbsdWvnfRwKzHy78O3hQpDj1foqW6iGpaqHY
	 bsp4w01XR7LCX3mLLBvOt6QMmkkO8sbqnX5fBPIvyhPcHIQR1FYsgDV3ZLAGtBeaou
	 k1XEfOwsUyVjGX5Bg7sKue/jf/GNkWINpuKoZSG5GbyCBsFmVJdkoNB++loU/+kkmK
	 ZVgjaI2fCnt+wHkU2tj8Wc5bCAhrKQiqydcCTSRq9NAaS8t9hXBGg83bYu45NHikKm
	 aNnu3ALGL8/87No5t5krECnHQAPF/v+Mnwny9Ip+eir/Bi3AuBiJRbhG6k4zeQNOOZ
	 FzSSFIkTa4LNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 591C8614C3;
	Mon, 12 Jan 2026 08:07:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C67C18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EC99843B6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jZMZNNyycly for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:07:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 251DF843FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 251DF843FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 251DF843FB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 14AE3A4C241D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuZ-000000003M6-0EZl
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:40 +0100
Message-ID: <20260112080419.2516889-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205100;
 bh=OxrT5BOTBzWwc0qb2GkVuw+K/M+kleBoYJa/dEbwCiU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=gbTqepBDX+LaqbSTLtPz2Qp0QdfH6cCTeqMdkcJlg26WIs7v0XD9u7p2SF2AV3bEB
 l9HKONHy+kKExJkcjXgzeYTthY28SqgOWKJgxtMBM6Izld1tLdogTSoCDW1R79fQBZ
 txxUgKGCGWLbVLuHQOTTlyuSYPrpuHdM2YPNa1WInNvlK46s7ckvp52nFRZyS6IW6U
 n4OqzTM0kLdskFAiYKC/aZzLF43lWEWVtAahBlAb82j+KKyxZqIeSDkLRcqug/gHbG
 nhDAJtbavVdhK4vNPZt/5VKd9iHiCWhNp07ESXTff2/SB6BUDckSodDmFyQx2NoM7u
 ynrOxbJ0RPjkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gbTqepBD
Subject: [Buildroot] [PATCH 065/104] package/x11r7/xlib_libXfont2: bump
 version to 2.0.7
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

https://lists.x.org/archives/xorg-announce/2024-August/003523.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/a3a85df9a65a5185bdbd47823f336c4cb3fa14c3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 8 ++++----
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index f2ae5925f8..4f50b2dbd2 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003203.html
-sha256  74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4  libXfont2-2.0.6.tar.xz
-sha512  24d6baeef8dc2ca2730925c6b790a97f4a3f46ea7b4d908555e7df29cee6e27b63d638b50c88dd30c853cecff7d9b079402cb617f4498f96410c5770b8815cbd  libXfont2-2.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003523.html
+sha256  8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb  libXfont2-2.0.7.tar.xz
+sha512  f703127df5d5b1093c9b73e019153ed7799523573d52e61d344209f0acfd4df42e11be12bdd1880479c47c2b70de581a4f2ef74e199e9b1ac438f426593d56b0  libXfont2-2.0.7.tar.xz
 # Locally calculated
-sha256  97e413bb4962bbb5773085cd5405502bf1d4eadeaf98ff5be015eacacc840462  COPYING
+sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index 7f90f67046..c95f6c6395 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.6
+XLIB_LIBXFONT2_VERSION = 2.0.7
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
 XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
