Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DC2D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E3F5809CE;
	Mon, 12 Jan 2026 08:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQrfRhaxGuIb; Mon, 12 Jan 2026 08:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2829180970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206968;
	bh=jQUTzb3NoGe8NfFlwUtmWr4yFR6aRL4G8/By/CDhi6Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VNx0/hZNFLWdCRfUlIao0LB1L9UrQYMR1Nm5GaIH+dKfiflC+he4EV6b3XGreMjIy
	 npnfDwuFsE4Owh397X6itkqFlAosSz9TtXArtYZl68DBzzTAih/1V5IZhY1Sfqt8gH
	 ZR3R4rpWftMG0dShcBs8kvQt6aGCfZoNsUDJnQ+2NvTmz2ne7xoO4EoR9WYiuAWyDJ
	 6Td2y5v7melaFmDhkK+MZ7hSWevtB2fb5McDxnIYJI3MrHGVICmP7Nmiotw2KPIcXt
	 Xv4LuAzqB7N//ipThjOBHKHml3PZWQy7CSA2uvunmHBXUhlD0XQHf9vCXX251ndDSu
	 d0DzWQ06kGebw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2829180970;
	Mon, 12 Jan 2026 08:36:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 300F318D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 177F540441
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yoey3oHaso5i for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11BEF404C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11BEF404C7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11BEF404C7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DB67DA4C3C35
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-0sel
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:29 +0100
Message-ID: <20260112082950.2528445-81-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206624;
 bh=JkwCdELEoOVTOSI+5nXvJYn/MB4vHZ7HT/2pmUA9xgU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=IFOLyaWWX6qhoQE1q/EpKzlDIK9zksdMaXJm+2aBSCniIKUJBvNP47d9TevFrCDEb
 XJDo6Fkk5I9UGL3jYp6q4k9m+5VSISl9lJbwn5Iyv/xZkHtHrUMkpIXR711v5e1orq
 jxvBI4wka2KiWe/9MITwDeucu+szmSkJ1TyBsDK+Ynq+ATZ/gHy7BkJ3VT34/NLlN/
 6wRj1c+M8MV7529kW21hV0dhhxultTmFHnuPfc/DluDSQQI35ur1K1hxuIV2tB2CTC
 R6UAZKwXcheIepG/jESNrsDRpWgb9Tew0d42kg1xX2VeGxyCUSXLHRvIoBFmQ8+/0N
 p+lX35xCFt3og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IFOLyaWW
Subject: [Buildroot] [PATCH 081/102] package/x11r7/xapp_xev: bump version to
 1.2.6
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

https://lists.x.org/archives/xorg-announce/2024-March/003473.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xev/xapp_xev.hash | 6 +++---
 package/x11r7/xapp_xev/xapp_xev.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xev/xapp_xev.hash b/package/x11r7/xapp_xev/xapp_xev.hash
index 9449781360..73788a5648 100644
--- a/package/x11r7/xapp_xev/xapp_xev.hash
+++ b/package/x11r7/xapp_xev/xapp_xev.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003185.html
-sha256  c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1  xev-1.2.5.tar.xz
-sha512  9fbfb78c9547974c2256a678948bf4a694a40b1c2bd5c5dec5f365a713e6d938c6039f055a9629f49de27f02f3d7cb912f07c035df129798a4b2ddc20febe66a  xev-1.2.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003473.html
+sha256  61e1c5e008ac9973aca7cdddf36e9df7410e77083b030eb04f4dc737c51807d7  xev-1.2.6.tar.xz
+sha512  aaabb635622abfbf0b7ef2a1978070a918ea94480f375dd0798375274cf378ddb25007cc42426bb2292ed65c8af922f88e6a04c5a2f6cff3fadb0194b53eb7e7  xev-1.2.6.tar.xz
 # Locally computed
 sha256  9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 0f29a731e7..9e1fd42302 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XEV_VERSION = 1.2.5
+XAPP_XEV_VERSION = 1.2.6
 XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.xz
-XAPP_XEV_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XEV_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEV_LICENSE = MIT
 XAPP_XEV_LICENSE_FILES = COPYING
 XAPP_XEV_DEPENDENCIES = xlib_libX11 xlib_libXrandr
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
