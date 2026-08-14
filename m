Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1BEC5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 07:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CCEA40895;
	Fri, 14 Aug 2026 07:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jnzcf2pD-vP8; Fri, 14 Aug 2026 07:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D02B40866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786691171;
	bh=z9G6UVCjr2xqVk3TSOrm72QGEYRJHs7Rwd6pp959iNM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=pAIBRu0XF0L9L4kwdqp7D4beQrB/thVIzm5PqVrnTDNfruZjiHu8s5oXWKtLjPHL6
	 Y7HPG+wN8Ei2+rYzzLAxml90r+HIysYoSmPMWSJZsDJmi7QtDWxfnHBHgsZ9xMyXqr
	 XfntoiEdNeHIseXeMwfKPP8W9CjpbETAnGyhScxDqhSx97IdNfwHhu3OKrP9Y4t1fV
	 RhoU+H4XzTHhWXle3sdjQEyIsPXGVq2OtNT4QwL7SUgXW8BJeqqUNQ0mncVkmQmwd9
	 V7XvH5FeoTa9NXKk+bA/nSSqD8+WmHlhaOM7nMuAOhSek8u383WV93bmchhLrvrYYU
	 ZWDgAF1r070MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D02B40866;
	Fri, 14 Aug 2026 07:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC115282
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9228A605EE
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2owEIW6SITxi for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 07:06:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4050D605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4050D605D7
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4050D605D7
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:06:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGuCgHjtRc8UJ4/xSDY7smU8O0SyJSfhWAhOrbSXxTRkhe+lQybYxH3IIj53kOBZ2A0bES+ilEfL5Ag7v0OLFIgUV+fh7+65gKdrDXbVWwgT9j8qioluHk4Yeb3OfqNIAayHKfavPOjQZk0PnipllPXOiFzS55bnOw+my+ZYGp1NroMHnYav12EyoKSMoL3NAtzBlYMpldGa3CjocoDkwTVEQKaTQLOwZEFZfpLxlzn5NTMLv7kEreUQU0h4LOJk6vF/BfwRoxPPbRpnCrm4aw1acN1PsTtTfmsc/TAWu7wyVYmZZ0c+3SmFw+Tu+whM8QJnawrxqOD+FTn+2126Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wengNW5swR8ieF10CiqDIgkNTo8Yq+fnM11kbZSj64=;
 b=Ll2fIxujmKnpuzJ32xCZ4pCSKYlCxLhHpktzgaTgZu2dZ9+PKcoeef4LYGjJnW3873n76x9LeOikfktx+awaZQgyXm+b8YR+bIl0yozeV8EpNgv1XNOXosJxkmhwI6AGa1EH7MpJrNe75inf+TXBoNkJH9hL574S5XVGlg8/SA5Cp1B2dAehqfHFiRLs/gfccz7e0+NgrPGAW/qxxgKVkmgY68YWdpnB8gZWPr3wVvuzIxK7MFBer9kOzUcHzk44zjQ1FiSrt/aZFIAPHXvPC2frzFLqvEAHRBLnvTJgrvyLHH8uPvT0nwYmIDVWgQ03TTEqBWv0aGlGgROfDQ1XcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from PH8PR22CA0007.namprd22.prod.outlook.com (2603:10b6:510:2d1::12)
 by SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:06:02 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::8d) by PH8PR22CA0007.outlook.office365.com
 (2603:10b6:510:2d1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 07:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 07:06:01 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 02:06:01 -0500
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 02:06:00 -0500
To: <buildroot@buildroot.org>
Date: Fri, 14 Aug 2026 08:05:57 +0100
Message-ID: <20260814070557.245945-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 909da0da-9805-4e81-1f7c-08def9d27ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|13003099007|18002099003|56012099006|11063799006|3023799007|10067099003|41080700001;
X-Microsoft-Antispam-Message-Info: 6z3z5iwmp915NRYJWvNTe4qIQIbpiEnI9/tQSiW3SBo1S6Pv7VtZuo3xdUwKKmtK0dmCNOTd8Ua044WI1FGjNwLDXuazCBDWUWeqCHYQwuCnpdIx6JL+1Lqbhu0ZV5yyFs/V043JNdXY5olvCgeB0pDNSwcG/vmbWtTTeDg51tB4K19DFCd8irPH49283vMtIijgFac6gw4YLmdVovcpX1MGPoatHFnRQ5flX3IjrOpDEJNJ0pra+ZN9e0VkfX0xUkG2+rQoExNY8U6bnBpM/FkbnBcIsAORNlsLzU2G8wODxv5QKlOoBW0Os/5hRbutT3f37FOEA71obBSEq9qQQXKpZpcOs23oDd7o8LdQMP+Xbql0/W5/5Udc5La7MKZZ8WPDDsFaAQ7Tmn1SKrPdJdpivLgJRs5fDm2+2u+9QqhqLXyH5+QLfYFyg7kb1/UPQNzKwlLrLZtWy3ZPi4KL9/3vH99X4RbXvaCkkPRM3+ET0v5z0somSl/+C1zmFYfJXJ5hJurP6MKlzJDlzKTu6YpJLJ/orEP/cpESdhsac/YaOVSHeRu02m+pSfEhRkYKnx6PMDuiOps0uEuAzGsuhszIDDp4k6IbsYds0aJAeSrw884gtzzoJNRnZVJOXxi/f7rknQYE5U3/YtKhD/bRhn7hxjFs3sClj2KosGJ082CvXiFPtEZmF2ZwKm5N3+OydRlLezob8nUtOpEphomwbvFi+Km9vmnYi+BJZ9DozwfQ7v2x1edZmzMwtpLnNB4m7IT44ZEhVDOkjIqhedHw8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(13003099007)(18002099003)(56012099006)(11063799006)(3023799007)(10067099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LwrGK3tB+nzA9dAv4KG37QI814+Ei8dVxLcvP+fbYoo6/LheCbJJeVQIEeAEIpDA6vP7nRlJ+r9IrUoN1CyJuQtciBGSk8pd8Lm5BeEpBvVPzSydtw+oVIiUgFQUZcS1tD5DQ8A2aDL3jaVNp7kZoExtPS4aU01pWbtwecWPaN5r6NPxe5REdh/4PWBjGuK5Ru6InJPA9nB5ggzCOrTJ1xopHiOcI3HWwKWfO0o6ubf+7N5rXxlLtwQk/PfO1RojUEHChxTtGqQeJW8rwcXimCjBUjwdJ5beaKMwI2VB2SL9KqueFnzGwByIL2pyk4HllsScqe9Yj8vbAvt0Q0UzSUOW6xB5dVFl0gNf8Nl2J6WK7c55eNDEn4dVF9cHNVp8bft+YKLn+uconNvvljQJoNprkoFnZo2YzOuqz6qPDaSDGumSc+eipvVWpTXm9sEH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:06:01.7383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 909da0da-9805-4e81-1f7c-08def9d27ff3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691
Subject: [Buildroot] [PATCH v1 1/1] board/qemu/microblazeel-mmu: fix run
 command for qemu 11.0.0
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
Cc: Neal Frager <neal.frager@amd.com>, joseph@anodize.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With qemu version 11.0.0, support for microblazeel has been folded into the
microblaze target. This means that the run command for microblazeel-mmu needs
to be changed to reflect this.

See the notes in the qemu bump commit to 11.0.0 for more details:
https://github.com/buildroot/buildroot/commit/9a5369effd22011b52b82c91f702bacde690c41a

Run command for qemu versions prior to 11.0.0:
qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

New run command since qemu version 11.0.0:
qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/qemu/microblazeel-mmu/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 20fa0072ed..a9f832e91e 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig
+ qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
