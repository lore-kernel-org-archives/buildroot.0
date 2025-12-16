Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E51AD609A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 15:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5856C8218C;
	Tue, 16 Dec 2025 15:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLuILspo9oS8; Tue, 16 Dec 2025 15:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 817BB81E38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765898106;
	bh=0nPFjFdZDQmHur7pbr13ZxwPEmE0pWE7FyHyWk1dNsI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pvlVUOLjOBi2ZHIHLkVx/1PaRMJN2f3vjF3mFJ7RqVy9v8grYLcX25INtKKvP7Jh3
	 DUHsnwGT6Jsgg1JkVW/5yqEPzAYFlNsxtviauLfKIqmO1rDtdAaaDOZXok02yTFsrp
	 yy+GZgPMVeOEI30py9E4a+4PJAaFJ/oBVHxHuoJvXImi1mznsA4q3XD52t7EFj12by
	 Tjv5kT2tDMKatD5UBkQ7cwLaSauvtmTPsY8HRwL2A1EgWG6pJMZc4PNAdYxTtPGU5W
	 e2QmurrbKVbRMdjUnbj50I/pVMKfUB98AEstZUAFVpcURK8w7XspFMnXUb40mGbQ97
	 kSTcDIfbyJ+Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 817BB81E38;
	Tue, 16 Dec 2025 15:15:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6935370
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9979D40C28
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8eknk44zPYp for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 15:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 876734089D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 876734089D
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 876734089D
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 15:15:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 834F7C19D37;
 Tue, 16 Dec 2025 15:14:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F2B6C6071C;
 Tue, 16 Dec 2025 15:15:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C6ED119A8E0E; Tue, 16 Dec 2025 16:14:56 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 15:14:41 +0000
Message-ID: <20251216151449.395253-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216151449.395253-1-kory.maincent@bootlin.com>
References: <20251216151449.395253-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765898097; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=E0FdzClJUfEaiM2kZMLRmlLrmOS27JQTJoUX5cj1MsI=;
 b=OoBy/ljRYMYQRr7nEyHBxQqVWlW7ORHbPRdiKqQniAa27uUJCD85MIaLFiBV6jHLbs32Up
 6zqzooX2fl75LRmm4/HbGvMUwpks7z47X1nKP/WiGYma5e9kJX5MtqMDWFoSzzAvFEmi0J
 7a6Hgxuj05YflXxzJNrUggwKV0n2t3tVM9bNCOGOuyPKApuxz4LpAL8uxysL7coQPNIiED
 6RmSdI0FesnFDxYdl9/9yrawYLQzzWf9nWYr3pICNFBr8YazNaavGagY6FDlYSnANrwq4s
 EdIHzkshrkpVzEijAbWWT/AU1u/O65YmfEeBmRrix2jimgqqrGw/T1ATSV/xRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OoBy/ljR
Subject: [Buildroot] [PATCH v3 1/5] configs/beaglebone: Switch to Bootlin
 glibc stable toolchain
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

Switch to Bootlin glibc stable toolchain as requested by the 2024
Buildroot meeting report:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Changes in v3:
- New patch.
---
 configs/beaglebone_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 86bf6bce9a..8a8f618e40 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
