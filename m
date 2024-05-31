Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF0C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE8724130C;
	Fri, 31 May 2024 09:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dl9wwMwiqF-q; Fri, 31 May 2024 09:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B11E416BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B11E416BE;
	Fri, 31 May 2024 09:48:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 538F21D504E
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA7361143
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guaiYbrp_Ncr for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:48:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::600;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0B2960641
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0B2960641
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0B2960641
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:48:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDH4mMPW0g2/hSwSplCpz7Pi4B+5v42mhfhrrEb7igyTxKFmNnBYi90sZp6icaGI07UrSbiqx9Z0tfbwtiUpizKorlpByAoNnISgJ6yNkecYIEWBlkYNjfczFNB03N282DPuoh91l54VFpd3O0o2SLpPNyk+H/u94Z2em58W8l5SCvrjsD9wH2f8Jq/esQ9plGmg285pjhqVksiRUuA8kCBZHvvGoCcJGCqFgCLPlBfP2f8NM5aoINtYCBr1ElqSMb/EeFxBSXOje5OMyZnCElmT7mRuwut3pvj/RFP+RJogKrZnxP4fTmdPIAMGB+pXWc6rfrZ/U2+1pvwvCv+tRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flJkBaN5Ga1BynZrmPo8Khlt7iYgw0jFrO1cNPb26Z0=;
 b=YITrb1PCxZQ6Jz/ScGoJbiKl9IpxYHIkVr8EtfXFQvHmNdm/iNSbXtNFqinFXVdLSaqOWrjUFqRSOLTr0E/epU1W6tuzDm1JfVfRNJV6qtj+I+DBtgKiHhVOyXtdeN2UZU6bdJHFfcVJ2g/0QAoay6Kj8yk0+hju793SnOaoGfiQ7UVvU7fYizJd4opYhMXuFBFT5+wMRFdRCe7WFaWU/Sn77Ou2OupM18K2IEbW1hslLxd5o1QmnnkkfXOBiWGybP0uMWK9l8sulABvgQ0ITTZZWe18eL3/EKRl8bWP8eH3gEsBFWuUNXUS/lCBlOCuN3sTP5Z4yKsmLZDL2rVQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR11CA0028.namprd11.prod.outlook.com (2603:10b6:610:54::38)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 09:48:11 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::8b) by CH2PR11CA0028.outlook.office365.com
 (2603:10b6:610:54::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25 via Frontend
 Transport; Fri, 31 May 2024 09:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 09:48:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 04:48:10 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 04:48:08 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 10:47:52 +0100
Message-ID: <20240531094752.3760287-7-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531094752.3760287-1-neal.frager@amd.com>
References: <20240531094752.3760287-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c0426f-31b6-41e7-6992-08dc8156c848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZK2DiZwvWKhDSOqEpdOHVbBhtn8jfTOfASXlO3mak+foYnHANYqjnKz0Ssep?=
 =?us-ascii?Q?S9mHTWI+WvzViC7av6hBXLFCSIoiGW9SJar32sweCUhwA30/jjxCKCOBPIzl?=
 =?us-ascii?Q?XTZdVezQFQ/JfIm6Xqt9QKy76lyVBdVOM5cfc66Oml9GznlTShjkH0xxGxey?=
 =?us-ascii?Q?4QAL/RUY39+Aaa4VGsAFOch8IQgywTsfqhE2CPBsmhpWskm+swGStYJVGi0s?=
 =?us-ascii?Q?uQOyuDWUFJfHbnWhzFboeWUfsmqalkQG2bnmKJvo3eRsAcehdWlg+f9cQQ8N?=
 =?us-ascii?Q?F3tdhg5K5E42uQIe+s98OgsQpxNJN46bTAi7lVKDK9/uiBU/hl/MBnHZlAST?=
 =?us-ascii?Q?cUO3+X6BBp3m0qCr5Ss7y7lSoje9O1nTtsrFa7SRUt+keR67GwhxiQLJwgLl?=
 =?us-ascii?Q?FUz/VYtJRtFUhyohnwZiIs5FmYdT3vZzaW2G+yDyocDWBINzBy0zLCfUsAwR?=
 =?us-ascii?Q?TPah2U7ZmYQbC9JpPtA22+pKMicACJUdZMr41FH6tX6p4VoKxGC67brzQQhh?=
 =?us-ascii?Q?3404mU6SJYVZzMFjUbPdPId4PPRJg0cuwZE7RWgbgMYUq4O9+O9D9shtndBU?=
 =?us-ascii?Q?61TOZ5jwfQ8q1p0mIlv+IkIlWJDzSpcq2ROTiI2WB9smot9+7FxGbYO1mhlJ?=
 =?us-ascii?Q?vLNheIxCTyfFPgFextIym9IcQZpoQeObpIOFZpiUA+w/UjsZnEj51EFkBc5E?=
 =?us-ascii?Q?G4nt0VlVdpWYo9ZEZs4CPOVxzFDxmgiY8Z9PDpjVhN3IKa3gx2DhXofGTKNJ?=
 =?us-ascii?Q?XvZmRzYIost0u1Wu2Ai6SL47LSiQsMNkDoautWBmQ4pBOSYzZhPcaUCBJfYn?=
 =?us-ascii?Q?gH9SpxpQC1x1JkASUjLGKLlydHChwIcM6sjZNy0Z1ymZVF6s6DarM1eoPGu9?=
 =?us-ascii?Q?39BNoobVFh/uT7mcIMp5bm3rRV6Ayzx1yTN/M/fThrfZj6XPJ3ain1kVShdu?=
 =?us-ascii?Q?LU5R070seXJz5/7aIUfGA6CITL4PTSzb3Zx1jks3Ywm2jfo7fi+EhuN1z1h9?=
 =?us-ascii?Q?Y7oRQjmeDMj1ufj9IwM4snbT63+fll8X8aiPFgVzIg54IF/cw6IVfY6BwwKR?=
 =?us-ascii?Q?T6Smy2apMUlP3WbM6t4IkYRw6lKg+vdAn0JIjbQhhwQiykWRHtP/pwLgZ9+6?=
 =?us-ascii?Q?V0kh8kNMg4/AmylHyda9y93mbKjugDQRezQUqWWgKY4tOlt3Vr5+yv6W5doz?=
 =?us-ascii?Q?vmqGXclrz/2vbW8KFH0FPWvbCXUuwz04jX+AMf3PTs+gAJQIf0ZGUjrAyNQd?=
 =?us-ascii?Q?5xSf82dUHfmmRodjg+z60+b7z+YLYOh7ESLtrymcCOSL6kO0e0YHRXSImQcr?=
 =?us-ascii?Q?WzjtqW48PAxFdgZGkBL7/bPElQrR50s5V4SXeFulot4dHDOwPc5Br1YE0lXr?=
 =?us-ascii?Q?PHgWbmfZLtxj8PeI7j+aMQbeL2kOkDSS0B7vG1XOLx/YSdQ7mg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:48:10.6189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c0426f-31b6-41e7-6992-08dc8156c848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flJkBaN5Ga1BynZrmPo8Khlt7iYgw0jFrO1cNPb26Z0=;
 b=UGWQ1WWuu/wCrQ2ZHzzvBOCkz+8M+JElupUtSmCksEF4B+WjkcUyYAX/7eR11+NR9S7fNuVTzl1KUTIXlZMhzNA2XDv3gaOlOsBxLwoIk/wxU+RtS0eTn99qAbVfmQGeFxrjl4oHerG9B5Wc7OelMqFhGaxv1gJwnl92a5xXMz8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UGWQ1WWu
Subject: [Buildroot] [PATCH v2 7/7] board/zynq/patches: remove xilinx 6.1.70
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
V1->V2:
- no changes
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
