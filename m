Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD53C4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 10:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 328DD60B70;
	Thu, 22 Dec 2022 10:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 328DD60B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwcJSdUVzeLb; Thu, 22 Dec 2022 10:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5911B60B2F;
	Thu, 22 Dec 2022 10:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5911B60B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 278621BF304
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 10:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0C8D60B2F
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 10:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0C8D60B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fC1fviftHmdT for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 10:31:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F02960B21
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F02960B21
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 10:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxuBtA/lus+LFBjDe12KimGUcTQ45L+LNkOQxTTP8p4qPGYWad9s1JWxcJekJfEKDuLsdkBRF8iy9t2dfizqcdZxqgp7AgKT6EoGmg7cTpY8tXvOrcJVvzvzWdwcOQGiUaL5Qcp+P/wecYCqM0idTNBqdeoBm5DO7v24aX7+CPZx86JhQ2FiQWrW/NCmQlhPCDyi+RQE3KNEna7ERGYn9GjQ49PgA6gvagO9TjoD/jdCrfQJUIGIYJ6ATNftaL21YfmhzGfP/oVsjVT670+o/naOcTtN9yA1WjeSC0LWOebuvP3ju7xOAAiNFvbFMgq/iq1Bz1Pjekx31q43zhAYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fat5rAszVmmF+buQQlumkI6u7lBTyNgJR+dNWs15ATI=;
 b=CARX87BQGBFR/xBmVQyIQaSiICXJrFdxvYzg8wxmoGCUNtmmHhh3tcBlSXqkKnLqHWe7o+pB9kxyIZVGMyV/L9WClwzUNH16afZLk0pwZoZcbOwRMDwkZwb6IM/Q+Fr3FIJraaOcmegNHJPWFaU0f+yW4LC+aSTxWL2I6lS+8e8znkdP6GP/cJT1YrXqaP1ZNLBsC0gswgXZilFCYkoUaJ2ObD0CLgS8VU8pYYXzqnfRsExrW9WY3YuZ4za4E4cLCr8EhoyqaoiDXDRK9xmhsfraJst2l5ElRgcMF7ToebRH0Nud8oxl6aZNEJoozdAttLdu8yCH3eQ9o48C7N5/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR21CA0014.namprd21.prod.outlook.com (2603:10b6:5:174::24)
 by SA1PR12MB7197.namprd12.prod.outlook.com (2603:10b6:806:2bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 10:31:51 +0000
Received: from DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::32) by DM6PR21CA0014.outlook.office365.com
 (2603:10b6:5:174::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.10 via Frontend
 Transport; Thu, 22 Dec 2022 10:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT075.mail.protection.outlook.com (10.13.173.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.12 via Frontend Transport; Thu, 22 Dec 2022 10:31:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 22 Dec
 2022 04:31:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 22 Dec
 2022 04:31:48 -0600
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 22 Dec 2022 04:31:47 -0600
To: <buildroot@buildroot.org>
Date: Thu, 22 Dec 2022 10:31:44 +0000
Message-ID: <20221222103144.20516-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT075:EE_|SA1PR12MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2e67e3-15de-4645-2ec5-08dae407bbd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8VwXM0K3ZQcJxlf4F+NWy3ZukkE99QEsXvgOfosoo8vwRoh5Wip2tEjVwjv+ITjyKEIqkNT1TSIssInw6AGgoqixkgfH2v9punmBVNvc9eLhFDO5kII1DxN1UgjT/4y2AzPZ5snX7uDa7ziAOQXW9iu+/IRwm4EpTMsSYxEKZDhkUe0VR/nYuxxe8Iuh/H/R8Ei29QTpDEOBFPNX46bU0p35PrDS42bk90KJc5wQJ5zJwaf22FZDyc/cH0BqqODh4otv4xXUWgDtoEgCoWupqwrGfANBE9v4n0RZfUXAoMjrzPHZe2j8wQ0sN7s7sHIldeuQg9wAc/75Hz+nmVw6PEcoh5O7uDmYD/RFh1J1wss1U8ei6sEKB1moedlEoNO630QCywIZ+m9u728i5fX6LxNFK/AAoKqz5ldVDN0Kool2AQjc80aXxFy2BcXJf6ArPd+pfYJb/dKz0ra54c13KqKR9cybAzFWHxXJ6/gLwQxq65pbevzKYpMudmFc3uU451t2GmNsY8sbTXzpBkH5Ll0S+v3aogL37Ht1AgG/d9vdo79gdMQXrKqfaB6qh7zXnd00XmvTnGtBtGlyslrgbsR2jre0z+F9km5hp8ocgpJmLHr3pxFrrX87Z/xrFgoazG+PfFYukRltlHL8TShfMwo8Nda86zZdens+tiITWbaFUn1or9xY9w3Z9IotUkO2eFLjFQnvew8fZdMmEGjOxKdXu+5oC1k8+aqlsgHs8f6cBvghSOSP6vH4AWxrmp8nsKBmf9pUmgX1so9Jyb7hg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(82740400003)(26005)(40460700003)(186003)(2616005)(1076003)(47076005)(426003)(478600001)(36860700001)(966005)(336012)(6666004)(36756003)(83380400001)(2906002)(8936002)(40480700001)(41300700001)(19627235002)(316002)(5660300002)(54906003)(70586007)(356005)(4326008)(81166007)(86362001)(70206006)(8676002)(44832011)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 10:31:49.3041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2e67e3-15de-4645-2ec5-08dae407bbd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7197
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fat5rAszVmmF+buQQlumkI6u7lBTyNgJR+dNWs15ATI=;
 b=GVQl7h7Rd8QkqOldgN1F9Gl/ilkdhb0nuvqaO+LFCi4Z0IrPGyIoFyxaBldnij44BNl/mjkogfZVfZ3RfjBjZwkRfzV8KiJ7pq12/vUwNMaSh6kIw4diCBIVbaTPjTJ83QQi9V5FgecD0mSolc99z4BhBPlFSclndGtuTGfSS/g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GVQl7h7R
Subject: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig: fix
 linux dts name
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

The Linux DTS name has changed for the zynqmp_kria_kv260 with Xilinx 2022.2.
smk-k26-revA-sck-kv-g-revB has become zynqmp-smk-k26-revA-sck-kv-g-revB.

This DTS corresponds to generating the zynqmp-smk-k26-revA.dtb for the k26 som
and applying the zynqmp-sck-kv-g-revB.dtbo for the kv260 carrier board.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506541

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - Improved commit message
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 5c53122b46..40e422a0e4 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/smk-k26-revA-sck-kv-g-revB"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
