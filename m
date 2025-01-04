Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96173E77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 21:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C1C811CD;
	Sat,  4 Jan 2025 21:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FnnhzZIU2Nx; Sat,  4 Jan 2025 21:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B7E980A83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B7E980A83;
	Sat,  4 Jan 2025 21:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2228FF27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 21:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E2A180A83
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 21:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySUNVALRYNvi for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 21:38:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53F44811CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F44811CD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53F44811CD
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 21:38:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id C26A41BF204;
 Sat,  4 Jan 2025 21:38:45 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  4 Jan 2025 22:38:42 +0100
Message-ID: <20250104213844.825123-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104213844.825123-1-thomas.petazzoni@bootlin.com>
References: <20250104213844.825123-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736026725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXoIq8j0dX3rvqW+n3hXhMklxrS9Hg9D8EnDJvfJjVU=;
 b=XvPJYVOdqpFw3C1Wyt+3Tm2hs8pCUejp7YhFuiyDs/Mu14ZRzliRjQRVE36vcgIl4iJSrc
 F5NN9tn0sUjZe1QOJLQQx0z6duNakdSD4KsU/ZluzOycIO9qYvezgob82PO6omzKBVgiCY
 ixJy2ZCbJfP4b5AfJQpkYBeQEX4FfZgAduXlhYEIrysPh5zlAQuwQWoMQzOWfs+TJf+MlF
 LyAcPbygz5NEOoeeuJv+mGGVsFxWt0crufVaycc5vxCHMkQevi32cR5x42a/UT5day5kJZ
 nqky5Hg99LmlMf08C+SlWiC4Jlb2oCUpLZJ70AFV4NyznV2k4K0frImZPPJBFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XvPJYVOd
Subject: [Buildroot] [PATCH 2/2] package/pkg-kernel-module: disable
 CONFIG_TRIM_UNUSED_KSYMS
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

The kernel option CONFIG_TRIM_UNUSED_KSYMS=y allows to trim unused
kernel symbols... which basically prevents building external
modules. This option has been enabled in the default MIPS architecture
kernel defconfig since pretty much forever, and it causes build
failures of all our external modules on MIPS in the autobuilders.

To fix this in a global manner, we handle the problem in the
kernel-module infrastructure, by appending to the
<pkg>_LINUX_CONFIG_FIXUPS variable provided by the package.

Fixes:

  http://autobuild.buildroot.net/results/c26abec4e24d06557079654b12825efb2211996f/ (cryptodev-linux)
  http://autobuild.buildroot.net/results/699c618730cb33f0ccf54f90e4b722198fd3d3bc/ (emlog)
  http://autobuild.buildroot.net/results/f1d5626f5698a955bf378217528fbf4f8f741435/ (rtl8812au-aircrack-ng)
  http://autobuild.buildroot.net/results/c9a507757ce3a01cd08d596cb519ee9f19caf77c/ (mdio-tools)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-kernel-module.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index 4f64a73f11..032874c3ca 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -62,6 +62,9 @@ $(2)_MAKE ?= $$(BR2_MAKE)
 # the root of the package.
 $(2)_MODULE_SUBDIRS ?= .
 
+$(2)_LINUX_CONFIG_FIXUPS += \
+	$$(sep)$$(call KCONFIG_DISABLE_OPT,CONFIG_TRIM_UNUSED_KSYMS)
+
 # Build the kernel module(s)
 # Force PWD for those packages that want to use it to find their
 # includes and other support files (Booo!)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
