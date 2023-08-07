Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E263EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 07:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A12E381C44;
	Mon,  7 Aug 2023 07:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A12E381C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2QsQ76A0Gpj; Mon,  7 Aug 2023 07:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C5981BCF;
	Mon,  7 Aug 2023 07:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C5981BCF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F25F1BF357
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 07:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51021403B4
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 07:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51021403B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VFgfdP31sA3w for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 07:03:43 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 204CC40334
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 07:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 204CC40334
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeFL8K2f1cE5h+fvPtywgdAJjaRPg7zmlgi5ToByE6XUFQF20b3XsjZLIxeE1Dsly7oLdPl7bUaFFqGCdJVmEeQmSOGUwr31PIhHG8CCWmGOkZY3QGcdEVgEk3r2tsluThLGVVMj1cswoo8WETm87pFpXZJmIB7Mn74m8ZPqMcd+Iw+1sNKtOyV5vKJlE49PhYZzoCz3jE3wamldtsso3U9GApFWYB5BQ/9uORE6oP9zCZ/C++NKJmVBZ7ZDbxSbJgglGpuDhH86Tm41080JSgFExHUzlGZkFajj6bJGDl4F0IsLI3O6QtpKtDt7c/EsYFGLwwwwH6wXNQ/oNPExNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY3Thyf8ocUl4+5atwwKeV97YVkaB+QRE08jUIlOgHo=;
 b=OuHrSvMqw4O8xqBs0ThZWQAbwkZ716SN8Bz6I8xT7XSl6+O+jL0waQRKYbsMl0DE7nmrMbqpQTECf2pfKRIMBJr+7BEAXW/PgBJadndzmf7qWcSLl05/xf6sESyIwu61XL5m3uhWXMjZk8Kb20pBV73vo4kCuW4PVbK0G0OwKQoA1TG1qy57MiyX4RuHs7AnlCWQ/4ZkCx//0bQgFN2MISmUpSQ6lggMlk1wdpAXjdkf3eiVfiGmhHK4Dv1eFRxFcaeIHUxih3blu4ZG90tzBCXQrJ81CnHyzzNsc13CbkZPmCRCmIujDRCTBp11+7qVuOceyl9Z6wqPH8RdcUG6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR16CA0004.namprd16.prod.outlook.com (2603:10b6:930:10::13)
 by MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 07:03:36 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:10:cafe::7a) by CY5PR16CA0004.outlook.office365.com
 (2603:10b6:930:10::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26 via Frontend
 Transport; Mon, 7 Aug 2023 07:03:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Mon, 7 Aug 2023 07:03:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 02:03:36 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 7 Aug 2023 02:03:35 -0500
To: <buildroot@buildroot.org>
Date: Mon, 7 Aug 2023 08:03:32 +0100
Message-ID: <20230807070332.2387171-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d39d08a-3372-4417-7518-08db97146c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MAV5Ix5OidsHVZVx6QI3fJQmDjAxQXbFMowl44mnkHP+GOyjk0hzFPbE7TZ4A2erOdthFK7XrcG1v/bv2V+k6SJ37P3qOa0YkQMe2mXYOhVbXEXDu0jK4kHisNoSMiJX8mMzpfBAjE5XobwS+lmZadw27lCUkM8Vb9WRy7uanqxTzl+d829I4VP5WpKhVbN1ns9gAcvtbPWvyE2qMJgWg6lh0F6gEwN6qNn/LmRzXzQmp72ZSc6hLGLxfJZhNhKj//VgRcrIm5A44PSgoyJEdpeRccr/Fk2pRi6EoDPcMeBqPT0Q0l6s2fP1T7TbiztfnDDGHOh1wb/PviZph7e8Z/sWXWZ34C4JYprY/335F8v/Q52+GXb3cTCquDB0JgWCEfBcvMXugxPFCSbMLnwC1VrECujh/G4TnzsGM2YoOss4HM8yX/sWUA1IHKgy7gEOFlRaFWj61bTa2TSy80nr+tB9eVyamJgHa8H4BmZvxt51AJn7/zbQjoMugSBmxyQbdkfGcFl0uyN+WdOrrykXRNFq1Qmbg9bpt3so3KQcTutk4GGc5xDTakxG5bFyv3979i0G8P7KfSoD6IO3vmgmGSJWYWwmMJdDyQmvjoORRWJr8pQiZvVMDtjMQddwgSNxXlbqEPXKfIisJs0NHEh6mrSpVcES+KODQvtq8nycVtiTg1yHDeKJQe1RB/DsgKhNSVu6/ea9e7D7XKxcb4wV5iqnp/0SMp3Sca27ym+cfvv0mlZHnwmzHYGHjnWZwwslMSraFXYZnjN3tsnqiVeLiw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(186006)(1800799003)(82310400008)(40470700004)(36840700001)(46966006)(83380400001)(47076005)(426003)(36860700001)(2616005)(40460700003)(81166007)(40480700001)(54906003)(4326008)(6916009)(2906002)(5660300002)(4744005)(316002)(44832011)(8676002)(8936002)(336012)(70586007)(70206006)(86362001)(478600001)(82740400003)(6666004)(41300700001)(36756003)(1076003)(356005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 07:03:37.1301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d39d08a-3372-4417-7518-08db97146c22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY3Thyf8ocUl4+5atwwKeV97YVkaB+QRE08jUIlOgHo=;
 b=hIs8/6iv837DGfi1+aMC6diPL/ADsbx+++eXJLloKPcdOyWmEgCPYo6jHKwM3FwakNwEn+2kBoPVaTiV+AuFx+UMBaCdn6AefEPk8yt2q2ZDtoUAwbuobhr8JOyGRDvfQahSWgJoJEieyvLyK7/suzOAOrvnK9T5C+ECwGlVK8U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hIs8/6iv
Subject: [Buildroot] [PATCH v1 1/1] board/zynq/post-image.sh: correct
 comment text
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index 627c8ac41a..192354b5be 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# By default U-Boot loads DTB from a file named "devicetree.dtb", so
+# By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
 # devicetree listed in the config.
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
