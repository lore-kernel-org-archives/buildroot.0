Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD89EDA68E
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37CF5608E7;
	Tue,  3 Mar 2026 15:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yp__dlVPZK42; Tue,  3 Mar 2026 15:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9968A61065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772552853;
	bh=/0UWsAwc3Sie8UtVHc5DpRHfo1MwJLI+maRSLmSDkio=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=d7f2qpnA0uKHp/+9aQ+PCUG4wePvO9xPfLfeGicES207NqpHKbvcM2AcduqrkhNwg
	 eeQ8fiEZdm8tXQPhS9nnCiwCj49dbMYJxIzO2A0ugbJs0iMBoFN3JpQ4ntraf8w40f
	 9zlDBXxzPgmWNyI/zrg6VOl37BTO9Ai59euvOPEghDVTIEmPDo/oVG1PXj6jMITKY4
	 2R995MeixCNNi+JeO93erQa0Ixe6kL+HCCIn5KKzYVNfe32EqgPAwgAKzDLSvnvz3+
	 lM0o2ubFSVmYv76OP/QyC4jHeon8xZ32zN1b8aHtXkBNMPM8yX7xBE7eqT+Mdi96sj
	 Fx0A1M+NrBYzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9968A61065;
	Tue,  3 Mar 2026 15:47:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33D3A25B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 257A140843
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnXvdJkRcmVp for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::9;
 helo=dm5pr21cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E185840839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E185840839
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E185840839
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:47:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6XCTrTtxG1uoERhPX7wt4J+qfyJwwj8WyfEq0RlgGl14nFQUG9M4qbADVt10bl4r88VRn57OEqMAEOn/XwLF8L5EB62kQJpw2prf4l/X4WVGWIopSY8xmHp8h1RjT6cTrlleBcUB7EKlOS+fuDElBZgNK55i4JzpDzHauVG+UG4NsZ3KP1oTX5XPtOY/VOzg0HYJMsvGdHGHTho8EAfmb9vSX+kK0TbZQ9LllxQPSM8u0fexQR3vcfWeYrnYhcmPJcHtsY443Zx5mkqCMrEAlfr3WCSGXtQm3tQQJBgV+vmB+nCaJKI20XYyYfOPuL+5976Y4e+rwjKNrGi4IqIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+SIK75PNYeYZd2A/vVK14z8lz1BIQjmxHbpHzazEFM=;
 b=AlZeRHHoQqDnGe7R4lzLEnA/r+kUeFCAlWoaGLhoV32AJFQfBrYZZXgeSP2G3BuH4tDopO5Je5Z+y04qeXiAWi/QDRhjDxXXb+1yefOqaRlwr8xcPnMi4nLN0NLP2iXJw49kIq9qaUF39xyhlxMnhTBtpdeUwN+oBYWoyBoVzd7D0eiHfrhoTxDDVxpm5Yxe2GlRHYV7emGsZf1Us70Q4UWt0Ll+s6RFnF2cPYzJVzDKkI20B1L/6FThptA+8xwrE8KD7uXrNjQqzxTL2nwFKp4AnrJUcOUHE5MhPBg/OVt8rRn15nIVsJucUFdPlw1/OtzgwN/EoSVH1HES2686/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:610:77::18)
 by PH7PR12MB6444.namprd12.prod.outlook.com (2603:10b6:510:1f8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:47:21 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::1f) by CH0PR04CA0043.outlook.office365.com
 (2603:10b6:610:77::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 15:47:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 15:47:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 3 Mar
 2026 09:47:19 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Mar
 2026 09:47:19 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 09:47:17 -0600
To: <buildroot@buildroot.org>
Date: Tue, 3 Mar 2026 15:47:14 +0000
Message-ID: <20260303154716.2122822-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|PH7PR12MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: ca784939-7a48-4d84-2a61-08de793c2841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|7416014|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: jdSJtVwlT+rnbPrWkf5hYgTLncKTTNNmqVsLY2q5AtRKr6RR9TfAUskhSmv/k5M/ak+uUREsRWWRDo7y6A00BEm0OhdJfEzQ7a8dvT5nZIgASYXpW6pSwerwWnFo1eAlH9QTGqxRRNgPqJscwUW4LvGyyCYiV3HRFegScmRBlWuYUsc47t7GtQd7vRmYFPZaozqSi1XqCj0zuOLpWX/Ks6pnR4TMw3Vck86I4dQOx3IPr2PvSbtxhxck+eP6QoqzTIkxcuQ9Uim3G3jLnQcSJiLRQhgF5bct47jff/egKO5z2JRRWS0A/r78F8zQ0ZUa9iPZ59van87GAXx+EJVdWOwmG3RaeGet4XpYbAmgoDokbt5ipqpyY5x3bC30tLtrgJUoXRZe3ArdVgpBsQqDyAEfAFoGYQ506+GiK5FOzVaS02jjsK//oC51y6ESAYESftEawYeLaUMqD0LSwuM5nHRDODaPQBsjicMh6gQbAp3bWZR0o3Dw2qcgFsS5q0MDn/2+onQX5h9FOFa5a9CtOSeg77AtABAUD6CIELzjTAJ8ZIBcNALkb2J/6seQTMHGEuOy+Z/O5ueDqWwTOF0RGOoTR0GDv0s/BG45lkhZX3reqawrvg661M0dTTi1ENkbDdHi3cgEjJGhxNOTQWVjfPBIGv4FHiEENwdOBXS6P8Q0+AUB2UPq8KaCprJuNa19M5gUhZ7d1+K9XhnRG7tlgPGuW1kvgzU7BHpeQrO0FGyCUXn9q2Op5hKzpMYXjJFWav2wPiQ2Mx0hE49zqAb9WxCDa4jaryPhnxhrwRAOcAowKSzT1qMHXzLW9zaACxmBlwx3yg7k2IKiOZV6h9GBD0i3b3/YOQ0nruWs9JjL/vA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yBIKQrFYQorzoUW4tU2B+XheBNo3I2FBopVA6IxICmNxRn/qUaKOuJvrqgd2E5WiIUhzomMsiDUUdHg6JJ0fBh8w4yBEyctcMn50Khe4yTXQMNMR3xzwjOP4nirQVMU2MxrIzRAY5At0DH9KDrMS8TurkYr+aRs8Le2gQrwA04owQiULdRhDa8GrGLhjj+pi8IAS7PgVW4a2o1uihRwXUkxigMGhwZF5osPXfjo65i5c4EOFObfqq04fsdwDDfOWlWa5Dhd7BHW3zs0guv4GhDE/8oUD0/wrgu31ijBSn16dW2QVSOT+cZekvHRJn65oVCWRXBnZcM8LC3RU5Ttj4rXvVerc8B8c23YW4c72Ub4Z12A8LzoVHXCngbYD3n9pDRF3brYZLtdw+IgoU+fqURIDJJJ2Hn5O2M+hDwMJ6TCTFbZX6u1DwYqeo/1bBals
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:47:21.3003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca784939-7a48-4d84-2a61-08de793c2841
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6444
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+SIK75PNYeYZd2A/vVK14z8lz1BIQjmxHbpHzazEFM=;
 b=ueTmVC+wmyjDIDqji8qO9bp4Y+Mz/zLTWOD7EZI+q9CGdmZH7iwWjcNGSv0vFZqq3/LHk4J0x1/GGW68038k8O4+ChHvAGiHMhpbuQYK5RZ0NfFr+Qp+M7yE4U0oDQ2ShtXpVbR4BuJeNd3InlqyRSu/Z2ELYDigeMw+b+zwpz0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ueTmVC+w
Subject: [Buildroot] [PATCH v1 1/3] linux/linux.mk: export LINUX_DTBS
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Users of the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR config for custom hardware may
wish to have the dtb filenames for use in their post-build scripts. Since the
BR2_LINUX_KERNEL_CUSTOM_DTS_DIR only specifies paths to custom dts files, the
actual filenames are not available for any post-build scripting.

By exporting the LINUX_DTBS variable, users will have a list of all the built
dtb filenames that are built and installed, and they can use this for
convenient post-build scripting.

Even if users are working with an evaluation board with an intree dts, the
LINUX_DTBS variable will still give them a list of all built DTBs, so the
same post-build scripts which work for custom hardware will also work for
evaluation boards with intree dts files.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..6ef9f54ffc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -226,6 +226,9 @@ endef
 endif
 
 LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
+# Post-build scripts may need to reference the LINUX_DTBS,
+# so export it so it is easier to use
+export LINUX_DTBS
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
