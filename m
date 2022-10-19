Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E10C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 05:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40CE24007D;
	Wed, 19 Oct 2022 05:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40CE24007D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTMfRwzG2siH; Wed, 19 Oct 2022 05:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D61741B9E;
	Wed, 19 Oct 2022 05:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D61741B9E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 586B51BF330
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 05:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31CD141B97
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 05:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CD141B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xp1-Fkl_0CXW for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 05:18:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3361141B99
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3361141B99
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 05:18:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5e/8Ctr4V+JM0DwSsuXznHjagOQCzIA29xW7AcLmJsuz2rcn0qKRCoV0iS8IrVV3xYqEBRk/YJorYh/od5euqAgbL+pX0pIaV6zWL38vlQITFY2xouebVgaDYXREUBxHXJvdpu23eXJ2NEC/8VH88aDig3GkmwodJiUVYar7IcX8TgwjACzDGkhpt0/YRuUtY4OiQ8Y2AsrPBuMdnoy7GsZwQgbAfLhvNO0Iak9BpxCL/bP0eQ39SG0/8BHmEfWSaj10geu3t7pALdX+cqaANwJ6IdprkgUpa2vLV3O6bMOl+olfNpxgm1shGKdATrGQ6Q6Z7k9KLOhv1HGQV0C/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyKcUhYJtC0R2ciKKYInF8UYPUqn3LfFjmYkEIBJNzo=;
 b=bFawBSfG3xUTwOq4K4czJAMkZnil9QtBwSD5poC6esHuHObv9AB7PikCNDhSMvNOqeEPxW3Cx6aSYlS8H+P8/Nh0tf1v7rgPkuN6tVhWxF0374ejiRUcLjoypUQ+4xAkmUDqc3t+88r91wVmrik9VitOfcGiMTUJyj5FkWETaR8Bf8QMT6GeFQwqCYtm6E+cMftcgGwYIKssNcuM0NUiVbcw9KIog47p5EwLEdVBXJw/KClKzDf+1atqGwQ5ktDJ9JwvEihNiGddlKRlS6mnqzh3cIpkUJlP4vywyr2P9mxnXwR0dc4vrDbkRzmr8xVK+tcs6J7pAakjeEAuxSKNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0297.namprd04.prod.outlook.com (2603:10b6:303:89::32)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 05:18:46 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::70) by MW4PR04CA0297.outlook.office365.com
 (2603:10b6:303:89::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Wed, 19 Oct 2022 05:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 05:18:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 00:18:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 00:18:43 -0500
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 19 Oct 2022 00:18:43 -0500
To: <buildroot@buildroot.org>
Date: Tue, 18 Oct 2022 23:18:23 -0600
Message-ID: <20221019051823.26706-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221019051823.26706-1-neal.frager@amd.com>
References: <20221019051823.26706-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT045:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 15316a70-67e0-423d-c19b-08dab1916548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JkML352GIzGPDmqBApA64+M50ukAFWOXvwEKMo3blFEoTBobMt+sgObiC8VFY54RX6VMPfNP2qzQqI8ZnueAjLx8jmSugmNIaCV9n/MxojZaxkHy5Lj5VB5oYtn4ywTvMUlHzWGV6ThlErPyQSgt0q55fKXh0awJTBX0KzvfWEXiSiACIwS/hwcGp7iNw/NpBZd7hwNe0UUImMc4JukoU3O1NqDRhrKZvCXDtOjiaK9yyt3VNWpolSAbTPD23srcom220XGvd+5UYMi8JHGMj9hhT4toUNHme3DU1/V+FpQJ7+fgHcTa6YBwNIZWD7avhm2IUYCeEFl8IjSDsvk8bzxx0d6JTGhi4W2uZkEfkGqXedJSejW+6+rRjSbmDvzxVZGoHGfXspcEvxpKGuQTSz1F1hxENr7eaDFUWb+Ng98I3LO0ksKxPyNvdEJojPafU9dfulSnxKrrSzRiW8vwZ4r92nkmD/5qs+bkP0fVT1WsNQHxcZH5z4Ztkj52i6AzxBVpqVoJTsUWqe3ykSfUVz4/3Tlc4tnoSb76qe74GYefeIMCxEon3MbXE+LLbcJXvACjGtgMLysCeaVTGuY5rlysyT3yckLXvUdzVYvZNrEWqdio3yX7MyU8Vcd3X7REXLjtCWTG33xzHO+9lg5n5tLY7dgr5PaZJotXK5DbTrMMP/OFYj/0Vc8o1iqyVBp1tySwUGpXf9vd50wTjtgLyso4NIqVWBH7Aqs6uOo0vP31aEh6PLasRfC4sCGLA3kygyapOnqD+LjveFr9d6JRq8s8phELHc92H4dAisaM4ppDR8E7bQ3K9GclgCekvcfB4ZSdG1dr3Xoup7Fnwg3BA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(40480700001)(54906003)(316002)(478600001)(6916009)(4326008)(41300700001)(8936002)(26005)(8676002)(36756003)(2616005)(5660300002)(44832011)(70586007)(70206006)(186003)(1076003)(2906002)(83380400001)(356005)(40460700003)(86362001)(6666004)(36860700001)(336012)(47076005)(426003)(81166007)(82740400003)(82310400005)(41080700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 05:18:45.2425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15316a70-67e0-423d-c19b-08dab1916548
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyKcUhYJtC0R2ciKKYInF8UYPUqn3LfFjmYkEIBJNzo=;
 b=3WTgfYjb24keYnpMlc9l7fPvLKFZpwIFSFWxHyEi/5WqLJ8IPRfxffYuOvM4jqpYN3bHZA4H+TS9FmxjKEvlDsp6x21Ohd3vAA+cw6vGf0WjFKqwB2rNXBwIyUIJ1IffCqEqPw+lorC7nAk2WRVIpf3fbQ9pUPkgCpUSnrFBkyY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3WTgfYjb
Subject: [Buildroot] [PATCH v1 3/3] configs/zynq_zed_defconfig: bump to
 Xilinx 2022.2
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
Cc: ju.o@free.fr, Neal Frager <neal.frager@amd.com>,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zed to Xilinx release 2022.2.

Xilinx 2022.2 includes:
- U-Boot 2022.01 bug fixes
- Linux bump to Linux 5.15.36 with bug fixes

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zed_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 34e1b67184..26109b7b7d 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zed/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
