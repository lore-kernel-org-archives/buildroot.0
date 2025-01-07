Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEF4E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 06:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C93908131C;
	Tue,  7 Jan 2025 06:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_hc0HE9cqUq; Tue,  7 Jan 2025 06:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D47E68131D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D47E68131D;
	Tue,  7 Jan 2025 06:32:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF2B67AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A56A660731
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HD7WBbDE9qoh for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 06:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::62a;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B25CD60722
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B25CD60722
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B25CD60722
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 06:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8eQ6lyHptmwQgNRDvTcCKARFJmfmFJ0pSTUGL1BM1/B+duq9gQAfrX2XkF7fptognPPyuiCE7vAKgT225ZuTbTz0LviAa6fsgSk2nVbSQfNF8g2hAnMimrgFveQov0UdHhEmqwfjAna1b+fE8Q+I5N+GTz1BBZVacpXezb55HbaSOZdJMs2bOQajcd0PRSpuuAVDV34SHtzuaE+dSFhQ4ukULDhnCqGora/ivKYmMhfl6Zjqb/mpL76BFXtxYx1lqkhF1G7YSwNL61MQRM9D/F7c8wC6g2eHxkzApG/313LMoHWkt5L3FAkfV8CuplMj6pjn7AY3s/Lvj9SEBfAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PkwTk0V/ztANjbshPbBP/EmCu+v0rqQ0BBdeFe5q28=;
 b=e9r0YIDA2WHxKyn4fYbARvU2827v0DKTHphEbyRxsL9SPXkZYsWRFL77z9Db2X9S8P3UnMX05fBSScJtYbmHVQuN0owThoArY8WHEylq9cv84635NPs3TLG3ch2D2D7+dM1R7vqyez7f3plAdfjgC8EBY0v4se7UbQ+8TOv28jmb+2Zs2x7cxhbqSC3h8TqP26+E6DmIlyhyX3xn4QTMvhWFJeFyYSEnVg2N1kyzRpvV5WCWw+rokxILxXos8MDnDriUls/NxpgpZT/G/MzGLPel+U+El/hbaFllsuHaHXgXZRPEe2ea1Rymq4jVz2Z1So6r09P0sDf9KaajF+uhTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BY5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:1d0::11)
 by DS0PR12MB6535.namprd12.prod.outlook.com (2603:10b6:8:c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 06:31:48 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::22) by BY5PR04CA0001.outlook.office365.com
 (2603:10b6:a03:1d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 06:31:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 06:31:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 00:31:44 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 00:31:43 -0600
To: <buildroot@buildroot.org>
Date: Tue, 7 Jan 2025 06:31:33 +0000
Message-ID: <20250107063136.787314-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107063136.787314-1-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB05.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|DS0PR12MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 277ab177-cb0c-49e4-c426-08dd2ee4f65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uN24cYBW1935EasE7kyNt3HmzTCIbSbrxpHBaX9q3SRCmMCBBFq+uWkxFtn0?=
 =?us-ascii?Q?C317JSI/EdyYHyb4NYGU+Q4eQg2eJPsmh2QzIwnTY9gzAmWYZeKNWx8CCpCY?=
 =?us-ascii?Q?abicDRMoZAe79zcBgCXhZTGTyKTVeHItPwENKnlSI8M5nzDDoN2jgorEJoKg?=
 =?us-ascii?Q?2nvXmMXInIUny61htlHCdvcxFVNlEAlxqvKBXuf64IjvjyissjpNXJSPwUYS?=
 =?us-ascii?Q?wcRAghHXPP7x2yY6GL957BDWFdab/WveJN/5Q6l5yQEXb0mZUC+Uoc0UrUoO?=
 =?us-ascii?Q?lFwjI8g8zyryrAbx9+0ixt0H7/xmWHRERxNn9M6YC+eYnlBnnJRUiee2wQR4?=
 =?us-ascii?Q?IQQZYaa7HXDNwUnyub9Rs0UY5vJleD//m5pLG8oGmD1ZxtpkfytqzuU4rxbw?=
 =?us-ascii?Q?hV/3Puh8C3M19MnzKAQdjldmARYp4vFqnE/e8n/qn3uf8IwH0y1QNBtFFEqP?=
 =?us-ascii?Q?T2eLq82iGxlLoiFw/4QTOJaoiDiSdLtJ1PQ77jPpSlH79q+iu8ckWX85I06M?=
 =?us-ascii?Q?jF7ouAXjbYFJ5MHAHIqrN0smTv0cqm9BcsVEizVKvahDYDVgUZ7WzkDCXwnE?=
 =?us-ascii?Q?mNCAkpcltlVEthMn4HOHN3W0kkFgxSYN2lfIQblxhu3cxZWzWitR2KJMxxVG?=
 =?us-ascii?Q?g+PTt6Dr7bREibawOc1DrPUiiuYhVCXZG3TEn5mue+Bo17K6q2kvtj1XKTs8?=
 =?us-ascii?Q?uAbbTQftkaoekBPkjFYxQfgwLwoT3ehmQs5BNBBw1fWHzTCPxlTPIGfM51MN?=
 =?us-ascii?Q?aFk+YDOY+FVp9cHNupt9dasmb3piZzjVBXpwBBQig9O1latH2116PVboYeoz?=
 =?us-ascii?Q?QameMojDpSCaZViB7PqS80GdBr72XeB/pwL5sh21vz7z2d9UUDhzhWKMqlU1?=
 =?us-ascii?Q?cUngpf1HSksoQ9eK4mcM28jM2YpQhBMVs14ohzRABK5pVSKHzN48pOVZs//R?=
 =?us-ascii?Q?w/ig+caVraEYz4RplkaXIhzCD7SQt2CzE+4YXdB67iDhUosbRpECcB5+Ts5a?=
 =?us-ascii?Q?IGNiP7Gi1OnCcBS4DpDzgtYFjwesWUVVCGbaZw75gXuVsVQCeYVgzhHpUNEE?=
 =?us-ascii?Q?u0B1/1T/ZW5ngVxDydVET2MKMjamgE8j4z2vBZWsLl9SoX5qCOwy2Hblz+cM?=
 =?us-ascii?Q?nFOKrZx6qvZcZAlr8IVcv8zyre6Ph+Ut7HTlxNtj9tkhHswDFb+JCOsjfI4m?=
 =?us-ascii?Q?S7PVcEpE9u1ReRmmFFt3IgmagruEWSbUOw8fJPU7oRen0S0rskWN6Vdqql+2?=
 =?us-ascii?Q?GACcwwzBzsYoubamwNokVwyJCezZl6CjNshnUrk95go6JzkX46CstfwFMT7n?=
 =?us-ascii?Q?7g83CFWXV3Mw7WF1xd3fgCCp48u96oQoPHfLd9+thcuvL3KP42RpZpb/9C0P?=
 =?us-ascii?Q?YxEAQVAMyf0Res0EqRY85CQZpZN2C9jOGL5r455Pqff4uy3CGL+AH6fmXJtO?=
 =?us-ascii?Q?HvOyPhCbdHRKO7fjIxYYsOXx969EgNc5PldoIDUSXouVpuv7LYH+Nw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 06:31:47.5521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 277ab177-cb0c-49e4-c426-08dd2ee4f65d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PkwTk0V/ztANjbshPbBP/EmCu+v0rqQ0BBdeFe5q28=;
 b=2e9erFBQj0iapVxldDzi6bRTf+tEDhJekKuw6aHd+hCdsWi2HcwXw5DbeaQ7P+j/iZCYIHrTi70OL0guz/iA+M7MtrUM5J3nJQxnSHEENqleRn0yCxmaFfrjaSnNkjRrrLAGUlv/rCKbwS/9j14gkN7z5A/RcKFix5wZtowx+zk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2e9erFBQ
Subject: [Buildroot] [PATCH v4 3/6] board/zynqmp/patches: add zynqmp binman
 patches
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
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the zynqmp binman patches that are already committed to the
u-boot next branch.

Upstream: https://source.denx.de/u-boot/u-boot/-/commit/10de9b5a6a5b53a37600894115685f00d3bbfc2d
Upstream: https://source.denx.de/u-boot/u-boot/-/commit/290385f374fba69f9c4f473c8bd25d64935a4c82
Upstream: https://source.denx.de/u-boot/u-boot/-/commit/d92fdb60677b3990919a4216d3452418db215224
Upstream: https://source.denx.de/u-boot/u-boot/-/commit/afbc1fa5f18a2eebf1cf06f62574016edc093f50
Upstream: https://source.denx.de/u-boot/u-boot/-/commit/2eb8cd5bd4936a5eb2e77729855d946f6720921c
Upstream: https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - new to patch series
V2->V3:
 - changed path to board/zynqmp/patches/uboot
V3->V4:
 - updated links in commit message
---
 ...kbuild-fdtoverlay-changes-from-linux.patch | 198 ++++++++++
 ...s-and-add-new-dtb-entries-for-zynqmp.patch |  91 +++++
 ...for-pointing-to-separate-description.patch |  66 ++++
 ...64-zynqmp-describe-empty-binman-node.patch |  64 ++++
 ...ynqmp-add-binman-description-for-som.patch | 345 ++++++++++++++++++
 ...u-boot.itb-and-qspi-image-via-binman.patch | 159 ++++++++
 6 files changed, 923 insertions(+)
 create mode 100644 board/zynqmp/patches/uboot/0001-kbuild-cherry-pick-kbuild-fdtoverlay-changes-from-linux.patch
 create mode 100644 board/zynqmp/patches/uboot/0002-arm64-zynqmp-remove-overlays-and-add-new-dtb-entries-for-zynqmp.patch
 create mode 100644 board/zynqmp/patches/uboot/0003-binman-add-option-for-pointing-to-separate-description.patch
 create mode 100644 board/zynqmp/patches/uboot/0004-arm64-zynqmp-describe-empty-binman-node.patch
 create mode 100644 board/zynqmp/patches/uboot/0005-arm64-zynqmp-add-binman-description-for-som.patch
 create mode 100644 board/zynqmp/patches/uboot/0006-arm64-zynqmp-generate-u-boot.itb-and-qspi-image-via-binman.patch

diff --git a/board/zynqmp/patches/uboot/0001-kbuild-cherry-pick-kbuild-fdtoverlay-changes-from-linux.patch b/board/zynqmp/patches/uboot/0001-kbuild-cherry-pick-kbuild-fdtoverlay-changes-from-linux.patch
new file mode 100644
index 0000000000..cf7f101af4
--- /dev/null
+++ b/board/zynqmp/patches/uboot/0001-kbuild-cherry-pick-kbuild-fdtoverlay-changes-from-linux.patch
@@ -0,0 +1,198 @@
+From: Prasad Kummari <prasad.kummari@amd.com>
+Date: Fri, 6 Sep 2024 12:38:07 +0530
+Subject: [PATCH] kbuild: cherry-pick kbuild fdtoverlay changes from linux
+
+Linux commits:
+15d16d6dadf6 kbuild: Add generic rule to apply fdtoverlay
+44f87191d105 kbuild: parameterize the .o part of suffix-search
+
+The Linux commit 15d16d6dadf6 adds a generic rule in Makefile.lib
+to automatically apply fdtoverlay, so that each platform doesn't
+need to include a complex rule. This also automatically appends
+DTC_FLAGS_foo_base += -@ to all base files
+
+The platform's Makefile only needs to have this now:
+
+foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
+dtb-y := foo.dtb
+
+Signed-off-by: Prasad Kummari <prasad.kummari@amd.com>
+Reviewed-by: Tom Rini <trini@konsulko.com>
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Link: https://lore.kernel.org/r/20240906070808.1045991-2-prasad.kummari@amd.com
+Upstream: https://source.denx.de/u-boot/u-boot/-/commit/10de9b5a6a5b53a37600894115685f00d3bbfc2d
+---
+ arch/arm/dts/Makefile  | 57 ++++++++++++++++++++++++++++++++++++++++++
+ scripts/Kbuild.include |  4 +++
+ scripts/Makefile.build |  1 +
+ scripts/Makefile.lib   | 27 ++++++++++++++++++++
+ 4 files changed, 89 insertions(+)
+
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 48ca62521b8..8b6f65a61a2 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -477,6 +477,63 @@ dtb-$(CONFIG_ARCH_ZYNQMP) += \
+ 	zynqmp-zc1751-xm017-dc3.dtb		\
+ 	zynqmp-zc1751-xm018-dc4.dtb		\
+ 	zynqmp-zc1751-xm019-dc5.dtb
++
++zynqmp-p-a2197-00-revA-x-prc-01-revA-dtbs := zynqmp-p-a2197-00-revA.dtb zynqmp-p-a2197-00-revA-x-prc-01-revA.dtbo
++zynqmp-p-a2197-00-revA-x-prc-02-revA-dtbs := zynqmp-p-a2197-00-revA.dtb zynqmp-p-a2197-00-revA-x-prc-02-revA.dtbo
++zynqmp-p-a2197-00-revA-x-prc-03-revA-dtbs := zynqmp-p-a2197-00-revA.dtb zynqmp-p-a2197-00-revA-x-prc-03-revA.dtbo
++zynqmp-p-a2197-00-revA-x-prc-04-revA-dtbs := zynqmp-p-a2197-00-revA.dtb zynqmp-p-a2197-00-revA-x-prc-04-revA.dtbo
++zynqmp-p-a2197-00-revA-x-prc-05-revA-dtbs := zynqmp-p-a2197-00-revA.dtb zynqmp-p-a2197-00-revA-x-prc-05-revA.dtbo
++
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-p-a2197-00-revA-x-prc-01-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-p-a2197-00-revA-x-prc-02-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-p-a2197-00-revA-x-prc-03-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-p-a2197-00-revA-x-prc-04-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-p-a2197-00-revA-x-prc-05-revA.dtb
++
++zynqmp-sc-vek280-revA-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vek280-revA.dtbo
++zynqmp-sc-vek280-revB-dtbs := zynqmp-sc-revC.dtb zynqmp-sc-vek280-revB.dtbo
++zynqmp-sc-vhk158-revA-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vhk158-revA.dtbo
++zynqmp-sc-vpk120-revB-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vpk120-revB.dtbo
++zynqmp-sc-vpk180-revA-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vpk180-revA.dtbo
++zynqmp-sc-vpk180-revB-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vpk180-revB.dtbo
++zynqmp-sc-vn-p-b2197-00-revA-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vn-p-b2197-00-revA.dtbo
++
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vek280-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vek280-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vhk158-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vpk120-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vpk180-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vpk180-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vn-p-b2197-00-revA.dtb
++
++zynqmp-sm-k26-revA-sck-kv-g-revA-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kv-g-revA.dtbo
++zynqmp-sm-k26-revA-sck-kv-g-revB-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo
++zynqmp-smk-k26-revA-sck-kv-g-revA-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-g-revA.dtbo
++zynqmp-smk-k26-revA-sck-kv-g-revB-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo
++
++zynqmp-sm-k26-revA-sck-kr-g-revA-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kr-g-revA.dtbo
++zynqmp-sm-k26-revA-sck-kr-g-revB-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kr-g-revB.dtbo
++zynqmp-smk-k26-revA-sck-kr-g-revA-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kr-g-revA.dtbo
++zynqmp-smk-k26-revA-sck-kr-g-revB-dtbs := zynqmp-smk-k26-revA.dtb zynqmp-sck-kr-g-revB.dtbo
++
++zynqmp-sm-k24-revA-sck-kd-g-revA-dtbs := zynqmp-sm-k24-revA.dtb zynqmp-sck-kd-g-revA.dtbo
++zynqmp-smk-k24-revA-sck-kd-g-revA-dtbs := zynqmp-smk-k24-revA.dtb zynqmp-sck-kd-g-revA.dtbo
++zynqmp-sm-k24-revA-sck-kv-g-revB-dtbs := zynqmp-sm-k24-revA.dtb zynqmp-sck-kv-g-revB.dtbo
++zynqmp-smk-k24-revA-sck-kv-g-revB-dtbs := zynqmp-smk-k24-revA.dtb zynqmp-sck-kv-g-revB.dtbo
++
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kv-g-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kv-g-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kv-g-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kv-g-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kr-g-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kr-g-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kr-g-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k26-revA-sck-kr-g-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k24-revA-sck-kd-g-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k24-revA-sck-kd-g-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k24-revA-sck-kv-g-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k24-revA-sck-kv-g-revB.dtb
++
+ dtb-$(CONFIG_ARCH_VERSAL) += \
+ 	versal-emb-plus-ve2302-revA.dtb \
+ 	versal-mini.dtb \
+diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
+index 62e0207f91b..5daceb26061 100644
+--- a/scripts/Kbuild.include
++++ b/scripts/Kbuild.include
+@@ -31,6 +31,10 @@ baseprereq = $(basename $(notdir $<))
+ # Escape single quote for use in echo statements
+ escsq = $(subst $(squote),'\$(squote)',$1)
+ 
++###
++# real prerequisites without phony targets
++real-prereqs = $(filter-out $(PHONY), $^)
++
+ ###
+ # Easy method for doing a status message
+        kecho := :
+diff --git a/scripts/Makefile.build b/scripts/Makefile.build
+index 97dd4a64f6e..b3bb8e558d3 100644
+--- a/scripts/Makefile.build
++++ b/scripts/Makefile.build
+@@ -293,6 +293,7 @@ $(obj)/%.o: $(src)/%.S FORCE
+ 
+ targets += $(real-objs-y) $(real-objs-m) $(lib-y)
+ targets += $(extra-y) $(MAKECMDGOALS) $(always)
++targets += $(real-dtb-y) $(lib-y) $(always-y)
+ 
+ # Linker scripts preprocessor (.lds.S -> .lds)
+ # ---------------------------------------------------------------------------
+diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
+index 16bbc277a9f..b867941816d 100644
+--- a/scripts/Makefile.lib
++++ b/scripts/Makefile.lib
+@@ -47,6 +47,13 @@ obj-m		:= $(filter-out %/, $(obj-m))
+ 
+ subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
+ 
++# Expand $(foo-objs) $(foo-y) etc. by replacing their individuals
++suffix-search = $(strip $(foreach s, $3, $($(1:%$(strip $2)=%$s))))
++# List composite targets that are constructed by combining other targets
++multi-search = $(sort $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $m)))
++# List primitive targets that are compiled from source files
++real-search = $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $(call suffix-search, $m, $2, $3), $m))
++
+ # if $(foo-objs) exists, foo.o is a composite object
+ multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
+ multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
+@@ -58,6 +65,13 @@ single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
+ multi-objs-y := $(foreach m, $(multi-used-y), $($(m:.o=-objs)) $($(m:.o=-y)))
+ multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)))
+ 
++# Composite DTB (i.e. DTB constructed by overlay)
++multi-dtb-y := $(call multi-search, $(dtb-y), .dtb, -dtbs)
++# Primitive DTB compiled from *.dts
++real-dtb-y := $(call real-search, $(dtb-y), .dtb, -dtbs)
++# Base DTB that overlay is applied onto (each first word of $(*-dtbs) expansion)
++base-dtb-y := $(foreach m, $(multi-dtb-y), $(firstword $(call suffix-search, $m, .dtb, -dtbs)))
++
+ # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
+ # tell kbuild to descend
+ subdir-obj-y := $(filter %/built-in.o, $(obj-y))
+@@ -69,6 +83,7 @@ real-objs-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)
+ # Add subdir path
+ 
+ extra-y		:= $(addprefix $(obj)/,$(extra-y))
++always-y        := $(addprefix $(obj)/,$(always-y))
+ always		:= $(addprefix $(obj)/,$(always))
+ targets		:= $(addprefix $(obj)/,$(targets))
+ modorder	:= $(addprefix $(obj)/,$(modorder))
+@@ -83,6 +98,8 @@ multi-used-y	:= $(addprefix $(obj)/,$(multi-used-y))
+ multi-used-m	:= $(addprefix $(obj)/,$(multi-used-m))
+ multi-objs-y	:= $(addprefix $(obj)/,$(multi-objs-y))
+ multi-objs-m	:= $(addprefix $(obj)/,$(multi-objs-m))
++multi-dtb-y	:= $(addprefix $(obj)/,$(multi-dtb-y))
++real-dtb-y      := $(addprefix $(obj)/,$(real-dtb-y))
+ subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
+ 
+ # These flags are needed for modversions and compiling, so we define them here
+@@ -296,6 +313,9 @@ endif
+ 
+ DTC_FLAGS += $(DTC_FLAGS_$(basetarget))
+ 
++# Set -@ if the target is a base DTB that overlay is applied onto
++DTC_FLAGS += $(if $(filter $(patsubst $(obj)/%,%,$@), $(base-dtb-y)), -@)
++
+ # Generate an assembly file to wrap the output of the device tree compiler
+ quiet_cmd_dt_S_dtb= DTB     $@
+ # Modified for U-Boot
+@@ -382,6 +402,13 @@ $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
+ $(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
+ 	$(call if_changed_dep,dtco)
+ 
++quiet_cmd_fdtoverlay = DTOVL   $@
++           cmd_fdtoverlay = fdtoverlay -o $@ -i $(real-prereqs)
++
++$(multi-dtb-y): FORCE
++	$(call if_changed,fdtoverlay)
++$(call multi_depend, $(multi-dtb-y), .dtb, -dtbs)
++
+ # Fonts
+ # ---------------------------------------------------------------------------
+ 
diff --git a/board/zynqmp/patches/uboot/0002-arm64-zynqmp-remove-overlays-and-add-new-dtb-entries-for-zynqmp.patch b/board/zynqmp/patches/uboot/0002-arm64-zynqmp-remove-overlays-and-add-new-dtb-entries-for-zynqmp.patch
new file mode 100644
index 0000000000..975200137f
--- /dev/null
+++ b/board/zynqmp/patches/uboot/0002-arm64-zynqmp-remove-overlays-and-add-new-dtb-entries-for-zynqmp.patch
@@ -0,0 +1,91 @@
+From: Prasad Kummari <prasad.kummari@amd.com>
+Date: Fri, 6 Sep 2024 12:38:08 +0530
+Subject: [PATCH] arm64: zynqmp: Remove overlays and add new dtb entries for
+ ZynqMP
+
+Remove device tree overlay (DTBO) entries for the ZynqMP target
+from the Makefile. Add new device tree binaries (DTBs) for the
+zynqmp-sm-k24-revA and zynqmp-smk-k24-revA configurations.
+
+Signed-off-by: Prasad Kummari <prasad.kummari@amd.com>
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Link: https://lore.kernel.org/r/20240906070808.1045991-3-prasad.kummari@amd.com
+Upstream: https://source.denx.de/u-boot/u-boot/-/commit/290385f374fba69f9c4f473c8bd25d64935a4c82
+---
+ arch/arm/dts/Makefile | 24 ++++++------------------
+ 1 file changed, 6 insertions(+), 18 deletions(-)
+
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 8b6f65a61a2..35623380673 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -414,11 +414,6 @@ dtb-$(CONFIG_ARCH_ZYNQMP) += \
+ 	zynqmp-m-a2197-02-revA.dtb		\
+ 	zynqmp-m-a2197-03-revA.dtb		\
+ 	zynqmp-p-a2197-00-revA.dtb		\
+-	zynqmp-p-a2197-00-revA-x-prc-01-revA.dtbo	\
+-	zynqmp-p-a2197-00-revA-x-prc-02-revA.dtbo	\
+-	zynqmp-p-a2197-00-revA-x-prc-03-revA.dtbo	\
+-	zynqmp-p-a2197-00-revA-x-prc-04-revA.dtbo	\
+-	zynqmp-p-a2197-00-revA-x-prc-05-revA.dtbo	\
+ 	zynqmp-mini.dtb				\
+ 	zynqmp-mini-emmc0.dtb			\
+ 	zynqmp-mini-emmc1.dtb			\
+@@ -433,23 +428,10 @@ dtb-$(CONFIG_ARCH_ZYNQMP) += \
+ 	zynqmp-mini-qspi-x2-stacked.dtb		\
+ 	zynqmp-sc-revB.dtb			\
+ 	zynqmp-sc-revC.dtb			\
+-	zynqmp-sc-vek280-revA.dtbo		\
+-	zynqmp-sc-vek280-revB.dtbo		\
+-	zynqmp-sc-vhk158-revA.dtbo		\
+-	zynqmp-sc-vpk120-revB.dtbo		\
+-	zynqmp-sc-vpk180-revA.dtbo		\
+-	zynqmp-sc-vpk180-revB.dtbo		\
+-	zynqmp-sc-vn-p-b2197-00-revA.dtbo	\
+-	zynqmp-sc-vm-p-m1369-00-revA.dtbo	\
+ 	zynqmp-sm-k24-revA.dtb			\
+ 	zynqmp-smk-k24-revA.dtb			\
+ 	zynqmp-sm-k26-revA.dtb			\
+ 	zynqmp-smk-k26-revA.dtb			\
+-	zynqmp-sck-kd-g-revA.dtbo		\
+-	zynqmp-sck-kr-g-revA.dtbo		\
+-	zynqmp-sck-kr-g-revB.dtbo		\
+-	zynqmp-sck-kv-g-revA.dtbo		\
+-	zynqmp-sck-kv-g-revB.dtbo		\
+ 	zynqmp-topic-miamimp-xilinx-xdp-v1r1.dtb	\
+ 	zynqmp-vpk120-revA.dtb			\
+ 	zynqmp-vp-x-a2785-00-revA.dtb		\
+@@ -497,6 +479,7 @@ zynqmp-sc-vpk120-revB-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vpk120-revB.dtbo
+ zynqmp-sc-vpk180-revA-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vpk180-revA.dtbo
+ zynqmp-sc-vpk180-revB-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vpk180-revB.dtbo
+ zynqmp-sc-vn-p-b2197-00-revA-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vn-p-b2197-00-revA.dtbo
++zynqmp-sc-vm-p-b1369-00-revA-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vm-p-m1369-00-revA.dtbo
+ 
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vek280-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vek280-revB.dtb
+@@ -505,6 +488,7 @@ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vpk120-revB.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vpk180-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vpk180-revB.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vn-p-b2197-00-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sc-vm-p-b1369-00-revA.dtb
+ 
+ zynqmp-sm-k26-revA-sck-kv-g-revA-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kv-g-revA.dtbo
+ zynqmp-sm-k26-revA-sck-kv-g-revB-dtbs := zynqmp-sm-k26-revA.dtb zynqmp-sck-kv-g-revB.dtbo
+@@ -520,6 +504,8 @@ zynqmp-sm-k24-revA-sck-kd-g-revA-dtbs := zynqmp-sm-k24-revA.dtb zynqmp-sck-kd-g-
+ zynqmp-smk-k24-revA-sck-kd-g-revA-dtbs := zynqmp-smk-k24-revA.dtb zynqmp-sck-kd-g-revA.dtbo
+ zynqmp-sm-k24-revA-sck-kv-g-revB-dtbs := zynqmp-sm-k24-revA.dtb zynqmp-sck-kv-g-revB.dtbo
+ zynqmp-smk-k24-revA-sck-kv-g-revB-dtbs := zynqmp-smk-k24-revA.dtb zynqmp-sck-kv-g-revB.dtbo
++zynqmp-sm-k24-revA-sck-kr-g-revB-dtbs := zynqmp-sm-k24-revA.dtb zynqmp-sck-kr-g-revB.dtbo
++zynqmp-smk-k24-revA-sck-kr-g-revB-dtbs := zynqmp-smk-k24-revA.dtb zynqmp-sck-kr-g-revB.dtbo
+ 
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kv-g-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k26-revA-sck-kv-g-revB.dtb
+@@ -533,6 +519,8 @@ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k24-revA-sck-kd-g-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k24-revA-sck-kd-g-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k24-revA-sck-kv-g-revB.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k24-revA-sck-kv-g-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k24-revA-sck-kr-g-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k24-revA-sck-kr-g-revB.dtb
+ 
+ dtb-$(CONFIG_ARCH_VERSAL) += \
+ 	versal-emb-plus-ve2302-revA.dtb \
diff --git a/board/zynqmp/patches/uboot/0003-binman-add-option-for-pointing-to-separate-description.patch b/board/zynqmp/patches/uboot/0003-binman-add-option-for-pointing-to-separate-description.patch
new file mode 100644
index 0000000000..76343afcc3
--- /dev/null
+++ b/board/zynqmp/patches/uboot/0003-binman-add-option-for-pointing-to-separate-description.patch
@@ -0,0 +1,66 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Fri, 1 Nov 2024 10:17:54 +0100
+Subject: [PATCH] binman: Add option for pointing to separate description
+
+Adding binman node with target images description can be unwanted feature
+but as of today there is no way to disable it.
+Also on size constrained systems it is not useful to add binman description
+to DTB.
+Introduce BINMAN_DTB Kconfig symbol which allows separate DTB for target
+from DTB for binman itself.
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Link: https://lore.kernel.org/r/f1379d2587f9bf279a7a75c318aabbc1b35ee0c6.1730452668.git.michal.simek@amd.com
+Upstream: https://source.denx.de/u-boot/u-boot/-/commit/d92fdb60677b3990919a4216d3452418db215224
+---
+ Makefile    | 11 ++++++++++-
+ lib/Kconfig |  9 +++++++++
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f049d77dcaf..cb0ff66eccf 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1337,12 +1337,21 @@ u-boot.ldr:	u-boot
+ # Use 'make BINMAN_VERBOSE=3' to set vebosity level
+ default_dt := $(if $(DEVICE_TREE),$(DEVICE_TREE),$(CONFIG_DEFAULT_DEVICE_TREE))
+ 
++binman_dtb := $(shell echo $(CONFIG_BINMAN_DTB))
++ifeq ($(strip $(binman_dtb)),)
++ifeq ($(CONFIG_OF_EMBED),y)
++binman_dtb = ./dts/dt.dtb
++else
++binman_dtb = ./u-boot.dtb
++endif
++endif
++
+ quiet_cmd_binman = BINMAN  $@
+ cmd_binman = $(srctree)/tools/binman/binman $(if $(BINMAN_DEBUG),-D) \
+ 		$(foreach f,$(BINMAN_TOOLPATHS),--toolpath $(f)) \
+                 --toolpath $(objtree)/tools \
+ 		$(if $(BINMAN_VERBOSE),-v$(BINMAN_VERBOSE)) \
+-		build -u -d u-boot.dtb -O . -m \
++		build -u -d $(binman_dtb) -O . -m \
+ 		--allow-missing $(if $(BINMAN_ALLOW_MISSING),--ignore-missing) \
+ 		-I . -I $(srctree) -I $(srctree)/board/$(BOARDDIR) \
+ 		-I arch/$(ARCH)/dts -a of-list=$(CONFIG_OF_LIST) \
+diff --git a/lib/Kconfig b/lib/Kconfig
+index d47df6bb1cf..a1ee51e6eae 100644
+--- a/lib/Kconfig
++++ b/lib/Kconfig
+@@ -45,6 +45,15 @@ config BINMAN_FDT
+ 	  locate entries in the firmware image. See binman.h for the available
+ 	  functionality.
+ 
++config BINMAN_DTB
++	string "binman DTB description"
++	depends on BINMAN
++	help
++	  This enables option to point to different DTB file with binman node which
++	  is outside of DTB used by the firmware. Use this option if information
++	  about generated images shouldn't be the part of target binary. Or on system
++	  with limited storage.
++
+ config CC_OPTIMIZE_LIBS_FOR_SPEED
+ 	bool "Optimize libraries for speed"
+ 	help
diff --git a/board/zynqmp/patches/uboot/0004-arm64-zynqmp-describe-empty-binman-node.patch b/board/zynqmp/patches/uboot/0004-arm64-zynqmp-describe-empty-binman-node.patch
new file mode 100644
index 0000000000..b2923f6199
--- /dev/null
+++ b/board/zynqmp/patches/uboot/0004-arm64-zynqmp-describe-empty-binman-node.patch
@@ -0,0 +1,64 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Fri, 1 Nov 2024 10:17:56 +0100
+Subject: [PATCH] arm64: zynqmp: Describe empty binman node
+
+For enabling binman by default there is a need to have at least empty node
+present that's why create -u-boot.dtsi with empty node to cover all ZynqMP
+platforms.
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Link: https://lore.kernel.org/r/14d874ad4568fa8e3178e893224fecc5c676f04c.1730452668.git.michal.simek@amd.com
+Upstream: https://source.denx.de/u-boot/u-boot/-/commit/afbc1fa5f18a2eebf1cf06f62574016edc093f50
+---
+ arch/arm/dts/Makefile               |  1 +
+ arch/arm/dts/zynqmp-binman-mini.dts | 10 ++++++++++
+ arch/arm/dts/zynqmp-u-boot.dtsi     | 11 +++++++++++
+ 3 files changed, 22 insertions(+)
+ create mode 100644 arch/arm/dts/zynqmp-binman-mini.dts
+ create mode 100644 arch/arm/dts/zynqmp-u-boot.dtsi
+
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 35623380673..4bdfb204ae3 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -426,6 +426,7 @@ dtb-$(CONFIG_ARCH_ZYNQMP) += \
+ 	zynqmp-mini-qspi-x1-stacked.dtb		\
+ 	zynqmp-mini-qspi-x2-single.dtb		\
+ 	zynqmp-mini-qspi-x2-stacked.dtb		\
++	zynqmp-binman-mini.dtb			\
+ 	zynqmp-sc-revB.dtb			\
+ 	zynqmp-sc-revC.dtb			\
+ 	zynqmp-sm-k24-revA.dtb			\
+diff --git a/arch/arm/dts/zynqmp-binman-mini.dts b/arch/arm/dts/zynqmp-binman-mini.dts
+new file mode 100644
+index 00000000000..8f3d18ef394
+--- /dev/null
++++ b/arch/arm/dts/zynqmp-binman-mini.dts
+@@ -0,0 +1,10 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * (C) Copyright 2024, Advanced Micro Devices, Inc.
++ *
++ * Michal Simek <michal.simek@amd.com>
++ */
++
++/dts-v1/;
++
++#include "zynqmp-u-boot.dtsi"
+diff --git a/arch/arm/dts/zynqmp-u-boot.dtsi b/arch/arm/dts/zynqmp-u-boot.dtsi
+new file mode 100644
+index 00000000000..9a7527ed5a1
+--- /dev/null
++++ b/arch/arm/dts/zynqmp-u-boot.dtsi
+@@ -0,0 +1,11 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * (C) Copyright 2024, Advanced Micro Devices, Inc.
++ *
++ * Michal Simek <michal.simek@amd.com>
++ */
++
++/ {
++	binman: binman {
++	};
++};
diff --git a/board/zynqmp/patches/uboot/0005-arm64-zynqmp-add-binman-description-for-som.patch b/board/zynqmp/patches/uboot/0005-arm64-zynqmp-add-binman-description-for-som.patch
new file mode 100644
index 0000000000..82b5ba8bc0
--- /dev/null
+++ b/board/zynqmp/patches/uboot/0005-arm64-zynqmp-add-binman-description-for-som.patch
@@ -0,0 +1,345 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Fri, 1 Nov 2024 10:17:57 +0100
+Subject: [PATCH] arm64: zynqmp: Add binman description for SOM
+
+There is necessary to do some steps to compose boot images. These steps
+were in scripts in layers for a while. That's why introduce description via
+binman to simplify wiring and remove all scripting around.
+This should make sure that everybody is up2date with the latest versions.
+
+The first step is to create fit image with DTBs with descriptions in
+configuration node which is written as regular expression to match all SOM
+versions.
+Description is there for k24 and k26 in spite of low level psu_init
+configuration is different. The reason is that it goes to u-boot.itb image
+which is the same for k24 and k26.
+u-boot.itb is another image which is generated. It is normally generated
+via arch/arm/mach-zynqmp/mkimage_fit_atf.sh but this script is supposed to
+be deprecated.
+FIT image by purpose is using 64bit addresses to have default option to
+move images to high DDR (above 4GB). TF-A and TEE are optional components
+but in the most cases TF-A is present all the time and TEE(OP-TEE) is used
+by some configurations too.
+
+3rd generated image is boot.bin with updated user field which contains
+version number. This image can be used with updated Image Selector
+which supports A/B update mechanisms with rollback protection.
+
+4th image is image.bin which binary file which contains boot.bin and
+u-boot.itb together and can be programmed via origin Image Selector.
+This image can be also used for creating one capsule which contains both
+boot images (in SPL boot flow).
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Link: https://lore.kernel.org/r/35bc47a4a4799c5f5dbea56a45340a2810538330.1730452668.git.michal.simek@amd.com
+Upstream: https://source.denx.de/u-boot/u-boot/-/commit/2eb8cd5bd4936a5eb2e77729855d946f6720921c
+---
+ arch/arm/Kconfig                     |   1 +
+ arch/arm/dts/Makefile                |   1 +
+ arch/arm/dts/zynqmp-binman-som.dts   | 225 +++++++++++++++++++++++++++
+ arch/arm/mach-zynqmp/Kconfig         |  14 ++
+ configs/xilinx_zynqmp_kria_defconfig |   3 +
+ 5 files changed, 244 insertions(+)
+ create mode 100644 arch/arm/dts/zynqmp-binman-som.dts
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index cbe72103aab..dca493eaf55 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1302,6 +1302,7 @@ config ARCH_ZYNQMP_R5
+ config ARCH_ZYNQMP
+ 	bool "Xilinx ZynqMP based platform"
+ 	select ARM64
++	select BINMAN
+ 	select CLK
+ 	select DM
+ 	select DEBUG_UART_BOARD_INIT if SPL && DEBUG_UART
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 4bdfb204ae3..4653b5bdd16 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -522,6 +522,7 @@ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k24-revA-sck-kv-g-revB.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k24-revA-sck-kv-g-revB.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-sm-k24-revA-sck-kr-g-revB.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-smk-k24-revA-sck-kr-g-revB.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-binman-som.dtb
+ 
+ dtb-$(CONFIG_ARCH_VERSAL) += \
+ 	versal-emb-plus-ve2302-revA.dtb \
+diff --git a/arch/arm/dts/zynqmp-binman-som.dts b/arch/arm/dts/zynqmp-binman-som.dts
+new file mode 100644
+index 00000000000..3d9d8476c98
+--- /dev/null
++++ b/arch/arm/dts/zynqmp-binman-som.dts
+@@ -0,0 +1,225 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * dts file for Xilinx ZynqMP SOMs (k24/k26)
++ *
++ * (C) Copyright 2024, Advanced Micro Devices, Inc.
++ *
++ * Michal Simek <michal.simek@amd.com>
++ */
++
++#include <config.h>
++
++/dts-v1/;
++/ {
++	binman: binman {
++		multiple-images;
++		fit-dtb.blob {
++			filename = "fit-dtb.blob";
++			pad-byte = <0>;
++			fit {
++				fit,align = <0x8>;
++				fit,external-offset = <0x0>;
++				description = "DTBs for SOMs+CCs";
++				fit,fdt-list-val = "zynqmp-smk-k26-revA", "zynqmp-smk-k26-revA-sck-kr-g-revA",
++						"zynqmp-smk-k26-revA-sck-kr-g-revB", "zynqmp-smk-k26-revA-sck-kv-g-revA",
++						"zynqmp-smk-k26-revA-sck-kv-g-revB", "zynqmp-sm-k26-revA-sck-kv-g-revA",
++						"zynqmp-sm-k26-revA-sck-kv-g-revB", "zynqmp-sm-k26-revA-sck-kr-g-revB",
++						"zynqmp-smk-k24-revA-sck-kd-g-revA", "zynqmp-smk-k24-revA-sck-kv-g-revB",
++						"zynqmp-smk-k24-revA-sck-kr-g-revB", "zynqmp-sm-k24-revA-sck-kd-g-revA",
++						"zynqmp-sm-k24-revA-sck-kv-g-revB", "zynqmp-sm-k24-revA-sck-kr-g-revB";
++
++				images {
++					@fdt-SEQ {
++						description = "NAME";
++						type = "flat_dt";
++						arch = "arm64";
++						compression = "none";
++						hash-1 {
++							algo = "md5";
++						};
++					};
++				};
++				configurations {
++					default = "conf-1";
++					conf-1 {
++						description = "SOM itself";
++						fdt = "fdt-1";
++					};
++					conf-2 {
++						description = "zynqmp-smk-k26-.*-sck-kr-g-revA";
++						fdt = "fdt-2";
++					};
++					conf-3 {
++						description = "zynqmp-smk-k26-.*-sck-kr-g-.*";
++						fdt = "fdt-3";
++					};
++					conf-4 {
++						description = "zynqmp-smk-k26-.*-sck-kv-g-rev[AZ]";
++						fdt = "fdt-4";
++					};
++					conf-5 {
++						description = "zynqmp-smk-k26-.*-sck-kv-g-.*";
++						fdt = "fdt-5";
++					};
++					conf-6 {
++						description = "zynqmp-sm-k26-.*-sck-kv-g-rev[AZ]";
++						fdt = "fdt-6";
++					};
++					conf-7 {
++						description = "zynqmp-sm-k26-.*-sck-kv-g-.*";
++						fdt = "fdt-7";
++					};
++					conf-8 {
++						description = "zynqmp-sm-k26-.*-sck-kr-g-.*";
++						fdt = "fdt-8";
++					};
++					conf-9 {
++						description = "zynqmp-smk-k24-.*-sck-kd-g-.*";
++						fdt = "fdt-9";
++					};
++					conf-10 {
++						description = "zynqmp-smk-k24-.*-sck-kv-g-.*";
++						fdt = "fdt-10";
++					};
++					conf-11 {
++						description = "zynqmp-smk-k24-.*-sck-kr-g-.*";
++						fdt = "fdt-11";
++					};
++					conf-12 {
++						description = "zynqmp-sm-k24-.*-sck-kd-g-.*";
++						fdt = "fdt-12";
++					};
++					conf-13 {
++						description = "zynqmp-sm-k24-.*-sck-kv-g-.*";
++						fdt = "fdt-13";
++					};
++					conf-14 {
++						description = "zynqmp-sm-k24-.*-sck-kr-g-.*";
++						fdt = "fdt-14";
++					};
++				};
++			};
++		};
++
++		/* u-boot.itb generation in a static way */
++		itb {
++			filename = "u-boot.itb";
++			pad-byte = <0>;
++
++			fit {
++				description = "Configuration for Xilinx ZynqMP SoC";
++				fit,align = <0x8>;
++				fit,external-offset = <0x0>;
++				images {
++					uboot {
++						description = "U-Boot (64-bit)";
++						type = "firmware";
++						os = "u-boot";
++						arch = "arm64";
++						compression = "none";
++						load = /bits/ 64 <CONFIG_TEXT_BASE>;
++						entry = /bits/ 64 <CONFIG_TEXT_BASE>;
++						hash {
++							algo = "md5";
++						};
++						u-boot-nodtb {
++						};
++					};
++					atf {
++						description = "Trusted Firmware-A";
++						type = "firmware";
++						os = "arm-trusted-firmware";
++						arch = "arm64";
++						compression = "none";
++						load = /bits/ 64 <CONFIG_BL31_LOAD_ADDR>;
++						entry = /bits/ 64 <CONFIG_BL31_LOAD_ADDR>;
++						hash {
++							algo = "md5";
++						};
++						atf-bl31 {
++							optional;
++						};
++					};
++					tee {
++						description = "OP-TEE";
++						type = "tee";
++						arch = "arm64";
++						compression = "none";
++						os = "tee";
++						load = /bits/ 64 <CONFIG_BL31_LOAD_ADDR>;
++						entry = /bits/ 64 <CONFIG_BL31_LOAD_ADDR>;
++						tee-os {
++							optional;
++						};
++					};
++					fdt {
++						description = "Multi DTB fit image";
++						type = "flat_dt";
++						arch = "arm64";
++						compression = "none";
++						load = <0x0 0x100000>;
++						hash {
++							algo = "md5";
++						};
++						fdt-blob {
++							filename = "fit-dtb.blob";
++							type = "blob-ext";
++						};
++					};
++				};
++				configurations {
++					default = "conf-1";
++					conf-1 {
++						description = "Multi DTB with TF-A/TEE";
++						firmware = "atf";
++						loadables = "tee", "uboot", "fdt";
++					};
++				};
++			};
++		};
++
++		/* boot.bin generated with version string inside */
++		bootimage {
++			filename = "boot.bin";
++			pad-byte = <0>;
++
++			blob-ext@1 {
++				offset = <0x0>;
++				filename = "spl/boot.bin";
++			};
++			/* Optional version string at offset 0x70 */
++			blob-ext@2 {
++				offset = <0x70>;
++				filename = "version.bin";
++				overlap;
++				optional;
++			};
++			/* Optional version string at offset 0x94 */
++			blob-ext@3 {
++				offset = <0x94>;
++				filename = "version.bin";
++				overlap;
++				optional;
++			};
++		};
++
++#ifdef CONFIG_SYS_SPI_U_BOOT_OFFS
++		/* Full QSPI image for recovery app */
++		image {
++			filename = "qspi.bin";
++			pad-byte = <0>;
++
++			blob-ext@1 {
++				offset = <0x0>;
++				filename = "boot.bin";
++			};
++			blob-ext@2 {
++				offset = <CONFIG_SYS_SPI_U_BOOT_OFFS>;
++				filename = "u-boot.itb";
++			};
++			fdtmap {
++			};
++		};
++#endif
++	};
++};
+diff --git a/arch/arm/mach-zynqmp/Kconfig b/arch/arm/mach-zynqmp/Kconfig
+index 46c7fc75537..341c8379946 100644
+--- a/arch/arm/mach-zynqmp/Kconfig
++++ b/arch/arm/mach-zynqmp/Kconfig
+@@ -140,6 +140,20 @@ config SPL_ZYNQMP_RESTORE_JTAG
+ 	  even if no eFuses were burnt. This option restores the interface if
+ 	  possible.
+ 
++config BL31_LOAD_ADDR
++	hex "Load address of BL31 image (mostly TF-A)"
++	default 0xfffea000
++	help
++	  The load address for the BL31 image. This value is used to build the
++	  FIT image header that places BL31 in memory where it will run.
++
++config BL32_LOAD_ADDR
++	hex "Load address of BL32 image (mostly secure OS)"
++	default 0
++	help
++	  The load address for the BL32 image. This value is used to build the
++	  FIT image header that places BL32 in memory where it will run.
++
+ config ZYNQ_SDHCI_MAX_FREQ
+ 	default 200000000
+ 
+diff --git a/configs/xilinx_zynqmp_kria_defconfig b/configs/xilinx_zynqmp_kria_defconfig
+index 32d40939ac1..7b0e1a63483 100644
+--- a/configs/xilinx_zynqmp_kria_defconfig
++++ b/configs/xilinx_zynqmp_kria_defconfig
+@@ -39,6 +39,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
+ CONFIG_CLOCKS=y
+ CONFIG_SPL_MAX_SIZE=0x40000
+ CONFIG_SPL_BSS_MAX_SIZE=0x80000
++# CONFIG_SPL_BINMAN_SYMBOLS is not set
+ # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
+ CONFIG_SPL_STACK_R=y
+ CONFIG_SPL_FS_LOAD_KERNEL_NAME=""
+@@ -223,6 +224,8 @@ CONFIG_VIDEO_ZYNQMP_DPSUB=y
+ CONFIG_VIRTIO_MMIO=y
+ CONFIG_VIRTIO_NET=y
+ CONFIG_VIRTIO_BLK=y
++# CONFIG_BINMAN_FDT is not set
++CONFIG_BINMAN_DTB="./arch/arm/dts/zynqmp-binman-som.dtb"
+ CONFIG_PANIC_HANG=y
+ CONFIG_TPM=y
+ CONFIG_SPL_GZIP=y
diff --git a/board/zynqmp/patches/uboot/0006-arm64-zynqmp-generate-u-boot.itb-and-qspi-image-via-binman.patch b/board/zynqmp/patches/uboot/0006-arm64-zynqmp-generate-u-boot.itb-and-qspi-image-via-binman.patch
new file mode 100644
index 0000000000..af55013917
--- /dev/null
+++ b/board/zynqmp/patches/uboot/0006-arm64-zynqmp-generate-u-boot.itb-and-qspi-image-via-binman.patch
@@ -0,0 +1,159 @@
+From: Michal Simek <michal.simek@amd.com>
+Date: Fri, 1 Nov 2024 10:17:58 +0100
+Subject: [PATCH] arm64: zynqmp: Generate u-boot.itb and QSPI image via binman
+
+u-boot.itb has been generated via mkimage_fit_atf.sh but it is on the way
+out that's why convert it's description to binman.
+Compare to script binman description is not able to configure BL31 and BL32
+load/entry addresses which should be done separately.
+
+Signed-off-by: Michal Simek <michal.simek@amd.com>
+Link: https://lore.kernel.org/r/90b613796aee38158252c8bb1dfc3da0420f089d.1730452668.git.michal.simek@amd.com
+Upstream: https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca
+---
+ arch/arm/dts/Makefile                |   1 +
+ arch/arm/dts/zynqmp-binman.dts       | 111 +++++++++++++++++++++++++++
+ configs/xilinx_zynqmp_virt_defconfig |   3 +
+ 3 files changed, 115 insertions(+)
+ create mode 100644 arch/arm/dts/zynqmp-binman.dts
+
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 4653b5bdd16..f4e4149e85c 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -472,6 +472,7 @@ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-p-a2197-00-revA-x-prc-02-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-p-a2197-00-revA-x-prc-03-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-p-a2197-00-revA-x-prc-04-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-p-a2197-00-revA-x-prc-05-revA.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-binman.dtb
+ 
+ zynqmp-sc-vek280-revA-dtbs := zynqmp-sc-revB.dtb zynqmp-sc-vek280-revA.dtbo
+ zynqmp-sc-vek280-revB-dtbs := zynqmp-sc-revC.dtb zynqmp-sc-vek280-revB.dtbo
+diff --git a/arch/arm/dts/zynqmp-binman.dts b/arch/arm/dts/zynqmp-binman.dts
+new file mode 100644
+index 00000000000..df0fdf46510
+--- /dev/null
++++ b/arch/arm/dts/zynqmp-binman.dts
+@@ -0,0 +1,111 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * dts file for Xilinx ZynqMP platforms
++ *
++ * (C) Copyright 2024, Advanced Micro Devices, Inc.
++ *
++ * Michal Simek <michal.simek@amd.com>
++ */
++
++#include <config.h>
++
++/dts-v1/;
++/ {
++	binman: binman {
++		multiple-images;
++
++		/* u-boot.itb generation in a static way */
++		itb {
++			filename = "u-boot.itb";
++			pad-byte = <0>;
++
++			fit {
++				description = "Configuration for Xilinx ZynqMP SoC";
++				fit,align = <0x8>;
++				fit,external-offset = <0x0>;
++				fit,fdt-list = "of-list";
++				images {
++					uboot {
++						description = "U-Boot (64-bit)";
++						type = "firmware";
++						os = "u-boot";
++						arch = "arm64";
++						compression = "none";
++						load = /bits/ 64 <CONFIG_TEXT_BASE>;
++						entry = /bits/ 64 <CONFIG_TEXT_BASE>;
++						hash {
++							algo = "md5";
++						};
++						u-boot-nodtb {
++						};
++					};
++					atf {
++						description = "Trusted Firmware-A";
++						type = "firmware";
++						os = "arm-trusted-firmware";
++						arch = "arm64";
++						compression = "none";
++						load = /bits/ 64 <CONFIG_BL31_LOAD_ADDR>;
++						entry = /bits/ 64 <CONFIG_BL31_LOAD_ADDR>;
++						hash {
++							algo = "md5";
++						};
++						atf-bl31 {
++							optional;
++						};
++					};
++					tee {
++						description = "OP-TEE";
++						type = "tee";
++						arch = "arm64";
++						compression = "none";
++						os = "tee";
++						load = /bits/ 64 <CONFIG_BL31_LOAD_ADDR>;
++						entry = /bits/ 64 <CONFIG_BL31_LOAD_ADDR>;
++						tee-os {
++							optional;
++						};
++					};
++					@fdt-SEQ {
++						description = "NAME";
++						type = "flat_dt";
++						arch = "arm64";
++						compression = "none";
++						load = <0x0 0x100000>;
++						hash-1 {
++							algo = "md5";
++						};
++					};
++				};
++				configurations {
++					default = "@conf-DEFAULT-SEQ";
++					@conf-SEQ {
++						description = "NAME";
++						firmware = "atf";
++						loadables = "tee", "uboot";
++						fdt = "fdt-SEQ";
++					};
++				};
++			};
++		};
++
++#ifdef CONFIG_SYS_SPI_U_BOOT_OFFS
++		/* QSPI image for testing QSPI boot mode */
++		image {
++			filename = "qspi.bin";
++			pad-byte = <0>;
++
++			blob-ext@1 {
++				offset = <0x0>;
++				filename = "spl/boot.bin";
++			};
++			blob-ext@2 {
++				offset = <CONFIG_SYS_SPI_U_BOOT_OFFS>;
++				filename = "u-boot.itb";
++			};
++			fdtmap {
++			};
++		};
++#endif
++	};
++};
+diff --git a/configs/xilinx_zynqmp_virt_defconfig b/configs/xilinx_zynqmp_virt_defconfig
+index cc298b200a1..2643ce2acf7 100644
+--- a/configs/xilinx_zynqmp_virt_defconfig
++++ b/configs/xilinx_zynqmp_virt_defconfig
+@@ -243,3 +243,6 @@ CONFIG_EFI_SET_TIME=y
+ CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
+ CONFIG_EFI_CAPSULE_ON_DISK=y
+ CONFIG_EFI_CAPSULE_FIRMWARE_RAW=y
++# CONFIG_SPL_BINMAN_SYMBOLS is not set
++# CONFIG_BINMAN_FDT is not set
++CONFIG_BINMAN_DTB="./arch/arm/dts/zynqmp-binman.dtb"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
