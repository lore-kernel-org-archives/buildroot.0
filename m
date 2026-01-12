Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236C7D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F195C61515;
	Mon, 12 Jan 2026 08:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxElT26LVXbi; Mon, 12 Jan 2026 08:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22D6361546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207244;
	bh=Vq5YxzoWp1NG/9BFKElJioOXytS8btIPprEXxceugsw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8YacrJHKnE19scDLxK++l5mk60zajIro1LzxqPa4rvOKJy/A+dLp5R4aAqKjijlq
	 xxCd50IVlEE2cvw2dHMz23TVWNeSgiwNK+rDv2orhg2gTMiUcTzXQw9jq+JHBfwY/k
	 L+7zbOS5uo4Sc/5aSd7iJuBWu6VYWLcC8ffsua4IfruA2xVqISi9E8mUKlo/u12D3j
	 WCUqK22yJgSGn65zpTX1GLYf6436J60WUDBFr+jZlejifrPLWsL42CyuCWrNcPnmYH
	 szADXAbluKzpk2Ei44DnhZXNMuEwtITOGHT/m4kz/PLjyE+LQzk0ypuS5JjFKxQnPn
	 idVV6oKuH+0SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D6361546;
	Mon, 12 Jan 2026 08:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F1581CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D27841584
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTmuo4ysh7mU for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17AEA4157E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17AEA4157E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17AEA4157E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:40:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2EE5CA4C3EC9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJ9-000000007z0-0JEp
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:13 +0100
Message-ID: <20260112082950.2528445-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206641;
 bh=BTSIYKdWxGCMtytmDhVSx6ZVDJMENCD5v+XaX2mbg0c=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dS2VMM8Az0VAOaJEp26xDD9ByShGOQLViM9ylIyO2XzAn2cHKYRayWF0VzBSGCnoq
 o9XJP30anmxGHjoph/avqAHEIK9Po5kNvrsmHfd+cJL7xDL2+DHmu7RpiF1AyhH9SQ
 r/LkbdntZcPVZOo0KmUQukxImWgNhnjvOyG+vOmPBEX83YcW83Yq02mJ6teNVLuC3s
 JZz3OaagcXU/CVO5Ogu32LIL4fAk5eqCUmLcXk4QeIYVcXJs0i+H6Iq+4OlkFHLArJ
 zqL17+jd1fD5/YbPsZeHcAK4qWtklxc7mCTeP7J6gvhric11EvTwoYGKCbhdAZE9DQ
 CFoF4LThlz0MA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dS2VMM8A
Subject: [Buildroot] [PATCH 005/102] package/x11r7/xapp_fonttosfnt: bump
 version to 1.2.5
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

https://lists.x.org/archives/xorg-announce/2025-December/003651.html
https://lists.x.org/archives/xorg-announce/2024-October/003533.html
https://lists.x.org/archives/xorg-announce/2023-September/003422.html

Switched tarball to xz.
Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash | 6 +++---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
index 72077bee60..05ea16b02c 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-June/003093.html
-sha256  1a1bb4ef25856dea7de3d491ae7231493225b400bee0f6a1f949017ffd203a64  fonttosfnt-1.2.2.tar.bz2
-sha512  ceac6ccb064043d46f9f16f31fb89c6cbf7f026d049f7b5325d6af97e809b4cd068e6149413bb328c0af601a98b5070e21d469888a6853f6cabecd5b46f60240  fonttosfnt-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2025-December/003651.html
+sha256  2e251e66e8753c08aa280b26fd4a10d0d88e7d9bba5c8aac3d3fb36705e5918e  fonttosfnt-1.2.5.tar.xz
+sha512  3be2a625234175dfc8a637b13f2d273afc82126ccd624a38afcc7ef3e13814dac0e55c8ae0a0a713725cf52078f8b45f3e86d7b357b1a19a55def55f969d0640  fonttosfnt-1.2.5.tar.xz
 # Locally computed
 sha256  f83378580cb7909a98b52bf5cd6a29f4894d76318c5c5312dd3f17a3e92beef1  COPYING
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index 9fdccbb843..d341272b09 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_FONTTOSFNT_VERSION = 1.2.2
-XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
-XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FONTTOSFNT_VERSION = 1.2.5
+XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.xz
+XAPP_FONTTOSFNT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_FONTTOSFNT_LICENSE = MIT
 XAPP_FONTTOSFNT_LICENSE_FILES = COPYING
 XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
