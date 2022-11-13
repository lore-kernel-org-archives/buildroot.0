Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DB5C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 18:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 252AC60BCF;
	Sun, 13 Nov 2022 18:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 252AC60BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pX5XcKlwYE_f; Sun, 13 Nov 2022 18:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6756C60773;
	Sun, 13 Nov 2022 18:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6756C60773
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A70F1BF37E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 18:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E7138133B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 18:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E7138133B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C3aJLKeNh1yU for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 18:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F199F81330
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::625])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F199F81330
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 18:49:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAKJihv8i9/I9mYfsqbU6EfwMvYT1H/W8FhlRoDx40Q/hsn2oSn8zrIu2j0IOo5T835wVckyQPQIgp4Gk1LIoXLmCuLuSuS0U4lIzA4xipeRVIjS3QEsNtdjUf7le956ANs8SZfWT0k1nmJktSTIIpQzauQNJxwfvgwppOnadY8/DuX89PffCn2ST9tDTbhQB1rDFCtxkneOfydr3HiifuMDAf2PxtetVh1HAERsIKSiT6mWRy/rjpdm6DdhT/FDsepMskxXRI+pcmU/wjwATcvTGSxDqaz/3AD0Tn1EShH9u/IeL2QEgSyPOs/Vra19S5UdqdRceHseddbegq5nQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pasj2mqP8HIRtNa7+FUO5ntZ0CW1D/irC8TDC7Ln8iw=;
 b=FbfX7xyekgJeTr5UnEQ3r+9wPyX8HdpbTcQMHCA2zv/btTQySswNHb/kQ1fQjVpF4fNYFwNJ9ZWz3YVuhwaQ0KYf5RpWTvpvZIcgBibpeoYtvjsXojcNMo57jIg3L7HjAS/+Y3E2fX/1GCUx9TndfvLY97L1axsgnmYKHV7Yw1brYe8HZkZjPDqsI/MuN0cZq1OGzR7WR36J/m6m3uKxrXFbjendQS1Yun4cpQA5Czf0Z+8XY1VRDX5CNn3XUmw3f50jBdWKwl9k4PClrJ+I9MRE8DjzsgQvmGL53KSe3CnEF7DtfEmh6ZQzOTTaAlVHhCze9v6QVrmGl/5QGjpW8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR11CA0043.namprd11.prod.outlook.com (2603:10b6:5:14c::20)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Sun, 13 Nov
 2022 18:49:37 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::60) by DM6PR11CA0043.outlook.office365.com
 (2603:10b6:5:14c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Sun, 13 Nov 2022 18:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Sun, 13 Nov 2022 18:49:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 13 Nov
 2022 12:49:36 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 13 Nov 2022 12:49:36 -0600
To: <buildroot@buildroot.org>
Date: Sun, 13 Nov 2022 11:49:33 -0700
Message-ID: <20221113184933.47232-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 379ff5bb-39c4-40b8-ada8-08dac5a7d057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rhACg8nrwDwHhuy1i6KyDItOxSoTKQM6acNFi+tdPxQh0BNbSnupWf0XHnYXPJxY90mFfWlNilSEutOhE2KHXwXv9w5wXKjBx7eaOuMpG2FHIe/AWj9K9ZAzF638ZOvNBRkg3Xb0HR+LykYxtRVyOT6D1Kc+sQVRjKwzpJREd4q8RZq4qc6fcen/vzwgAgobGEiSE0LO/ayhJJz6ThGREi7NPC55gLA4LJmvzqM9sKDJ7snGOwLkFJSvSCWQKaLSgd0xdhSWlyakuyxLGTLUzhFcPkgVJFsJ4LQMho0nOWKzzwVVzzoggQxKKepbBQBgGrAkyzeufALyvuUumHNQ0unAL9tOWPj2dXGNWdOIdkxMFUtFg17D9rVOG6+GbD0gQ8+EmbQgNGygNGrO//5CwlW7e82DFS0wbeLptLxltc+VtzuCMZja4oh6WW2z3eIOGaOejPz02gS/yR3XNpPsAciP0AT2GauIO2Nc/UvLP9Ft+hXpARlkPP68U17iwgTH7fc5Q1aXXYwtuKBEcpXxWUHqdph8Js7MqL23X+vtLZQid+6K4vi9qIqhWqgJ5J+eEwxPQ5cqycmvfo5yMYTheJo3ScWV+Rc6rusUWMW/l6xcGGuv6kigoHn5IWr8oG9tH5v7XCwAlTQe84XmaetybC5aJijv9DMTXoVVmWZrU9a8Z/ncQrEcZ4UCsTHSGg66/WTi5K7HH6WmVLoqfsTpOo1DmguGcTeOzTQJqVXA202WDzkhoOVdyl4GqPQyEM8IMJzV3RsrTgwNMHPbpJc7UzOZT0Izr+K5DwKMiJh1RBepDQb+tnwvKKCjBbdgN6nx/bjwvSeSWT30xDvoQGgyp0TJkzBTlcay8WqtPBLB2uE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(2906002)(70206006)(44832011)(5660300002)(8936002)(83380400001)(4744005)(4326008)(8676002)(36860700001)(6916009)(54906003)(70586007)(82740400003)(41300700001)(316002)(356005)(81166007)(40480700001)(86362001)(478600001)(6666004)(426003)(2616005)(1076003)(336012)(47076005)(40460700003)(186003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2022 18:49:37.1026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 379ff5bb-39c4-40b8-ada8-08dac5a7d057
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pasj2mqP8HIRtNa7+FUO5ntZ0CW1D/irC8TDC7Ln8iw=;
 b=aeJJFAG26N/z8AlwSwqAZgL9YA+53c1Ud63SmPHOyE5MwCap8E1myzbnZ9yKzPxy4YDTf9FaSxpshUEHv1+OsbiWNJakmkGpCVOk6t8h8c/foCMiqz1qObQU3i8vFZL9EdqQqbibEW4sTbrFsH1C83YdfF4xlf+EEVR1ejQm560=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=aeJJFAG2
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/kv260/uboot.fragment:
 remove unnecessary CONFIG_MULTI_DTB_FIT option
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch removes the CONFIG_MULTI_DTB_FIT u-boot option for the
zynqmp_kria_kv260_defconfig as it is not necessary.  The post build
kv260.sh creates the proper u-boot.itb without needing this option.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/kv260/uboot.fragment | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/kv260/uboot.fragment
index 874eb470ac..0ed560c411 100644
--- a/board/zynqmp/kria/kv260/uboot.fragment
+++ b/board/zynqmp/kria/kv260/uboot.fragment
@@ -1,7 +1,6 @@
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
 CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
 CONFIG_DTB_RESELECT=y
-CONFIG_MULTI_DTB_FIT=y
 CONFIG_DMA=y
 CONFIG_XILINX_DPDMA=y
 CONFIG_PHY=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
