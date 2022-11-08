Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D908C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 21:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2024460E58;
	Tue,  8 Nov 2022 21:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2024460E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tChs1UppbHFw; Tue,  8 Nov 2022 21:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5902D60758;
	Tue,  8 Nov 2022 21:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5902D60758
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7554F1BF5EA
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 21:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCC3A81325
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 21:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC3A81325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeLD3lgSR5UH for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 21:20:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A988130F
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4A988130F
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 21:20:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKg1x/9LwVSYD4wWkhk6/z+BZ7BG31W/ZeOnXX7D56XGkDXXlUYIeMkaqg6sDTmIf7kM/7ZTylUQDmzRSZTXXo4lN8xUjpQEr+sESsNQ6p2/4UCvzvaR26RgrcZokzmLSxi96WOVqf2D+LvSsWbBSZ8PwEd7SpwnnSwohgAMtpfvQkpPb2jaeJO4TCq3RmZb/yLeI4xMaOswgB2/ZwS+yGkB1habDXd1AU3fmidWoN1570Idzh9l9dIYObtNFlV8DXLkUHIxKdhlfsKmWVKFXqfnMx3i3a9LDlYqdIiBx/j9/WNIWh7L2oPUn6wvKuMXGXjkn6fUeo5EcdHsZiIVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qxZgz2hkZcKqGC+PDQb90iNLPXWrCKumxDB4Ei05aQ=;
 b=TfhkFKDgQeV2sF8EJRE5DXVfc9QEXk9FkW4nrx+rzgSO2PIB8lvBqegXILDw/KutZAtqQCD+2wLwxZtWBIc6dyVPu5/5N0KOF1CHMxE3DkUi8+jwxFbUkcUOJxXD8alKnByQH/jfi4AsTMBVmDMd+tOkvxdYnjtVUknpGUGXRxyAXu24MAzTcuWaFeiUTuRholVekoUuh9LY8YmYug6oXGFqZ4kTgilcUOXeAMOsPnV8dxBXmlTMx1pE5pA7i4r7c8K5vRsupEfxoI4Gs671UIhTumvaSMAOWMcZ9vDMwdcFTynFrmNON55SY5pHYxX76WTRDJRV+03hN+0IbaGCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0098.namprd03.prod.outlook.com (2603:10b6:5:3b7::13)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 21:20:14 +0000
Received: from DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::a7) by DS7PR03CA0098.outlook.office365.com
 (2603:10b6:5:3b7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26 via Frontend
 Transport; Tue, 8 Nov 2022 21:20:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT108.mail.protection.outlook.com (10.13.172.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Tue, 8 Nov 2022 21:20:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 14:07:14 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 12:07:14 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 8 Nov 2022 14:07:13 -0600
To: <buildroot@buildroot.org>
Date: Tue, 8 Nov 2022 13:07:04 -0700
Message-ID: <20221108200704.23955-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT108:EE_|SJ0PR12MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d342cc9-9c3c-4daf-2439-08dac1cf06a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYFd6GC8UwqHTnUudTD8xF0v+kLPsq/g6O0WiGnARBZ+ibpKm8ThOyqWNqYV29qhyQtqRGpyhGulr+mkbneu4gPDkSSp+Z0OJE66XIm6LzeU/weMdGVwQhZ3wI9Cp9e+nW2goGN2jR1Hx2c3PuJazi8iZtqV0UUcHaPf5yYZt6mKK5GE1ZBs/EleziHiipRKY/BjPTg+T02mEzyKm7d+m9pXrq9PSXwpopuwMGLZzUsEHh/p1LRJ/ikojO7enDfH1tZ0uJFvbGcXz85TDqDE6AKj8MXcBkNvvW/6yu5QdiP+/bKpYAj689Vin9c4gY+Hgey4S3lBrQQMvM8geHsGsX5ReFTojJx2OnRC7DQGycipceeUqfe1ehiUv0WD2avRtmex9RNbXEv3bx05fnSco6d2wpm3p0PD06DDtDvNpHJlojUni9V+9VVpF3AP5xIw0KVwQ7tBvDyAtt9IMjmIH736M8oFyi5ep7OBhDQBRQOlMg1WvrXxMO4Aeyb5WqpaoK6qp+QwQXbtJRYwgHkjGrdoK6jzS4uxOWi+O2bURk38zFtNj4d8nm5D/xujX8iL3/GDU+JdjqWbocHPAImLdYrSPS9ys47/mNzUwPCeNApknZ+bMoC7go5VFQ6+1/SFWZGdc2XlMigZA4sfOY/+yDWfCz0+0GeHTmxLpC/QlC5IGFPlrZdT9WQGdsTFS3IjvdzQXfP0xFSa/Etsvut0SjXux4DrlZfS9QltPooSxqzvkPC/lk6aic8V9z9R54RvG2s5GtVKh94DnWt6cQwxG3VePJGjDd9FuOXzXbbwx2wc8AsLVJlLMXLvfgnMKfDr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(54906003)(6916009)(316002)(36860700001)(426003)(40480700001)(40460700003)(47076005)(83380400001)(336012)(1076003)(41300700001)(186003)(4744005)(2616005)(2906002)(44832011)(8936002)(5660300002)(86362001)(36756003)(70206006)(8676002)(26005)(4326008)(70586007)(82740400003)(478600001)(81166007)(356005)(6666004)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 21:20:13.9286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d342cc9-9c3c-4daf-2439-08dac1cf06a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qxZgz2hkZcKqGC+PDQb90iNLPXWrCKumxDB4Ei05aQ=;
 b=mmJj7w/lwHZuZPvRNb0VXVa8bS/JlZa5ycVCDU2y/PnE+Hy7fU8uZTP3TYyfg0ok94H5JuKI2d8AFkXpwxMX1LjAvnmkCgHWRhtg+xD1hofiTYtx6bPviunl5kWjJNh6GTeMuqBXRQ6e2inuri/oH1dhLQY4cmlHEqfxcBxu5iU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mmJj7w/l
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
