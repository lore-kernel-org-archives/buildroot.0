Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD557C369A3
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 07:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35DC381762;
	Wed, 25 Sep 2024 07:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ywt4CtmQ1bR8; Wed, 25 Sep 2024 07:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A770817E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A770817E4;
	Wed, 25 Sep 2024 07:22:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB66D1BF38D
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 07:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA9E76068A
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 07:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i00nwuffKHaM for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 07:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85E3B60630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85E3B60630
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85E3B60630
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 07:22:06 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 48P7LtI4096885
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Wed, 25 Sep 2024 15:21:55 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Sep
 2024 15:21:56 +0800
To: <buildroot@buildroot.org>
Date: Wed, 25 Sep 2024 15:21:47 +0800
Message-ID: <20240925072151.571744-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 48P7LtI4096885
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: [Buildroot] [PATCH v4 0/4] Support Andes SPI_burn tool
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
From: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Reply-To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>,
 ycliang@andestech.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds support for Andes SPI_burn tool that can be used to
update flash memory for U-Boot and OpenSBI development.

Changes v1->v2:
- Add documentation in the readme.txt
Changes v2->v3:
- Resolve comments on v2 patches: https://patchwork.ozlabs.org/project/buildroot/patch/20240904051609.2871616-2-peterlin@andestech.com/
  - Fix indentation of the help text
  - Add LICENSE file
  - Rename downloaded zip file with package version
  - Do not `make clean` before compiling
  - Add links for ICEman & AICE in andes/ae350/readme.txt
Changes v3->v4:
- Migrate to a GitHub repository where hosts the source code of SPI_burn
- Fix alphabetic order in DEVELOPERS

Yu-Chien Peter Lin (4):
  package/andes-spi-burn: new package
  configs/andes_ae350_45: Enable host-andes-spi-burn
  board/andes/ae350: uboot.config.fragment: Support loading U-Boot on
    RAM
  board/andes/ae350: readme.txt: Add SPI_burn tool instructions

 DEVELOPERS                                 |  1 +
 board/andes/ae350/readme.txt               | 43 ++++++++++++++++++++++
 board/andes/ae350/uboot.config.fragment    |  1 -
 configs/andes_ae350_45_defconfig           |  1 +
 package/Config.in.host                     |  1 +
 package/andes-spi-burn/Config.in.host      |  8 ++++
 package/andes-spi-burn/andes-spi-burn.hash |  3 ++
 package/andes-spi-burn/andes-spi-burn.mk   | 20 ++++++++++
 8 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 package/andes-spi-burn/Config.in.host
 create mode 100644 package/andes-spi-burn/andes-spi-burn.hash
 create mode 100644 package/andes-spi-burn/andes-spi-burn.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
