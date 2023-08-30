Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C1BC83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 17:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1989080F01;
	Wed, 30 Aug 2023 17:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1989080F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdr6TxeLWUrV; Wed, 30 Aug 2023 17:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EEE8813A0;
	Wed, 30 Aug 2023 17:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EEE8813A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3C311BF426
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 17:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBDE240636
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 17:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBDE240636
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhUpFpTP4dHl for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 17:33:11 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::609])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F5844039D
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 17:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F5844039D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9Sj9f4I8CeSnnAfasi3OsPvsck5HjKUJRmntp41H6sNJbeiaSasu4BtXscxrCMKCWSeypQG2W0vR0VQUzhdg0pPbdFmDzbSqi8PdkAv1unVTI1a07dwfCUH/KMXAL1bINSpmSzEH1cFRI+NX4fa1rJdxdySpI4XtHXsGdMtqW25LrAPnbfwu9lhPyEPPjSF5cRadFvbzgoEerteRLReNh+kohbPWYp2QTeyFBl9gWv6fTG6n72HXpkCS6mdzYrb3U31sz03xaPOsGGx39BxFt3/QxyJZgDXnZudu5gV8wNHGGmC4FZuiensnvVQ3aXuMS2AlA2l5Go70nr1EUvXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1y+V2HxHxNyghSLwa0/OWOgByhPfPPyZxTzPDVROF40=;
 b=JAgjSsX38iBX5+2Z27XHKddbP2Zmp9+2S+WsbcNCABis3LGrUQtkn9KfVJl5f8jRlAPze8CKQZiA/p0uMk7iBpJHvm23/TlzAwFoTctDo+hOEo3YBTu+TeYJL5vE6ieqkH9KjybnFGhTzHbW00blUCJYYN5eKaX9vwtCQoT54ZLg+vz7DYCD2RhlJ3Pz0X69ApK2U8l5zmw3ETklDS+E8GESi+QkdsjF15PhdPmpnKruTrDIwYoNzMt+Ui1hn3+kHiWyNY31luWYo3Fv//R4iQwVqDgWlVWMse+KfbWhEJQoXXngJXV3CLhqejeC43Vs7imK6OzMQvaE4kqLMOclaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SJ0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:33b::32)
 by SJ1PR12MB6145.namprd12.prod.outlook.com (2603:10b6:a03:45c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 17:33:08 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::59) by SJ0PR05CA0027.outlook.office365.com
 (2603:10b6:a03:33b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.17 via Frontend
 Transport; Wed, 30 Aug 2023 17:33:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Wed, 30 Aug 2023 17:33:08 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 30 Aug
 2023 12:33:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 30 Aug
 2023 10:33:07 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 30 Aug 2023 12:33:06 -0500
To: <buildroot@buildroot.org>
Date: Wed, 30 Aug 2023 18:32:55 +0100
Message-ID: <20230830173255.1620616-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230830173255.1620616-1-neal.frager@amd.com>
References: <20230830173255.1620616-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SJ1PR12MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d975f28-472a-4479-c2e4-08dba97f2ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4VbDYKZA0VpnLG6lXF+rvZlIUku8huqcPZy6+gkriiqYHeH/P+5sPtjUOcycVU44bILxr7Uu1lLB7J0BldJxqo4vwfinr959r3sS3IsXro4yMmOl3tGktpCLPCphANUIFl2qIQkvaOelF1f0UX2SgbPJv7UVq23GkJq9qsBKC11zk/aD4p+5SsyrtSTtd5QxINHtlRQsW9lLUOLJV9meC+ExXjBlGsfWFsgXIvuoiCY/rhtyV2hhkRR3LfELXxI12DUPw9hLIMbLKgs2il3Noo/x2Iatd2MSoOfT48q8TXvLVnRVL387RVLlvDcFW5FDBNO4H+JtGZDDjua5jzcuX3VBqO0XOpRvhjKAD9qhNOOyRc4l5HI3sIriBIsI1Iqhfg3cOoZTR7FvnvWHSLkAcW2gpZL1yDXCHFod38tRY2cKtuI3hfiknHsXpH28Nux23pYCRlzW7WMh+SSEdPJfBbx6PFRPhDVDt4r+bq8FeSOs3n7oj3aMEudpXveWzAAk41KyxaP4tPIasetWLP7Hszvvm0Vj0/JYdjeZgyChqPQmkfWm7zXkUZicVdVwQ9MayS5k9jwX53PxxBqYapQ1+8LLfQeDwAlq8JbXVg/sSVDvtUFBkswukK9LyW9/pN/z5y5kGCfZVZ0Acuj9raSRwQ1k8Bw13EjB4y7rArhBsuvsPjOaWymY00S9peYDgXZOK3qA+PVfEtm49vazR7M9FPf7sZeUla7I6gQ+RnW5OBHSHFBMf0hJNpNloMLC15TZDE+8yKrlSKEAmlHPW+6toA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199024)(186009)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(70206006)(2906002)(36756003)(5660300002)(40460700003)(86362001)(44832011)(82740400003)(356005)(81166007)(40480700001)(8676002)(4326008)(36860700001)(47076005)(41300700001)(83380400001)(8936002)(336012)(426003)(1076003)(2616005)(316002)(26005)(6916009)(54906003)(6666004)(478600001)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:33:08.0690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d975f28-472a-4479-c2e4-08dba97f2ce5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6145
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1y+V2HxHxNyghSLwa0/OWOgByhPfPPyZxTzPDVROF40=;
 b=CvhEDRnRJTImtf87V7uTGssrQJ4M+8ZEJbYEo3AkLQjXgkrOv3oel4hLJ7ZU1/wVdQODcuwG5AfhL7UXWQIL1TAu1U5Bzid9MD9NksMvy01SGC43pg80sLzjonogAhRg0cOx7o3DqGoFqnXnnEgD5efaNgotorkB5wGwWtfnGNY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CvhEDRnR
Subject: [Buildroot] [PATCH v1 4/4] package/toolchain-bare-metal: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new virtual package for adding a bare-metal toolchain to
buildroot.  By default, this package will configure a bare-metal toolchain
for the Xilinx microblaze little endian architecture.  When configured for
the Xilinx microblaze architecture, this toolchain can be used to build the
microblaze firmware applications for zynqmp and versal.

Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                         |  2 ++
 package/Config.in.host                             |  1 +
 package/toolchain-bare-metal/Config.in.host        | 14 ++++++++++++++
 .../toolchain-bare-metal/toolchain-bare-metal.mk   |  7 +++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/toolchain-bare-metal/Config.in.host
 create mode 100644 package/toolchain-bare-metal/toolchain-bare-metal.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 85237c353a..b4566d0ea1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1327,6 +1327,7 @@ N:	Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
 F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
+F:	package/toolchain-bare-metal/
 
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
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
index 0000000000..2f047858c4
--- /dev/null
+++ b/package/toolchain-bare-metal/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+	bool "host toolchain-bare-metal"
+	help
+	  toolchain-bare-metal is a host utility for a bare-metal toolchain
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
