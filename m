Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37DDC18E7C
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F3244134A;
	Wed, 26 Feb 2025 15:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21yyK9-bmB-r; Wed, 26 Feb 2025 15:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF2141345
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF2141345;
	Wed, 26 Feb 2025 15:13:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC60D94F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D068B4134A
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHt8UIDRNxnF for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 15:13:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::605;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 096C24134C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 096C24134C
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::605])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 096C24134C
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 15:13:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X29rDrAM614MfJWjkZF+W6req+EwcnVCglNtQF4KELtkds3hn8k6yECNvuJk77YWlTlNKgBTTHOjYnzdod1ELPoVRfi8PTBh0NzVjCq98l+yYqtsghniDra3Hftcm33++mJs3k/Hk/4GPoh2iXFcEKxY8O5tGbJFozDrJvPVZjppn9Gn/skT3Nz3nEYtkLrbtLJ+uyEy+chSKUkdwzjAoI1ukF7UXtCThNB4sTXz/3Hrih1rNdg8qLlNWI80MZJ5WMe1vP0cySDO7NhCUzMXg58vDDs6tpj+bzFBZt7B9iDpJGLTyNKLeU+0t6lbWTzEETbtlcjqtnuevzx+Vyczyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmGtrMwjCOUtikDa+LN2qdK+dqUmxr3HnIehm9N+oQ8=;
 b=L0WpjRGbNTpHXmgAYd25bVdpCwM3II6MCBnz1cvzw7Z0XVNbKcd2j6tcl7Dn3DgTP31ePsBp/1pqqKnHCVMqOy8AoV5aQsvtKMZoreAU3DA44c4t9U8F6zWsDDHtmCRi8qoZEbkWeb47MkLdDXAFrPNvBFlotIrisJ8I+YuB2kV9jx8fTVJU7ytMtCD3sPD3c8m+J7DKIoyg+YDcBVDqSom3izkKuhEWZXb+EDnRx6aQ7y0YYwqtsCvGba8joNCdDZ/vHKAyFYsWK7+eqNJfxLOhDNSUiPLxy8rbZYAuPELw7vKoynJ809+WOiwisvzFpiLStUi0MoRwBv4ryFfnTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR16CA0012.namprd16.prod.outlook.com (2603:10b6:930:10::20)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 15:13:30 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::3f) by CY5PR16CA0012.outlook.office365.com
 (2603:10b6:930:10::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Wed,
 26 Feb 2025 15:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 15:13:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:26 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 09:13:25 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 09:13:24 -0600
To: <buildroot@buildroot.org>
Date: Wed, 26 Feb 2025 15:13:15 +0000
Message-ID: <20250226151315.2537267-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226151315.2537267-1-neal.frager@amd.com>
References: <20250226151315.2537267-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: a6262a8b-d98b-4dfb-452b-08dd567820d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HmVNopF9ah0vdNS3hosSLm3So3Icf0L7jHBZqMcyl8LFMJXlm9sOZ7MjR5wl?=
 =?us-ascii?Q?Y2HDmuoGUwNvdpCP9sgYGWOUq9sUmnu5G+KQU6GGatR+/6kIYtr8OklHYH2h?=
 =?us-ascii?Q?Xd2q+2WRh0gtmySBY4JHk2Tz4lXQKtLz9DaKoX49J/SXRlwIqahjLlHtxauN?=
 =?us-ascii?Q?Fp+G3NTpJ/pUB3VLp+s20jfNUvcpzWR+h8iWC1wZY7dhJ0Gt6+m4UXis/Rom?=
 =?us-ascii?Q?Y1YeHJA0mWDjPfHqJ97BNe5F6814HmszefITnvOq5w/5zuC94GE/xvFijhRA?=
 =?us-ascii?Q?bSSR60+K3C8e2YUg8IShT4QEMEaYsYaqNE0lR3uaAAlWayzOyNf+Dpo2JnAH?=
 =?us-ascii?Q?RmuvL7nomaHe6OLy+qaO08jJsn3xtj5TyWGOw3OVmQOfyor59upyN6LRNkDx?=
 =?us-ascii?Q?cRdt1HpYspRc2rvN1jwrDdAnxwecpGtdszKoGMw58qiIMtpJztwJJXuEl3eB?=
 =?us-ascii?Q?xF4uGDNRmdzE1idNl44Y2jYTBwHHVSwLT+O0XAy7xgFYBBC8U+nW3iWr3iXw?=
 =?us-ascii?Q?5ZYa9Ro+kadUiavzSX7sG1ZrQzII0kLExi199ICOQn1G40n3RpyqwVuv6wCs?=
 =?us-ascii?Q?dF9CZ8d/PdR9PC9q5a1+Eta8JuAD77kAfIsVoVdD6tJ3CKFTO6XexTD3FOid?=
 =?us-ascii?Q?mq7BcqvCXFYf0nbfShUp3/m1x2aXAUYGvosHpXvgl2QJlc3G3IRR6L3P+Jp/?=
 =?us-ascii?Q?5i+nRDlgV9wGGCc6dT/D+dMILEUNwh7ODcT6gUZaShSoWc0JddYDn9075Znu?=
 =?us-ascii?Q?bCN4Q2udn6XIM/TubgUajyWoe9vDuJ5/AgLhgMcC69Ytjap7xbxbixnqCXR/?=
 =?us-ascii?Q?anHo+Qg3DTbEG8L2rht3UWYK/XeeVVNV9KUL7gDfSR0BVNHOlUtXhhp6E6c/?=
 =?us-ascii?Q?vSHMYm0MRIHrkeTYtZ3SN8y6NqobrwNQsV5k2MKee8GVRXGm9zjI0vkoPIdf?=
 =?us-ascii?Q?+7G+vqUGuUA02vpehAcGwimmVe+mP7EGk+dCj5d0qP+4LOMSKrU1gTAKGeFy?=
 =?us-ascii?Q?9v62tR1iNkgxut/M4Dd2beVWijLgd+k/6QO3TDWmlVC4PdTjMfoqNeigXY88?=
 =?us-ascii?Q?ucecIWZK5s76JhS1t71bWJWgMvZFBbMKArwO4zsOViQCxyHD7kkRT2OyuT2T?=
 =?us-ascii?Q?+d38ve5wFi8pjGcYJXrL0NHcXZ6MSwNRtf4zKATr2qFA7vzGUs/b16PJ0f/q?=
 =?us-ascii?Q?LQZVnlvHWXksi74mV96k+r1xDQX3QNaZpumVkCgbm/rFsLvwbEPJxywayoSB?=
 =?us-ascii?Q?S7HCxNvmtdoSrXcyvkzavbo/qqL2PJhRMF+AvK0XqyUis/3icjEm9nVKcgfS?=
 =?us-ascii?Q?58QVILjARLOX7VxZOLC52OZcdFQA2F5LVXNYv91IUGLa2ZkfRp4wzDFYqMvA?=
 =?us-ascii?Q?uBth03gu1Wo68C2HgkhmfLFQc+MTiqOwo1SL9a9kPQROIdlkmCi5tOOBw9+q?=
 =?us-ascii?Q?1DXUndcdUrTvRcrlyIKPZeeqWSsdqLmlNsUSxauA47ndjOCpNm5uTIG5kV3j?=
 =?us-ascii?Q?5JrPZKECgMPWSzd5oPRvLwAjsKXKP2ZfaKhF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:13:30.1943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6262a8b-d98b-4dfb-452b-08dd567820d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmGtrMwjCOUtikDa+LN2qdK+dqUmxr3HnIehm9N+oQ8=;
 b=BrqunEkfgVuq/Q11+8FHCsAoobvumiWzmEytFje1G7WlkidWfp/1USoYwj5dfQb7zF8239tllGcitFjPLwHOSzNzedFMuUZWUotY9HUv80Rk88IquhLEBbA/riMyDEDhWBPp7Q2bxvSFLjwJypTbcV/yBFSxK6SLND+bSfex53A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BrqunEkf
Subject: [Buildroot] [PATCH v1 3/3] configs/zynqmp_kria_kv260_defconfig:
 bump to Linux 6.6.70
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
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_kria_kv260_defconfig to Linux kernel 6.6.70.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 288606fc02..ef6a23f2a2 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.60)/xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.70)/xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
