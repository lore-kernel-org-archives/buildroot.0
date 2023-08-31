Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD6FC83F12
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 14:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31F9F418A2;
	Thu, 31 Aug 2023 14:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31F9F418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58s6_gEQwJ-A; Thu, 31 Aug 2023 14:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FE8C4189E;
	Thu, 31 Aug 2023 14:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FE8C4189E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DECAD1BF990
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B79B060B1D
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B79B060B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NftLnkUkHpv7 for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 14:52:09 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::616])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8FBD60B06
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 14:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8FBD60B06
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3s1w8ID97VrDPNmQE8HIx7WLcRAClB/Kd8HhnUgIOBtTV4z1ZIcmyGy8NSTjZutET5OZzCtn0xMLEjE+wWl8uIGVrXYg+Yh9P99ZERVfrjYhFlcPpW0v2yo/JEMMcDHzZa3bP/PFYu68RIU6HcnVNZ71v3d/vuCvvk1gkqOIfvHJf8Tk5epoEENX+SCbU/12Mv78ANKOAM0gEhdcrzXhNJzSFw69GY5mv0vJE0ml6YsnzpygzSFDCsWe+x4Ez8QjibSdl2PX/9VfCv9x0GScSVl6HjNqIz29YTRgw8+5ngTe2xuivB0SvXL78F2CB2bMn3SeIFZnyLZRCUE5M1TLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ka7bJF2mfM15tR9uTp+ADSmTwtWtTAuLTMIojht+pPY=;
 b=oVqzJr9JFYsNkibmQmOFImdc4t49hzYxrjbyZDDDBIIT5HF1UF7uhLOxqSt1Fm5sAimtih/+/LHGRWdaX7qbzxuIUq85YOWGG0iMEpVMtcufeQeeXzDotks1WMFkB3xjuJI+iFmJhFxQ+Mo14ZyDTQabcOi/Km4NSaVsVfUKXV5tQOEBd5FMkiV9+MgJXCNLlFALDrk8ead7pqympfJM/HdSr/5HVbh44lFLDeviUZivdzWJ6k9DqL04rP0xJDla8QLvwSQR9ylXFkwQ4acJwvVUr0Dlq3nZWVOTe6yWbVB4tZzTz517eAao1iiue8CktR6EhbESnRPkYBr96bEWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CH2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:610:5a::36)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Thu, 31 Aug
 2023 14:52:05 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::3d) by CH2PR08CA0026.outlook.office365.com
 (2603:10b6:610:5a::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Thu, 31 Aug 2023 14:52:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.20 via Frontend Transport; Thu, 31 Aug 2023 14:52:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 09:52:02 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 09:52:01 -0500
To: <buildroot@buildroot.org>
Date: Thu, 31 Aug 2023 15:51:38 +0100
Message-ID: <20230831145140.2537382-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831145140.2537382-1-neal.frager@amd.com>
References: <20230831145140.2537382-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 871465e2-08e9-44df-2179-08dbaa31d7d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IwbL+Dubdcqp8hJOB8CZYYkqAJyGO6/t9+pD1xYet7cK5kwn6/0YS9aoHFZHf6fULVxXufHbEDYwdoM0UfG+QwcbAoRoBs/rHA+dTVPEu8KlG7M0wYQ0/Fm/52yAVe7u+DHSq2XflF1KGrH/AG36MLIr10LOHW9D6CENiNPyMn8Gq0f4zjmYXptdBPJy0hmFy3PtAnz1n02Oq8HLp6nYpJbopU1CJh1tf8B66a+I0skbJCF9XZ4mUsXreWLuQQ+0ylQbMAgJKWTwHtMuJI6wgmT5WAkDBznjRn2UC1uxdv75JM7YdaFtsTWrlpoKKatI2EO/fVtm4OQlTlaR7gAkGnO1kh91hICfWnQtzlz+fF+GzjtNF5aC5wShEdpful2m1BHxj/Q5kN4NoUUNhcD48ddF/jWjFj5LvZNf22BwafL8HsLEP4LFEgnvMJkK1HqYIIboTFUF06Lw00jmqgqYE9g11ZHcDZ79O8EMuWK3/+MzVkp6cohc12htf+J2WNPSik0+c8o5hJNexD9ln1HixKP9VJ5Iy4u4EYvJP5ACVhxL1/PFvy2HLpM0WFhJ/PBIulZJ97bXGQK/T4Sc+P0HNc4yluleKS9L2dpJOyQsrhla3s5WqwJcBUixYCMqpZ0nJag1+Gv0Ma0DAhx3eU5eILZwwe4GVAQFPvHathsxC5CSOPzvjw1McvVhv4Eax0u5UvEl9DYlT4mNDPR9oL93XGRhg9kqwFznnSYjLAyZKtdXfAAnW7PsGHBhozTf4VnFERCBd2XABScTSKHKFYVvFA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(40480700001)(82740400003)(36756003)(41300700001)(336012)(426003)(1076003)(26005)(40460700003)(356005)(70586007)(70206006)(54906003)(81166007)(316002)(6916009)(478600001)(6666004)(2906002)(5660300002)(86362001)(44832011)(8936002)(2616005)(8676002)(36860700001)(4326008)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 14:52:05.3267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 871465e2-08e9-44df-2179-08dbaa31d7d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ka7bJF2mfM15tR9uTp+ADSmTwtWtTAuLTMIojht+pPY=;
 b=l1UvdoBHN2jRmrjiaH4hCKcOxvH89e3VdNvPsVY4cpzj+qwQhZTmbzckDguTV41C7cZKpm3/1dW0LHBDsKGsgA7LQSiAb/qpM5O+8UU67DiC9utc/i9Y1zTOGF+FypZ4he+OjeqD9nHGkBZZhgvmkwY9hR8D6OYnqnWXyducbqM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=l1UvdoBH
Subject: [Buildroot] [PATCH v2 4/6] package/toolchain-bare-metal: new package
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: multipart/mixed; boundary="===============0424268997530811330=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0424268997530811330==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

This patch adds a new virtual package for adding a bare-metal toolchain to
buildroot.  By default, this package will configure a bare-metal toolchain
for the Xilinx microblaze little endian architecture.  When configured for
the Xilinx microblaze architecture, this toolchain can be used to build the
microblaze firmware applications for zynqmp and versal.

Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - adds select option to bring in all packages needed for toolchain-bare-metal
---
 DEVELOPERS                                    |  2 ++
 package/Config.in.host                        |  1 +
 package/toolchain-bare-metal/Config.in.host   | 21 +++++++++++++++++++
 .../toolchain-bare-metal.mk                   |  7 +++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/toolchain-bare-metal/Config.in.host
 create mode 100644 package/toolchain-bare-metal/toolchain-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 49980fe443..8ddb629f05 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1330,6 +1330,7 @@ N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
+F:	package/toolchain-bare-metal/
 
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
@@ -2199,6 +2200,7 @@ F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
+F:	package/toolchain-bare-metal/
 F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
diff --git a/package/Config.in.host b/package/Config.in.host
index aa1f15e3ac..103d461a7f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -106,6 +106,7 @@ menu "Host utilities"
 	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
+	source "package/toolchain-bare-metal/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
diff --git a/package/toolchain-bare-metal/Config.in.host b/package/toolchain-bare-metal/Config.in.host
new file mode 100644
index 0000000000..629b58d9c5
--- /dev/null
+++ b/package/toolchain-bare-metal/Config.in.host
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+	bool "host toolchain-bare-metal"
+	select BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
+	select BR2_PACKAGE_HOST_GCC_BARE_METAL
+	select BR2_PACKAGE_HOST_NEWLIB_BARE_METAL
+	help
+	  toolchain-bare-metal is a host utility for a bare-metal toolchain
+
+if BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+
+config BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_ARCH
+	string
+	default "microblazeel-xilinx"
+	help
+	  select architecture for bare-metal toolchain
+
+source "package/binutils-bare-metal/Config.in.host"
+source "package/gcc-bare-metal/Config.in.host"
+source "package/newlib-bare-metal/Config.in.host"
+
+endif #BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
diff --git a/package/toolchain-bare-metal/toolchain-bare-metal.mk b/package/toolchain-bare-metal/toolchain-bare-metal.mk
new file mode 100644
index 0000000000..407ad4ea33
--- /dev/null
+++ b/package/toolchain-bare-metal/toolchain-bare-metal.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# toolchain-bare-metal
+#
+################################################################################
+
+(eval $(host-virtual-package))
-- 
2.25.1


--===============0424268997530811330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0424268997530811330==--
