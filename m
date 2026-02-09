Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFDBE94617
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 22:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226D340DD6;
	Mon,  9 Feb 2026 22:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7YWtHubD5Uw; Mon,  9 Feb 2026 22:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99F0A40D07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770676423;
	bh=FNN4dSlKwRWOcGvhLagc/Zt4iQ8bYr9yPq3q36Rvfm0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cs/9R6vTTe3RPe2bSHEkxWlXAJtGkTiAr4ENecBzoFG26CZGltn3Y6ncxvvp9IO4/
	 XItA5UNd9H8u2SJNA7U5iyS9G4FebmmrywGm+FIOdeu4hWgdiuUBe74s7oK4cbwFgc
	 ROwt0vYAXhmi9Nr93NmT0GlTR5r+/S2bHlzFcYzVl41Ferv6PnCoyQOND3hk+oTpBj
	 PkyeQeZFu3FxVnLrnbKZv9gHAVy5rLjIiN/wpz46aYUd9zBADIk3eQ2U1Qupwh0ptZ
	 a4KiT03BGahn4K2wWO6Rgv1H92CuifTIpMMbDez6FfbgkX1b5zjOsz1x8Qe9Ot2SpT
	 ZTPy+CBBD4XuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F0A40D07;
	Mon,  9 Feb 2026 22:33:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08D35F2
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0BCE83C4F
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXE_puRABDSs for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 22:33:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E468183C55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E468183C55
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E468183C55
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:33:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D49BE19F5AF;
 Mon,  9 Feb 2026 23:33:30 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  9 Feb 2026 23:32:57 +0100
Message-ID: <20260209223259.1002212-4-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209223259.1002212-1-ju.o@free.fr>
References: <20260209223259.1002212-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770676417;
 bh=wIGQuM0dqbj+viB3VmEH5wsJZ238Tiy97aned0KdxiU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pzVWbayeMbwK83KIszus4jUxC/nCM8vUpier6m7tQKE/MS8aH4P8O0OZY9DQEHsYV
 28+ZqjavKcNYhedXzvebpR10xkNpiY5HX+0WY1JRxfrL806zNGYRDcEq2WZ2e+n6Lq
 W7MqLLVZ9DNIHPAS34M5GibJ2ESTCZpcFGkSHNgWKKLPCxtJDaFAIXafxS/JRBC6px
 uAQ70xi9OHOdG+lt+blQrjjnWbWROXuz7MegZ5cJ8Wp3jY4TruU0ACpnDLsAeoyhOK
 GOfWWFOWD1y6F+CM/vo/NPpZ/pJ8HJMd9czssgrIJBvSpQjYG0REZ9b8O6T7JFru+1
 om2v0SctlaRpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pzVWbaye
Subject: [Buildroot] [PATCH 4/6] package/xfsprogs: enable host package
 variant
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host mkfs.xfs is needed to create XFS root filesystems
in Buildroot.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in.host          | 1 +
 package/xfsprogs/Config.in.host | 6 ++++++
 package/xfsprogs/xfsprogs.mk    | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/xfsprogs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 2160a0f558..b990ce8b14 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -128,6 +128,7 @@ menu "Host utilities"
 	source "package/utp_com/Config.in.host"
 	source "package/uuu/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
+	source "package/xfsprogs/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
 	source "package/zstd/Config.in.host"
diff --git a/package/xfsprogs/Config.in.host b/package/xfsprogs/Config.in.host
new file mode 100644
index 0000000000..f200b766fe
--- /dev/null
+++ b/package/xfsprogs/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_XFSPROGS
+	bool "host xfsprogs"
+	help
+	  The XFS file system utilities and libraries
+
+	  https://xfs.wiki.kernel.org
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index ab78f8e2cc..7367ea51ba 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -20,6 +20,12 @@ XFSPROGS_CONF_OPTS = \
 	INSTALL_GROUP=root \
 	--enable-static
 
+HOST_XFSPROGS_DEPENDENCIES = host-inih host-liburcu host-util-linux
+HOST_XFSPROGS_CONF_OPTS = \
+	--enable-gettext=no \
+	--enable-lib64=no \
+	--enable-static
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 XFSPROGS_DEPENDENCIES += icu
 XFSPROGS_CONF_OPTS += --enable-libicu
@@ -34,3 +40,4 @@ endif
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
