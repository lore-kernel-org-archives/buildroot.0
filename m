Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB01EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 07:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E17583E1A;
	Tue, 17 May 2022 07:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HOwXQcOhTnLC; Tue, 17 May 2022 07:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 888DA83E13;
	Tue, 17 May 2022 07:30:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1F3F1BF2F6
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E005683E13
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FI5yjlWT4A2 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 07:30:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::603])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1456783E11
 for <buildroot@buildroot.org>; Tue, 17 May 2022 07:30:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk2s9q6OC5B8mSBlyug9vdhFAF9I+/1RNeDUmS0oIRcWxV9e+Bk/lCZl2DSg6i5qPAu0+59vjeGIUA6BQsHsrgcfxcUBR2at+pyK1eh/NnU/EUQl+IiN+w7430fhqDQkYdyxJ4gdX7Vo5EoYVGsNQCpk4/f8B8M8WEhT3ReEU3ohylOV9GCI5TA72mxxLbSDnr48jpscx2hms3pElCbAE742XbWbuLzmTFvE5YH74JwQZWDb6e134hX38Pg0cu4Cy3NpW2TjG7+ak0XyO/PISGcBBRgQfTEpuNPJP32pZiwqOTxU+dVcyNzO02gHWY2EMR276g0J30Obf1OdN9b44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdMm5JkyzMCXW10kZvfCPAlwhdeAqZ+9aIDsfKpgM0w=;
 b=dY2Qafkd5/SpgNc8fruxNrzDjBjc9hpE5T9aMbOzkhT+sjivziCeEsLw8aWIRD1kRqNvrFNbokLRmmFDOnNnpQPjWdlkWXKyHlfIW1KTvtHwz0TvZCXmeYl8MFbO1e3hCe2jXVRg/zKxYxjMeNa16LaLutqnVzGo2MwkUbvdqrsmhty/K09RY2evgQYQPsUtUjsTiJKVxxK1TdoVYlWCrsx5CuUjd0sjLZL4Rblsvb2IMTftcKVxYFYHD94uZqCTjdQAElJCWU2qEjqyNujwWNcQhUpIXH428P2xwK7d38iKlWbB8rMscaT3p4Os62PCW9eUR2Wk4h1PBq918gkWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdMm5JkyzMCXW10kZvfCPAlwhdeAqZ+9aIDsfKpgM0w=;
 b=X+JVURDypBRXzLXeGXjy58YaCZmFw1m91saVAIdop+omXKcsIcZ3CWlMeqJuUVRPYBc0LooAucIfbpFQ3vh7Xp8ib5whWRIs3cZ3KufsfyEHGP6cNTA0splWrfxDwU5oJvbeLhg90/sHoiKFuUSdj+bRK3IwiCvvlB7UW/UCol4=
Received: from BN0PR08CA0027.namprd08.prod.outlook.com (2603:10b6:408:142::25)
 by MN2PR02MB6863.namprd02.prod.outlook.com (2603:10b6:208:1d7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 07:30:20 +0000
Received: from BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::9b) by BN0PR08CA0027.outlook.office365.com
 (2603:10b6:408:142::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Tue, 17 May 2022 07:30:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT017.mail.protection.outlook.com (10.13.2.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 07:30:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 May 2022 00:30:09 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 May 2022 00:30:09 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=52476 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nqrej-000EOf-4A; Tue, 17 May 2022 00:30:09 -0700
To: <buildroot@buildroot.org>
Date: Tue, 17 May 2022 01:29:49 -0600
Message-ID: <20220517072950.1322452-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517072950.1322452-1-neal.frager@amd.com>
References: <20220517072950.1322452-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 416a587f-42ab-4ddb-e1ae-08da37d718ea
X-MS-TrafficTypeDiagnostic: MN2PR02MB6863:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB6863E0C5901B1FE09D0C73D5F0CE9@MN2PR02MB6863.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92oEsFVcPLUmFkCuKKvi5wJH53ikM6gIC+2f2FPYzEpbxf/cmDX0cP66gLyoEAXqikXupEl9/AJal7HNN57qaHFlaYwRDlqh7qAzJ95zoUfMHQjZWRqEupJBVuHq5Jvkh6YOAXMa7ZIWRnR/dP3x+IX+hY6nVwt3diOxF6R7bmzMAO7MLEjmcjgVpFJYIme37OQ7iT4i9ssqNUQU+HL93Q++5o4mjEu48jBa7EHLqRzbyRuctPAj/BXiIWueuYxjjSY6DQopAK6KDZ4FLFQZhyBOYVviQu5olt0hUyXTopa69rWtEhUT5FsNwF2stHJERxpKgMOGaViglKQ3N9/Rkqu27teqQweS77dZ7+p2Lr2omOwioTZ0fxLhMXJy9R8wmKPYYyhqlpfgvEu3UsUf5ldtumpV+Ov28Kwb8idaY0pI9qK536138RzY+Ig/K985AI+/iMsPEU4TY7CK/OteLdQ+HC3UEE95B3/NKjOWz/w2l2O5fL3VW4wcudjfylla1KbRIpWnn24dKoL0Rv3Ky6VWYxur8inkMcMojeAysGsObuBiOl2H2PdiOnyLb8LNk7h1/MhBk33vXvI9iPwQBRfa1OMgKyw8fCV6e2lz37vWgCAjcR292Mvnhl2Dm1gD59vgWenLwY1BSR8EChktrB7MVn+MxGFWmm7fzzGXEvBLyJXg0+WdH066v517Oa/nXClBz2dgzcVcyMdTPlo3Rg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(7636003)(6666004)(2906002)(1076003)(54906003)(47076005)(356005)(336012)(82310400005)(316002)(6916009)(86362001)(40460700003)(5660300002)(508600001)(44832011)(4326008)(8676002)(70206006)(70586007)(9786002)(4744005)(8936002)(35950700001)(26005)(2616005)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 07:30:20.0483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 416a587f-42ab-4ddb-e1ae-08da37d718ea
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6863
Subject: [Buildroot] [PATCH v3 2/3] board/zynqmp/kria/kv260/uboot.fragment:
 add uboot build options
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
Cc: wesley@sonifex.co.uk, Neal Frager <neal.frager@amd.com>,
 luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds additional uboot build options that are
required for kria k26 soms.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/kv260/uboot.fragment | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/kv260/uboot.fragment
index e1aca68692..a156748168 100644
--- a/board/zynqmp/kria/kv260/uboot.fragment
+++ b/board/zynqmp/kria/kv260/uboot.fragment
@@ -1 +1,14 @@
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
+CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
+CONFIG_DMA=y
+CONFIG_XILINX_DPDMA=y
+CONFIG_PHY=y
+CONFIG_PHY_XILINX_ZYNQMP=y
+CONFIG_PINCTRL=y
+CONFIG_PINCONF=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_ZYNQMP_POWER_DOMAIN=y
+CONFIG_DM_RESET=y
+CONFIG_RESET_ZYNQMP=y
+CONFIG_VIDEO_ZYNQMP_DPSUB=y
+CONFIG_SF_DEFAULT_SPEED=40000000
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
