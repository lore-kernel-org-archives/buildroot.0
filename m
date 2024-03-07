Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FB3C48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 16:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5277340817;
	Thu,  7 Mar 2024 16:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w5U1SkT8KcVV; Thu,  7 Mar 2024 16:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3016F40821
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3016F40821;
	Thu,  7 Mar 2024 16:02:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B28D1BF59A
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 448D440821
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaHxC5dbxgWe for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 16:02:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::600;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6009040817
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6009040817
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6009040817
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 16:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fInWKTdfdfwtEbaHLYn0B4DOfaUeuHfSx1Jk7JnnfbHoz89XqFZW7EHHcP+YuG9MucpZ0K1eXFWF6qbFo0cydi2+XRgmiVnpzpjn33U+4U1BIz3XW6+MiqelGhNqfTIE574cN2tuBZsJpsM5/6l27WPtemof0x/OtTPczTt+ipygB6LPGZV6PiT2Os2JJVNRWaf25TSe5Pgeyc9478rsshYBNqKhH4zdFtgSyHVibQdP2lkpFnlPifg2s9Tya8FTPvu4YrG9frisd0Qebd6hdntstzwabIQOsmCoItTyENB45MEaoHRKjEWH2Z0G0+U2xLNsnY36KZwLvGU9n2+B7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6tjBpDgWXutsXtz2D0QqQIBhWA06rEhTJb0fvpZeNQ=;
 b=aGqYaAO5hhDfckoIfv7mp9vi0leIkln3zTpHMDC5++2z0sFIebNNfznQCxIcvmWOcDBiLHoZO2u8uEeX8SQS46mpS9HZvVA9GVcNNZCejjHYSOq5S8Ks8hPsJuboSI/ouq4dt6U1KoXdLkMhy0YbiGWEThjFNl5Roy+A/VjEss0cbzWfEm/GlWTe6cyxCj1CtjAjrWe6HHf4MmRxqzdOR0hdzftJ7lh/irreCCw2cUxoExwrLmFWiRQpqEtGf9QzW9+5OHLpWUdvjIEwGQAqvqNZSEMpbNcsgqO7NDFGO9ZwLXG8dNXpxV9srXqgeYbzQ5vJI6DAVTnYvyLkA0m8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR04CA0016.namprd04.prod.outlook.com (2603:10b6:610:76::21)
 by MN0PR12MB5929.namprd12.prod.outlook.com (2603:10b6:208:37c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 16:02:15 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::c9) by CH0PR04CA0016.outlook.office365.com
 (2603:10b6:610:76::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Thu, 7 Mar 2024 16:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 16:02:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 10:02:13 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 10:02:12 -0600
To: <buildroot@buildroot.org>
Date: Thu, 7 Mar 2024 16:02:04 +0000
Message-ID: <20240307160204.1923757-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|MN0PR12MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 65238693-3c4d-446f-3c33-08dc3ebff4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMo83QnKgnl0SWxxQ5dHwkZHRGtjTbp2wkXjPMOLr6Oburhh8+46qgCXkQIhM7Jaj/2QxbaGmo92phtkcYfA+H+li4+qJv2+4t0Sl3Y0op0Qg82gUSnUsxy4Q+fyfklVZylt0zLPfiPX8kAD8Ze2m3on2h2mNA2PskkYd0QTKMpegGC7J1nHCzLFdOhEP9bYHjR3wTPImnJvn++h4IQllwn4/R8pCyp4jb7TdT6qpPVzYd9dS+cuD88TJvSjkDmPYZSo3Gp/bYG9KXhKNcKHceOws8p4UiFnrikCxBUyyDtE2598iXjfbruH+/TR8XTN+fGchdkThDq4K6odj/1K4JVegpe9uz3DjSR2Qxqw/UL1QgR5nh7KPc5t3dwtRTfdl0DfuOo5oBsnIWiIqICxwlZ5g0HcFdzZGwRz7pYCSzWmdXCmP7HJFh7z3wpiI+UlzwGqbrlxlqxqU2prcxc79OFKrCEglx1KFI9JZhxbOzknfoXr2AntTF6lNyYh5UnSJKHKPjc+LPm7Jw/gO/zX2J3CqFvl3Fv3GUtezUUo1UygTollC5DB5dGM1UL8Z+h8SxFU028qRoynbrzPWxvA5QxRFpEO4LI5mHfhkKegEV7z70FUIaM6KkuMqQez0DzI3XdCfTGXsMJSEvSppx2HyP/SJ6c1okN5TCScX58HUi5rf6NJrKtRgV5EAnQy+71xWQi4IIOjB+CyHHEjQtwnzv9pjXgERhI1EeUH6ueFRy1XXNQmIsEvFc4XniG3tQDw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 16:02:14.3615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65238693-3c4d-446f-3c33-08dc3ebff4aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6tjBpDgWXutsXtz2D0QqQIBhWA06rEhTJb0fvpZeNQ=;
 b=Dk3Cwwrx3dFlZeY4dPOhU+yrAFx5U8fWAob9vmiihrsZCeGIO/JcoE3BV6XtB4LJ9TLHc/jSFYUorGB79yka4a8NxVrO5EnT+Uzx+gNtsarlgvUsP3eY4j/zjmdGjgV0wR5+0ZxMgY5Jh5ALZi3nCaqAdqDO1DKEZo+f3rplfvE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Dk3Cwwrx
Subject: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: apply
 binutils 2.42 patches
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

Apply the same patches to binutils-bare-metal as binutils.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/binutils-bare-metal/2.42 | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 package/binutils-bare-metal/2.42

diff --git a/package/binutils-bare-metal/2.42 b/package/binutils-bare-metal/2.42
new file mode 120000
index 0000000000..dfad0ed2f4
--- /dev/null
+++ b/package/binutils-bare-metal/2.42
@@ -0,0 +1 @@
+../binutils/2.42
\ No newline at end of file
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
