Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A1CE7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CFD66083A;
	Sun, 29 Dec 2024 12:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcQL9s7IgM_h; Sun, 29 Dec 2024 12:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 940C760845
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 940C760845;
	Sun, 29 Dec 2024 12:38:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F322CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ACE44003A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDxF0UBvOkZo for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60C004046C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60C004046C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60C004046C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1D54BFF807;
 Sun, 29 Dec 2024 12:37:56 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 29 Dec 2024 13:37:48 +0100
Message-ID: <20241229123751.639378-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
References: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735475876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THb7ERjpzIzWuluKlS8kjtb1RYP6snQmKs0lXRiJpHk=;
 b=fxK+Q+4zfRLDkH/ACmU30SQClxNm2yB/z/62r630nz9Aao4gqQ45npM37jcgUky/ZPN0Do
 YfjrURISFhsDfE2z23sQKi4HVuqm6iG+5P7J16atK3arhpaxnx1P6ljDp+9Z7ms7WCTk3U
 KNNRyzClBYKD2p4SK4PuTXCzAHR8WvS3HhQ69fCzIVc3L1gfh/XEbyLHKj+ZRdDLikjXzY
 NcgUIY7d7COrft/ttf24EeZHuh4QTJlsqGHD+pGz56dJGR20Z8KYVB0e4M2OBWXUSRccRk
 EWYWJK8X1w5SdvdmU2gxoEZWPIYNMsm1pgdXKQGR5fYxpS1UAUn96Imi3fB53w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fxK+Q+4z
Subject: [Buildroot] [PATCH 4/4] linux: select proper defconfig on ARC
 750d/770d
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux kernel "defconfig" on ARC is haps_hs_smp_defconfig, which
cannot be built on ARC 750d/770d targets, so let's use a kernel
defconfig that works properly on ARC 750d/770d.

Fixes:

  http://autobuild.buildroot.net/results/2913e5958cd6b20dbfdcdad304a5f5a0f8030d8d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e443fb227..12699b8ee4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -347,6 +347,8 @@ else ifeq ($(BR2_powerpc64),y)
 LINUX_KCONFIG_DEFCONFIG = ppc64_defconfig
 else ifeq ($(BR2_powerpc),y)
 LINUX_KCONFIG_DEFCONFIG = ppc_defconfig
+else ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
+LINUX_KCONFIG_DEFCONFIG = axs101_defconfig
 else
 LINUX_KCONFIG_DEFCONFIG = defconfig
 endif
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
