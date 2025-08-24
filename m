Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214BACA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 09:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90A641B62;
	Sun, 24 Aug 2025 09:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xldvqlGmvL6R; Sun, 24 Aug 2025 09:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBFAC41ABE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBFAC41ABE;
	Sun, 24 Aug 2025 09:02:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82BDCCA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A9641A36
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bs1ML4T58T4I for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 09:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37B3441B1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B3441B1B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37B3441B1B
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E40AD1A0D62
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BE9F5605F1
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 547FF1C22D8AB; 
 Sun, 24 Aug 2025 11:02:51 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Aug 2025 11:02:43 +0200
Message-ID: <20250824090244.281771-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824090244.281771-1-thomas.petazzoni@bootlin.com>
References: <20250824090244.281771-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756026171; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=byvO3Bmakqs0Jc4OQLrdMz6iVyGmfaMTBJxIMHJb1F0=;
 b=YjaxN9kbIyeRxHnW9QNBP4VnpxWzWWn6BE2we64koCQ77DaCPxYiUz/6SeycekXehyBiPo
 gGyMw6w2wNkKSO29dN421/Z4qZUBOfSH8CHWiddFOJ/r680lop3sT1cKIUwS/8NxNRKVCy
 A1ESIjgGbhM64GNGePlV0jg8GaIt2BYuNiPY5R/TFDt6uNZlbL/1o1XrAOH8mitrfeeThH
 KpGuELNrIe89WYNu/AGNNFV+SibGTfnvZXfsv9jGOdyXIIkTW3WtAmpZmniQLFmSF4cnQ8
 wAWvTCB/Ma9tFFEjjFfxp5w/Fskq3JXHH9LNk77jY3GxmA4jHlouhEVW7lF1RA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YjaxN9kb
Subject: [Buildroot] [PATCH 2/2] linux: CIP 5.10 versions not available for
 Loongarch
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

Loongarch support was added upstream in Linux 5.19, so it is not
available in the CIP versions that are based on 5.10. Prevent from
selecting those kernel versions when Loongarch is used.

Fixes:

  https://autobuild.buildroot.net/results/eebcf605f8f868a668960152f30c08f700405a4d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 7f90c566b0..b4b0295dfe 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -36,6 +36,8 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -56,6 +58,8 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
