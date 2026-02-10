Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C77CEB26E9
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 16:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA7B4121E;
	Tue, 10 Feb 2026 16:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KX6Ed1X67qCd; Tue, 10 Feb 2026 16:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0527B40B4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770742139;
	bh=vExgdzOp6S3/wY0+kG/IVDVlBb6Pyx+FB8KK1tYBDE4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZKHlR7XAPa5YR4K2omNi7epItfa7HNLpE6Qc45kg/rzf8T97M2rExt7QYN5PZVwSP
	 Y5mGiQDacVB8acQuUNRJ9orF9y69zUS7DM8PV0KldDt/cRh5+lsjAQN4+N02Kdxi9o
	 BymnpVHZ47SUpOY8sw4jxCGIUX0IDJRc48I0TXgxj//CYdoQ6aFA10QRs1iN7yPiBl
	 KqtUxGCJrsbI9c3z/J55b13OznI9xe9XteBATF2s9bo9U7/wplXEwJ5UiDFAZMhujm
	 knlQWDprRxBLYhJHxF4RAMpzzJey5J/8m1ssIXO7/+sEJNnYpBWYMop1FqPq2KuzfR
	 YgCmpsIzwHhnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0527B40B4D;
	Tue, 10 Feb 2026 16:48:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 742E71A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 655894082D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7O60fL2fg8wt for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 16:48:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAADF404F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAADF404F3
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAADF404F3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:48:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pquyvTgY7lZ8Ppquyv8VBV; Tue, 10 Feb 2026 17:48:52 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 10 Feb 2026 17:48:51 +0100
Message-ID: <20260210164851.189380-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBAj36KZCsDLipT5CTfLpzIjbwVaT8GDBMKnrPrs6giA+wNn2XQAmxAyA+NOoGQnUrG0d8jeBR2uzSIAixKM7/GDXtj4qqKT5z1Yiwuzw5qfwjQsy9xM
 4c0kzmvni6QHM/m4OJLzrNb72FNYN1IyixKKhdfsxIU+jsPJBGpAe/2ftpwm9+egi0N9qu6QvNZiu7Gi/raTG9zCrgsiKejy0p1PAsvHOOOF5pR6kQygM3Y4
 IY/zjQlIP45sL+AiEf5061IFLRNl2GQgwK1p9rzQ9Ig=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770742132; bh=mfG4+mw58mx2wxuiY94hNbdOuER9PwEtuy0hPRLIeoY=;
 h=From:To:Subject:Date:MIME-Version;
 b=WIGH+e/I+Qff8uHZ3JuXLa6/E89/Mn25vCvv1oLq7pi+7a4OpBCQbEheEc3JYnNRz
 Eq4xrfPx5CBsLNA7rg6wYSX4qxuDZ7AF72IUXXFeoPkhiuk/ml1ZjxsO/JaUIp8HTL
 YcmS3yaWxzbPPuQtfdV8N1l2G8PVC8xpCCcOwWYz1dU7Rkxb0OIIsKL1zPZA4lLp9U
 U6s5vHfeJZlYzezFg095u5WVXDBbFfUhl0x54vx/42xrp0MPDQo3iHjGND5cZ6yl80
 wyss8zki/fygXVrHdXtC32CTG6Z3o8vZaqKVRTH/BB7kCc68KvXPCptZmPGEXxaYAr
 CmHyAtk9Rh7OQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WIGH+e/I
Subject: [Buildroot] [PATCH] package/mali-driver: bump to version 2026-02-10
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

This version builds up to Linux version 6.19.

Fixes:
still not happened

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index c6b027f1a3..0c0de10dac 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bbfd78d3342fe8bdef5e37659740f69818aa1b3be3a75e5bb085223d87a2a1d4  mali-driver-ef3da788030833289040e4396bff010edcc2289b.tar.gz
+sha256  cafcf9af1c8ce5045dc0f077c51b87d204ddad6cf7e5db22bbf6a3d4356be972  mali-driver-5c13ca89d83dec3e51ed1880dff726838bfdecd3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 40ae03a1df..77ef8963a5 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = ef3da788030833289040e4396bff010edcc2289b
+MALI_DRIVER_VERSION = 5c13ca89d83dec3e51ed1880dff726838bfdecd3
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
