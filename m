Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F3EC433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 02:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6191D41268;
	Fri,  1 Apr 2022 02:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKo1TY9JpOtk; Fri,  1 Apr 2022 02:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FBFE4029B;
	Fri,  1 Apr 2022 02:56:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 695D91BF30F
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 02:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 569AE6F637
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 02:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7rf2axujLOk for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 02:56:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12rlnn20051.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F01A56F614
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 02:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MavtMfwez69as4MsW/EgLd9T6Uk1s+ALnWERqnR6bo9sVuN0I5gvmSgr6nDJ/+laVW7Bl6TkWPqxFj9rD3VHn/9u2GDLHHuUktVe1GSAT4G2ev6UtqKrSyOj6Zk1eExVU+6l4AdwSSBhHAvYrd8bJTTn4rkmUdt6KZvOswqNaM/lNDOIYZVRp4uxJ+3Iu3vStchbiw1JNQeP/Omu0qD2TYmfx8TGcl5RbxyV7QISmQ0xJ2tcg7IdTbYbnH/wP37djWX4XW8GLnHN4eIkZ/iiw+/QEEJJ2NhIAxwRkzfS+6wUv4Vh6WojCsBD3Z/Hid1aB1AvjRm3wxdNfDRvG9r5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OOwR1iiQKzDIAQddI6ApRqAtcHxUBShv2EPlU1pLTg=;
 b=DGa/lN2mx2+ilhnXuh+6pyvkWxCpo/yUq6gzYYp5TVTfyCXWQTYIuPDPNqLm6dZ5DxqN9m9rsy/uVy3Ag1fNG5dRLPh6k+0zUS10F0ptAWzmmR1IXrz+zqvMSY0Qvv5p5EosLzHY63W01eeGqadMTEowxYg1DzhAG4cwpwb31wiyPgFcAFqe32XQN8z33TfDiIxKddfa9MiWS6nzu/PAI5kPkyheZO8dUGblBFc30Gfu7tXy2k9Fh0MwSe21I3HWPDCfu6t4qC5RqjPjQwNwfO1aBKmz92qsXq3jGSUcTuAkG0GbtClbwif5JWlb8xaVHa9qmlbdNr2WxYMSHxWwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OOwR1iiQKzDIAQddI6ApRqAtcHxUBShv2EPlU1pLTg=;
 b=XL2ljoSg9mVKnxerJhEOeYGInRl4WxZhOWDwOcguaEyI0khnrjEOyr9VVKOWa8XxUrU9rurP1kP6IzXmNBe/FAllfHU1MU3vGjr9YrcymiuO9q7cdDQGIIpsTGxe9KPgyhq0LFrsK8fzTJhscgVm3xnmT98XyjuZC40iNQWjTV8=
