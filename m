Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3010D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6C361504;
	Mon, 12 Jan 2026 08:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBn6TUwXK1Sy; Mon, 12 Jan 2026 08:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C669A6153C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206908;
	bh=6/JtGat/fjzOlDlgkroVVoGWxN0vVt2Zp/pMJxkF5iY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khcRi5lqMjkk7s9L16FUAhzJlbeU+R25sCA1VhAKpWLYnEg8aem7mgrrTeXeXngNq
	 fSaGw77rAAzJ4qDTFWYYc3dYOF0toCAMiZzwVXychKHLazCbzMQKDfAcWy6eB6GgLG
	 ViUngZbkfKAAeoddSsJJYTtsvGNthae47QbkIGZUeq7aKTQE5BW97T1BJhvTKH2AWl
	 yZLKOCWy1ZW7lnJ0vsoOPpLiaQGKtGkUUdGSQbv9vj/eznbGvumI3xrz2yaDlOjB3p
	 do342wM16IIGlNDerp5c81UQvamJw9TDTLg70tnFZLZbQw5VNJ4yTjR8v89WaXENKw
	 BNFOLTC+Nbn5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C669A6153C;
	Mon, 12 Jan 2026 08:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B6C18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3861740052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQkdDxhkWsKo for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D325D4162D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D325D4162D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D325D4162D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8154FA4C3C09
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-3K74
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:23 +0100
Message-ID: <20260112082950.2528445-75-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206622;
 bh=kPiESk17u4ypySoIHKKPwbanE86A1ET1bAlrTDkGehs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=WqK4Fu4G3J3cmI+pfCD/scS3mOtyQmIrrzSSzh17xldZUZz5fSPdylVyh904sow4J
 GQJ6u/52PXGL/uCNlTasj1SXitXDINDOVMJZWbUnb32N33aS3zEDehXmyfo0MMsZlN
 O9+Un6i0xdH7ccGyI2Pxta70seF+H3GVVTdwtgUfosmMRrFAy4AB0PAv4FFhllx2kh
 0hdZ9qEYmHYsJ1myem0pyNjfS/1snz9ov3ZzEVjU6DvM3iYhfGedc7PlV5Lx/zVp+r
 LanSk8ve7814IOvhhdD7Txydv8gMr7NZ1fk3/Tud0BRzhsv8jQQ7emLDKFaaMr8Eqy
 vcWWyq3MbSj1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WqK4Fu4G
Subject: [Buildroot] [PATCH 075/102] package/x11r7/xapp_xsm: bump version to
 1.0.6
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

https://lists.x.org/archives/xorg-announce/2024-March/003479.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xsm/xapp_xsm.hash | 6 +++---
 package/x11r7/xapp_xsm/xapp_xsm.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xsm/xapp_xsm.hash b/package/x11r7/xapp_xsm/xapp_xsm.hash
index 9568836bbc..ed6ad5455b 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.hash
+++ b/package/x11r7/xapp_xsm/xapp_xsm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003152.html
-sha256  9c30fdaa3fc132e4ff201cfc478669056e6e15502e77df88df11fb94e4e6fb2d  xsm-1.0.5.tar.xz
-sha512  df3777b3aab813ec8aa906f5a03f93b8ca645978970290cf7baf732e175c36c00ae19baeb45ea7404d35838c21e6f8fca28f0da3e2f398d17adac5f2acb7b351  xsm-1.0.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003479.html
+sha256  b74cc774c6060c37592f68a90dbd31b0f2a62fb14e562769434f79be284a63ce  xsm-1.0.6.tar.xz
+sha512  ee4e9b4ab6be6773e53685540f807b03d553bfecc26c4e85fe12daca486fdeb66c594c6eab54043a8c149112c7a3ed18e463d68d7aee62e93a06c091ce39c268  xsm-1.0.6.tar.xz
 # Locally computed
 sha256  5531d18cfcc944dab39991f63f182cbbce3fe493ba0c7cf08a25c0d01ee84482  COPYING
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index 1c73f5c65c..9783273d4e 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XSM_VERSION = 1.0.5
+XAPP_XSM_VERSION = 1.0.6
 XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.xz
-XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XSM_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XSM_LICENSE = MIT
 XAPP_XSM_LICENSE_FILES = COPYING
 XAPP_XSM_DEPENDENCIES = xlib_libXaw
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
