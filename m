Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA95C2A096
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 10:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DCFD80827;
	Mon,  5 Jan 2026 10:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTWcNQrPl2Pa; Mon,  5 Jan 2026 10:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC7280BB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767610580;
	bh=FvtQ4JyrEHcpk0PTfJApShwLPEim2s6biFzCAqfmyG4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Pg+I6roX8mjMJn4v1dxXtC5bkfUodkBjsq7Bf297fVhEL9wxpwUnRIBRCwd+lCRsz
	 n+aR+280N8vGxBosJUKdQQtLqO+NuWrN4udI58eZVH4B3bV50n1XxydxahrDUSjvj5
	 Bx5bRYauLgGAQLHF47MrFOIje6jRXFzD+Gn0aG1mvEVeDZjiWWOGewbUY2VKfPVhC2
	 Ua7gMnOk/0rW4dx8XsuD//swnX161bsJzQRaWcLhH9Z67UQBBeyZt00Vig1Tndz301
	 hg4yUOYE0Su+ItPHCmNLBUebBkDfzQVs2CaKKEnhewJjctvTACXrw3z9EDiWEp+2DN
	 1mmsvlR8zy5tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC7280BB6;
	Mon,  5 Jan 2026 10:56:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D922DE7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB80740430
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qczPLxGwu1FO for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 10:56:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C71E440240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C71E440240
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C71E440240
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0EAC61A2656;
 Mon,  5 Jan 2026 10:56:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D80F260726;
 Mon,  5 Jan 2026 10:56:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E35A103C848C; Mon,  5 Jan 2026 11:56:13 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 10:55:54 +0000
Message-ID: <20260105105558.1991-5-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105105558.1991-1-kory.maincent@bootlin.com>
References: <20260105105558.1991-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767610574; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=PoliDWGrbvmWSh9NMJiiGveg4PXPDhJ5i9nm0bYdUqc=;
 b=kHF/r+f1Yx59377vdUwLhVpHNi8Gu2VFFXWBhmKaEBhguHc0JRhYUSdfeWZsLPplMLCryA
 1bqxdD2ssozvQqxVvpdHCkgmhYk/xegh14s/Epccc9/RUB8fGZF/VG11O/gxQntAMTGC0U
 GAlqUC+xexI91z6Ly+nMCyWZz4gYdiGByPOdLCNpDRa5XyznqJbp7tkOHthB8V6cnK9RcM
 Lxy0mt1bHhFPEcHwTxbdT0mq1Spzw2JxULPSmpb8lPrN7T42qfb+J4uKTfo58tcqy/RcG6
 9bq99fL8YIeryjT2ZtiK5X2UBqZS1JrAo3iU5JFAlMP+VzsK+l8CnNVZHbve2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kHF/r+f1
Subject: [Buildroot] [PATCH v4 4/4] configs/beaglebone: Enable AM33X_CM3
 config
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Lothar Felten <lothar.felten@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Julien Olivain <ju.o@free.fr>, thomas.petazzoni@bootlin.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Add support for suspend resume by enabling AM33X_CM3 config.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v3:
- New patch.
---
 configs/beaglebone_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 11859a6c02..be11186f8c 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_XZ=y
+BR2_PACKAGE_AM33X_CM3=y
 BR2_PACKAGE_KMOD=y
 BR2_PACKAGE_KMOD_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
