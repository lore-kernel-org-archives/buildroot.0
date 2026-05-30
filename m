Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB0BCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49C98853E7;
	Sat, 30 May 2026 17:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PETwMZDpYpSs; Sat, 30 May 2026 17:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9322B853DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162439;
	bh=6WLmZJv+ty55XnlTkT/CCvKLASeLOw/hDswytkjIHGk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FshDuh9fD/5rew+SavQDLehMSCC/NSTZsUjlcV/KD2hDJilmeAd9EOhHgVfy+OotF
	 bHLWCr7aPaACxFkXnkINtQ5q/nnvYvqFQPOA2DR3vBPfJE2rPWFJL9Fna1qwc9pnBp
	 H+cS6ewbUslhptmBLf2aCnEabj4tJjEHAPwMh6tFXvozvtMPV8MPd16ZL4AML6ybHf
	 fUGUjiBsCyi6KquqChQ20KXfEYnmU9DFvdDDmpAZCnbApvB8QzMu/0WkGQgEP9iQNv
	 hq4AgV2dbf1dWjpfbKDkvaAms9l6kZc0DPNzws+wDQQ3OJ2+poFFs+zWZWGW07ZXp7
	 MFUCmMmQgRe5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9322B853DC;
	Sat, 30 May 2026 17:33:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9A12D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB45042698
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHgnWpcxinjs for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:33:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 592AF40064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 592AF40064
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 592AF40064
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:33:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -173867640; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 17:33:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wTNZK-00000005Qt5-068v;
 Sat, 30 May 2026 19:33:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:33:51 +0200
Message-ID: <20260530173352.1294980-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=boGokWom5+4khc4br1aECD3AfYGdCw4cXeralK5r68vsfypJnEHfh4vPh71TJAjsUXQXgShBNggZNpw3JtHW1dFST+goUYRAyzLB/NIAa9V6nGK+xsH359zXukV7fUvQjSmePlU6R7RDq1lbC918OH4GiYNoF/DBXXJJRXl45bnsz/UrH5OOtzAMg+b9hiuRC8EKiI2bPHEiQT4iqK7bR6L3HPWVVNtwWA22lI1DvtVwb77HZYs+bJcBxQRY3Hpi3rZu/VmE6lfAItgDfiFcI4TfJrl13mkc0GfWOag8iWhXJiINIxA5yfppWG5BMWwzpcRWOAp9/PfDvDn1qJHYeg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=5p4hleu22R+yEtAEb6UKN+cU2k0Ie9e02wKKsnuYmE4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=boGokWom
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: correct cpe-id
 version logic
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Dick Olsson <hi@senzilla.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 53bb7eafb2 ("package/arm-trusted-firmware: add
ARM_TRUSTED_FIRMWARE_CPE_ID_*") added logic to set the cpe-id version from
the package version by dropping a v or lts- prefix, but it used subst
instead of patsubst - So it would replace "v" and "lts-" anywhere in the
version and not only in the beginning of it.

Change to patsubst to fix that.

E.G. with the following defconfig:
BR2_aarch64=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="version-with-v-or-lts-in-it"

before:
make printvars VARS=ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION
ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION=ersion-with--or-in-it

after:
make printvars VARS=ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION
ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION=ersion-with-v-or-lts-in-it

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index c3c4a581da..1b52f36783 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -8,7 +8,7 @@ ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_V
 ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
 ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
 ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
-ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(subst v,,$(subst lts-,,$(ARM_TRUSTED_FIRMWARE_VERSION)))
+ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(patsubst v%,%,$(patsubst lts-%,%,$(ARM_TRUSTED_FIRMWARE_VERSION)))
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL),y)
 # Handle custom ATF tarballs as specified by the configuration
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
