Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C054CA1013
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 12:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E548C82003;
	Fri,  5 Sep 2025 12:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UhONre68NHx; Fri,  5 Sep 2025 12:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2458581F44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2458581F44;
	Fri,  5 Sep 2025 12:26:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54863B69
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 12:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B39181EBE
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 12:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJ81j592pMIc for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 12:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::61d;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CA2A81F44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA2A81F44
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::61d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CA2A81F44
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 12:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae0DyOJLoThYybD1tVw7rryDq6krDKSfR/G2G0g1wT+ofPQgWph4OSP+L0NeeA6gUe8ScHVZNeVIrP+EdMbgd99670s9ac5LQaIqvQUd3qbEjzZoEk7uwMQru4g/sFynweQJjCeGdnKZUyNBszSXXpBbZSecfh8jbYnT6PZ0tIcBG+ILAKDoBCiKCPfNko72/p8jJspr5Nw7X9xSSSqkQwCq+Ym5/H9TGgIUTyAfAad4km9pMZKoC5SxtHCbZTpR2XiaNG3CCP+q8X8QfNiXmX59+BJF9vwP2u545GfycCzKIflvxdcULLnU1Eo6mbUXsI0yodcd6wxA2HfpH9+EQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aI6y48NOCfjPQyIiCz6jlHfphSC3YW9TzyydF7UR8nc=;
 b=WvM5V6pDX1ZrOmnoVVh5nz33kEYWAR97zkiSiDYQU/TQhbFJMKEM8ugPMaYVdmOFV9qJ+Bd3EPAwb5Du/MuQTWP3v5KMzLeTLvq1GN7mbciFVcPWdfLSbeLX21ISZFwnBrZw11VWwJaNvPbqqJbKprFsQKGfnQaOYrEZMXNAIWed+EbqyOAF8LB8rdmUJEwGxqBAgsRh6SL0vYTZnuyXa6PlTalP/FxWTKFVbEhyDENWLkgIayAy8/ammgUFYO5wWzRZjOtkaW/2Ym507oG8Lt52KT79e2VuE1uHl7rl3t/fZhrcaxKK0ecfijBfX8wxfSBDFx6GxoMPAazMEp/wcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0097.namprd03.prod.outlook.com (2603:10b6:a03:333::12)
 by SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 12:26:14 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::ee) by SJ0PR03CA0097.outlook.office365.com
 (2603:10b6:a03:333::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Fri,
 5 Sep 2025 12:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 12:26:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 07:26:11 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 5 Sep 2025 07:26:10 -0500
To: <buildroot@buildroot.org>
Date: Fri, 5 Sep 2025 13:26:03 +0100
Message-ID: <20250905122603.2521801-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|SN7PR12MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b71bad-cf50-4881-886a-08ddec77674a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oumWrqO7wVURgy/h13nvujVaOVDQqsGh5eTCaPJLrFwktXT8wi+szdah9lvz?=
 =?us-ascii?Q?+bzukukU//X8NFsQoEASGtAQRD/ODGQLlIns2SBv5d+k128YAKToIuRIbZpb?=
 =?us-ascii?Q?3PVQa87in0HGbAB8WGjzzXbSjCDpKyRIeIMf2zhpGQvXqNgNftMS1XOdyVpi?=
 =?us-ascii?Q?/WEiyJg4wBRV54KgYKfHphsLiSy8tFuyV+HIZrZv2m0iDlxNCxUcDNt4065h?=
 =?us-ascii?Q?PuGouulwiU5FBXvWdMX8iPLcd/YGsraEX1qSGygmkWOxF7sgsR5N6tr9HOFE?=
 =?us-ascii?Q?mOv+n7IBnozK4Y6hplnCaXakopNdS0RWrZPAno9AXAkQn3bbQmDdTCjYzkto?=
 =?us-ascii?Q?UqQGxYi+9YCd9wS1cRHggcRDApElmdvXOoW4thqzfXqOSR9OeP/wbNoV9YAN?=
 =?us-ascii?Q?o13AZCPgyoFqqm1vUsK0+PY1Bm2qrFsHFAtEpA/EVp3BYgEjyz0Sla0JFtg7?=
 =?us-ascii?Q?K/+08Vu9+oQPvlHxWjyxab0HiUO1yToXRPJXcsPn3zyzfHZjnQQ+JWDVHY5p?=
 =?us-ascii?Q?oKkChHqDGL3N6TQ4fABIqZ0B0eTaDti6BfntnyQRvZgniog49Cq3IQOLnoab?=
 =?us-ascii?Q?oFAoHyd33cPLr1obgfkScFae7WMHXMEuz8mzsDFAJPwHDd/eVMUGX13OZUug?=
 =?us-ascii?Q?O4ZYQUsZt/qp7jFdpc0x0cr5m0mY2hp7RSDj69wiE5skC/IUoVPmn7r3ihcE?=
 =?us-ascii?Q?ILQ8WDBFN4giOjtIiX/B2kmX9qwE0vPoGQ0K2Kvhzk4lVbORk9LowGzTiCSQ?=
 =?us-ascii?Q?DWjIANdQitJla3+xGYPJLTlujXgPsjZe4VdXXzzeBDH4d450XjQ4gnhdJlc6?=
 =?us-ascii?Q?J4hbLFI4T0C5XNCGehdZa5LUMavhVg1x6tZdby7xFNSWLgaR5D84Rgpp4D3W?=
 =?us-ascii?Q?An9MezLkvacwisjgMFgRBATPuOxkae/9+vCilf1BJQvv5yD3hZkARWHrdMuz?=
 =?us-ascii?Q?btD2uT7f728gePJvzgBAWpTZQhqEUU4jnaZWk9Ci/6CXa89hUsEg8M1OJjkp?=
 =?us-ascii?Q?RuxQfy1jBQFthCD4PlQMQjzmCc6yTyJ563yQbw77kvdHhFIKZcJTmqyjC1jX?=
 =?us-ascii?Q?WKbzX9toCDjrGLXf1VvxuhoMqGW3VQCjztpFYbLidZtgL215at4nVQHwDVuU?=
 =?us-ascii?Q?Tk6SGZtk1fCo2QpQN4mMCnLhoKZzRJHMHUxh/G4HibMcm+nD4Kph816Ez6Pi?=
 =?us-ascii?Q?F0ooaUm9n7Cd+hvg+pao7tDAJrm07x06AfsFv2JqiPquTXfm8qlF1HEKQFmA?=
 =?us-ascii?Q?9CUaVrt2WkYcpuUzakZde5eq1IpbUcrphjq7az2QVY7//z3BCwrEKBhyWmWo?=
 =?us-ascii?Q?eM0NBx7XAINfau06Q2B8oEbl36xgLSLhEQF700zANptNkz3Brl/Tj4O1N/RZ?=
 =?us-ascii?Q?iemlMtrdQp8FqHKtpRZrrUeab0RKgG57PCJP17Bq+hKYIYNY0obl4qTenEWZ?=
 =?us-ascii?Q?48wpROQ7+Dj4DomjXQbBQ4+Vo2LtUXHwq3XYWd56asHDNBT/wp4oS+AKado7?=
 =?us-ascii?Q?6mOykRQpnpYenNAumFCZ0DAQ99/Y8FAfA2p7Glb+y1Y3GXXb6E9C7rKAnnkJ?=
 =?us-ascii?Q?1Q2ZQQaApEITWe0q2Mg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 12:26:13.3337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b71bad-cf50-4881-886a-08ddec77674a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI6y48NOCfjPQyIiCz6jlHfphSC3YW9TzyydF7UR8nc=;
 b=qDYkvn4mSYDpZhDX6j+sizcmvKQ+AEo7fATol/05T6uUHuZrVBo3IAt4sCBswNM3efmCXxFKcqWqmY6WNrr6uruGBXuaMKDoqrkDww7bP+u4FXPKNWzXwMwDKlq90sI7bn8Njy6TKY1htoae9p3L8kqHXlxaCBjVkhPvAAHMEKM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qDYkvn4m
Subject: [Buildroot] [PATCH v2 1/1] boot/arm-trusted-firmware: override BL31
 environment variable error
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

When building the arm-trusted-firmware, if the host environment has a value
configured in the BL31 variable such as the following:

export BL31=/tmp/bl31.elf

This will cause the build of the bl31.elf to be skipped leading to the
following build error:

make[1]: Nothing to be done for 'bl31'.
And then:
readelf: Error: './output/build/arm-trusted-firmware-custom/build/versal/release/bl31/bl31.elf': No such file

To fix this, clear the BL31 variable in the MAKE_OPTS, so that building the
arm-trusted-firmware will build regardless of the host environment.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- correct file path in commit subject
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d3960..021ab5c092 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -162,6 +162,7 @@ endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL31=
 endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
