Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D44C27C44
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 317844130C;
	Fri, 31 May 2024 09:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYE31ihuw4Gv; Fri, 31 May 2024 09:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3E8F41648
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3E8F41648;
	Fri, 31 May 2024 09:48:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BBE61D5044
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18944606E2
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4p_xWSiBZQW for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::613;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0204060612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0204060612
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::613])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0204060612
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:48:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvu/jbbAEADlY7Ytv7S7ff9ldEAagLRKO8A8UedGujLXs6xqzgCGnqzpUIqjBi4Lg3kI2w8GMFEhGthWrO5yArgMgGfW+JZ9k+MevmpfoZNJsip8yr8pdIvAAvvFYVJ+CHzPnUqwdLJAnCHaiCxtQ7X0slXBWQMm1870fjqr/tYcJs/XNYh85tL9Yff+jnjIKzZKPQ5HHZ+ARXZxabnBGIRV7/uCqQNk5ffKZkKKs/VB+kP1WC4cGtVhyNoBEfui9lWHVfCqg0VKknEdv8/RXOBbZYEgZ3YM4tcc61tLG3lgR80u53FteDCOChAofqjiP5FTyK1EiAHU1F3vjPKCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw7hvXe0NEJl4cio91ydVbvrZVNBDsAWAwONYNKZiq8=;
 b=ct76eXJHc7liyImQev9DTHD0JQyIGG7+aCJLiQuklUz18nT+yJdN6lTDuHXYCv9mXrXkM1NoqAzLV85P+3mb0W8cjO/EavNiY4pO7vI7kvPCKQE3mlfzXIe6Vsk0QISQHS2SYe2KXWrZOREKZH31BvEVVSFxLWQZpwXRuq9tJmj04nFOUzy2CqZjtXy0MXL8h2oZb9KTbayHq5WyvPguYHCaTO+IV8dHPkq6mQC4EOYPUOW0ylXJGyQbjAjdz3d00Afwj8BOkrHHRkJyD5+JupGxXlLa2IUSujLGLVWdkp7WEoALjDjye0BkxrgO8SQJDAbIVPU9CNAR/qPlN3rE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR03CA0343.namprd03.prod.outlook.com (2603:10b6:8:55::17) by
 PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Fri, 31 May
 2024 09:48:00 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::fb) by DS7PR03CA0343.outlook.office365.com
 (2603:10b6:8:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.18 via Frontend
 Transport; Fri, 31 May 2024 09:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 31 May 2024 09:47:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 04:47:59 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 04:47:57 -0500
To: <buildroot@buildroot.org>
Date: Fri, 31 May 2024 10:47:47 +0100
Message-ID: <20240531094752.3760287-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531094752.3760287-1-neal.frager@amd.com>
References: <20240531094752.3760287-1-neal.frager@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1d79d5-a615-4ec9-1bed-08dc8156c1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|1800799015|82310400017|36860700004|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/sKFyOeQbfpPJVrCvlP5ggYbE2e6byHdDxprA6ENX5nvE4FUIcgRO9XfmX27?=
 =?us-ascii?Q?52sQzSknkjMnUXryRZ+I612G43g/xagnmEfxQuzzLEEPujlOguDbCO6tguXQ?=
 =?us-ascii?Q?H+suvc1AueyOrjsjURLkDpMjkqKOUibku0ABdpM3SEa1qFRe/luKQDFf/kXs?=
 =?us-ascii?Q?0idz00gDtRayLQnDg3rqBfVu3A26dePALaLW9QgNoTVZ7V4MCSa3TxlyjMOm?=
 =?us-ascii?Q?9xeUutrhwI8Fu/z7WPSUfopmEheXGBfqHtmcOITj67pqRsBlErQFklrxDXl9?=
 =?us-ascii?Q?dR+/MWszGLPchqIt0g23NBE8vdYgWVGV4aMtPD20Zl2FhR4/P89xLbRjhFJr?=
 =?us-ascii?Q?plPDfICAuVahAAy0DOUUfFdfZz/Yul421EdmKBdmr6JnCF4lIx3WdKa1RJSz?=
 =?us-ascii?Q?rEF0evStNk3mosOT5nb3XzP1lVlNCyhTACOjnsHp7V84+ULSpLQ1q8j3dOlG?=
 =?us-ascii?Q?jZlQ/owom54gaYiPzUCzWoVFKQR9VsZ70uk2sohOclCSIaZZfxrA5ZzQbIT4?=
 =?us-ascii?Q?SYyBNo4KnXfMjHNNEmNJ73NpQkhtYPc6twUHdK8EhqK7FFk0RjcMSIQiOhHA?=
 =?us-ascii?Q?CIRMio7NP+E9jX29YZHQIl2lcgjb6vtTyT8x7yVt/gOQoWcn68RRmQadVg4V?=
 =?us-ascii?Q?pPVrCAnwe8XOYI3B+cKaqp1lnDMCPICe7F52mZC4w89yfLITAkEXuUftaeQ4?=
 =?us-ascii?Q?I4ZGQ3mw2pUQJrplH175Fsn3CuaGI92uxm/QI4lpTb9Q7LoXw5MTDRgo38HT?=
 =?us-ascii?Q?iFEGdaBD+Z2RUA/EuNRKxP5gsb75SOeMr6sM2zdNzCf128Wg4HDrKXnEgIFY?=
 =?us-ascii?Q?ps/AF/512DDPg5YCFTAJO4H6M22yFMlsOvJuntjWV5ysrjzmxPbCQ4Xe4Kvy?=
 =?us-ascii?Q?5Ovx4FaTp1JQC6KoipkSAs2puqmKv0PdgZUEigCBLdIvJJEyul8uMPrc+BM0?=
 =?us-ascii?Q?Dafqlmkv94mDeNz7fM6W79g+XZBB3icYQRhmo0HAE75XLrGXQFcK+hdjiMHT?=
 =?us-ascii?Q?zcK413FmDrNhkwVT5J6FG3BCBj3VHfKYFt+hDzx6zxF9fOGiDflNyqIBwQZH?=
 =?us-ascii?Q?xnz1kba8o/pLkhZQTYTj3w3sRF+wzznw4c05j+3/Nb6/cX1xX/PbJKdEvFRe?=
 =?us-ascii?Q?Ffn5AvLHlKJqs7MwSE19BLpbFaYq75D94ZzP+9eTfb7LX5zf/M1M12TDcjwB?=
 =?us-ascii?Q?ETlkGKrDtYTLPWnZ7c6iwtTlxuddjB3s1HKrJ6+p+8cMsy8q84e+dxbd6VYR?=
 =?us-ascii?Q?sK6jPaHYfxzZscPjrxvcRFGwngEU0Qho5p0npsrqlMsEtYi7p/RpGCkKbTE8?=
 =?us-ascii?Q?zxWKx4/nPTEXFc/C7YbdMnQ+Lue6Vhdw9YizLNHMIU8qDOzgXWpDSzT/wu1R?=
 =?us-ascii?Q?gBLbGX2wN5aZ0TB8W6wXus/oHexEXCFQd6B7c5AqLE7ahqJrjw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 09:47:59.8584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1d79d5-a615-4ec9-1bed-08dc8156c1dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vw7hvXe0NEJl4cio91ydVbvrZVNBDsAWAwONYNKZiq8=;
 b=sVKwANcLAqHZ4oYS7CovH7sE1fXoslZtxXxi39xDdmzFSTuQ97+mWVAvVOZuH9c2ZQWcGpA18d1iJ7kFE+6HedWaPxS7J4bTXkHrDzf3lzhW6hyQg0VlagpAEvKwvPn045qAh07VdCcgY656U1BLpzGE8uAob4W5xDOWeZrNe50=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sVKwANcL
Subject: [Buildroot] [PATCH v2 2/7] board/zynq/post-image.sh: support linux
 6.6 dts directory structure
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
Cc: martin.chabot@gmail.com, brandon.maier@collins.com, ju.o@free.fr,
 juju@cotds.org, michal.simek@amd.com, thomas.petazzoni@bootlin.com,
 Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux 6.6 includes a xilinx directory in the dts directory structure for zynq
boards.  This patch updates the post-image.sh to match the zynqmp post-image.sh
in order to support this change.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- added this patch to support new dts dir structure
---
 board/zynq/post-image.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index 192354b5be..f44b66342d 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -4,9 +4,9 @@
 # let's use a symlink with that name that points to the *first*
 # devicetree listed in the config.
 
-FIRST_DT=$(sed -n \
-           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
-           "${BR2_CONFIG}")
+FIRST_DT=$(sed -nr \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
+               "${BR2_CONFIG}")
 
 [ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
