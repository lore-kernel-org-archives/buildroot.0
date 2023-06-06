Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A76C7EE24
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 14:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B117B418DD;
	Tue,  6 Jun 2023 14:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B117B418DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFOyVXWQJbpj; Tue,  6 Jun 2023 14:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A537418D2;
	Tue,  6 Jun 2023 14:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A537418D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F1BB1BF57C
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 14:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A53D40220
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 14:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A53D40220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NV3kQB5I3nmq for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 14:42:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 341A940134
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::604])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 341A940134
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 14:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSJ6THhy6HJUUNh2wbtYQGxiIkRPhPir5iDseHNEIsmNBN9ts9UAiCx9oPc2XoNS1PdaexTRaQnb+2/SliYrTclkJuoHR08LJlhX6uaq1Y58aB8GkARRC72QvKkjHlVmmeQWQtgSYlBY49b7SqcVzzJgrT+A58C2ZTV2G39I3KW74t7B84lrPVeoO2zx2CHMAOk6xT7VBGBzuZWsd5fdb8icLcwLL9zE7Oo2zzryeBvXgMgDbFzlfil3F8OGrn94LuNNVlpmRBtKzJyFTJED6eLDoRngQPF8yFirIZBdw+lnoc36De6CxM4hl+D8kvDIDoS/DOsmaDfOWJCfdj4/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ7RwSCRMMXdWs4JwYyqN0/4fsw/kEUjBtLXNILE3No=;
 b=IPXWmN+S8ygrCfZ83lox2H4kooolMgS6+3gfUHSUCYAa+sp4QXsK8PdSE8ORg8hp5qIS4mx9tC5kLAQAqGMp+ML7RbKiPQdjN7868BgzcxhxhHuJ8xWfsK8khQHzYtRQbGuyR5JRHCuGicHUP/sMMSU7BNXlcS4ma41fciDWvO1psgw1CXVhdwJ5REkBxEGMq+msKrSYXMqqXYlfgcZgEMighIOem77D9tum7QBOpNj+i0oUrHPqy7gHmOJzzkxa/DUxGfpSZqQzFApU6jIxnNhGsGSl8qlwarqGCrbFvCAaSoI7BPKh6dqxqE0lTU0KSLXaMAM4Ady9fevaaFWciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0748.namprd03.prod.outlook.com (2603:10b6:408:110::33)
 by IA0PR12MB7532.namprd12.prod.outlook.com (2603:10b6:208:43e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 14:42:47 +0000
Received: from BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::fc) by BN9PR03CA0748.outlook.office365.com
 (2603:10b6:408:110::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 14:42:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT089.mail.protection.outlook.com (10.13.176.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Tue, 6 Jun 2023 14:42:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 09:42:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 09:42:45 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 09:42:44 -0500
To: <buildroot@buildroot.org>
Date: Tue, 6 Jun 2023 15:42:37 +0100
Message-ID: <20230606144237.2802780-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT089:EE_|IA0PR12MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 84aeb50e-773c-4d4f-9edc-08db669c4b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xv3sb9LF5MdL3J0VcrbRmWamKdSRrcCfh7m1iqOJ3ABSF7FaKpfLq0sJBpANrTQOwhUpHy9Grmo9Z47nnAHTG1wubsp2Jaso0J3kX8zmW03V54yMyT2MZyn+nH1df0Ind+uvAV44B16F48t59aE+sI0QrH/PsXDTZHDGIRhXYRzWtpib3cJ1y7TqcbSlz3oSI1N1K9PfTx/7S7uW/0bjJs7wK0ie6TZy3BTVH9U0boGARXUWtvyUqlwwogoRJcJngeKqHOreu+TTJTGTcKljRVM/erTsq/JCpiwwZC4/ooW0gCNktz35t8xfFMR0YU1lHRZiMw0XckgGJL0GpsUGuvNGHO/4aueYEGRNtBN2Ilpwg/vOwrH/DZy6bbgbkSMMaFmJiugFmcr/4dAfqCc3nM96FM5qSj/1xase9aIWWlqVdb+ZGY21VNPu1mC+p9ipe1lJ1Iiu/tcrebXZlt0pyc54yBxY6uy9aiTspm83xYe6bZhXdc14k9Ox1RFU/zo45vmQyRfxX4oqlqKjL+c2UZUi6tVQOkS5tFUb+qxt1cfVpBeQ390HjFqkO/VrbUYdZjwz3AnIGsdjawoIlSs+/y0c8tjxHYhA/6ELgI1DREe8YHilCh+4ryI91AtgeLDSNGv/rnABYuuUQw0xunMHQRuE+oqTAGZ1JOMuwEZM/nswRLH7WFuIOFXKdpvmdvFpJNUn8L3I2psgDb1vitz33h4xqJjQukFIvU6D5K7O87blc8lW3Hzyq5NoBY6I0GC82kWrKvpbrYksGOA/7QHrA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(26005)(1076003)(40460700003)(40480700001)(36756003)(36860700001)(47076005)(426003)(336012)(83380400001)(86362001)(82310400005)(356005)(81166007)(2616005)(186003)(82740400003)(8936002)(41300700001)(44832011)(54906003)(2906002)(478600001)(70206006)(70586007)(6916009)(8676002)(4326008)(316002)(5660300002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 14:42:46.6045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84aeb50e-773c-4d4f-9edc-08db669c4b40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQ7RwSCRMMXdWs4JwYyqN0/4fsw/kEUjBtLXNILE3No=;
 b=VBYsy89NHi4a8qtaUOREbFtEdjS/5osLZBlEB9CFLwYVk26o4lMppiCu/BUT9yvGsO/f/Aik8CvFipPmeHtlQ95nwhfdJt07SrRvIO/ZrVwfaDXrJSInF3MR8NKKcM0zeNlFUYnAZsLyik37LD73Q8gWryKUIkCvvw6EBAoERNc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VBYsy89N
Subject: [Buildroot] [PATCH v1 1/1] board/zynq: fix shellcheck issues
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch cleans up board/zynq shellcheck issues.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .checkpackageignore      | 2 --
 board/zynq/post-build.sh | 4 ++--
 board/zynq/post-image.sh | 8 ++++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 10e70f0787..90a1481e54 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -101,8 +101,6 @@ board/udoo/common/post-build.sh Shellcheck
 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
 board/versal/post-build.sh Shellcheck
 board/versal/post-image.sh Shellcheck TrailingSpace
-board/zynq/post-build.sh Shellcheck
-board/zynq/post-image.sh Shellcheck
 board/zynqmp/kria/kv260/kv260.sh Shellcheck
 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 board/zynqmp/post-build.sh Shellcheck
diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh
index 9fd8bbf2c8..7cec673e4b 100755
--- a/board/zynq/post-build.sh
+++ b/board/zynq/post-build.sh
@@ -3,6 +3,6 @@
 # genimage will need to find the extlinux.conf
 # in the binaries directory
 
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR="$(dirname "$0")"
 
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux.conf
diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index ac74286cf6..d4553beccf 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -6,10 +6,10 @@
 
 FIRST_DT=$(sed -n \
            's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
-           ${BR2_CONFIG})
+           "${BR2_CONFIG}")
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
+[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}".dtb "${BINARIES_DIR}"/system.dtb
 
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR="$(dirname "$0")"
 
-support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
+support/scripts/genimage.sh -c "$BOARD_DIR"/genimage.cfg
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
