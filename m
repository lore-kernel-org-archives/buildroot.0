Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C764D1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 434566170E;
	Wed,  3 Dec 2025 22:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hz08wd51wYAW; Wed,  3 Dec 2025 22:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 607D961AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799330;
	bh=GMAwxlur5+TBQDA6h6thAtHiogiOcBXdhm4z0v4UDNU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SwIjxsO6y7qxrCw5IS41q2gIKeYk6gMeaCb4dYRejAn4xE+Eb6VPGfkPnr3ihxAMr
	 rpBtJw1PjzHM9nrbO3np9hi8y2W3EosKehAwv360Av7q6BdbbRKhpG3AasugG21yyV
	 WK9Z1kP0wKt28r3bihUQphBgZMfb0MoZ9Zge3vUpTfZPAejCjgEkhX7bnSX4+pHygr
	 AzjXv7WPqIFzQ6U05rosUtzaPwv+Ec4wjEH9O1joMTiTu1kmFGrUaiJefh/DffE74m
	 jeZm+pGtBEZifhaSJunngnvwGkHreghK6XRW4ioBwABrjxw+MCILBBH3nJGRhR9M+r
	 1n5zSBwz6xrig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 607D961AEF;
	Wed,  3 Dec 2025 22:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F12E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 654CC4004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzF1lxON9NY2 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51E5940520
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51E5940520
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51E5940520
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0B20CA4C79C8;
 Wed,  3 Dec 2025 22:59:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-3hX0;
 Wed, 03 Dec 2025 21:47:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>, Davide Viti <zinosat@gmail.com>,
 Eero Aaltonen <eero.aaltonen@vaisala.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  3 Dec 2025 22:47:06 +0100
Message-ID: <20251203214709.2321976-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799144;
 bh=EYph7q34J0CtyoZSDbOKs6jOEN6OJW02ZfEWv0u2xcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=W/9n7o5txUuyL5x/rrkPBXvHhOs/zFvxqFc+rq2n2R2GNt9tBkRipcscL+GHm2VjW
 jfLodtyieKL7ICws0NlIroPzTdLZccYLrBt48qY4D7n5WmgCVYqd1mO6ijEN/ojaEk
 py5YYkftI+QuM/AfHUwfx7J6whTXNeVOHQ8Jn6NY3FrpQiESY2Hr6d+7wofpdlnkYg
 yvvo9E2XNqYDe5GnT60vCV7JcHEfoOK1ZgJU5AJBuOKtMQdRdE7pUlR7PuUWXPadND
 7VkbnlQdNa/Lh5soYRc3AqJkIm2B11e74VYcRMA/H39UJb1B5txqSNjcjrcSOgfbbp
 Mdez7ycZAgEpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=W/9n7o5t
Subject: [Buildroot] [PATCH/next 18/21] package/psimd: fix cmake 4
 compatibility
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

The current upstream repo shows this note:
"This repository was archived by the owner on May 27, 2024. It is now
 read-only."

Switched to fork whose only difference is a commit fixing build errors
with cmake 4:
https://github.com/snest/psimd/commit/4674816f56757dbd99b297cb5647f2520df08db1

Fixes:
https://autobuild.buildroot.net/results/130/13084ca4df5ae91d72f46ef51873676b05398ec9/
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/psimd/psimd.hash | 2 +-
 package/psimd/psimd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/psimd/psimd.hash b/package/psimd/psimd.hash
index 5692e79bd6..69481438e4 100644
--- a/package/psimd/psimd.hash
+++ b/package/psimd/psimd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f6c4dab91ae9a03b3019e7cab0572743afd0e1b6e75b97fcca50259c737c924e  psimd-072586a71b55b7f8c584153d223e95687148a900.tar.gz
+sha256  8934a8dff062663331a17588dfb771940be9d22887596c8ca77e25026c2adc6f  psimd-4674816f56757dbd99b297cb5647f2520df08db1.tar.gz
 # License files, locally calculated
 sha256  984ce1e0b8ee89d234e28b960381f240e03a07a8031f35012f9c3256f56964e2  LICENSE
diff --git a/package/psimd/psimd.mk b/package/psimd/psimd.mk
index be0090a32f..cf6562a3f4 100644
--- a/package/psimd/psimd.mk
+++ b/package/psimd/psimd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PSIMD_VERSION = 072586a71b55b7f8c584153d223e95687148a900
-PSIMD_SITE = $(call github,Maratyszcza,psimd,$(PSIMD_VERSION))
+PSIMD_VERSION = 4674816f56757dbd99b297cb5647f2520df08db1
+PSIMD_SITE = $(call github,snest,psimd,$(PSIMD_VERSION))
 PSIMD_LICENSE = MIT
 PSIMD_LICENSE_FILES = LICENSE
 PSIMD_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
