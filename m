Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1123ED25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD810607B9;
	Mon, 12 Jan 2026 08:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tP9dIllOBs0j; Mon, 12 Jan 2026 08:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 194BD614B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205805;
	bh=Vq5YxzoWp1NG/9BFKElJioOXytS8btIPprEXxceugsw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1tBAIO9wmiSVS+QjDJC0ncAooy0Ox3r7mE22aU1niVeWTqpzSDcJQ7A97N6a2ZNR
	 POMDKrS73lE8BO+IKXtbGFvgr6VjF/4zwSEra9t0KHrCfLxEE4105b6pdglGCWTK8L
	 01J1K7fGPvQob+neUQbFzc8z3yyCuu5D8AyAmJr+vn4e5sZFSaRD74GUgi/xkznyBe
	 6NXoD3q6edA56niUV1JwQ3mR95yDF7WsHlRIu9faO/bXbkJ2pjipcIDjWyuKF3mbme
	 5gOYuC9E1JfDngIuCIRzxu3wMV4BXA2rXx9ZJyn9EgiMOZUM6GJqVNv8D25R575lzJ
	 OuFuy0XszKRvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194BD614B8;
	Mon, 12 Jan 2026 08:16:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2D318D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5001607B9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eL1WhPZea2lu for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6A71614B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6A71614B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6A71614B8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 041A1A4C3DB9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuR-000000003M6-2fG8
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:40 +0100
Message-ID: <20260112080419.2516889-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205138;
 bh=BTSIYKdWxGCMtytmDhVSx6ZVDJMENCD5v+XaX2mbg0c=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=qqY/WXTHfu61s6fZeuTpOZSGBOKM7e47ef0NDgHnH5ZBCHp2TfTnG+YbdG1q2Pdlz
 P4nJ6oxNqWLkacHad/Xr/ti4N3vUbCgUdm45SVk8V3G7kY59ku9n8TxzrFsue2sq9k
 AStKqMQkpbIjc9LMPfqTsvdDVd1umfcdIhZU5i/00wIST6CLOukj9sRz95d4+OKOG/
 V9U0Nop6bC+ymLTZbbBUXyND/wfUXwJvk6zXOOi9JdE8usfXUQkm6WwA29N2BtOtQp
 8eP33uE3m1+f9Y2dmfRTrkpOZwnaNzuQV8Ns4VkySuZ1hYf1jNLllE67T7ODRLb4gY
 YLLRRMKv+5c3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qqY/WXTH
Subject: [Buildroot] [PATCH 005/104] package/x11r7/xapp_fonttosfnt: bump
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
