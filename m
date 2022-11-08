Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BA1C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1BE560E49;
	Tue,  8 Nov 2022 21:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1BE560E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aCJJSTwU33gj; Tue,  8 Nov 2022 21:20:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4ABD60E69;
	Tue,  8 Nov 2022 21:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4ABD60E69
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7CB1BF5EA
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 21:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 549854024A
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 21:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549854024A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFLPygutL9fW for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 21:20:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDF54023E
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBDF54023E
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 21:20:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/UpvXdB5RJGainyEWks4TBGSZYJLkdkt68IMkHUbe1mqz2NoGc1OBOc+aZYHn0B1e6u17SeDu9BCtxC5PcrSChSx77S+LJkL7AfRohcZluRaa+t7d35tzwpLIke3bfCw6d3ghH7CDNpYlXHx+xdZ+zXfnExxKGEioSe5rIaGgQ5P25geTGQYNiwFxVKfa1sQV7vHOjTA/2wEoySTgh3nqCy70fAQZtt+ddmA+dEjcXZcfYIZTnljILf05Q33pfjdfOB4XxZqUufWdwqagnwHq79+4j5jtcOL5pO0hQ2S7ACbQhXn3TnLv5EQQoYD0xfc0xNy1CYtmRmcSdK/fPOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qxZgz2hkZcKqGC+PDQb90iNLPXWrCKumxDB4Ei05aQ=;
 b=BnjBae3vEGpsY/Mnd51M9qHFqUD7gT6UmuLcBiPqGQEDTY4N/4rulbOYUuSjJNvZsedDLmlmBS4lTHI59MKEMSHy+2FNY2SQEGnfy5/3P8SBR7Knw7kQ8roDtu95VexQUubTkvWx7kqQ3EEzy+XtBkWreIqUWoussBpJWflOI/30C8QolpoVF2UVi1QMWW4GpyWR4xlja7Q0lHMH9pXW5Bzu164v3BEgnyCKb7ZIpkFEyqlTYMaBmmYx1HtYPL69TNlGBpNZk0Mld1h7pK5agmFwPvs2dn7mhUh4+aH4ydOJyS+gZZxxm+Xk9c6mR+hWxVEEly+VtizNTyEd2Lz2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0114.namprd03.prod.outlook.com (2603:10b6:5:3b7::29)
 by PH7PR12MB7793.namprd12.prod.outlook.com (2603:10b6:510:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 21:20:19 +0000
Received: from DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::c8) by DS7PR03CA0114.outlook.office365.com
 (2603:10b6:5:3b7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Tue, 8 Nov 2022 21:20:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT108.mail.protection.outlook.com (10.13.172.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Tue, 8 Nov 2022 21:20:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 14:12:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 14:12:13 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 8 Nov 2022 14:12:13 -0600
To: <buildroot@buildroot.org>
Date: Tue, 8 Nov 2022 13:11:59 -0700
Message-ID: <20221108201159.5395-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT108:EE_|PH7PR12MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bce8258-06a1-4a41-0acd-08dac1cf09f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x2yXjoHDfWzhp6j2hj6EnETQ07jaHzNSeoTvWIKc1zwNr6VHAzunfLqBcwpIbXdiXNyvM2G0wR/AW4ImfJIfmbRBqrKufyHMOPqaATHIRFnV7NUo42ZoEwX5frc3dnT+AW1EgGUKYV/NBbQp5CVLrZUZi0GgOUCIKFhmfQw0ceLFfFs+kpJ8plguCWEHyUIy1D/klUnzpuNqa4/nkQGa/+r2xAlqJV85uTXb7BPEmbQc+veUGB9Od/U9usEqdk/6AChPd1YLF7dZlJZmP8f9GEgrdOTO6+gPnrlx8gOVi0QXrZwhh2x9p1v1Ng2OmW4YRX01vClFklk99JfWcojz2kyaR96rSfKAxsVzG4mF8TEhlQ7xF0TPBlCO5UdFEI8ltm5Y37sVTpnolnH+NE81L97RI7FNQ0Rza+x1SG6kRPTHJcZ3418X3OGvLPtZQr8NU0dC2TGFfJbr7AuW8HY80Gtw3ZNLRglmvB3rkUzgZYFBetNrCqtZCYBq9Nn/m7DRIxuS94Sh7IVFtsZbTd5AiwgmQcYSF5HmqSWYFKXdgXEIoFPtRad3wIR3sdiZnTtxb4Isl7vs/zmS869v7q944QmvB7lE/CrFAqj6IKfHVb879mG6potsTCU/hQDGxBnxAWV6+8YTIJLqkFknWThzm+sWXPf4LOeDc8eMWRlEPUhXO8yaN60kYxf3WXoil70YWfqTLaoM2K1Oksa9c5jxaFv8bptcc7AmmrNWBXTn8B6uuDtT7uc/QE3iW0bPtKkrZFw8yVSFe+XXkLbZpcN2MSgdCqX6BcXnJqAq5KrFVXO8pHOOIvfgDxxARIMhMzFa
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(356005)(81166007)(86362001)(82740400003)(83380400001)(40480700001)(40460700003)(44832011)(4744005)(2906002)(186003)(6666004)(1076003)(426003)(47076005)(336012)(36860700001)(26005)(70206006)(4326008)(8676002)(2616005)(316002)(6916009)(54906003)(70586007)(82310400005)(8936002)(478600001)(5660300002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 21:20:19.5075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bce8258-06a1-4a41-0acd-08dac1cf09f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7793
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qxZgz2hkZcKqGC+PDQb90iNLPXWrCKumxDB4Ei05aQ=;
 b=AUHLP4pLaf4fd6VZh3TAFhY5scKTdJLfJg7Uz81fDnN97l+eu+yNOH6BMR1l6QHqc/ZILtZmqzx4qEhbAN7Yb9niYFLL+jvSfbRtTUZclS4BPFd+G8KQJN0QxvjZeR2IHnzuIhBMiYZoIlDGCwVo/EpQDFGJ6AOHx6l8nhSQEnU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AUHLP4pL
Subject: [Buildroot] [PATCH v1 1/1] boot/uboot/uboot.mk: add stripped
 u-boot.elf support
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
Cc: luca.ceresoli@bootlin.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If a user requests a u-boot binary in elf format,
they may actually want the stripped u-boot.elf version.
This patch provides the stripped u-boot.elf binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0439ec5e4b..216efc5a13 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -53,7 +53,7 @@ UBOOT_BINS += u-boot.dtb
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
-UBOOT_BINS += u-boot
+UBOOT_BINS += u-boot u-boot.elf
 # To make elf usable for debuging on ARC use special target
 ifeq ($(BR2_arc),y)
 UBOOT_MAKE_TARGET += mdbtrick
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
