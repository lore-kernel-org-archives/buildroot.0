Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318E9D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07309614F9;
	Mon, 12 Jan 2026 08:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQyZJn9Bs-zB; Mon, 12 Jan 2026 08:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374BE614FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206811;
	bh=M9Y0FqBTPDQADu6Ir8R7emT/VyJzGpa3r4TReM3pApc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VADSG+tA3y2roEA9mOB4tuuKx4BFDYFmvB9BbHLVYnxtQk29zYoyQhjkocpB+TuDX
	 TdU7wWGQOmzbo0l1wSSZs/VH36h0N9aT4/k1bgl/LzDzvC0iuAZqYeaASSP6z5NrPp
	 CxEQwxqzBxyjKn9hsHJqpTqovTiy8zVk3ovagVb608hpAXEvqlkp5doesiLGUvemMV
	 hZPObT1UHIW7tW+AHr5th/E5U8XdjVX26xcu6tTlpPnXSyknqYUr57VsymP/7x6JpZ
	 PTXt8pdosymYEqeMvdx/9qq5l5W4SPWU79c+Y+hVZe2CSLPN6CbFoEi4L0oDCCZFRh
	 p/WqM7R09dCUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 374BE614FC;
	Mon, 12 Jan 2026 08:33:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9A2A1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC64280A68
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkcjPCInlin0 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B12E1844DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12E1844DD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B12E1844DD
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:33:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF042A4C3BA6;
 Mon, 12 Jan 2026 09:30:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-1Otf;
 Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:16 +0100
Message-ID: <20260112082950.2528445-68-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206616;
 bh=42cPrjmV5tZTfE/Me9fK4Ly+0Jc5J1oEow+RjuoMDe0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bgkbcPYsPNwKNxXl1kP/0UhgNjkCuRX0+qCEc0eTROwTZEScBNx70TRz9L6KJe/j1
 7JGc2SeV1WCGrpN0/vZCPFqJAMhHHjn53DmGl+J7L/9cNM2gOMwCaTp/dUPQt5t5Y0
 aEk9quJBvujUhnR5uHPEzM2SDo8h17pTIhj8z3iku7qWjA2Czqzygw+C/lXocZCOeJ
 ep46qam5TX3uFfF4wtGnR2WDxfzksJSgiYmN41jmrw3rMEh4+9Y1PVWuqRUF5dZP9f
 e8iIlBn9YmWJoef6HZTNZGTsiLtmTFMSPYVyyPf/dTAHyTAoRgBLJPFx0i+llBm+Dy
 V1HcntYLQ6grg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bgkbcPYs
Subject: [Buildroot] [PATCH 068/102] package/x11r7/xapp_xconsole: bump
 version to 1.1.0
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

https://lists.x.org/archives/xorg-announce/2024-April/003512.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_xconsole/xapp_xconsole.hash | 6 +++---
 package/x11r7/xapp_xconsole/xapp_xconsole.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.hash b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
index 59d4a67194..d8181fbe5f 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.hash
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003173.html
-sha256  7b4a6af068e40e2e6a4521d6f35c9253ec152c287d025fff9cc4c99f2586bba4  xconsole-1.0.8.tar.xz
-sha512  93fd8527abed4faaf0f6a3804ab08dbcb926b0aaf67fd814c003b6b1102e2f643be5362a020c7028ae928925ffd423df6eb456d4ed48cf30a4c5f00a7ce648fa  xconsole-1.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003512.html
+sha256  0c775978cacdda76dfc8b5a97142f145a177d26220dd307866d9dd62e7391189  xconsole-1.1.0.tar.xz
+sha512  1b5b1e1e15e3b988c159e924ac5c51734c4e37ed112815fc6bf6e36f80e840ccd904a4f0b0f27191e0dbf656d367a38873fd493a266887daa111e5266eebf37e  xconsole-1.1.0.tar.xz
 # Locally computed
 sha256  a29ea5dbcde7ba1695c95949be6303d1ca1de0b7786a38b60f33eccf03506f9d  COPYING
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index 57ece56190..bd4c43e321 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCONSOLE_VERSION = 1.0.8
+XAPP_XCONSOLE_VERSION = 1.1.0
 XAPP_XCONSOLE_SOURCE = xconsole-$(XAPP_XCONSOLE_VERSION).tar.xz
-XAPP_XCONSOLE_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XCONSOLE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCONSOLE_LICENSE = MIT
 XAPP_XCONSOLE_LICENSE_FILES = COPYING
 XAPP_XCONSOLE_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