Received: from BN6PR16CA0010.namprd16.prod.outlook.com (2603:10b6:404:f5::20)
 by BYAPR02MB5448.namprd02.prod.outlook.com (2603:10b6:a03:9b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.17; Thu, 31 Mar
 2022 19:21:00 +0000
Received: from BN1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::2b) by BN6PR16CA0010.outlook.office365.com
 (2603:10b6:404:f5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23 via Frontend
 Transport; Thu, 31 Mar 2022 19:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT047.mail.protection.outlook.com (10.13.3.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 19:20:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 31 Mar 2022 12:20:50 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 31 Mar 2022 12:20:50 -0700
Envelope-to: buildroot@buildroot.org,
 ju.o@free.fr,
 neal.frager@amd.com
Received: from [172.25.185.186] (port=35128 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1na0Lh-0003Gu-Up; Thu, 31 Mar 2022 12:20:50 -0700
To: <buildroot@buildroot.org>
Date: Thu, 31 Mar 2022 13:20:30 -0600
Message-ID: <20220331192030.3871720-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 484771b9-69f0-4dd0-2332-08da134b96c7
X-MS-TrafficTypeDiagnostic: BYAPR02MB5448:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB5448721E36B8559F76E9A7C7F0E19@BYAPR02MB5448.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9xNB300IiBWBMiNL6wVxoZuA9agyVyAR/iokvayieD5x55AjFdPOK01J7P4JfaFCtCpe91EczVVNi0ZcwQKsS8/qfzQd+VA1D6Co1dTGKPvw8+4f2T/921NITkLMUZo7/YamxOZpudTjBDocSFtlIXezDSBoVnk/RltkxpqpFQxP6atEZX62LVy5uIYlt448DM02Z957HrrjnYDb6cjafzarYzYd69RDMc+jOphuu1IEsn111FkuCJ5qz3FnMhEU+ahf6INkWABisUVjrWgD0m9KXNtAUVMXVjhauOjUvQfB29Dw9sVHKqw57wA9Io0HYBbr8LmXoEgz3lCd2TV87yOE+DwHzGrp00SHZJyYVQfpzZNZJOryOIiITIZ2jPiz+YmPKgqNp9k2bRd0QmT9rhMACqp8CTaSwDJUa1K+RgiK8hqPNztP2M9nfs4hEyGFWI9ZyoTYPAwDso9R9C6TFGuyuLENyd4cw8T6FkkRyfDn65rAryc9/jyoCXT6pt8nySQiP3qc0flQ5K6HhaZKXXTn75BdK5CzLopgiJGJvKuRDX8CD4BKrpeksjg19+k6ixKwP6GOmpsI6E7Oj+aABNtkjpCFN+TN//287kgZZ+qskdfw6LeemJtH6uV63R+Lz9nWLxamDm+wJViHwsu3a/swMPA8ILH1lIdtW+N9xqJBwA+Rr6s6pZ6kZGvwhBtp0gistgA1m0N/o7+qOaCinYQgHJPOUihQ2QkLAr/6cRaVkwQxmAMA6dP7Cn0Zkdn
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(86362001)(356005)(44832011)(7636003)(9786002)(8936002)(26005)(336012)(40460700003)(5660300002)(508600001)(36756003)(6916009)(54906003)(2616005)(2906002)(70206006)(316002)(1076003)(82310400004)(70586007)(4326008)(8676002)(6666004)(83380400001)(35950700001)(47076005)(102446001)(41080700001);
 DIR:OUT; SFP:1022; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 19:20:59.6329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 484771b9-69f0-4dd0-2332-08da134b96c7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5448
Subject: [Buildroot] [PATCH v1 1/1] configs/zynq_qmtech_defconfig: move
 post-image.sh to board/qmtech/zynq
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
Cc: Julien Olivain <ju.o@free.fr>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch creates a post-image.sh in the board/qmtech/zynq
directory, so that the zynq_qmtech_defconfig can be updated
independently from the other zynq defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/qmtech/zynq/genimage.cfg  | 27 +++++++++++++++++++++++++++
 board/qmtech/zynq/post-image.sh | 13 +++++++++++++
 configs/zynq_qmtech_defconfig   |  2 +-
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 board/qmtech/zynq/genimage.cfg
 create mode 100755 board/qmtech/zynq/post-image.sh

diff --git a/board/qmtech/zynq/genimage.cfg b/board/qmtech/zynq/genimage.cfg
new file mode 100644
index 0000000000..67baca795e
--- /dev/null
+++ b/board/qmtech/zynq/genimage.cfg
@@ -0,0 +1,27 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"boot.bin",
+			"u-boot.img",
+			"devicetree.dtb",
+			"uImage"
+		}
+
+		file uramdisk.image.gz {
+			image = "rootfs.cpio.uboot"
+		}
+	}
+
+	size = 32M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+}
diff --git a/board/qmtech/zynq/post-image.sh b/board/qmtech/zynq/post-image.sh
new file mode 100755
index 0000000000..54c5493b4e
--- /dev/null
+++ b/board/qmtech/zynq/post-image.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+# By default U-Boot loads DTB from a file named "devicetree.dtb", so
+# let's use a symlink with that name that points to the *first*
+# devicetree listed in the config.
+
+FIRST_DT=$(sed -n \
+           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
+           ${BR2_CONFIG})
+
+[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb
+
+support/scripts/genimage.sh -c board/qmtech/zynq/genimage.cfg
diff --git a/configs/zynq_qmtech_defconfig b/configs/zynq_qmtech_defconfig
index 4db3f68b1f..dc3b22c876 100644
--- a/configs/zynq_qmtech_defconfig
+++ b/configs/zynq_qmtech_defconfig
@@ -5,7 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qmtech/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2019.2.01)/linux-xilinx-v2019.2.01.tar.gz"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
