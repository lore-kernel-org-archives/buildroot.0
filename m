Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE59CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 09:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD83440D39;
	Fri,  3 Oct 2025 09:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUma_JvXhhWF; Fri,  3 Oct 2025 09:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B952C40CF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B952C40CF6;
	Fri,  3 Oct 2025 09:25:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 416E6226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 09:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA0F240818
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 09:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVPNIF1m-uVH for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 09:25:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::7;
 helo=ch4pr04cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E427740CF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E427740CF6
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E427740CF6
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 09:25:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giIIvLcKI5qVqDQGPNa9sytomPyN8X3n3BJwGE3hZYI27SL4giWeQBxOnJpQ2t7flFPiCZSNdvOZzJ//6Tr+FC4bW/hC0vuWBV1x5zdDGIG4IbjwOjhOOWJck5zyudIZrb+YLG+n2iT3fBPTcDmqHOgq7NA2wiKbifWcJtHYqRejfiY74C4fynjjz/Lxn0n3SjA1FFYKKoYAl3rTi1P27cWStx2F7jAtReooUQ9TcD0CoFxtxHDJhub9+KQlO0RCgXMGo2GhMfF9GP8hND2/Dcll50l+pFaopOvb/IiYK7qcoRN8M+6ZIQ/Wk24J+JG4q37UqcLdYGEzyNqAfK9DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiBfa6ju4+yuXq1NqTnXjWelcp951o/nljuQcqmfVB0=;
 b=mcX5l54PVJN7f4zfikEVmEioLb5xTTThXcERrw7X/eOtG54X0Q1gDHLAZ/AxIPnRule0yqpmuX3c7hr9QO1IvRcQEJ830//AUz6fm78oEbKEWNpEB+Ly+uaDIZUyMSrMKxuV7OC5q90Psx2vN3VFEPz4gupvjK5QGgH+xgCs4EAkf1OLVB6U/U+bnSEnEhJPsQgXEyuPAWjV+/8+3Xw1Pt1TDFzAhD59mTPcVC0ZhthhdrCVJRtf0VRrKD76UrlvX2LhHbBnUGdnEtQgx/3aRT6NdO84Nyv/rSSgPdU0RCUiQgg2a3BYAtZoORIxqIgRPOcLNGteObXvV77nbYqw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR04CA0254.namprd04.prod.outlook.com (2603:10b6:303:88::19)
 by DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 09:25:19 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::cf) by MW4PR04CA0254.outlook.office365.com
 (2603:10b6:303:88::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.16 via Frontend Transport; Fri,
 3 Oct 2025 09:25:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Fri, 3 Oct 2025 09:25:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 3 Oct
 2025 02:25:18 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 3 Oct
 2025 04:25:18 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 3 Oct 2025 02:25:17 -0700
To: <buildroot@buildroot.org>
Date: Fri, 3 Oct 2025 10:25:14 +0100
Message-ID: <20251003092514.3686293-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|DM6PR12MB4465:EE_
X-MS-Office365-Filtering-Correlation-Id: 833436d8-f792-4711-915f-08de025ec537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8vRLG0HBZdS0BenJ7u2OzW0fL85G2KjOSz9pFL5q4rVuZU6cYUMFENh/E3I+?=
 =?us-ascii?Q?Q0SlQw2J2n8+uWDMls/2kf0LqbPoLYZE78e9f34vkFMD6Ct68CW1CVr0ZREw?=
 =?us-ascii?Q?/oYP97C3gJubA7ZiCUR3SZ+OhTeRQh5FWPnMuspCU4mMnJ0rUcdOMv5UlZKq?=
 =?us-ascii?Q?fViJoEIWtqESQqcN89PaJDPuxPpfFkwZ2qyPuW+smyOfxzVj6OBzT9d8eHKS?=
 =?us-ascii?Q?ocdTSYmpV06dCU9YwUuyZljWG0WFQwNXE008QOftWkrmixvgy03Pf7IrWeOg?=
 =?us-ascii?Q?cddPuM/rMboulf91tCmNp40QzY6YTCkcvtohk4NGrGYIe0hiBztQ1MiaPRH7?=
 =?us-ascii?Q?TqBN9XLzR5nTDrMBsRTeQYPxOIUBmx60ZRKJSyv5Ly+3CvFhbyIKVKfJrfdF?=
 =?us-ascii?Q?xN4v3bStA9GpnPbOzIwjPOz5QPPlNy0XaWQhsgFw5O4huuXOnanuyvYtQnfA?=
 =?us-ascii?Q?EZ1ekvLdDCZzkC+3e34hMVlzyfR6Xi2QC3ritKNqdNzWlH9z2i786/dEAzCq?=
 =?us-ascii?Q?eJifGcxeNUZsSApYyoxzo8yTUg4V2lNj1+1jetXNgr7Rf+kxf+9yR2Leq9S2?=
 =?us-ascii?Q?V/aGNAX+ubQW4lxrBOf4pM3xwPId8DZUfzxgKZUgzAeAH9r8Xujqz0KNUlJ+?=
 =?us-ascii?Q?jw3r+O8tpm5XrLCrdWIJ91dHni8ALsXzc/UoTO/za/8y3ttuf1IICUW1076e?=
 =?us-ascii?Q?jIavdRfPROOdFh8VsRMLM2xtzHIMUR5lXVXNwH1IR4q0IoID8yEdS0pkCHqI?=
 =?us-ascii?Q?wu5VPTWotgvTCa+gdSwGAi1cqJnjebUrUzFRCxBWsM3/3VddYZ/Mn1qEp/4g?=
 =?us-ascii?Q?NuKUnN6eJlrfI4+tF0Z05khIsPbknTpsIaavDYwdCRbpEC7CF6UztP/2q94V?=
 =?us-ascii?Q?OQLWAEjuFrJiGAImmVt/BTDNZ5wKgy+898ARJi/M8smd8KoU694Qkpsqy3/d?=
 =?us-ascii?Q?LDHBb5O0IeGTuxMAx+QvNbFzX4C10FADsHyPDbmi1I2Qe/qSfI3NBVkQpm75?=
 =?us-ascii?Q?Q1b6MJyTmR/9zFD5zbiaVkWzKDpUb6oUn+F+U9wqCSO+m877dm3IWpKat5fA?=
 =?us-ascii?Q?2qY0fufpZd7wcQYo+/kLdeVu2K28EiMptZ3fqkFBsbr4TtWm8k69FaLuV4hk?=
 =?us-ascii?Q?XS65FbCD/0zvAZJzrWWg0Scf/GBBsDCSadtr5OPDInafsVZ13ckMIfHga6p7?=
 =?us-ascii?Q?YbH36hdH4cxVr9LpGru6QKWyJlm4HOauRSw513hXCVXg1ZDg8P2rMqHWxDrn?=
 =?us-ascii?Q?jXgwE7uVbEEj34vwEoIkiJCnYVr3XanlmAS87xWXtmJTWBD8mWyTaWxT3g6R?=
 =?us-ascii?Q?Zr+FlNKB31qull+fPr05cmUlSnzSfOf/p8wJOyEZXtQStGsvjqqamMhYdnFu?=
 =?us-ascii?Q?s4tMhnBuqD7unF+k0OAVRVJ5bXogRgDrCBNP+/zj6C9fgq2PQtZiHAfH4Q0h?=
 =?us-ascii?Q?gf67oNbMc7c2b/HV6zG2L40Dsn5W6zOorHzwWBz7ddo0B8rRfwFwntA0hoaD?=
 =?us-ascii?Q?EIds0tpX7yJ8GdEJf28AD/0CjOaKrTNVsi1gqatZ1ivl6g4WgfyyNMzzTtRw?=
 =?us-ascii?Q?+zOKhDUw0Vcln+Ck9oy081NGf7CE3VPsIEH6E8wl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 09:25:19.0863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 833436d8-f792-4711-915f-08de025ec537
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4465
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiBfa6ju4+yuXq1NqTnXjWelcp951o/nljuQcqmfVB0=;
 b=CcN/CoAccp0fBrjaN7fv+8NZIgvAUfgohZ0LuwaFM3q0c/xaztAQfsu+2UtZI0pGXDT74A8NaZASi5lLgTVKhgxpWrpHn9mn8FitEiI3ceMzLr797bmddCE+2vZFm3SnhnbXqrptsWcwGAMHBOuC+zNABbsbHJjiqU3WZyb0Bio=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CcN/CoAc
Subject: [Buildroot] [PATCH v1 1/1] board/versal/post-image: remove
 unnecessary mkdir
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

The board/versal/post-image.sh script has an unnecessary mkdir command:
mkdir -p "${BINARIES_DIR}"

Just above the command, the script is making a symlink for the Linux DTB in
the ${BINARIES_DIR}, so if the ${BINARIES_DIR} did not already exist with
images inside, the script would fail regardless of whether this mkdir is
executed or not.

For this reason, remove the mkdir call from the script because it is not
necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/post-image.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index b5ce2e3f0c..3242e4384a 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -12,7 +12,6 @@ FIRST_DT=$(sed -nr \
 
 BOARD_DIR="$(dirname "$0")"
 
-mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	the_ROM_image:
 	{
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
