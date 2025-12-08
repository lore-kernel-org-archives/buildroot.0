Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ADAD3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 22:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA42183D4D;
	Mon,  8 Dec 2025 22:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-P-Uh1J4pDR; Mon,  8 Dec 2025 22:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D6483D45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765233240;
	bh=5EEPgLuQEsWgo2nUsSuCRN+/wz02TklvNea0nuymcGI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VNG94abF3KtxFusBnPsSmXANM7IcW8Tk+bELQbOxAOY9Ha+J0m6nl20OrOigUne2X
	 FRMuv6QSI8V0RBDt6ltDBBngSUnZrpCsPXtcjUzH9PB27Ash+leJg2tavrhQZutQzG
	 9aCje43o2HEEkyWh5+nMtwlw/8KIC6KLtMSY3SRhu5lvwBIHueooXKrxc40EA1vYRX
	 UEXHri7PKUu3RYXLCAWq5OxqidPUKEhgbM3qsqgcWmjyYCAFyp6HPQswwIH6E6o1Fs
	 0DoT+eRo8LzOdZhQUTAYFAwGWV1sKs6WlgKkrLr3g8vOFoxXuZiJRHezeCdGZkrAHS
	 8TQ8Xhx2guTQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D6483D45;
	Mon,  8 Dec 2025 22:34:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1508FE7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06EBD40058
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9NaS7nozxSJ for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 22:33:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F3F040028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F3F040028
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F3F040028
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:33:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 97C284E41AF4
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:33:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 503D7606DD
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:33:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3EF91103C8D5C; Mon,  8 Dec 2025 23:33:52 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: romain.gantois@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  8 Dec 2025 23:33:49 +0100
Message-ID: <20251208223350.166794-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765233234; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=qX8HXxpv6LODG+ijBrJqLcUrGNfqY27G2d4t1+YbVjc=;
 b=oz6bQWwqtQeBPA/HpZ95S8ozkoH0H/2ZDZZRoS5Fdrwxz+BiNf8338Un3bNiVnCrWRYLD5
 wCbmXtC+bV/5ztpmidmcqgiyal3QQq+yrURT7z+GxmNPgMVUeXRFs9ZLrLNWB6mtUtajth
 w+qsCXhVTjEJ4EcnLNMh9QKm1VBrolAChOE6sjzPe4dfzwdt7gXcCPc//uN2bTilyDJ7RR
 wTf+oDeiOZIrRSPkFveVBUe+RzH8MMj1Y+/DzSo2YzGDpgld4dzTPxFHpmto9t4GtVxY7h
 j+HFYmJaA+CQutAlqC9tOm6wLdvFAPl3WfZIijSTDWpPwXcY0sXU4dl4ZNy0pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oz6bQWwq
Subject: [Buildroot] [PATCH next] package/snagboot: bump to version 2.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes between 2.4 and 2.5:

- snagrecover:
    add support for bcm2711/12 platforms
    add support for several AMLogic platforms
    add support for AM654x platforms
    confirm Allwinner A133 support

- snagfactory:
    allow changing target device mid-pipeline
    tone down UI colors, increase button sizes

No changes affect the packaging or dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snagboot/snagboot.hash | 2 +-
 package/snagboot/snagboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snagboot/snagboot.hash b/package/snagboot/snagboot.hash
index e5978617aa..6fff4c94c1 100644
--- a/package/snagboot/snagboot.hash
+++ b/package/snagboot/snagboot.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a3ace4245472141c0cdcd8e095530652ce95d804f7515a29613ddb07d2c32033  snagboot-2.4.tar.gz
+sha256  03b3793feb9d926f5cb4f1c89f7a22075247fe91942c7be13065b6b62029376e  snagboot-2.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/snagboot/snagboot.mk b/package/snagboot/snagboot.mk
index 12f77c0b14..64b8b6fcc9 100644
--- a/package/snagboot/snagboot.mk
+++ b/package/snagboot/snagboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAGBOOT_VERSION = 2.4
+SNAGBOOT_VERSION = 2.5
 SNAGBOOT_SITE = $(call github,bootlin,snagboot,v$(SNAGBOOT_VERSION))
 SNAGBOOT_LICENSE = GPL-2.0
 SNAGBOOT_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
