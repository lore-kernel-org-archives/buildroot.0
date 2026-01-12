Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56454D2504A
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10498614F4;
	Mon, 12 Jan 2026 08:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJOBDV-euPAy; Mon, 12 Jan 2026 08:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 388CB6151A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206265;
	bh=bwKMQcXJMBeuWkX7sTwg671grvh9hFH5IJFTImb0/F4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ci6iLH9kq5FxjbGi6XM8K03H49vA7Khrm2nnO2x1Iy4sDUOjp9xj041nL2RcG3dfs
	 zLvrJoCgPSa11WZsI2temDDuh00LAJA1IlNWUzLPLCtaP0aLIuE9b2AxruVgFoh4jI
	 AKFYrqOVgPIh3dQS0tWSSHj4M6NGtow46GAfugtkBKWmG5s0w1Qdf8PbhTry1lmLzQ
	 sXg9c/0Js5ZX5Y1hu0ZP1y30XSFBP9yEODRMctWjaSqLOoWeyezAElI3yRvEoF0ISw
	 qzOb2+PLS5/LNyiakbBBvCx1x9PNWaI6vAXSog29+LlR6h4hOeKR6NSlavllyZ6vQB
	 2se3iyTIkC5Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388CB6151A;
	Mon, 12 Jan 2026 08:24:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28BC71CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 173EE4031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avhbB2j9fLFd for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3D7B4013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3D7B4013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3D7B4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:24:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4341BA4C4235
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-3sQZ
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:24 +0100
Message-ID: <20260112080419.2516889-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205148;
 bh=9Ca4F52D5860sk5bW38vP+7LQQ15z9JrBOFabx5zNfA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TW2fUY1zegm6MXlwnwyAi8XIRhG0l5ijVH3l/hDZp9YGKleMC4OtJY08WBlVMFuj1
 l4+8ac8uaExpbWSt0RIAkOLCWgoL+GcsnbkKKQgrP5DZlaj3LkBYJp9juykbztV/h+
 aoUe6kCjZd8l/lTPLMHowJTaxmSttQuaRcGFqQsU8iGG1A2ogFrT7P5yukzHE2lXTr
 I6KLsxpeLEd6jgOKP48YXjFjR3WohakErZz8/of4jP3DhOnJsfM57mUz8FNTZGLu5M
 DaZFpf4CpSgvCx6A7otk/F1OYJwQbvyOLifOgwW9MKpD2Yzc8UE/JR5L8JvIO0KA45
 hIAGj7teiYD6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TW2fUY1z
Subject: [Buildroot] [PATCH 049/104] package/x11r7/xapp_xbacklight: bump
 version to 1.2.4
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

https://lists.x.org/archives/xorg-announce/2024-November/003550.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xbacklight/xapp_xbacklight.hash | 8 +++-----
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
index bda5c32cde..999945d160 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003008.html
-md5  5b6405973db69c0443be2fba8e1a8ab7  xbacklight-1.2.3.tar.bz2
-sha1  f0a6163738143ec23542b459aef567309a119e0c  xbacklight-1.2.3.tar.bz2
-sha256  3a27f324777ae99fee476cfb2f064576fb8cba4eb77f97cda37adda1c1d39ade  xbacklight-1.2.3.tar.bz2
-sha512  717c87ce24634892fc4ac54fc59dcc0a5bc8f206aaf1d13410f95f7e4fe6e3dbc7ff8d951bcd8ea8c5e955357a00fea6ceadd4559e60b1a632e40f71290e12c7  xbacklight-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-November/003550.html
+sha256  d4c30b0e6f18c82f387585a737ee3b72d468c927892b08a898c41bc12248e8ee  xbacklight-1.2.4.tar.xz
+sha512  6aa39d8f4430b2b9da92afff462aebbd0f3fdef50bf6a4fc3e5c08e45ae18156dc2017b8a46cd3185b2e4b1b836d2bd7379821a6591afa3d6db395247c8193e3  xbacklight-1.2.4.tar.xz
 # Locally computed
 sha256  c9fbf1f272215babef31808c1235de8e4f7641ca5edfc4fc615b6556054b2b04  COPYING
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index d52d562ceb..91aa1d09da 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XBACKLIGHT_VERSION = 1.2.3
-XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
+XAPP_XBACKLIGHT_VERSION = 1.2.4
+XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.xz
 XAPP_XBACKLIGHT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XBACKLIGHT_LICENSE = MIT
 XAPP_XBACKLIGHT_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
