Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA250C4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 11:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C9560C19;
	Thu, 15 Dec 2022 11:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C9560C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8Gfh0nctz6r; Thu, 15 Dec 2022 11:17:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87DB660BFF;
	Thu, 15 Dec 2022 11:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87DB660BFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 014811BF308
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 11:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D075360BFF
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 11:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D075360BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jR_JxVXtHpYX for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 11:17:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B64EE60A98
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B64EE60A98
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 11:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+x7EC1OTlvKo1XNaFMWgYs/Lc3GeYm7PzVn1iXn+7l85qsuLJrNV6d9hI5JNpOqLoQs6SrX1fsHaLSPozxD0f7pCagnADUkrUE0LX1JgyzxNJ1DTBdugg0Alj/47LClLPppaPXl6FX5ChequtBVJLiIFNEbxes89V2MPuu/F1m9KNQkTX1B1QA7TxezMMDIXsBHT60uzFWu60AZQPa4gqjE7109seks2iUQpxrS9a96FWPiu4O3Bi0Ac+ZDGDay/2DHi4T53zhO+iDo+uNRKpPinho9Gi9RN8sk6O3VLjKUIvaShVd+sY+xFcBvyRLz2O8tp/qehJR7u552P+rKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOfVXv5m5sp7S7CM0tEdGRax/O1PtvMmk95wJv5GBxY=;
 b=WjsXLspxPqzsFCtOxzCl3uJdQT1q8I/yjeHGgaEayVjQ4qnlJVypSDMcuK0bbzXZ1TFLKidth9OfM/Oyk1OSGYXbeuUR+Kezrk5nwJzBsFic9GrbyelRJ0DBfcwro2r4ovBi2Pu4N6rvd6rk6mSx888rj2waJKqU6ueXqmDH7MbS5t8eceySB92PEXyh+27h9wFe8fbznb6/vS682xgpaegspK70RY0ercpcJZzxYC5T1+WPuK7kzrgRuq1JJsI72cvn+YKZlFKKb0wfY1UoSNBdsTfkrFLpXiGvOJrkX6q6Ke2PobPhBxBEBPPo6J23qOItiTpua8g9gP0fOkqbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0026.namprd03.prod.outlook.com (2603:10b6:5:3b8::31)
 by MW3PR12MB4443.namprd12.prod.outlook.com (2603:10b6:303:2d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 11:17:13 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::aa) by DS7PR03CA0026.outlook.office365.com
 (2603:10b6:5:3b8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 11:17:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 11:17:11 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 05:17:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 03:16:57 -0800
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 15 Dec 2022 05:16:56 -0600
To: <buildroot@buildroot.org>
Date: Thu, 15 Dec 2022 11:16:54 +0000
Message-ID: <20221215111654.8619-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT016:EE_|MW3PR12MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f150c8c-b0fd-4aea-c8b8-08dade8de9c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNZHblPTqHmzsWiF7oxziUdqgHqny9GCrJ+Zh6pOyrYwJer3IOtZzzPzOIclCHFilfVV4PlFa37valnb5fWYI3b1C5Lt9fAHD2d/zOFg4Ls+hq9CbiYbJ/yV83ThiH3Lyhv8GOOqv7TaVMQEX48Ybhxa0r1vpMw5Ml1KW9IpAnZ+Un/XyJ+H5NnMpHTAA2wgP6uKZnexeHZE8aw5o/t63WfGVhSxoH2yg26ZW9rldjxIqgHqqvoRAmWyzXzmjqjqNrLS8Zy1gqB4gLZ/XUc0J1YjSfzwEPLvxemx+evoDUoiycPSexvkVp5ZU6uXQm+kmjlKnvLzfIfLbGSEebLJ0Jd2S1JBV74IHp8CIaXJOWt5AkofvbUcdtr/2iDnfO+NOOPrU2DjoZ/QX8MpzZtWYZB8hugndihpFDbwtY+ZUhJrT/6dAY/IoRimg4eSw+TYEyLO0ZXaC95dqyhR7zBG1M9tsIpcy+c3lCPif7eh74mbNF7lQVKkdbRB6980lfx/FEaD+xK4EFturLZ9GIlwQc8/l9ft2LTu7xJynSl9lmv88VlmKxIi6juHFPooyZulSYkwrc9JD4/EPvHGKBx+z2KQVd8aCocDdZ2wdlnONcXFmlfrxkWEYQ8Dgi4EgRAE7zv6yFWh4qUffoKIDt3idV52rgsf7+ccQ5XKzKRkq/o8h0/KpAKK9y0k6WzKsX/fN+aqb3JQAB+AfVLCe5VAMlt8k7AR1l7SYmFd4ik3TgE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(426003)(8936002)(86362001)(36860700001)(478600001)(336012)(41300700001)(82740400003)(5660300002)(356005)(4744005)(83380400001)(81166007)(186003)(82310400005)(70586007)(26005)(2616005)(8676002)(316002)(40480700001)(6916009)(54906003)(4326008)(36756003)(2906002)(1076003)(70206006)(44832011)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 11:17:11.9177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f150c8c-b0fd-4aea-c8b8-08dade8de9c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4443
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOfVXv5m5sp7S7CM0tEdGRax/O1PtvMmk95wJv5GBxY=;
 b=Mas1y3wDykJhhgDdJ8+Z2t//DAU9sOUHzSar2zF1P8W+YW/n9Sa1MlN4ImxgDYNy2dljKMC+BzWmYOGKzofwtZJa+rme5JSNjyt+iSP0yTJ8s0AmiYvjiC52xr3Euw4lbtdEaq24FDkEZaw9/lto8tUcx3tP0fUjNLPQMjHbEe0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Mas1y3wD
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/uboot.fragment: remove
 unnecessary configs
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reduce the configs in the kria/uboot.fragment to only what is necessary.

This patch has been build and run tested on a kria kv260 starter kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - CONFIG_DTB_RESELECT is no longer removed
---
 board/zynqmp/kria/uboot.fragment | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
index 9e32edfb36..a6a262a562 100644
--- a/board/zynqmp/kria/uboot.fragment
+++ b/board/zynqmp/kria/uboot.fragment
@@ -6,9 +6,5 @@ CONFIG_PHY=y
 CONFIG_PHY_XILINX_ZYNQMP=y
 CONFIG_PINCTRL=y
 CONFIG_PINCONF=y
-CONFIG_POWER_DOMAIN=y
-CONFIG_ZYNQMP_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
-CONFIG_RESET_ZYNQMP=y
 CONFIG_VIDEO_ZYNQMP_DPSUB=y
 CONFIG_SF_DEFAULT_SPEED=40000000
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
