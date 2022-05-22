Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0276EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 13:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636B483495;
	Sun, 22 May 2022 13:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bH_AfVbTEzsi; Sun, 22 May 2022 13:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B4F083459;
	Sun, 22 May 2022 13:15:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32B161BF384
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 13:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F24B83459
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 13:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vhSWIQaxkOaR for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 13:15:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::602])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6364E8343E
 for <buildroot@buildroot.org>; Sun, 22 May 2022 13:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PU8In0Gwvyv3SxtGNmcyzXZ7pFZmwazhTzKfR5zas8N5/jIVqoBXeUw71FVF7UvifmwsKhwqC2qSvCTuynQbQbYiBidoDZUusJjAfPqqHav4Amfr62+J85P1S4wK3mly52MOb4ofb33jgIrGsPsIlLOWNjacaL1TtJRubKEgIxC380Zh1n6QjUEPD2V65Z56ZFJrLSvYWz8yoCG3i92wUckPVgl0efhaFNSCUMGfjTiRFhVDLKUw0YeZGgO7W0zYVbnjnJWOUFLexSWT5D2vixkyAGfW1+sSckY8mFY4ZGGJtsRC/pJCo4Zm/YoBXq4GIsYRAIeKdbSff3ode5iwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5A3ddEKubH0U8ldi2zvxfFOv0AEIY13Hn/f2eerk+s=;
 b=IAAAMU0+Rl9TInTLOhyER2oOCQMh18RUSgatHTUK+2RRSUU6FZ9/P4xS3Tgo2d40g0kMrmTRP1d2YX6bLx6zPMkmcM2b7SsJoZTM0mIBn7x9mYP+pExqY9BYActXa8B9XnAE9HzEpV69mfT8nrkApM4iwCGQxVJAD457eiXq3qtBiDHRIUi0PAAVLwzWyZTu6cS7gDdwuxIPRA9LW9foDmlhFNFWazZmkTfvk9S4GAWWSGN0ZtVVmlEgZLkXUiKeBVpCpKwApSBxA5mCaqbVTdu7prcV8kvPoO5JceX0FWj95QrS3KeAKGMlS5gBs6Igg67eAquZ6SuEAXlNfDA1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5A3ddEKubH0U8ldi2zvxfFOv0AEIY13Hn/f2eerk+s=;
 b=hyVCBvyDS2J7v/sZxDfKqNEJLefPbrNSMIeApmUbqQ36Saxd7oDhhsFS+tE+dJ8EhB49ecl4YoEHK3rrqF5PqvIMK20kFEE9guxwzjJf/iNsl48rRi9dlmrPULvxxSS1Nbyzop4v8D7dd/EYLYoPSShistFklTf8++3T0oRDfys=
Received: from SN2PR01CA0022.prod.exchangelabs.com (2603:10b6:804:2::32) by
 MWHPR02MB2399.namprd02.prod.outlook.com (2603:10b6:300:5c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.17; Sun, 22 May 2022 13:15:43 +0000
Received: from SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::90) by SN2PR01CA0022.outlook.office365.com
 (2603:10b6:804:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.20 via Frontend
 Transport; Sun, 22 May 2022 13:15:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0005.mail.protection.outlook.com (10.97.4.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Sun, 22 May 2022 13:15:41 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 22 May 2022 06:15:40 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 22 May 2022 06:15:40 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=39774 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nslQq-0004kl-9F; Sun, 22 May 2022 06:15:40 -0700
To: <buildroot@buildroot.org>
Date: Sun, 22 May 2022 07:15:32 -0600
Message-ID: <20220522131535.1498502-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9fea50c-6f34-4f83-170d-08da3bf52c11
X-MS-TrafficTypeDiagnostic: MWHPR02MB2399:EE_
X-Microsoft-Antispam-PRVS: <MWHPR02MB239948E05BA46787B83CE3CFF0D59@MWHPR02MB2399.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wWYu0Wy6//Gv2U4jIyYinpcVsM08LewKI9Myk8UI/If3QxlzHwPltWERxyteX+j8x/3MlxDj6DDbVteTqAkihGnFJlfZxUrjGnGu4owqxw7lKSj/LvJXW9YmIEMNlxEJdW22CUCab7zSVoK9tJlj2QIwMZ6HawBP5kvUuDad/Cw5SaYfr4HN5tVh1JXn54Vw5vK4Yy9nsf+nZUyvT+ty4mPbGZ3tPWu1yoTWiYRFbyTRiNC24th8RvXX3/lrhFOZ4TpWaWAwcuRoGyuXCzxm3CAOQhakgdEpYrqZhcVt4JymYz00W54yNtUbhL8NEkm9oxFeNbv318RIXEvodmU1YGR570PYbRZ57IOqdGTbZFY7tY5G9HIFgkGDcFDsHANAEpyNomKKJTTX8xm5+c5osppf8um1WG+fcXNLanV6e0y3J5VxS1Lyhytbpzlrm6BQaxnRY+OpkFOglw5k6aMxScyml15ue1Sc+T8479RmTh5XrwmkXTlMKqBCRPfVN6GhL9ZzKO5F/QPFySILIWtCnHZy1ESZlwk8CVI+9o3v9LPFRdgWXORz/CHTbPbNhyW+Tz2sLnlCHoFoWlfdv7fzHM7b323MGlK9kK3CF3CObZGealBabF8DzekXzCWdVyaGjEtbgrgcSe0mrmBimaeecm2gTbtbYpud66x3FppvJa6hFJPiajBpzUpAW/NB2bRQUz3rmhDTXNrNjhbDCncQuA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(40460700003)(82310400005)(5660300002)(44832011)(2906002)(316002)(26005)(508600001)(336012)(47076005)(4744005)(86362001)(35950700001)(6666004)(1076003)(54906003)(6916009)(4326008)(8676002)(70206006)(70586007)(36756003)(7636003)(2616005)(8936002)(9786002)(356005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2022 13:15:41.7909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fea50c-6f34-4f83-170d-08da3bf52c11
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2399
Subject: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
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

This patch uses the BR2_ROOTFS_POST_SCRIPT_ARGS to auto-generate the
extlinux.conf file, so developers will only need to modify the
board_defconfig file to change the console and boot file system locations.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/post-build.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
index 9fd8bbf2c8..749784c3f3 100755
--- a/board/zynqmp/post-build.sh
+++ b/board/zynqmp/post-build.sh
@@ -4,5 +4,19 @@
 # in the binaries directory
 
 BOARD_DIR="$(dirname $0)"
+CONSOLE=$2
+ROOT=$3
+
+FILE=$BOARD_DIR/extlinux.conf
+if test -f "$FILE"; then
+    echo "$FILE aready exists."
+else
+  cat << __HEADER_EOF >> $BOARD_DIR/extlinux.conf
+label linux
+  kernel /Image
+  devicetree /system.dtb
+  append console=$CONSOLE root=/dev/$ROOT rw rootwait
+__HEADER_EOF
+fi
 
 install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
