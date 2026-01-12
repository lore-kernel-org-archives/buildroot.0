Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0036D2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E47384407;
	Mon, 12 Jan 2026 08:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbazoJC_zrSC; Mon, 12 Jan 2026 08:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 916498440D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205286;
	bh=+ObE2aYKa2Ym/RsbFPEAb5mL7nNnIxO3h+O30szNZkA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S3RKmNHSeKhX9A8UKzCcx7yTJObGXIXBO0odE44r72qjn6CU5/0YvSGQEtgHmmhLn
	 ZJzSK+KzaMq/llWUd3Bd9drUmmXfsTzFzhUTRSV26Wco/xDVkrt7fjcp4vzQepzIWx
	 2uCXALeXHELpvW+bn9qb6ZVdrrv9ANrsorN28Ropuy5aI6HcOrSb3kjB9At93jTtrW
	 k02AML7aaXhM602RmO/FfUQ/3nHEKzFCrvmLbZmFMuGavtCq5guWdjSxaEWKBtZo/A
	 +CnJP+dERhXWdBl4Q2JfNsUdKT3xdliZ4JMt64CZNyDCA3ZVwkZc9VYm8yPP6Uecmj
	 2dxqR+BcmuPXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 916498440D;
	Mon, 12 Jan 2026 08:08:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E81D318D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEC5684407
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHG6Dh2DV7RX for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D867843FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D867843FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D867843FB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:08:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6167CA4C3AF0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuZ-000000003M6-0mJF
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:42 +0100
Message-ID: <20260112080419.2516889-67-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205102;
 bh=+T5CEFEBS6Ybi4G9edR1PPaXxXaPLE34XizW1PlXKAA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Ed13TZf9TPia09r9E4J4o9jJwY0D4bhIRcIXHHBeZPvzuyQ3RYjGklydL/W0prI0P
 WpEx+EBJaRtc5IXK7d6W8XxZtMeBKOnb3dQNgmyVTrN8o1Y2bwfqinLuA1UBj3MTP7
 /sRMvDGa285U1Ld/f0/OmhgLr4NLruuiQGOYdituJ5SMxN3NtG9vA2NM30Q/H9CKdv
 +bra8Ytgw2m1Sf7vGs87mZdL+ld7UJtqxY6FqAezKIp5t1xEnxfOx6NxIpGHwwoEVb
 H2aAnHIaVpzBBalkjJw10QwxnSc9BVzLl1W6TUY7SklMKdOr/Qe9PJPUKYuW80G/dN
 d1DaMDnpRLZjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Ed13TZf9
Subject: [Buildroot] [PATCH 067/104] package/x11r7/xapp_xfs: bump version to
 1.2.2
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

https://lists.x.org/archives/xorg-announce/2024-July/003520.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xfs/xapp_xfs.hash | 6 +++---
 package/x11r7/xapp_xfs/xapp_xfs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xfs/xapp_xfs.hash b/package/x11r7/xapp_xfs/xapp_xfs.hash
index ed802f86a0..a857f69552 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.hash
+++ b/package/x11r7/xapp_xfs/xapp_xfs.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003175.html
-sha256  3d8ac3e8add7eeb1dc199dff6c59f90a2dbe7aa4332c1e12192350f2cda1c1e6  xfs-1.2.1.tar.xz
-sha512  0f8b019e0d922b3d859110154e0ec58493f66507f9787cd41a6c03ad7a05b3293f088f1004e4aaa81e017a524c06d23915669f91ed5e1c2679b33c43de15e70d  xfs-1.2.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-July/003520.html
+sha256  b70bd46331e241b30e5e00dbdc2eabb7f3f8880cd44244acde13d7976d098ecc  xfs-1.2.2.tar.xz
+sha512  e8983ddade7015c87db1278093701b9e62c7d09003150ed7347a9b83b8f245e8ac9fe2d86d61bb4469bbbea86a71366ef299541793326d9dbbb1b9c0572bcba9  xfs-1.2.2.tar.xz
 # Locally computed
 sha256  0314ea37f40eff3c9ffe44b3924b2a768422f006a754e8286bfd1c73203d225e  COPYING
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 50a0412181..d96647e1df 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFS_VERSION = 1.2.1
+XAPP_XFS_VERSION = 1.2.2
 XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.xz
-XAPP_XFS_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XFS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont2 xorgproto
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
