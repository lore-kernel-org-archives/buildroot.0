Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619ABCA0ED3
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 05:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F01F81118;
	Wed,  4 Sep 2024 05:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9NHbs--j51o; Wed,  4 Sep 2024 05:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B9B481013
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B9B481013;
	Wed,  4 Sep 2024 05:17:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3C81BF3D5
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 05:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6778D81100
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 05:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXmyd0sk9wzz for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 05:16:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BF3280D09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BF3280D09
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BF3280D09
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 05:16:59 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 4845GEDc010601
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Wed, 4 Sep 2024 13:16:14 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 13:16:14 +0800
To: <buildroot@buildroot.org>
Date: Wed, 4 Sep 2024 13:16:05 +0800
Message-ID: <20240904051609.2871616-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 4845GEDc010601
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: [Buildroot] [PATCH v2 0/4] Support Andes SPI_burn tool
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

Yu Chien Peter Lin (4):
  package: andes-spi-burn: new package
  configs/andes_ae350_45: Enable host-andes-spi-burn
  board/andes/ae350: uboot.config.fragment: Support loading U-Boot on
    RAM
  board/andes/ae350: readme.txt: Add SPI_burn tool instructions

 DEVELOPERS                                 |  1 +
 board/andes/ae350/readme.txt               | 39 ++++++++++++++++++++++
 board/andes/ae350/uboot.config.fragment    |  1 -
 configs/andes_ae350_45_defconfig           |  1 +
 package/Config.in.host                     |  1 +
 package/andes-spi-burn/Config.in.host      |  8 +++++
 package/andes-spi-burn/andes-spi-burn.hash |  2 ++
 package/andes-spi-burn/andes-spi-burn.mk   | 25 ++++++++++++++
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
