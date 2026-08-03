Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFCFC55184
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 10:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A7460648;
	Mon,  3 Aug 2026 10:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68EzHrICW4GR; Mon,  3 Aug 2026 10:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 766A360659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785752990;
	bh=dDIw++uZZsbUnd2NfKF8iNUTlitVeJTa6V+qx9hKJDU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dUfEoRupKtTU2F5cUjJLVE/SSk3h7gmp2+CPf2VuLrsZBiCWrjRaKzNlTefhEs6UR
	 Ql5T1UV7XhwimQY4/8mu/FRCm8IbC1CDm0DI401fUnexNRA46lW1PA8jBtWSHDY6NT
	 QVpMxe+wzpE2udd3nB7/lxX+EcohPDFmGCoiNclZsl00nQReDD42lD5q4cCkoY2yUk
	 lfCJL+mOwyg5uINzlh2a14PW3OHuhoEf5msQR0E4GoAFwoD7t+E8biPMJBdg9viOcw
	 x7r54HPo8VvizRhKMAOQ1hAAJxqMUQbidLJjrTMbWU647p5ROaSMX+C4AvmT252F34
	 mlv4qorOJqFSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766A360659;
	Mon,  3 Aug 2026 10:29:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2714E282
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 10:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D88380BF5
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 10:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lp-zDvDDtsqK for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 10:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2CEE80BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2CEE80BE8
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2CEE80BE8
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 10:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z99UhC36hFuVmJxmsGNZjUANWaU2PdwGkW4/yq6DSiGfEloLRk1nhBhLTtiHr70U1xPlmf+VY/70My6VcjBowPOF+Ptu1Tdhr29KyoazdIAJBFAOp+dJanRjCeS5qa7gJhwTTfKxI47sDwZFEYkNpt/U3ajLVfW9fPr6cMRHaONxgGXckUfc+V/B0RIyNH07nsXZeUI6wR7DMXG8S7VrDDCydERF0RDPWMsKB7Ff6tyQCLixSkIQCClBMxTjEfDN9OpMFHYyPeZShJXjY5yMpF109HP3jAUxT7M5DIfcToMxFqGOgxg3klCrkFlJsDWq69NujvB0BBCf9xH0ZPRBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+00gMoJAoc8Bb74O4/ixtMTxtnkOK8cCByT/Il6CC4=;
 b=PqmLKNonBRpgOPeyCAhkbrqOBwpeTxtwtunIEd1eCXah594Mg1s+NxIxNZQwd1Fjt6uJwsE8bBWQ1UP7q8qSdgKGKaWdYB3HkJZQ3A8NV9koXg9c9lO/CRiKe/vOsIoCS/WMinJARKc6XUjqeuMGYoh9Ac2UmneuOSkGugiYXxaEMMQxpcHPwxybQAtnodsKsuPEzaAIcMeNwanvr4S895EGvef3kjwb+g7gdPXMdOkvvovu9JTd6OlPmUuPhX4Q/tzWC7EG7ePyWVubqOLGT/d+G6nN0N/4zpFyFNjrkiDkV+N9P8aVQo/DjnZq9f23nrJo+2T17hCnqc3OPsNYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:47a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 10:29:41 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::67) by SJ0PR03CA0225.outlook.office365.com
 (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Mon, 3
 Aug 2026 10:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 10:29:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 05:29:39 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 05:29:38 -0500
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 3 Aug 2026 05:29:37 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Aug 2026 11:29:11 +0100
Message-ID: <20260803102918.4064744-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803102918.4064744-1-neal.frager@amd.com>
References: <20260803102918.4064744-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e86e0e7-bf8a-4b00-77ee-08def14a1ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|3023799007|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: 6YzZ+BndlHvduNZ5cU4PCYdWXQ777LZ1Bx1g4obELAQqzoQx6XACvwWUfnFu4T13O1JlLBsFVpoHXUHrMuZTttPR52KPIRgsz/QqDt4kO8MytjIZ2qZf5qk5qAm7nnQcrh9j435zM2I1RBdE/oucqpVN+7/3Vj3y1Zm2v1/tnWStDzZtC0LBmrB5O5mPZ6YCPc2enLu/khp5Dkn4QAcLeLCSWmEd5ofCsz18iBHzXdVJNdzyKh+n34bnY8ifYGEEu13ebdw0+3iBDpfxYCWOY1MZOvaucRkcVlosPmHYHwCDBw3mKo9dTNxrRFoGTns7MehIWDWXaCdPR/YduNqK5L5C50boYpEg1rQmYYNd/OrHHrUFAgFLvX+puoc+D0AtVEYmxrU+pHZ1B0uzwi57djR6TYzooSVzfpSf6OcqAx0bXmvqsySSBmOlTvv97FNAUoR4eulpi636oW4IsUAU2aLT0Ub6FpHkPRVQx05BYGHUstCa6AVbJ4uXqeGV9C8vFlZizMWD2yDLlK3tWvKFSYHEETjPZw6blweRAOZMLFLS4cGEvVWGFpqzrF6wo3l4hyvg4sDbiWVeP9Py9q/KU14hT+cA4v6egM0Kula4a3ikKvQaHkd3uMilQ+HIAIF8U2qUX+xcVRKjkiJnNgaLR6pjJWbHriGDYWT0t+1z7YwYuUA0tfC4bk6IUu+n8bEPW75cB9BC+7LYT7YAOh9Icl6FRku/zZ0RhxaQXaWid57DsFmiGb7uuMKr9rktRMKLpu22Ad1iwkPfNle2UpchwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M2WD2qi3yd3lWPJrIRq02Hvoq8VRBX2D89MRAbZBwy81WNzzSoIDSeWEoP65WZbSFZE8Rgy7krzlqJcgU8Ebr7SgqyufekWcoE6K70kwOdkA10j8EznpxmLPXeIb7GS2LhHFA8F9kvCvLH1Bev4MtOO/aLqBmTsMhP9rsULyTsh18Ft+g14UGum3kZOg2TqJeBs5puTryBFhXuWOi27VoONPdZzOp05G9z4s6ltWb+4XlH18ZaS4+A7npNDoAZ4kxzOrD7hH8PoENut2HzUCYz9NnlovpShn42UUPPvvRYeRR+Uz/LBIS5/G5ofwxEl8IonSF0j7FocSuRTdD6cZB/zcv/HTuBXD3n9Lfx3uIIXebwTUnYQBp4qivc7LmjsMJeaH2sWN1M2pPopZ59+hXJrAu9oglmpNyjYxIgYl3gcHsNE94vRQnNh/5mNMpOiD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 10:29:39.8208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e86e0e7-bf8a-4b00-77ee-08def14a1ffa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+00gMoJAoc8Bb74O4/ixtMTxtnkOK8cCByT/Il6CC4=;
 b=HBLhyw1en5CKpVKkIR9NRHQV9kmwWbRaz5VYtEA9jtloG1YotJI7uALvXuCX1EaWAXHxqbDBU1rMiWOL+5p8vcqwORsAhHQmcfm0n+SzuCCSovQdwmDx3R2JTlRwW8GKxis6Upm6uri5eTFT+igD86D6uxMVRqCyPzWkjoHeQ1k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HBLhyw1e
Subject: [Buildroot] [PATCH v3 1/1] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: multipart/mixed; boundary="===============6828705360949837874=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6828705360949837874==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

The 0002-Update-linker-flags.patch assumes that the qemu-xen files are included
in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is not enabled, the
qemu-xen dependency will not be handled and the patch will fail to apply with
the following error.

Fixes: build error below
Applying 0002-Update-linker-flags.patch using patch:
patching file tools/Makefile
Hunk #1 succeeded at 36 (offset -1 lines).
Hunk #2 succeeded at 185 (offset -8 lines).
can't find file to patch at input line 76
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
|index 6bcc83ba..2590904e 100644
|--- a/tools/qemu-xen/include/hw/xen/xen_native.h
|+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
make: *** [package/pkg-generic.mk:239: output/build/xen-4.21.1/.stamp_patched] Error 1

To avoid making BR2_PACKAGE_XEN_TOOLS a required option, fix the
0002-Update-linker-flags.patch so that the part that modifies the qemu-xen
sources is correctly moved to a patch in the qemu-xen package.

Move this:
 #define QEMU_HW_XEN_NATIVE_H

 #ifdef __XEN_INTERFACE_VERSION__
-#error In Xen native files, include xen_native.h before other Xen headers
+#warning In Xen native files, include xen_native.h before other Xen headers
 #endif

 /*

to package/qemu-xen/0001-Update-linker-flags.patch.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- changed method to modify patches instead of xen.mk
V2->V3:
- removed text from commit message which appears as start of patch
---
 .../qemu-xen/0001-Update-linker-flags.patch   | 35 +++++++++++++++++++
 package/xen/0002-Update-linker-flags.patch    | 16 +--------
 2 files changed, 36 insertions(+), 15 deletions(-)
 create mode 100644 package/qemu-xen/0001-Update-linker-flags.patch

diff --git a/package/qemu-xen/0001-Update-linker-flags.patch b/package/qemu-xen/0001-Update-linker-flags.patch
new file mode 100644
index 0000000000..8162a149ed
--- /dev/null
+++ b/package/qemu-xen/0001-Update-linker-flags.patch
@@ -0,0 +1,35 @@
+From 2ba2eef5b11d81b801265ae92df91571c19cc8a3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 30 Sep 2025 11:39:54 +0200
+Subject: [PATCH] Update linker flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The -I$(XEN_ROOT)/tools/include added to QEMU's extra-cflags causes
+__XEN_INTERFACE_VERSION__ to be defined before xen_native.h is included,
+triggering an include-order assertion. Downgrade to a warning since the
+version is consistent in cross-compile.
+Ref: https://github.com/qemu/qemu/commit/e2abfe5ec6
+
+Upstream: Buildroot specific. This is a temporary patch for an intermediate bump.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ include/hw/xen/xen_native.h |  2 +-
+ 1 file changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
+index 6bcc83ba..2590904e 100644
+--- a/include/hw/xen/xen_native.h
++++ b/include/hw/xen/xen_native.h
+@@ -2,7 +2,7 @@
+ #define QEMU_HW_XEN_NATIVE_H
+ 
+ #ifdef __XEN_INTERFACE_VERSION__
+-#error In Xen native files, include xen_native.h before other Xen headers
++#warning In Xen native files, include xen_native.h before other Xen headers
+ #endif
+ 
+ /*
+-- 
+2.51.0
diff --git a/package/xen/0002-Update-linker-flags.patch b/package/xen/0002-Update-linker-flags.patch
index ac02722781..3ba678cd9b 100644
--- a/package/xen/0002-Update-linker-flags.patch
+++ b/package/xen/0002-Update-linker-flags.patch
@@ -16,8 +16,7 @@ Upstream: Buildroot specific. This is a temporary patch for an intermediate bump
 Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
 ---
  tools/Makefile                              | 29 ++++++++++++++++++++-
- tools/qemu-xen/include/hw/xen/xen_native.h |  2 +-
- 2 files changed, 29 insertions(+), 2 deletions(-)
+ 1 file changed, 28 insertions(+), 1 deletions(-)
 
 diff --git a/tools/Makefile b/tools/Makefile
 index a9a3196e..5d289651 100644
@@ -69,19 +68,6 @@ index a9a3196e..5d289651 100644
  		--bindir=$(LIBEXEC_BIN) \
  		--datadir=$(SHAREDIR)/qemu-xen \
  		--localstatedir=$(localstatedir) \
-diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
-index 6bcc83ba..2590904e 100644
---- a/tools/qemu-xen/include/hw/xen/xen_native.h
-+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
-@@ -2,7 +2,7 @@
- #define QEMU_HW_XEN_NATIVE_H
- 
- #ifdef __XEN_INTERFACE_VERSION__
--#error In Xen native files, include xen_native.h before other Xen headers
-+#warning In Xen native files, include xen_native.h before other Xen headers
- #endif
- 
- /*
 -- 
 2.51.0
 
-- 
2.43.0


--===============6828705360949837874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6828705360949837874==--
