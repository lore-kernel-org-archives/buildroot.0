Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FEDC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED6EB41294;
	Mon,  3 Feb 2025 17:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXAZeWPhv42K; Mon,  3 Feb 2025 17:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B084129E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B084129E;
	Mon,  3 Feb 2025 17:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AC3F12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A59F81EDD
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eacJsZnQe29 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:33:38 +0000 (UTC)
X-Greylist: delayed 466 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Feb 2025 17:33:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4BDE8146C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4BDE8146C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.91.199;
 helo=mail.bgdev.it; envelope-from=buildroot@bgdev.it; receiver=<UNKNOWN> 
Received: from mail.bgdev.it (mail.bgdev.it [195.201.91.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4BDE8146C
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:33:37 +0000 (UTC)
Received: from mail.bgdev.it (localhost.localdomain [127.0.0.1])
 by mail.bgdev.it (Postfix) with ESMTP id 214B62170F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:25:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.bgdev.it
Received: from mail.bgdev.it ([127.0.0.1])
 by mail.bgdev.it (mail.bgdev.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4jh4_9BP_BaY for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:25:48 +0100 (CET)
Received: from localhost.localdomain (93-42-248-108.ip89.fastwebnet.it
 [93.42.248.108]) (Authenticated sender: buildroot@bgdev.it)
 by mail.bgdev.it (Postfix) with ESMTPSA id 146DE21672;
 Mon,  3 Feb 2025 18:25:39 +0100 (CET)
From: Gabriele Besta <buildroot@bgdev.it>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gabriele Besta <buildroot@bgdev.it>
Date: Mon,  3 Feb 2025 17:24:51 +0000
Message-Id: <20250203172451.760-1-buildroot@bgdev.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bgdev.it; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1738603548; x=
 1739467549; bh=6/8UoABvny1AhX+jWSg35Lt5m1WhIInoYQm/LCrJdzE=; b=H
 32fQY3V/P1nPOMwaHzuiW6nh1unj328toiDRpTRMLPK4PU47AwNVXFXCPVBrr3TZ
 Cn1NUq3P4a7Bf+7Ds6gap0jUpptI+i+rLfKWR1801CuXfiykm7JidN/rOAuxiDIm
 Ie/mrEJtDtLqpfwnharApZ3dWq9nyAikKL5ovo6EvI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=bgdev.it
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=bgdev.it header.i=@bgdev.it header.a=rsa-sha256
 header.s=dkim header.b=H32fQY3V
X-Mailman-Original-Authentication-Results: mail.bgdev.it (amavisd-new);
 dkim=pass (1024-bit key)
 reason="pass (just generated, assumed good)" header.d=bgdev.it
Subject: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-arm-aarch64: add toolchain
 for AArch64 host architecture
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

Enabling AArch64 as a host architecture for AArch64 build.

Signed-off-by: Gabriele Besta <buildroot@bgdev.it>
---
 .../toolchain-external/toolchain-external-arm-aarch64/Config.in | 2 +-
 .../toolchain-external-arm-aarch64.hash                         | 2 ++
 .../toolchain-external-arm-aarch64.mk                           | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 309994d014..8582fe0ec8 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,7 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	bool "Arm AArch64 14.2.rel1"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index ed80511f7f..3f9c9cea71 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,2 +1,4 @@
 # From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
 sha256  47aeefc02b0ee39f6d4d1812110952975542d365872a7474b5306924bca4faa1  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  299c56db1644c135670afabbf801b97a42e5ef6069d73157ab869458cbda2096  arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 7f9c97c5e5..cbc923bee5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -7,6 +7,6 @@
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 14.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-$(HOSTARCH)-aarch64-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
