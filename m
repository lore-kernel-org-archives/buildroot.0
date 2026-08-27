Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DE0C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D11E80E5F;
	Thu, 27 Aug 2026 14:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jc7Llpwu0EBh; Thu, 27 Aug 2026 14:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787842242;
	bh=4NKLXYMOVJQnJILdefK/GIYxeFOSAdD+JlulspLPvJs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=LWAQQ8DCqeN4J6hCBNHkxKKUvXN6lajCsqwOGrqH3B+vK/ku2wJ0nnKVYmezjFSP6
	 0oGnywBECpjxsjG0Q5M7SEtTptGO6H20Wr+DW+wmMsEhA1epitXmGGe9X+jkn2WRd1
	 jxdOnU3A13zitXrFyg5UjoVC2sp/RuJMY4xnc2075S8mawzwsdrBSvI62JNcD1tIny
	 7VsRt95ScIZJ9LFvrroZMcZA7k1Dt1ONT4sezrk/P0SmbBNzSpB3EZI1Oh/oYgames
	 B/TfOY2Rt+1Ff+0wkuxhveEmYgsZuJpAmO8Mle25r0rz3pkEJtoPHz1RqvPID+wqGi
	 1vY7PFVCsgFqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD2CD80E52;
	Thu, 27 Aug 2026 14:50:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 682AA334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 14:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E6BA607A8
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 14:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uod6roSCHHSl for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 14:50:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06B1F60792
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 14:50:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaLhF9uIRKmCNBZDNWbpe+AM3YALCv44TDLVS3FvgHf2BsMVsYi1UPewMrS4ZR+aLJVCjDaUmwjTXcHhZK4vhvuQpoPc4ZTNxCz8c+4ciPJVP+7WILQ1gTedujSkdn/MFOjSK3WtS2t78q12DTAPdAHJ9XNK0V8/Fgv0LXabLlbaKyJOISD5VQY93qP+xronBWhABUxtSigf0+HssIbmhXryaU0CxHqiFpjFv3O625pQZmd/ujPncO/tULgR+PatUOhW5q7WKhggGCIxp9LCJVzHQEGZtA7eyQFDbg8Sq+9SsJzTcXyIVGPlr4G4duxchzLVVYEdzSziU9N+ooRPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iV7/mv7DGv13rDalWTMKeflWHIR0nqWC35vdsDgLCjk=;
 b=HVgw1vU53G1+VRZp+qqdfckVEKklGDzLYHR1pZLtcz7wC9I4jBnNoyJDIIs6onzw3+a9dE+lCr4bMW0RkA3W295h8Zpg9D06Jd4XlJhoy2SEMQCdnQaa8MYmUwBgAolMLYAGZHS4jllY/T17sNwhD22TbaXLLSM2dW9xhmfL+otR2r/JDCVBcs/43M+qEuBr8u1TCviBRaKBmqUjdAlD/xoryDX51KOGU0PEbXh2CCjWNXIRtGiqHRhTif/iuDFp/H9amMTbEgG7XPjcf4hNa4i0oQC6Mtkrje5Sxt8CooZ6DjjiE2IZAukfcLBIWBoA+B2fmBF7RPMQKS56Kv4uVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::24)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:50:18 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH1PEPF000132E4.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 14:50:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 27 Aug 2026 14:50:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 09:50:09 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 09:50:08 -0500
