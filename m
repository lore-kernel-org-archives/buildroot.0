Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ED9D25046
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2537614CC;
	Mon, 12 Jan 2026 08:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmZfNG5YsfaU; Mon, 12 Jan 2026 08:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD99614D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205588;
	bh=ghn2toi2j9XZ7KqpL4qclOFolHAETsZCBCZ6MMA0lig=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pUFVXPdJamoZwinwp0r2uGNd4BqpFLySi9N/SLDJ2GrIa7dVvRugroqkv+k2YnTgD
	 uOLBWhufvWy3eRNJlKIzZzIcREqi2upWPMyP4HIiCwhRMW9imCgj3ICMAN2i8UqxcH
	 R2Uavx4gaxEYw5xKCKJ5pFP3b9EELwLr5b8eaHOKo97VPa3kETbMbfFZRL1qgGqg1A
	 7xEJL/q6l199aceqVitPjsN90Jr87tmGyeZpFF3G0hUpleQOKAyBue6ynJdzKFoac/
	 naJfj+PI8HwbnFC/5Y+uhh3sbXfDcYx1QJC/6ju9MnrBwSplAbzVEQPVMWkEctelBx
	 4vSrr1kaI6Z1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD99614D8;
	Mon, 12 Jan 2026 08:13:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1043D18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02B0C4031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1W73mkGC72Yf for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:13:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D421E4013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D421E4013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D421E4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 013A5A4C3C30
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCua-000000003M6-3vOT
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:06 +0100
Message-ID: <20260112080419.2516889-91-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205127;
 bh=2SWvI6WRZj/zOVvw5ubBEM4JdGEJ8WYNKKf76D21zOQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=fk/Qnu5t4vlDc2QuHtq5+O6e2pludp8lqW1Z8zToW250nWvWLFY9gWFAFpHyYzjDn
 k/Ei4OGnfSEj07P6uu7dvGqf7ow1YUHTV5DtHxAdKT2itGBNS96kUxkxDl1MeLCsEV
 X8MvDaUIRoyUMOS4jwDKMFl87XOUEYfXMkgqzfcYj4p/Zvz0RDFQhwgTH3l5X255xY
 7ix7Xe6GzJZ7GXB36nwOBxSzXoBJ/+/b7FaBkYp4rdeF+3s6ncJC3fY3KxS2j6YaLb
 esL7Rk2Ng4HMISy40sjBG5gIBN4QSXvCT0Uj0/CAU5ofIwaVfwHVaxHmf0miFNzpev
 FmRk/VoEYYaHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fk/Qnu5t
Subject: [Buildroot] [PATCH 091/104] package/x11r7/xapp_xmore: bump version
 to 1.0.4
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

https://lists.x.org/archives/xorg-announce/2024-February/003451.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xmore/-/commit/f1d979d7a304113ab5df35971c440e6a76761ad9

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xmore/xapp_xmore.hash | 10 ++++------
 package/x11r7/xapp_xmore/xapp_xmore.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xmore/xapp_xmore.hash b/package/x11r7/xapp_xmore/xapp_xmore.hash
index 960a1e5f92..5ebf7473f4 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.hash
+++ b/package/x11r7/xapp_xmore/xapp_xmore.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002964.html
-md5  8e1279352192e4142740c21db58f9be9  xmore-1.0.3.tar.bz2
-sha1  b57b92afd783d28c4c505e0c95556939f24c3ec9  xmore-1.0.3.tar.bz2
-sha256  644a1e0d5182d7708d413722d0579a587dc56b9a8cb60640df076d302e09251b  xmore-1.0.3.tar.bz2
-sha512  e3e44831cd87a54bb585f80ef0d87f69dc35f6c834a73241aad9f6e2b0999b53c51a0a3f915a94ae4d6dc9bdfb9f60b6576f0bdcec441443abd98efa6c51b1d3  xmore-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-February/003451.html
+sha256  7eb560dbc1de4e43c64fe491ad73907a29d734cca82a9ad82c7d3feb9cdb0a9a  xmore-1.0.4.tar.xz
+sha512  52ac9bca78431f5f830b4607ff2cc375ab90e11380e0d4d3e591689359806cc7c7ec92c713d4d65742f40407e4f407c372759e5d03e30a30dfd866e6d5c6f6f7  xmore-1.0.4.tar.xz
 # Locally computed
-sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
+sha256  eaba8f94ecdc70f7d0f7a7c44544abd198f8ef034d1c45d3b915d52194f3ee3f  COPYING
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index f8a3ba8c1f..ac58ce35d3 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMORE_VERSION = 1.0.3
-XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
-XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMORE_VERSION = 1.0.4
+XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.xz
+XAPP_XMORE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMORE_LICENSE = MIT
 XAPP_XMORE_LICENSE_FILES = COPYING
 XAPP_XMORE_DEPENDENCIES = xlib_libXaw
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
