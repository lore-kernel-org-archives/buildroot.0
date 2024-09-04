Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53798CA0ED3
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 03:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19E5840A99;
	Wed,  4 Sep 2024 03:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2igdpKy6ukL; Wed,  4 Sep 2024 03:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1778140A95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1778140A95;
	Wed,  4 Sep 2024 03:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 676EC1BF573
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 03:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B985402AA
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 03:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXVLr6j-OYSK for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 03:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BED66402A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BED66402A9
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BED66402A9
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 03:45:45 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 4843jPp7047302
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Wed, 4 Sep 2024 11:45:25 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 11:45:25 +0800
To: <buildroot@buildroot.org>
Date: Wed, 4 Sep 2024 11:45:20 +0800
Message-ID: <20240904034520.2058647-4-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904034520.2058647-1-peterlin@andestech.com>
References: <20240904034520.2058647-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 4843jPp7047302
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: [Buildroot] [PATCH 3/3] board/andes/ae350: uboot.config.fragment:
 Support loading U-Boot on RAM
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

Do not disable SPL RAM support so the u-boot.itb programmed on
flash memory can be used.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 board/andes/ae350/uboot.config.fragment | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/andes/ae350/uboot.config.fragment b/board/andes/ae350/uboot.config.fragment
index fa38bbca3a..4497ed4c74 100644
--- a/board/andes/ae350/uboot.config.fragment
+++ b/board/andes/ae350/uboot.config.fragment
@@ -1,6 +1,5 @@
 CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_MMC=y
-# CONFIG_SPL_RAM_SUPPORT is not set
 CONFIG_SPL_OPENSBI_LOAD_ADDR=0x0
 CONFIG_SPL_OPENSBI_SCRATCH_OPTIONS=0x0
 CONFIG_DISPLAY_CPUINFO=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
