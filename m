Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5820FC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 08:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E10840708;
	Fri, 31 May 2024 08:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvKnlLBqdXd2; Fri, 31 May 2024 08:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0A2A41DD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0A2A41DD8;
	Fri, 31 May 2024 08:44:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 056E41D4F97
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DBE541A77
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 08:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpIqHAlFwueV for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 08:44:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::61a;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B352D41A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B352D41A6E
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B352D41A6E
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afESM5kfCNAj+DfQR9eMn/PBRSA84bEgH0B3A5Cj5Lm2CI2UsFmFPnr3EiHJB1vIGLMEOogGjV5n5PHG0Xm2RyDRIW5y5AxVjYhDgkqqAsW1AtR77yirQx9f9sSZdwDKTj1SdaWGHJEzcbe0dK3unx+9wwwKofhbP671/hFtS4Cx4BIrm9waOYP7f9KKqSrGeHobX1i+pk7ldHJcIuaOlvf7Mn0khRv8jVAvp0HJCoxX5Z6PCbkZGBwf9mi7otJQG5YnEzvHevquGgHybRVmw6FJIB7ia9iIgAIsBDiTcFY3bKjmadwhF4YTBleGRf8IdOZU8d/HARG2mi5K9xreHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xeUJkViV2iVGxhyMqbW4HTaOPo0SyK0+wg7kww7FVk=;
 b=iFhsA4EIWmu3x2WYhMUoah9ECV/h0E0VepFjuY2zb92ImkDKXTx2mydf1A6ycGvBAivAYYf8exo9kQMgtTyujJJVC6AZgX7+m6iTG4RJJvYTng59VGW/544MIOZCEnSc02NOOB7qqrQXbBwhOVIDjkNms4NqUTDuzD4Y98nCgn9gsLfDyE3ORsmDECDgyxRRoKDPx19tVC6JoQ89cPSM1Bp0rqLB6nDfY9+Z3iUGe+OF/4QgF975EHTyCXboqH8XnR8n1lCVnXj9Ov/vV+XhdW8lMQl5KVd3U88OoSRYeG8v4C9y2W5JTgeiyBivDNaRiAUg6Bpi168iuz799B/JTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SA1PR02CA0004.namprd02.prod.outlook.com (2603:10b6:806:2cf::8)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 31 May
 2024 08:44:08 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:2cf:cafe::a8) by SA1PR02CA0004.outlook.office365.com
 (2603:10b6:806:2cf::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Fri, 31 May 2024 08:44:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 08:44:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 03:44:06 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 03:44:05 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 09:43:50 +0100
Message-ID: <20240531084350.3703469-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531084350.3703469-1-neal.frager@amd.com>
References: <20240531084350.3703469-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: fba4bd89-5a25-4c6d-daa1-08dc814dd58c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|1800799015|82310400017|36860700004|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D9K6JCxsv0DUn1qyBUETjNqN0ZIWGGoD34jSK8GaOF+3rSGmO3uc0FzBclNB?=
 =?us-ascii?Q?j1ch/mWL8BeCgE3+Bb0S7RIsD19Zx0dGj/dbo7l7xUelpdCRFbQzBpsBvwrB?=
 =?us-ascii?Q?b2o3XWQHdwN/g5blECS9q+iAjXky3BzpJWvf5ob2athXs+s5qYvdAWesr4ml?=
 =?us-ascii?Q?hs5nf1H/0S2fq7bx7gePeYp0eDfk/hmL/Ns0lwAehU3E/cSysG46/Qf1FsW9?=
 =?us-ascii?Q?cr90o8BlNPiC7OetaPpmdFpa+hr90wSH8qhMoFgQnS0FE4ronrJYrUQe6CgX?=
 =?us-ascii?Q?XJHzDWzRdOX60VF1kpFNc0nm+0Uwpcra1oswoYGQ7yR+yI5nPttpC8e56nkr?=
 =?us-ascii?Q?ScW6fB7gVDDhGo93SzIojyKuqRs9agKq3qV0tWv5FaekuEesx9BPPR+L2Z9B?=
 =?us-ascii?Q?5uxv+uLJaE9WS+HxAmz2Fk+MHkD195GCDPn3cTlUc0dylpMDv8Ak9rcwEyqX?=
 =?us-ascii?Q?kwG7/TX9Q4sg37SFVavZcsUZi0Y5rs7AkOno2xc35YpSRGRYeAty4ZrpSyEm?=
 =?us-ascii?Q?LjTyfIyvYoGZ2sdoowN0SJ3Uc4z7JiFZ9HmxEYIYtIcKfpsiO2dMFKhU6eCq?=
 =?us-ascii?Q?oA6U2mnLWNgfFFTkdMWcXBa0NHvzlHyycjVfdeQV8dRkmKIzYHDl+KPY706b?=
 =?us-ascii?Q?ms/3astghAH2vkCxbVt383CC6XPKONZPwWxKvjE3pmRjulHdazYg9ALXU4zw?=
 =?us-ascii?Q?miKC/Tv7tTNncDQ/5lxQ14VWF089BJC2Gep+Pjdy6KV56VQXzUMUxJw6V1kk?=
 =?us-ascii?Q?t6kqcAo5932EXWFP//4B+Dg9ijxiNr/gBhjUYKxBsIK7wLA2iIrS8sUxZysE?=
 =?us-ascii?Q?JKKp6PDCxm1W1hvnJC58bCywKmK92dsI9rxWEpJYk9+gzSkyoZSbSPscLZxo?=
 =?us-ascii?Q?54z7wbwLpPw13bCBkqnqNX0A9NALQZqwkqqXlNLvY7ewES0PlEG2RlYYAgQ0?=
 =?us-ascii?Q?xNw0AJOoLK55WYwL6W2Y5O+WmwEl8wjBC/eIFJS1k8JXxyZNI/7cSMQ5NQEi?=
 =?us-ascii?Q?aSn3+PUHMwL0FzRUd8luYvkspyWp5t2hHsj6xVXO0pOHm3cPe1b+nLQwjMu5?=
 =?us-ascii?Q?aN8pko9sRgZ+A5kzsTqUuOsxCJqOplhv13Mb/4eHXggAru/19Ks633Rj7oeL?=
 =?us-ascii?Q?LWIPl4xIR80yEy3STEvHuXAshsM1Y1anLTKccP74AevNWERWf/tvUo9WnSYJ?=
 =?us-ascii?Q?h05E9oc2ZzAgpkuWgpH360ZJUh0SpUL8Wv0Uk76933jV5fBB4G0jjemoJgk7?=
 =?us-ascii?Q?4aXrVrwZJ3+CuE3C7Jim33T1u+C0VtB7KZc5nHLg2bSFCwggXlW1OlOY0LFn?=
 =?us-ascii?Q?SB8w/HycfAUugQzjFx6oQL3T7/rJgODlBvitIt+E388Ti/12nz+j5ITdiy6f?=
 =?us-ascii?Q?zXSUZHgqxSK7YfSJAlh1MMgMg+JHuF6wEPvpC5wh3OoacRJ8kg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 08:44:07.4385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fba4bd89-5a25-4c6d-daa1-08dc814dd58c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xeUJkViV2iVGxhyMqbW4HTaOPo0SyK0+wg7kww7FVk=;
 b=paDnACmfw9z78zd3HhRZ58yk2eAHKBaWrc3SiqC8lm3UBZuVnQ07JB04UGC5M+MlAUIHD24rWNAEYEfykeNePnkoB0cvLpNb6sIVJ3eUmQDxQfONyk37p4IysH7lx5/O3H1pHSZK1tivaY9mYV4hVuWYvsBitDD1w3Q+xSFfci0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=paDnACmf
Subject: [Buildroot] [PATCH v1 6/6] board/zynq/patches: remove xilinx 6.1.70
 hashes
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that the zynq_* defconfigs have migrated to xilinx_2024.1, remove the
older hashes.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/patches/linux/linux.hash | 1 -
 board/zynq/patches/uboot/uboot.hash | 1 -
 2 files changed, 2 deletions(-)

diff --git a/board/zynq/patches/linux/linux.hash b/board/zynq/patches/linux/linux.hash
index db57012f98..d85f773478 100644
--- a/board/zynq/patches/linux/linux.hash
+++ b/board/zynq/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  56acddefc6f6fdc00df5b75ceb4f86a9d0af9a4fef78cf57f9f2c274b22f006f  xlnx_rebase_v6.1_LTS_merge_6.1.70.tar.gz
 sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
diff --git a/board/zynq/patches/uboot/uboot.hash b/board/zynq/patches/uboot/uboot.hash
index 516707bf26..a5ab9fae05 100644
--- a/board/zynq/patches/uboot/uboot.hash
+++ b/board/zynq/patches/uboot/uboot.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  32a997a748697ff27e5e6db8edaff5ba893077214bc18b5267daff0b708dab53  xlnx_rebase_v2023.01_2023.2.tar.gz
 sha256  58e391a001d9d8ed347ab3258ff7c8435c866b1ff2b2c22ebc95af592444c0f5  xlnx_rebase_v2024.01_2024.1.tar.gz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
