Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBB8CD3427
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 06:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BFA941091;
	Thu,  7 May 2026 06:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZzIWtNoujmk; Thu,  7 May 2026 06:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFEE341093
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778133966;
	bh=/B0QIzdytL3HBm4cWuRnxhI8EUaUpS3lgPRKEs/77pY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=agRTewLV9nVKO5vCvu8+NMfZTAkfQ9P0KVhTpsTNjKxWiW2gTkS6gSuCR59Tdgn6W
	 jsAbJLqipr31goOrPV2WpjPKXQxMizJ8IIFrJ2zhbhoEzn2rqBsTMerqXqRHLcRfgl
	 6Iq06yhL5kP33M6SaZfIVox1fTyj9bc3Ra7yZ/n0FIrQFZUSab5X9aO5bEiJvq5pM5
	 u3Ndxf43cZUUz+DYPkgGCwdifmXgf8K6/pqtSQOfYdMKNcjMmQdUHQj/3LVd5nuZMS
	 ehNib1xpBOlYQXPwg86FHhlBLqXURejmVcTwUwuuG5jfJFJHibR9Bo94lM0t3EXXwq
	 aAA4NbGJcjRDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFEE341093;
	Thu,  7 May 2026 06:06:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D57D811B
 for <buildroot@buildroot.org>; Thu,  7 May 2026 06:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE06E60FF0
 for <buildroot@buildroot.org>; Thu,  7 May 2026 06:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSx5bomvdcPf for <buildroot@buildroot.org>;
 Thu,  7 May 2026 06:06:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.51;
 helo=mout-b-206.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 886DD60FEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 886DD60FEF
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 886DD60FEF
 for <buildroot@buildroot.org>; Thu,  7 May 2026 06:06:02 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4gB1vm67Msz9yBP;
 Thu,  7 May 2026 08:05:56 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Date: Thu,  7 May 2026 08:04:44 +0200
Message-ID: <20260507060445.440728-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1778133956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iwhQtWuhQa+vl+yH0OIUiUXR+mafzeSCIjqMMJUWqBs=;
 b=07rlSDkEB81jD4gxCNbPN/cDWQEFpnUGWAbJ8cyzNZ6xED5ZcwaQGBC0QFyZK396FoVqZV
 P8Knn5JwtsqZUVi/AUAJmp1s05XmLg5iJOXzJHChkus3KXQHAvnwbIecT4wX1B7jcjqdh/
 nkMRV44wX6+QCHTw+V39HHHdes4VrjEtSZnYvUxfDdnBZE6TrLzemBgaCMPLDwSAAORiyq
 Cz4e7QTq0ESPnimLAADH/xyEC5oKEQbMuZpfjObc1zGPQRgvhiwSeUu3QbFUDpt1BUA7Wm
 uriIXweVb0IQycCRyH7E4G6t2xZqWNG4XuM7fwVwrGAsnOv16iEwN/GnlaKlZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=07rlSDkE
Subject: [Buildroot] [PATCH] package/uboot-tools: bump to version 2026.04
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

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/uboot-tools/uboot-tools.hash | 2 +-
 package/uboot-tools/uboot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 39b894fe9a..6916498256 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index fa0b6aba78..6b5554da9b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2026.01
+UBOOT_TOOLS_VERSION = 2026.04
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
