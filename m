Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACF6D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6EB861504;
	Mon, 12 Jan 2026 08:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KF3gq0eQBNgz; Mon, 12 Jan 2026 08:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DF3761521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206944;
	bh=LfDe0Sp0t5Sd/7Wewi2QularYX/igkFuVj28wwSB0LY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vv3+Gc2cXgV8nN+bVNiUSjFAILB0KDufvj+wjUYE0qpyCDmXv/3DcEElpfptXXFpy
	 XC6B3BHaBs9XfgNGI81Cdnq0n9tBq0YZxwv2SxE90xMtKIAsfSP+BX47sysA3utWrf
	 4WnxMlkK8TbMghVSvZDRrdRRfky6hcYrS5p6Z5IEu0b48oN1wbFddRRX4ifr1TFtNG
	 9kEPnEBMvG54LSkGIl+Xt5ACAiS5836Rx0We5cdHA/xBP72mKF6m1/BNy5kkIZzaBD
	 dRIIxiMw5rHlcJ17qgTEGW8cGWC0dVc3lN73libpIdsvp84b2og2ahYoWZwhHh1Iwz
	 g7PxMfgou3bvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF3761521;
	Mon, 12 Jan 2026 08:35:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C7DF1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F23C861537
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEGvrVnA94P4 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:35:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E33A761504
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33A761504
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E33A761504
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB25EA4C3C14
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-0HdD
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:27 +0100
Message-ID: <20260112082950.2528445-79-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206622;
 bh=UQ9q0G9MJJpX8Heg9+shcSO1qudbfMIB/h4jKdG/GCU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ZLtiYO2OFC0sBxvBtCkfs2ykrdTlK4bMeFwCFza8kR/xeJCb1L3o8oGHkys+LpxrA
 8pBp3b69vzcCbFHO+diTNJx2/6lXvtK/MirtUHDT67vjsoURdVDLr9+oMpCMoMYXdP
 +7oYHzFHxcfpQq01bvw/NGQgsyozZeJc4rkTgywGosEIRsY/hlMvtmoIoyGFPMUeQt
 fo8a1oDG7oGX1CltynfDmQnoETzE8WaO15bp5CqaOTiruI7KqgQVGnQIXaXqW3fu6i
 68fo50tZMwEVLD6fJt3q/8lku7q2M1MsoItiAN9ak51FahJqS5RPH4OqG7Zm8PVLWr
 9bhFM/ezgVh2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZLtiYO2O
Subject: [Buildroot] [PATCH 079/102] package/x11r7/xapp_xmessage: bump
 version to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-March/003475.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xmessage/xapp_xmessage.hash | 6 +++---
 package/x11r7/xapp_xmessage/xapp_xmessage.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.hash b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
index 07952220d0..01e5f8b057 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.hash
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003187.html
-sha256  d2eac545f137156b960877e052fcc8e29795ed735c02f7690fd7b439e6846a12  xmessage-1.0.6.tar.xz
-sha512  89deb7a81bd047027f99cb92cd16a47f94479c61a6f9fbac4638e6d642037b3e9bbac2313db59ac8c5544175947c693f6a210537c6df2b88dc3de1c67498cba8  xmessage-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003475.html
+sha256  703fccb7a0b772d61d7e603c189b9739866aa97ba985c727275420f829a30356  xmessage-1.0.7.tar.xz
+sha512  0c44f7973f7ed8d7993aaeb457a8921301cb0de905e45d92bd99d49463223b54c704a28bef376fe6038b4aec7156be873a34294741c8537bb7a5a57e1f152cce  xmessage-1.0.7.tar.xz
 # Locally computed
 sha256  dfd5427188bd6d6647ad1a9a0644428403c6239f6aa7f9d1a17629d8cc0a4ecd  COPYING
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 52a9f32631..14e2edaac2 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMESSAGE_VERSION = 1.0.6
+XAPP_XMESSAGE_VERSION = 1.0.7
 XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.xz
-XAPP_XMESSAGE_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XMESSAGE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMESSAGE_LICENSE = MIT
 XAPP_XMESSAGE_LICENSE_FILES = COPYING
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
