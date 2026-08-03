Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A64C55184
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 10:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E13A80C8D;
	Mon,  3 Aug 2026 10:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uHZx8H2jH_u; Mon,  3 Aug 2026 10:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C1A80CB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785752480;
	bh=t3fuZ2bWjzZTOTAsrYsegEijetMbYZQuBVZak2vtgys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=eyQraHFErH6DMOXZ5AdzwrQtVlPLvXxbLKCS3wMrKVuu75WwQlJIP4jnyX2NkulhJ
	 gfsUIRrJWlWl0Vxi/B/iOMywZjWLEd23x5qdeaXW+JuMIgJJCQqUgserl3563ClYym
	 /SNJIqblEVXgYa1ZFE5WAOKAeqFdPALa8arc2ifvpZJq7qJI711ShATbeZ3b1+DCJS
	 K7W06ufir4B+MDM8q7Dh7OMK4yjLlpf2lDi2zGAj5XIfcqRXrZvU8oJfMnMi28fdUW
	 3njvlevlGJbapM9XGsJgVYNI7UGBULchOjhIg3g6XWtTJ+BY/7n1Dl6YnF4BElpbPB
	 tjbm7GTSxkH4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33C1A80CB6;
	Mon,  3 Aug 2026 10:21:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 690082AA
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 10:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ACC6404EB
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 10:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xz8_ACrR4tjz for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 10:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10c::1;
 helo=sa9pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAE9740417
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAE9740417
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10c::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAE9740417
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 10:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEhRSxd8cFzGfVT6GZvIo1C+IAIz+y8iuMnVIB3Wcwz+w+2/oYVt/AGw1LBcXz8ewJGarL4wY3nzn7iXZUYsKSrWrxwBHIkuSGEdpFgrvuyQ6CUnkTQjrR7xmPyZ7ALtYf88y0Ed3d4BaL6Y2PtSO5EmIX2aCqND8cYYx+qpCsFy+PBA1MsDtVfKB0sEo7QriwqUquyy8oPR3eJz8MMSXxGq1TxhZeXpsv2AnLS+1EBLND7HI8YSB1LiCFqZinWLKLBqMz4JOrQoqc9YMPJvoksVhOPoK2l5lmUJ31X32Vk3e7B8S3umpPYF2QhP/gBc3Q/Gqj1q2HY9lS3TdbtODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AwgRRlLdCB+DNzbqznsCY9NF7uxXqF4pnT9OnuPxb4=;
 b=qxUNVjWXdRdudDTeOsWbdpUNAuPb78EzIF5AVRDV7tPBLXijr4flTnDENhtVjqgM5C39YUHXlekrPAPlfv3rw4VeausXexUNvO2YFSnOuo0OuUH0jMLqLu2UnGTi6EJ3BgBsbDXCNLTvlIMCUwQk0BRLJGG9f7Ix/5P582XtEM/MgzNqxsTynLoed3Khgr7WZs9e6hw/cSNFdR8tESoLTUmq8ilHJ0fQr1KKR9Aw/ue9Zao6L09qVLVkg952/vmz9UUOXCiaOhOv1yVpbDxTfYunLhQlxdret1RMPWyohMbuEdDshVxHgXovpqIYqAguO3t/MHdOGOYdmxrmfJI4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BN0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:408:e4::14)
 by DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 10:21:08 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::36) by BN0PR02CA0009.outlook.office365.com
 (2603:10b6:408:e4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Mon, 3
 Aug 2026 10:21:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 10:21:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 05:21:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 05:21:05 -0500
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 3 Aug 2026 05:21:03 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Aug 2026 11:20:45 +0100
Message-ID: <20260803102058.4058372-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c24e071-32a2-4564-7488-08def148ee06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|13003099007|6133799003|18002099003|3023799007|56012099006|10067099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info: N65fI/GwQYEae14SL+eJpgkvEyVRqbDuH2PT/r973uRcE185/zHCAxWY10Qlc5dv0xtpad39OqzC25dj6OFiaThcVJcTwEPxSVB8df0cY2oUuCkZGPFq/XMFN7DNQpCsHdf4VCVdqG9iTqT4EBGuyGdKIftTKWNjnW4fvPqm95L9O7v9Fd9s0X5qqdne78f6zxjaR+zhzO/fuEb1K6jL6twSP/Rwt4WPxfDd7En9Hx72xoO9glTkVRB90JE5numkJwDplPfqKy3ctSiBnEJYX1pngHM0fqYkXeYpb3Nq4vq5nGGCnZ4/2sHCaTOxSHatS88MvQa1yoAGdELOjjT13fyHNkt+T2iXiiVbdVh+w+WQSOJ4kwMseL+70G6ErO4c8gIry4uttzUFL+Lfv0cOsLHExNTLghXN+0RxlHp3FzMcoirVxvBlwK7pDj8TqEHFsIYXYgKw0Uqb9ueN5wyENnI3wcEupHpfpDk4N7TdkIqWrTb4+sTUM7C7dwJBHZFh39LbddKeqfy3KBRLhPjarO2vF8ipIWg/sQMhNvlgWM0qQkrNcnsfRsZ0vX5GpH47QKc50LtwWdEv5o0hAxbK5wJQiU3PJBycgmzH93m9TP1A6GVd3Xg7Z7dXrGSMCJsbVzB8OYFKUvudkfRtlN4ZSJvtvow2znXFQudL/ouvrevOtmtOJnf7bCbUe6x3kIvHY4WyhHrLBv4qD/nZW2uPgg18yZqvzExa5wTQk8+VJjJutORwnn6thFx/V1y3E533MN7u/bd7Ck+1B2aFL2XkEg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(6133799003)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s1CssRA1ISZ+Mf1/76OLFHQ1hGTY6WbczXTp1xoOfxMxK26UKdo+ixS3a+KSdK5uEKMfXpi7yOFkl1p9eqCsG+/dZLel8iayaHWvqVwCMSQOjJAehl2FlnicIoR3hn4Y8wKW6H14PrrhUVIc/nLX9/yuByrnIA0/3oFyzlNzg4tSl8DkMZiyK5ng2askOp13c5GGGHDBdtZgDlC/P1n/mHuQsaOyrIitS+umnyTHyWrrI93jVjVrqjjKHw2wqIcZT1Dhs4YnwoHT6VMW2GAvFxhuUsWU51FQWvK2aBlwir+IEzmQEu/X23rFr2vdlflIPcW3yJ0PQq6XuLC2fWy1/pS1xaNmLTMiTNN3kd46U+kM9dYCyOC96e1hlmelTif+PEnRpRzBSVE5PyMDMraULuVP3HlrE4aLxVtNYvtih6XMl8mCchujgAvjdhOfINw6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 10:21:06.6093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c24e071-32a2-4564-7488-08def148ee06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AwgRRlLdCB+DNzbqznsCY9NF7uxXqF4pnT9OnuPxb4=;
 b=BeFxZtfkH+JS7hicWHM3ySJW8HKjZVqcRsn3dgSV3lZr3EyHMiafp++WuhB6kkmOiaISxm78Ai7W80LajvpfhlJVoo/DSP6vMNfXbMYcEYjkenHbw9jxNCS+RoACuLjY8DYeoDRE5xeiVUrSuxWQ9Sq6d8f+W7BIkHI3EbXWd5g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BeFxZtfk
Subject: [Buildroot] [PATCH v2 1/1] package/xen: fix build error when
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
Content-Type: multipart/mixed; boundary="===============2305972489503725841=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2305972489503725841==
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
diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
index 6bcc83ba..2590904e 100644
--- a/tools/qemu-xen/include/hw/xen/xen_native.h
+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
@@ -2,7 +2,7 @@
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


--===============2305972489503725841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2305972489503725841==--
