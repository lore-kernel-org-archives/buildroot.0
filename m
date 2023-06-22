Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB77AEB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB57423EA;
	Thu, 22 Jun 2023 16:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BB57423EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8JaTqk4mnTN; Thu, 22 Jun 2023 16:03:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0370C420F5;
	Thu, 22 Jun 2023 16:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0370C420F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AFE31BF97A
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5466B60F15
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5466B60F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fhj0ZolCX4ZT for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:02:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D330D60D77
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D330D60D77
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 16:02:18 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2HE7070364
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 11:02:17 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MG2H3A024661
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 11:02:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 11:02:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 11:02:16 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2Giw107613;
 Thu, 22 Jun 2023 11:02:16 -0500
To: <buildroot@buildroot.org>
Date: Thu, 22 Jun 2023 11:02:04 -0500
Message-ID: <20230622160212.2063472-4-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622160212.2063472-1-dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687449737;
 bh=72k6RPG7k8lasTc7bhEYLGisT+X+hsWqkFTR9+kuYBc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=JYi4tGPWE9LODfAy+r8EOKZZD8qmJC7AqZRBJHGuNO+ivDIGMS9S6u9i5qRqrCjW1
 yWUYqoCN8lqDV2MEogMrxacjkTK4IDngOChAzggWPeScogPd2sKvya7ff/h0wclvTU
 Z6hstPH4Q6Q3ww5Op522e2Snzl8GX/ulNclN6w7k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=JYi4tGPW
Subject: [Buildroot] [PATCH v9 03/11] boot/uboot: add support for building
 the TI K3 DM into U-Boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Certain TI K3 devices such as AM62x and AM62Ax require a Device Manager
(DM) firmnware to be made available to the U-Boot build, which will get
packaged into the "tispl.bin" image tree blob during A53 SPL build.
Without that DM firmware U-Boot will not be functional. To support this,
add a config option called BR2_TARGET_UBOOT_NEEDS_TI_K3_DM to enable
this feature, and another option BR2_TARGET_UBOOT_TI_K3_DM_SOC to allow
setting the name of the SOC which needs to match the corresponding
folder name in the ti-linux-firmware Git repository.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---
 boot/uboot/Config.in | 17 +++++++++++++++++
 boot/uboot/uboot.mk  | 16 ++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 085397d03d..7e1dd44196 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -240,6 +240,23 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 	  U-Boot, and that the TEE variable pointing to OPTEE's
 	  tee.elf, is passed during the Buildroot build.
 
+config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+	bool "U-Boot needs TI K3 Device Manager (DM)"
+	help
+	  Some TI K3 devices need the Device Manager (DM) firmware
+	  to be available for the U-Boot build. Currently supports FW
+	  from Git tag 08.06.00.006 by default.
+
+	  https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-dm?h=ti-linux-firmware
+
+config BR2_TARGET_UBOOT_TI_K3_DM_SOC
+	string "TI K3 Device Manager (DM) SOC Type"
+	depends on BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+	help
+	  Name of the TI K3 Device Manager (DM) SOC. This needs to
+	  match one of the SOC-specific folders in within the ti-dm
+	  folder of the ti-linux-firmware Git repository.
+
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..48af69bd26 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -184,6 +184,22 @@ UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
+# Currently supports the FW from Git tag 08.06.00.006 by default
+TI_K3_DM_VERSION = 340194800a581baf976360386dfc7b5acab8d948
+TI_K3_DM_SITE = https://git.ti.com/processor-firmware/ti-linux-firmware/blobs/raw/$(TI_K3_DM_VERSION)/ti-dm/$(BR2_TARGET_UBOOT_TI_K3_DM_SOC)
+TI_K3_DM_SOURCE = ipc_echo_testb_mcu1_0_release_strip.xer5f
+# This is not really nice but disable the hash check for the DM FW file. Main
+# reason is all those DM FW files for different SoCs have the same(!) name in
+# the Git repository they reside in, so it would be more difficult to distinguish
+# between them for hash checking purposes. To work around this let's just
+# rely and trust the official Git repo at ti.com is known-good which is also
+# accessed through a secure transport.
+BR_NO_CHECK_HASH_FOR += $(TI_K3_DM_SOURCE)
+UBOOT_EXTRA_DOWNLOADS = $(TI_K3_DM_SITE)/$(TI_K3_DM_SOURCE)
+UBOOT_MAKE_OPTS += DM=$(UBOOT_DL_DIR)/$(TI_K3_DM_SOURCE)
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
 UBOOT_DEPENDENCIES += opensbi
 UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