To: <buildroot@buildroot.org>
Date: Thu, 27 Aug 2026 15:50:01 +0100
Message-ID: <20260827145001.1382288-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bc3b50-0f0f-4e3f-4364-08df044a82b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|18002099003|11063799006|5023799004|56012099006|3023799007|10067099003|41080700001;
X-Microsoft-Antispam-Message-Info: 1ma+s8m7X7pXh/cLjjlh5KCnxDa2pxiOaEu9jZjv45sWehA14+ePsat3mW7jc6NBCwtFdkUw0lwD1DHoYDyeoqQX6Nam1eKsO+2q/CnRpCAV3iXRUl0zIzE7rWAcwCwHb0WO1FcwBGosEuizGAjHsT+rsaotZ29VuEsn1ighSurMTDQogS9S+0tm/WEvfYA/tJWe1rgOhO7MHg7C1FsfwTKTetNR1Kgy+EFjGYBhZIGscSLwbVYoUQecSU0kc7E06PjlIuzz1TQBLi4cvzcfYLgZ6bL+QSTXmSsiiCDuDye81HfVwRAtV75OuM1dIQu4mtU4qAc+CPLnhOH7n0HunXsI/i+b7YnzGAgLhWzAk0acIy1eo28oO/z9u7+CSvNlBqDmp/2JhmIv60R6zKLxIUXvkxiHb90CzbdosQiFTu0k8WHKWRReTyxAaBilYChsMZUwy0XTX76PYGe4MpeQai93uKAFTmKOO+bIWpsagpKk0cF/zwgSjxokt0OqTnkZLw/1XFZ43EbYpMLyferrNTtpZ42T6qJeeqWkPjlzUOLru9ZbNYhajCbtJXD0sQD7IluO3rl8BK0zZPAL0eNNdypsxNGULnmlN1vhPZsaSmQA7pwpumTvuRyNfjevylgAhnaLC5D+oYefZno5f0Mb3usCNuDOaHHeV/VYGlQEZR5zKgZK6CS+UY3FwJL09hx1c0QO+CWmbqeZd7QN3byaig==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(18002099003)(11063799006)(5023799004)(56012099006)(3023799007)(10067099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aJfEqFhhoX7+HxwwU5/r7A8Harjwln1KnJDcaKOnv78yjSk90rrhKJIjq3Xs6SACTpAd8UNiwJrZ82BFIjQchdCCZ6r2iceODSozvMsAeveWcUMX5AN+NShGmfl3jcRR+ffoaqJ/KC69EaYylEKTMtO1hvNQceUwZSqqIYx2gUBkgjtuiINsIh/tucMQWV1NyXwb6OTYmI376u5ph7c+fySn8gHNWjS3N4nMJc8/cjdfiLEA2PtyEJ7kvXAWq8EVXbJnweiWBRePwqJdCisgH+lQam6TkR+eFFBrP2vpnwZYbJo7lRv7QBEIH5IOGrNVJTB8/iz3v39RzMSHjumz2CEkx9eFNKXedoT/6/VvUIJGo7/2wZ6ScV/SEspCeisVTlnuC+l8vALPsQlFgDDbEfMF3KWyKEE8RPlKUnI9TtrahBbGBZTai9Lvcb21hFSW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:50:17.5892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bc3b50-0f0f-4e3f-4364-08df044a82b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309
Subject: [Buildroot] [PATCH v1 1/1] configs/versal2_vek385_defconfig: remove
 useless atf console config
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The VERSAL2_CONSOLE variable does not actually exist when building the atf
with plat=versal2. So the current VERSAL2_CONSOLE=cadence1 is not actually
doing anything. For this reason, the atf will print on its default console
which is UART0 or pl011_0.

The correct definition would be CONSOLE=pl011_1 in order to build the atf to
print on UART1 or pl011_1.

However, the git repo xparameters.h of the versal2_plm is not currently
enabling UART1 because the XPAR_XUARTPSV_NUM_INSTANCES is set to 1 including
the address defines only for UART0.
https://github.com/Xilinx/embeddedsw/blob/97f2baf7f69e9d5f447650110af0d8841e501277/lib/sw_apps/versal_plm/misc/versal_2ve_2vm/xparameters.h#L1519

The problem with this is that the plm is not configuring UART1, so the atf
will crash at boot time, if it is built with CONSOLE=pl011_1 and the plm has
not already enabled UART1.

For now, we will remove the unecessary config that is doing nothing.
The versal2_vek385_defconfig is working, but users need to currently open
two console windows to see the boot log because the current config is the
following.

plm - console uart0
asufw - console uart0
atf - console uart0

optee-os - console uart1
u-boot - console uart1
Linux - console uart1

A patch has been submitted to the embeddedsw repo to fix the xparameters.h
file such that the plm will correctly enable UART1. Once this is applied, we
will configure the plm and atf to use UART1 with the versal2_vek385_defconfig.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal2_vek385_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 5fe099bc8a..97d8364ec7 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -26,7 +26,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,ar
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
 BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,optee_os,xlnx-rebase-v4.9.0_2026.1)/xlnx-rebase-v4.9.0_2026.1.tar.gz"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
