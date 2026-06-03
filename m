Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD47CCD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB3E6116F;
	Wed,  3 Jun 2026 18:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9oV0vB4hK3d; Wed,  3 Jun 2026 18:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AFBA617A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780513075;
	bh=SfMuiChp4AOvrQTneWVIe4yNhopLrxzh7x9sFtylJPU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HDBnszm1b5DyWiavSB5FSd/EXOBcBnnZZvnt9EyM2cX1Dd4lZRebs1GzycWrONqIX
	 6GqTY586O0dXws+v/Ng/gJ2Q+5ZvnXhvWF82oLb+iGfBnCmPxoz421eCCFQowNPhk6
	 3WpnjQzI7mVjBOk4jQu3/iVxt3ua/MW1ztnsDyXxOlbJxhVyMQq6ThX1RXBtJ1f3yB
	 KBU8YS92GqDmgm/hbUyXaXyOgwuMkG4a5vaZr/+L6quxPvleXFupMrA0xTz9Cq4GTO
	 L5WwTDjQv+Hghe/ha6/n2x7RI0UkDwnk5c+E6DYMWgPPPHVYzimVjxpfJIYIdZSE6K
	 VzayCIfmDRBGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AFBA617A2;
	Wed,  3 Jun 2026 18:57:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F7D4192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9096580E70
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaOkSSEr7eYj for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F1B080E42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F1B080E42
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F1B080E42
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:57:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58F84A4C377A;
 Wed,  3 Jun 2026 20:57:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33256)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUqmh-000000001iW-4BSj;
 Wed, 03 Jun 2026 18:57:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Wed,  3 Jun 2026 20:57:47 +0200
Message-ID: <20260603185747.3538484-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780513068;
 bh=B5DMdP7vJWx16oMbAbQGW6SooRO7POqwJ8BTXOeHRGw=;
 h=From:To:Cc:Subject:Date:From;
 b=DAUKOrDKgpTj7mmRtcAtIX7qSMOhhTAaHmcwXjOue5/633VB4T1Hwk1iFJEm6jdsv
 tbZUHxocipIh2auQn5bHDDkTvFxJ3G8sbjAefS6vvDbPob1WpFkAVD8eD6VCkW8h4h
 +JDTfY+PPJasRDrAf1zP9MvgMWXFpd1TxMXzH8ZH+GsI2U5SeGWGdeC1v4eyOfDI+L
 FRSwygb3O1e93KCTR2Jyj5rNKRhRTbXnZzjMM9UjDAdOIjGmdUHzM+hwITj1+naNuW
 trAWnjaTeWHg5CguQWBvRoB39DYdOp21FFMBGsPnGwA4NzfJAelbU+LMyI0MYmV5il
 K+s3gC/zY7BzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DAUKOrDK
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xwayland: security bump
 version to 24.1.12
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

Advisory (no CVEs yet):
https://lists.x.org/archives/xorg-announce/2026-June/003702.html

Release notes:
https://lists.x.org/archives/xorg-announce/2026-June/003704.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d0b6f1c51e2fea4ad37b9730bea364b23448832e

 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 6204400852..2bf2d19020 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2026-April/003697.html
-sha256  27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff  xwayland-24.1.11.tar.xz
-sha512  586d7e60c8bf0d92cec66451284c6c43b960010f14a1e204b5de722c610dc067481fd6ece0ffae615ca53ca2d0262e2a3dbb916d04811b8d57c1085bc363f5e9  xwayland-24.1.11.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-June/003704.html
+sha256  6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21  xwayland-24.1.12.tar.xz
+sha512  b4ee41761c2caa7332573be07d9143b60015bb4a7910c90b6ae079dde0a1bf6b0b4773ff4e6fba48279cdee83b4de5eb4a19b9369b5753e4147b94fa2deece96  xwayland-24.1.12.tar.xz
 
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 0643cc5c4c..2b8513602c 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.11
+XWAYLAND_VERSION = 24.1.12
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
