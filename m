Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB8D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF3B614EB;
	Mon, 12 Jan 2026 08:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3TgdAIT2gYn; Mon, 12 Jan 2026 08:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 258AB6151B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207089;
	bh=ZG62jd19jJn99VwHC9VmA57KiNS3gmd5lNGsfeumcaY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OdeokqByV1qj6JmpW7X4GXChcjaExTaLvITIAte0tIA8qqmuPsngyfovhWIADXaC7
	 nPATOnto1h+VFM/jzqKY3/M/pw2mMnTYRyjWIxBJz++K45aWWdkK3cDfuxxdBYqby0
	 FOFtHYxVhS/fIdWLYuosGZ64NODdfiQXHj9B7PDZuorZY0blDKDb5eb9v5Zag1KCbG
	 mNJAzizwb9FDEFtjxXQu1MKbu3CwXVTmp0V6JncT2s8w7g1QlHCcu/q+x5rIaRXYW4
	 jwc3g/sagC3AvuYDQpymfQl9BZtpjN7UfG/9yFll3mR9G/BOM10Zp/EPKujH0ovg6R
	 SUq/yaoWMskNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 258AB6151B;
	Mon, 12 Jan 2026 08:38:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF461CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 716296151B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVRUtlZMxvba for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D649614EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D649614EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D649614EB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 530B8A4C3CB6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-44Bc
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:40 +0100
Message-ID: <20260112082950.2528445-92-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206634;
 bh=np1RdNL6BM4WorVVxrQYX76s6jbd40HgVWyVCzA56QM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=SuWmtsQaIL1y3Sl/A0cau0xNk/rHnQjRu7+VsUfHjnznJ7CQc2wZVvUR832getGLr
 T9Snc7kz6AhJlA+CHMe8EtKx1lGapmpy1yRJ48kJ5lNRLn7FEtDLHF1FCIjXeb2z7b
 HIX5DFP5VustEdaPk5cx1iiWQbGJNszj4ixNW3E2qArjhCT4gwy0lIQBcearblE2N9
 uS75lS0jkIDgqya6ybU2PcDZj2mtt0OpMmJe67c2X0kwsSN5P6zc4swxKGEiCF5h1Q
 dFNgjyrSqhYprIfwbjhVD79ZHd4LHPlkwq+VJXS71VFfbukR6i+8W9s+S7pVN8Nvo9
 OzqHyU9+dzI4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SuWmtsQa
Subject: [Buildroot] [PATCH 092/102] package/x11r7/xapp_bitmap: bump version
 to 1.1.1
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

https://lists.x.org/archives/xorg-announce/2024-February/003447.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_bitmap/xapp_bitmap.hash | 6 +++---
 package/x11r7/xapp_bitmap/xapp_bitmap.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.hash b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
index 8953bfc5f7..8cfb8e6049 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.hash
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003162.html
-sha256  8e86879c2feeece3f10e189330479cf51da0dd268355d1e3ee8a8497ab833690  bitmap-1.1.0.tar.xz
-sha512  3d6c94675f10772daeb71598c3e0ddcb51569b1bfc4771159e9df89599bfeb8bf49f464c24fef54d30a8f737af32136f859f844be03e088d24ed962f88381193  bitmap-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003447.html
+sha256  63d42eb63fe48198b39344af49949e5e424cc62ce8d722781fdad4a4fa3426e6  bitmap-1.1.1.tar.xz
+sha512  69096a73739019545f2eb44b823e659b84377cf7c497243c89cbf3f26c9623c31fecfa36628022d241a581a5930e9e2394ec116e5c6d9df94097b45661261307  bitmap-1.1.1.tar.xz
 # Locally computed
 sha256  03be44611edac06827bd13c0815a67ecd37ffe8fb1b9e210d6545d79bec89a3a  COPYING
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index ccc438560d..6dbccab23e 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_BITMAP_VERSION = 1.1.0
+XAPP_BITMAP_VERSION = 1.1.1
 XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.xz
-XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BITMAP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_BITMAP_LICENSE = MIT
 XAPP_BITMAP_LICENSE_FILES = COPYING
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
