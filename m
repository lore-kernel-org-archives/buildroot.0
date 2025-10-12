Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA53CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 10:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD8581E40;
	Sun, 12 Oct 2025 10:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lycu6QYQ9bhp; Sun, 12 Oct 2025 10:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3A681E39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3A681E39;
	Sun, 12 Oct 2025 10:16:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF5ACBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0D2A40F96
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zh3uWkzi8Bcs for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 10:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DADC40F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DADC40F91
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DADC40F91
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:16:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69351A4C64CE;
 Sun, 12 Oct 2025 12:16:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41576)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7t7v-000000005t3-2PgK;
 Sun, 12 Oct 2025 10:16:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 12:16:31 +0200
Message-ID: <20251012101631.3510138-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760264192;
 bh=9Y8ZX277w1lgAWK3dvsZAxIcjHqOdZ1SKT8cAQ+2QTA=;
 h=From:To:Cc:Subject:Date:From;
 b=r63cpA/LtOpmtvH6Y1RpwT/uc8dUg4fL1wuww1gCI+6IQx2DC5xJRcL7w+5Kd4P8s
 ybnLoyFMA2JJc5jthx7HrqlpuVk7TNPnhwSuWyWdNqpnyi6YfPX9NEyXndP0We4t1Y
 QR3IlZFHBns9tPuCDLMdYzpLtSuqgTuSJjb/vXnvmlSHDe0I7lDxjmOWh2TxrzuJhN
 Bhn4rozZ1gW1l4Y12VFU4FmkdT/0IC18eAMwf5s+CcbNhG9VnnbF4N+aItvBNYjmYb
 B3UtsI8NcwBNR07WalE6oE0xLvPYw1DZ37o5EvzbvLj6o2rP4dhZLoNnKJaFTqd5W5
 sVBojxBTXhLIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=r63cpA/L
Subject: [Buildroot] [PATCH v2 1/1] package/linux-firmware: bump version to
 20251011
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

Updating the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Updated paths for iwlwifi files due to upstream commits:
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/078946281c84e8477222e51f29416439a037d83d
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/06205c0eb81a78fef9eae2cb5b1789d99a78ac25

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Updated paths for iwlwifi (Julien)

 package/linux-firmware/linux-firmware.hash |  4 +-
 package/linux-firmware/linux-firmware.mk   | 58 +++++++++++-----------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 3824467072..f1fdca52a9 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  edefb1d2a538367abf9558802fee3cd135ebb19a4a5890c8eefb3416a92a6b89  linux-firmware-20250627.tar.xz
+sha256  b6c9a9c112b88417d985b87d6521b677fa2fa0d5d7ee5219c76dc8ca66945ad3  linux-firmware-20251011.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -49,7 +49,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  8f2a8ecb3358644cac3c1f37db3c61a92521bcaf4457ac726c597b3b81796aa4  WHENCE
+sha256  fc3825c3807cf5028aa9c60a4f5936a8265e3e00fcbc85b5c016bdfc136e045f  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 287f896c87..6e58814279 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20250627
+LINUX_FIRMWARE_VERSION = 20251011
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -551,62 +551,62 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_100),y)
-LINUX_FIRMWARE_FILES += iwlwifi-100-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-100-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_105),y)
-LINUX_FIRMWARE_FILES += iwlwifi-105-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-105-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_135),y)
-LINUX_FIRMWARE_FILES += iwlwifi-135-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-135-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_1000),y)
-LINUX_FIRMWARE_FILES += iwlwifi-1000-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-1000-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2000),y)
-LINUX_FIRMWARE_FILES += iwlwifi-2000-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-2000-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2030),y)
-LINUX_FIRMWARE_FILES += iwlwifi-2030-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-2030-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
-LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode iwlwifi-Qu-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-QuZ-*.ucode intel/iwlwifi/iwlwifi-Qu-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260),y)
-LINUX_FIRMWARE_FILES += iwlwifi-cc-a0-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-cc-a0-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3160-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-3160-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3168-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-3168-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945),y)
-LINUX_FIRMWARE_FILES += iwlwifi-3945-2.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-3945-2.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965),y)
-LINUX_FIRMWARE_FILES += iwlwifi-4965-2.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-4965-2.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
@@ -615,63 +615,63 @@ endif
 # different versions of the firmware API. For now, we only install the
 # most recent one.
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000),y)
-LINUX_FIRMWARE_FILES += iwlwifi-5000-5.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-5000-5.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A),y)
-LINUX_FIRMWARE_FILES += iwlwifi-6000g2a-6.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-6000g2a-6.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B),y)
-LINUX_FIRMWARE_FILES += iwlwifi-6000g2b-6.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-6000g2b-6.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7260-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-7260-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7265-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-7265-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D),y)
-LINUX_FIRMWARE_FILES += iwlwifi-7265D-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-7265D-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C),y)
-LINUX_FIRMWARE_FILES += iwlwifi-8000C-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-8000C-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265),y)
-LINUX_FIRMWARE_FILES += iwlwifi-8265-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-8265-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_9XXX),y)
-LINUX_FIRMWARE_FILES += iwlwifi-9???-*.ucode
-LINUX_FIRMWARE_FILES += iwlwifi-so-a0-jf-b0*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-9???-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-so-a0-jf-b0*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
-LINUX_FIRMWARE_FILES += iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7),y)
-LINUX_FIRMWARE_FILES += iwlwifi-gl-c0-fm-c0*.{ucode,pnvm}
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-gl-c0-fm-c0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ),y)
-LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode
+LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-QuZ-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
@@ -930,17 +930,17 @@ LINUX_FIRMWARE_FILES += \
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC),y)
-LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin
+LINUX_FIRMWARE_FILES += intel/qat/qat_895xcc.bin intel/qat/qat_895xcc_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_C3XXX),y)
-LINUX_FIRMWARE_FILES += qat_c3xxx.bin qat_c3xxx_mmp.bin
+LINUX_FIRMWARE_FILES += intel/qat/qat_c3xxx.bin intel/qat/qat_c3xxx_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_C62X),y)
-LINUX_FIRMWARE_FILES += qat_c62x.bin qat_c62x_mmp.bin
+LINUX_FIRMWARE_FILES += intel/qat/qat_c62x.bin intel/qat/qat_c62x_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
