Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A5DC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 08:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0881B60740;
	Tue,  1 Sep 2026 08:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCjmtI3hcEC2; Tue,  1 Sep 2026 08:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788252301;
	bh=lnvZgj6tLZgafzn4YTgdxq/lh1r+1d7L3IOq7AoWSZc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Pt8+9RmzbG860vqIyWQ/yTft2qEJbKbiZ9pdsuzp9AlwIEv57WoKq96xmRcIEkeY7
	 bRuosjcjcW5TqG2nPVA4eRdwSzNES2oeNGU8GVmO2OxK4Lxl/wrBfTU2MVbpx29mrw
	 zl2M7U2MHLec+Qmjp5sgJaiZVorlNgGW80z0OPBcDI3XOBkEaxQXMakL/7UR/KuKg+
	 qTXT+LwfCh7EdkJoa6ICmVC89bEMFyrnGDdZzw3DffIGckB5O6UoBs9U/CTLyzTxIY
	 eopdyKtpoJQSHKOxXkDhfocfUluaAScw4YmN490p+7bxz0cF14tiFGgQGRWBcRAQZM
	 Hv+EGzDyGwa8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C4736072A;
	Tue,  1 Sep 2026 08:45:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49209363
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 311A36072A
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXoKn9nOXqk3 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 08:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::1;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72ED1606E5
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 08:44:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTYSzi7PNw9n+ohSBrYXSWjFL9MfEY+vRXhZwv4+9nYhh/Fuv5xwtFTu8Dj0Nhl4ySks05jihdsGBcwc1w2gksVSZ7gLUhGssG2forHiUtESYBOaPLYnvMGQFqaH/diVVoN3Pbeq8LDTf6uOV+cciwQt5jy4otTKLCGLg0szHXbJ3DRgzvUYsxgG42NzAluTfIqrfFyfqZ360Yk93BOCdRtfAetifa8lXjzrupJhYKHHy8swEHJ0mrDHxEFgJVd0ho0InpRXx9UWLR7nBPtWC212D5LQUtSRIm+5mJFGphfyfCYh2G6rnYj4YC2cFREk2skj4nIS+S82h+hdcMho/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmZVDEgr5zD8JC1omtHE+1SwvOFmOxHXuSDcAOeUqh0=;
 b=JkG/gicrlJmPdP5Em9uXIprFCGW+GOahqtyxvL7loAqwaKlCpuk2DKpQ0Gz60EiNoOtd47om6+NIovJV7VODdSUebMNIoBhjs2V3juxdou4MgLyhqVZ12c62tYaEuBHJs7rLOKT13VF+9dacgzYFKsJ+2Awt9qd1iWaaOEDbyccDDQGwAAkOWHHzFr7pHF7QiF9ha2Yj2qs2easOjaktNPAEQguZgqYec/VIpBgYNYMdoq61GFPO+8qR1TkocA89wjgt9AnKema0Dtqn1iv89nHc6uwAkXsEHMLcB8aQYdFLT1aYhnAOuyuyYbEk4LV2cNMoj50QTgBNZ0f9eyPDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR13CA0062.namprd13.prod.outlook.com (2603:10b6:a03:2c4::7)
 by DS0PR12MB8366.namprd12.prod.outlook.com (2603:10b6:8:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 08:44:50 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::b7) by SJ0PR13CA0062.outlook.office365.com
 (2603:10b6:a03:2c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 08:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 08:44:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 03:44:48 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 1 Sep 2026 03:44:47 -0500
To: <buildroot@buildroot.org>
Date: Tue, 1 Sep 2026 09:44:38 +0100
Message-ID: <20260901084443.584247-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|DS0PR12MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 821b257e-81e5-4cb7-4d86-08df08054885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|10067099003|11063799006|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: i8e6/IFjtsC+5Nx8KLNPd1QcmpfP3j8s5qbrey66br5oJyXgGLo98NcpNDgFWriHDAt5USCmoikvMnpv+Zny6JPJbbD9c3yTtSSOexkRIN9rgfFEHZFNQh3I+1g2SooSIwl891KxHp8OIboqlMJJcbimOdkTPceOLch9aVj4hfPEzlA3UwAqIxnF9Srl5D5xvSNnHi/wNO5a4fEwApscf62YkGDukcAmBUGKZerAabwe5bxHCPTKPbrX0QnGjIJt++O9QJciRzAiPimJgTtgbN9ZAGj1UOZu9hvI+3Uuw8QSfVII+bkObN9i9gp/iRFwEa3mQh2CqCkvmSZoLQQfpbYJ1F7itYpiMxh/pSPN2Ws3B1pF8pmjy6X8zwXa1DzXXN1hPKG6UwcqEfpfpWhLmk6npJTH0cv5Gt4Xg1M4O/VjtX1VICyCPKeDMGunituU2MRvzRiMQyyDCnbqW/0T7F8uEwfhJ+4ZPxoh6eGP7cuqhBTfuP5qW1v3yzoGCxQdfuB/gSMcLcICh7LE+cwmnZobcVbCnZ3JkdpQAKCXE6DVBj6oKZ4j/8uKZpEo0GLRRjcOucOt41qlSWjB1MgP4HwMudrB+kQ2wY0OLtqT2jGgyLOoY9XMJ6GfpSj/GK8j5sJQgQqWhRiL0cImp9D76e3aQ0VBX/5fJdx1AynOlpwN9n1S7l6+qFUi49S6epcoTSAPSG5ZRnDgoXV6ZVGVx94dKugENdAko4VhkcjxVD+Eeo81eKUWlwJ5CfuSA/47sIarmJNfTKQBvxzmCerZzA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(10067099003)(11063799006)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6UwtSj3yJZqUZr20MkaeeQHG53GE5+CNe6RGi5/mqkdQOkid/ogPryes7KtZPU6ynAr/DNoeB6SCUICq7KILFuKlrjzR+beB5Pl3tIVxP/XtPAYi/wONpJlXNgDQLLyeHnz7WxwnME5boZ6Z/J4U2ypptLSMgiNfAMrRAnwlWZZerQCfFQmbYCh1nkc7RQM/8v3bxAkuEN4TNCshR8c+IGHwjnXNcySnnlirsl01P4HaCkmFJ7CrFneCE/YPm0PQf8DvuzmyvzWGZLReAfz8oJ98eZBshB3lVgyTvyiGImx2J1EJrERaBICPblOBUuTSHpLd5GHWiCGAnPkSkQlPX5ooEh3ClqR1De1q6LjniVj9Wh9q79i1N5/9HPa+0YoJZtjf7PQGoN+rQJJ9owMm93rOQ7PF6dlgfpxh7Ex3RCy2jGBHWnLPlmruGsdzNi73
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 08:44:49.3194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 821b257e-81e5-4cb7-4d86-08df08054885
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8366
Subject: [Buildroot] [PATCH v1 1/6] board/xilinx: add Linux 6.18.40 hash
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, arnout@rnout.be, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the hash for the Xilinx Linux 6.18.40 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .../linux_6.18.40/patches/linux-headers/linux-headers.hash | 1 +
 board/xilinx/linux_6.18.40/patches/linux/linux.hash        | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 120000 board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
 create mode 100644 board/xilinx/linux_6.18.40/patches/linux/linux.hash

diff --git a/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash b/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/linux_6.18.40/patches/linux/linux.hash b/board/xilinx/linux_6.18.40/patches/linux/linux.hash
new file mode 100644
index 0000000000..f0b8984573
--- /dev/null
+++ b/board/xilinx/linux_6.18.40/patches/linux/linux.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  bdb5c40d7b43f8a1ea6ee34e2392a389935120b11cf54c36ad3ccff937b1a179  xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
