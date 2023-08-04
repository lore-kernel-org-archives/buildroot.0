Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1479FC04A6A
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 06:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95EA641868;
	Fri,  4 Aug 2023 06:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95EA641868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MtV3Yx7CQsWE; Fri,  4 Aug 2023 06:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAE4F41C3D;
	Fri,  4 Aug 2023 06:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE4F41C3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D50D01BF2F2
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 06:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96CCC83AD1
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 06:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CCC83AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfiHgHH3qo5u for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 06:20:21 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E34084032
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 06:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E34084032
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgTrclP963h7M9BJaW0U6ktOLFb9t3/c1HP2qF4uRGhwBT6vL4Fm3JTi/SIzJoMpoaMbVyK0WoQaLRD71rA6S4oiN+VwTn8ziNpiL60kPqPFcPaMOShF78meEa2prmUfY3Tqp0JZVWL+sscYqgxe+oqy3HU0DHflzvaGQfkhv1fXFqM30mjZN494CzYoetq2wwXCCD0JegdEamk7ezSOyMedTQJt6Je/XAvAyO6BBXUUnwrNKyRQ90B1hSl7bECJSfBrTPfm42QxXTbnjJp7XKcsN8SXWYkOY8+p10S8KNGJQXKbTCo3+5FPGLlNcgmdmeBmIkNVXouXVXk4VCsPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt9YdPVMPkZ59Mr+bA78MmxmCmR5DGj9Pz0SFEP80Ps=;
 b=jn+flZiQY/iGyoknxQ9M0q9LQx4BPtB0urnkMBt2jUEQdmDaW40PJIu+DrTN1q/8GMgm02aNhssx1va2rH13NhlxnvcNCo4GKRQTMNr1GUwIICA0KyXzqw0AtlP4woZs6P8A/SPqsgSY2/46xJlvRdcB/np3kjsRTu6kyQ2gJ842iXo4NaNWUc6oiErh5kdp5jq4hs0lnkGBHLQa/sv9t7ZmF0YnlWrOw59nPInN4+ynRE3XhiadQFEX6rOPZSizFpZFQGXl8Apngw1m25JSRSAEDrZXv9wPWhpGfZfGyAvCSeTQCJpWojGNYtMKPv9XTfNE/ViPxlRobneNNKsDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR15CA0255.namprd15.prod.outlook.com (2603:10b6:930:66::25)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:20:16 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:66:cafe::72) by CY5PR15CA0255.outlook.office365.com
 (2603:10b6:930:66::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21 via Frontend
 Transport; Fri, 4 Aug 2023 06:20:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Fri, 4 Aug 2023 06:20:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 01:20:15 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 4 Aug 2023 01:20:14 -0500
To: <buildroot@buildroot.org>
Date: Fri, 4 Aug 2023 07:20:06 +0100
Message-ID: <20230804062006.2398819-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f086fc-817e-4e46-5992-08db94b2de59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nAFFCqpBmx8WFLlBlsGn8wSfQWSE3INQd1DV1GLlv8peU+hwniBj+J8Fm9RgQcYRWKQczq7B6E8HTnMEMK0Lzac3I7xyIB4FBLW7jXHGbjv/jx4UBrW6AgR8vBNbk+1Ie5oEd80qfzE3Dgyfl/Z54NNk4kcq3r93c9578/f/B1QzNniZ6A3WhLOAewviuBMVgh7OB9a0w1eJ9tnmU4br/kC4KFRm6vSzWoTj7Oy5SLoCpBMEyKVWJ5zZsei4BG1XZZKU0puSC7O+7MB4pXRQUEJsEYFWGcvGXtBsEZAzvDupUPP3utGlWYDldCGlWfhxJL8SfZjtwSvHMYERRyCIY0PN2SdJX43kRN9C+XVo4oXnzk1ShIBvsxcxprACBqhA9U0QRXuUXQT2xOg5BokF7y/IohgMj7wOHdoIl7JOguKEr39z0kvFpkCPOejPJ1z5VSfaZ1rhpk1YXBozwwFp1vvemQ1VBbb1kz8gpoblqrncKKL2DbwSdq//D3t1UeN6IHooYcdczswH7RZ9prsjs5rqvNxDm5T4d2tnW7tfO4zEuEwk17DWzwEa0Uu3xmXC9aOBoc+Hk+BqfOmJLshqIeOALHoF5IrJT1CRW2pgB5Tv2/6timwvo43XBGAd2XLtEGTvgCY1YfjXe1telRcmHumNvqvEKsG+VmTsgJHTK31iaV8/LnFPWLBd8TTSxhSk7jWHamTZfqRHO3/V+kyDk+G+IZBfbAr9SbZ+NerNT33NSsGjBhFdQ/cWopAG4dAd/ebGqtPccgfbHmaMv3N9KQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(1800799003)(186006)(82310400008)(40470700004)(46966006)(36840700001)(36756003)(82740400003)(86362001)(40460700003)(40480700001)(54906003)(478600001)(81166007)(356005)(47076005)(1076003)(426003)(2616005)(83380400001)(336012)(26005)(6666004)(41300700001)(8936002)(8676002)(6916009)(4326008)(70586007)(44832011)(316002)(36860700001)(5660300002)(2906002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:20:15.7450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f086fc-817e-4e46-5992-08db94b2de59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt9YdPVMPkZ59Mr+bA78MmxmCmR5DGj9Pz0SFEP80Ps=;
 b=0f0rCZ99T1ReGy7EZ5+PDtbluqVYHKrIG0xbaw2q8mZBu3gtnJ5YvQ3u4Whme0UNED47FOj9ri2zgiye1Kgm9MQ+7QuSTwDCSKkxruV2vVyj9QQ46dIakziw8Eo/uOctJzh6i9eMoA4WX3Tg4UZGTBb0gf7Nyl887MrAgKGqusI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0f0rCZ99
Subject: [Buildroot] [PATCH v2 1/1] board/versal: clean shellcheck issues
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch cleans up the shellcheck issues in the versal post scripts.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - Removed " from lines within the cat command as they are not needed
    to clear the shellcheck issues.
---
 .checkpackageignore        |  2 --
 board/versal/post-build.sh |  5 ++---
 board/versal/post-image.sh | 14 +++++++-------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f846cc7a87..f612dfae4d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -99,8 +99,6 @@ board/technologic/ts4900/post-image.sh Shellcheck
 board/toradex/apalis-imx6/post-image.sh Shellcheck
 board/udoo/common/post-build.sh Shellcheck
 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
-board/versal/post-build.sh Shellcheck
-board/versal/post-image.sh Shellcheck TrailingSpace
 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
 boot/at91bootstrap/0001-eabi-fix.patch Upstream
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
index ff8f8a6071..ed08ea2d49 100755
--- a/board/versal/post-build.sh
+++ b/board/versal/post-build.sh
@@ -3,9 +3,8 @@
 # genimage will need to find the extlinux.conf
 # in the binaries directory
 
-BOARD_DIR="$(dirname $0)"
-CONSOLE=$2
-ROOT=$3
+CONSOLE="$2"
+ROOT="$3"
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 92e65ed3b7..1d9802c34d 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -6,12 +6,12 @@
 
 FIRST_DT=$(sed -nr \
                -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               ${BR2_CONFIG})
+               "${BR2_CONFIG}")
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
+[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
 
-BOARD_DIR="$(dirname $0)"
-BOARD_NAME=$4
+BOARD_DIR="$(dirname "$0")"
+BOARD_NAME="$4"
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
@@ -23,7 +23,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
 	  }
 	  image {
-	    id = 0x1c000000, name=apu_subsystem 
+	    id = 0x1c000000, name=apu_subsystem
 	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/u-boot.dtb }
 	    { core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
 	    { core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
@@ -31,5 +31,5 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	}
 	__HEADER_EOF
 
-${HOST_DIR}/bin/bootgen -arch versal -image ${BINARIES_DIR}/bootgen.bif -o ${BINARIES_DIR}/boot.bin -w on
-support/scripts/genimage.sh -c ${BOARD_DIR}/genimage.cfg
+"${HOST_DIR}/bin/bootgen" -arch versal -image "${BINARIES_DIR}/bootgen.bif" -o "${BINARIES_DIR}/boot.bin" -w on
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
