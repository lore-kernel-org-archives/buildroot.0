Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C42C5518F
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 14:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC00340546;
	Mon,  3 Aug 2026 14:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_Zpk0Bt163b; Mon,  3 Aug 2026 14:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C95234055C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785768732;
	bh=hH8OFwnhle0+s6v1Vu6G8SBD+ZXni5ZkcDChbIrOPiQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=W2pJSvCCOJy864uv5EzHwjysCEOUIoKc7Rkl4eklFYe1WPpm9bcQ1ntIhEgwr0YHx
	 ji2UG+kptqH+lxsszbgQjMdHzgVAh2rldIYarjRm9PpWBmm0+DsDZ1TGoZmeqBUjV8
	 pEcJmQzy8mbppu2iZstTJpRJ2dKsz9IVWX1C1uCfhWzJxp+TfHOujY8m20Kz1wI1kA
	 5trCY+TSBDVrGstSZnrtN9VNCzcyx6WW8tDG693HcBO6eoYLrpjkq/c2jQNvVHlaV4
	 mV/C6YJoYhnnQjffz+TqL6lznt5zF6Z4iGQNgx+tUF9v37tyKIhVs94l7eaM+xyD4Y
	 q6AXU7r5LNFrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C95234055C;
	Mon,  3 Aug 2026 14:52:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 531923A6
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44CEF4008D
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewmo0FoMn4zJ for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 14:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c100::f;
 helo=bl2pr02cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99FF040042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99FF040042
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99FF040042
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:52:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZcl1r5wjK3mPs3LNVhqmvuhaO/930HIqC314mAFsceVV5ltqTuLz+hagQeOlnZxwKLubnSVqR9qJdYiEFFkj+GMZRPybjEtARa9P4Glkf+xQTmE1/4VNCeiVilITZUMSJgIxcr8a4IakrI3mUwSMdus1zouX2P6tRTDrSvsJsLzeCJ97TfvblD9iU5/WO8Rtx4kmrVB2dnvAhHxSXF7RKIBi2XySQIK/pRT17uFkzmuK3QEcAvyEXT0lDiik7YM/DkOeV1WXb2bSm+3IoszLQA0qF6EpheUkv6dkvArQex6wliMBi95aYcZoa/vSzVNcokI+2Y2WYztjeQ4OpvfJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo9zOtg3TEv3M81Tfsf6p969WoddP9xYSUvgjvmkfBw=;
 b=d4t6GjrUpveMQ+h2X+F3yi5qz83mjWkYooyyDQjcc+QuIxuPWjz/1VPEMPXA0pRFd+z/z12CDbQAmHZ8CmU2tsHwE7xmiQm9SubwsSQYC0AxwprqR1W+xNSrNGK7kBz1XIuaKtmviBoNKCdvcQMY4Jc+RA8hmUyHlOwkZYLSPymQmLD/BZCZUimJpsl49JDPe7r2+YQ/GkLeTitDkKIBEw+0WF3fKzxGuKHGk/eIri8i7kACp+JG5OEonLrofeVyIN6zVB+loTv5+ZUc3t5tAPHtxMc+0SRjMW4YpkBNpuRXpBh71V8d+MSUI0rLS/36yyVFVBEmcxkDTxAx9+jvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8P220CA0031.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::14)
 by CH3PR12MB8970.namprd12.prod.outlook.com (2603:10b6:610:176::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 14:52:00 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::94) by PH8P220CA0031.outlook.office365.com
 (2603:10b6:510:348::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 14:52:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 14:51:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 09:51:58 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 3 Aug
 2026 07:51:58 -0700
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 3 Aug 2026 09:51:56 -0500
To: <buildroot@buildroot.org>
Date: Mon, 3 Aug 2026 15:51:41 +0100
Message-ID: <20260803145152.102135-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|CH3PR12MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e850927-cfdc-4c6e-7d89-08def16ec55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|23010399003|36860700016|376014|1800799024|82310400026|3023799007|18002099003|56012099006|11063799006|10067099003|13003099007|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info: eCJMMoxdZfGUihDNvk1ByMz7QFwKzNFnvjvYJQqbQfl4K7msSy4xA7xSzcyWhpaxZq3Mu1OZG6zGzYC7AtrsCqf7rT5NA0RMOF80g7GKW1y3LZrQR1X9T9eXGJlVsjPaIEQDO8a/oogKANiqYCINAFN55t0JotNcEW/17Nwjp2rPjIH3XWTEKwVA7C+gsg5AcdwCcK2DzaTcePgiFgLo5lM5Cp5T+IoVRTb9E41OxOvPr5km7titzkFBNd2d8xE+XuiIx4rFzRACXe1qtmsVyooqbhZWjnAQdxal8rb8O7i5ZaYsDWV1C/9EuST1uVSV9ltqcrh+IIjAQV/wsxkeHaj0vSZIcVwcEZnVRN1g+nZs5szM3O6bvBGcVV639h+9lv38bfA2KCj13Ue38Os3N0oPEf2knIwhMdkO0Om96rNRAiXIY1BRWxhNpp79elp7o/BhS9iXSRxDhoLbKM2OYwuDGkqzychx5MTBwqrbsqE/vSLWPSHNmD3iUUoZU6kKaTV02BWdErxIc5Byj1yGyKAPyzXskbZ+SdariOVoAcPlqDS3TTI3OuFv+ItBkk7pvveaUZJtfj2QWDOouiyb4PUXKa7F6ZGse0BMBg7rpJpXujiWkKsB/fszzEmrh63Zu54/Zwfw67HyKInhFCCagRER2Tpoh+pnbMpLrfDLZJ5xz9BlAQHT4WKJcp5DKdNfXf7FB+0UgazbnvT9+ZJFL/vddHxMBB2whu2kpWrnMi21d3cPzSUcOCF+Wuu8K2k2oc2dpwPGNWgMrrK5y/Ic3Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(3023799007)(18002099003)(56012099006)(11063799006)(10067099003)(13003099007)(6133799003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: plAk5d8m8MQJUouJM7HoK2ObD4oByQkfCOK80sfRc4uWraFjq9UHUx75R9EzsvtB5V4pLi3ZXzUEQ8TMOXqrODKeL7ssOI2JLbaRgGDakjMDm0UgOZpzn7whTbU3AhhhfhqmRtZszAwfL7FnEF2P+aMnG+oaB5AdBrsE3Om/JXCj/QsHJx/XZPIDEuq5xLxe5iksoLAHA0s4Vy2SAFw2ft3YMbM4CG3QoPvCeKs1uS1rMUjdmJYlnNUiVWhaqSk2btoEjEwW5FMLaUrI4cHcSGecFmB7PtMWgxYzmnbKUDjvi/gDKLLns8yogvM9Vj6sIHsW7xvk4b0tilfqfMmXoLGmxNcyydiFme9gpFQQa44xJVClupS+HlXB7TuQAzeskBkGaS18o+B2Csol9cONhpur6t0TTBOPvCYhWLXFTuNEus1jbLq/ytZ/imM+FB7U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:51:59.2043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e850927-cfdc-4c6e-7d89-08def16ec55a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8970
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wo9zOtg3TEv3M81Tfsf6p969WoddP9xYSUvgjvmkfBw=;
 b=v+4a8uzK2zyHaHf6EJNLFFknMqegc6ubsr7MxTqEiHhiNkOZw56M/aiu2d93Q2ouM9jPXUl3UifepGwwli9ZXggX+3cQ1hiy9oSkSNvgXp5zJdgVdPYqwuPQTRHldMtmQ+flfc+lFyz8u/ZzzvGVBsHlegu0tp75TXn/h6uVDqg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=v+4a8uzK
Subject: [Buildroot] [PATCH v4 1/4] package/xen: fix build error when
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
Content-Type: multipart/mixed; boundary="===============8345954613985476083=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8345954613985476083==
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

to:
package/qemu-xen/0001-Update-linker-flags.patch

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
 # BR2_PACKAGE_XEN_TOOLS is not set

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: John Ernberg <john.ernberg@actia.se>
---
V1->V2:
- changed method to modify patches instead of xen.mk
V2->V3:
- removed text from commit message which appears as start of patch
V3->V4:
- merged into patch series as the first patch
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


--===============8345954613985476083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8345954613985476083==--
