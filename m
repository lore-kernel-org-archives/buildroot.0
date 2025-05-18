Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85D2C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 11:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8589081E1E;
	Sun, 18 May 2025 11:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPtiK8n6zMKx; Sun, 18 May 2025 11:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3024818D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3024818D0;
	Sun, 18 May 2025 11:54:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13394DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0438B818D4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhkpAlba2BXI for <buildroot@buildroot.org>;
 Sun, 18 May 2025 11:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B269A80E50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B269A80E50
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B269A80E50
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:54:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 16DCD431EB;
 Sun, 18 May 2025 11:54:22 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yuriy Kolerov <yuriy.kolerov@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 18 May 2025 13:54:20 +0200
Message-ID: <20250518115421.41021-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekgeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffdvvdfhudetteejvdeikeffkeelkeevffefveevvdeijeekiefhheduheeiveejnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohephihurhhihidrkhholhgvrhhovhesshihnhhophhshihsrdgtohhmpdhrtghpthhtoheptehlvgigvgihrdeurhhoughkihhnsehshihnohhpshihshdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747569262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XTpj3ayeWVq49NluY7oJFadUDChEKvGKJzOVeGpIrk4=;
 b=ZCdYqKC7F9P+lvzM8vPs5i2mo4Ro1pBEJOOKPrPH3N1dp+fvR6MMQe6Bv0eC4Khr+3w3mD
 PDxIkAMI6BOEQdzX2VkOEWxqbPJNuoGEiNvgCgqyaUNJuX4G0/SgDGCr4aPzaKCNYcdjgo
 FnkqeZzwFZXlVYSzrLXudMA3MruqsQL4+pMD4ZoxBZRhAAg0bwXAMkIukfK4zLw6yIlUbp
 2P7LQ1Iy2k68FfGDd/Fxcm0Izp34Z24fMplM9UyuB42UH4xZQwyRCdNYbcls4x+2NoXqT8
 Y2tlynvGYHVQ2KcQaqy9AZP/ujbsI8pVCN+NGjPAtoc5cnTDtnEoOC5YSQ2zHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZCdYqKC7
Subject: [Buildroot] [PATCH] support/scripts/gen-bootin-toolchains:
 arcle-750d toolchain has no gdbserver
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

Since the build of gdbserver for ARC 750D is broken, Bootlin
toolchains since 2024.05 no longer provide gdbserver for ARC, causing
build failures when the autobuilders try to use it. Let's fix this by
telling gen-bootlin-toolchains that the arcle-750d toolchains don't
have gdbserver.

Fixes:

  https://autobuild.buildroot.net/results/77c865f941612e99d8b6a7f66b5bc06f90d6b7db/

Cc: Yuriy Kolerov <yuriy.kolerov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains                          | 1 +
 .../toolchain-external-bootlin/Config.in.options                | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 502411d4cc..152bb90a85 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -36,6 +36,7 @@ arches = {
     'arcle-750d': {
         'conditions': ['BR2_arcle', 'BR2_arc750d'],
         'prefix': 'arc',
+        'gdbserver': False,
     },
     'arcle-hs38': {
         'conditions': ['BR2_arcle', 'BR2_archs38'],
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index ef3d23d026..2dac422796 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -353,6 +353,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_USE_WCHAR
@@ -378,6 +379,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_USE_WCHAR
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
