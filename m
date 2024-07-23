Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E735C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 16:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44A6060654;
	Tue, 23 Jul 2024 16:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 499WZBwvWO0Y; Tue, 23 Jul 2024 16:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 422776069A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 422776069A;
	Tue, 23 Jul 2024 16:16:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7851BF2FD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76D2E80D5B
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd76W2d_nh9l for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 16:16:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=91.207.212.93;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=79348e9772=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C4F480DCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C4F480DCE
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C4F480DCE
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 16:16:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NBiFAR026014;
 Tue, 23 Jul 2024 18:16:29 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40g2c4u3eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2024 18:16:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C2EDD40046;
 Tue, 23 Jul 2024 18:16:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A67524551A;
 Tue, 23 Jul 2024 18:16:16 +0200 (CEST)
Received: from localhost (10.48.86.128) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 23 Jul
 2024 18:16:15 +0200
From: Etienne Carriere <etienne.carriere@foss.st.com>
To: <buildroot@buildroot.org>
Date: Tue, 23 Jul 2024 18:16:11 +0200
Message-ID: <20240723161611.2729715-1-etienne.carriere@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.128]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_05,2024-07-23_02,2024-05-17_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=P8zPAQKCkbLm3FsaxozIei
 h4iD5QSNdnfkiSQ1L+qSM=; b=ewX5F3i+Qblj6jbDKrZBHmIK+scPRUlAHFInJX
 olkbeE0rpgmZsJyV+xVyvAzktx9OZE/xPbZ52OblRabzAR9rs/djpZi8WdustwJd
 WIsqEV4jFMdCD/x+3fB1bj8PevasASom48fzXc/FZl6slBMMcqbTtoudsX3PnPOs
 DwslQYThDdKSYBlFUqZ1cqc/p1jhIvzJlzwRdj/XAqqSrB+qKZl9WjlI36PLpflR
 ojXl58SfRJHQYEXELHZahh5wD+ncLCT2YCGgMiwDotqTsGh0T8uGCTi0UfW1bgdu
 vr00jZoDAFKZZJbLXBiE6mCA2ZSXJJCdsdmB4NjMuu0Pno6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.a=rsa-sha256 header.s=selector1 header.b=ewX5F3i+
Subject: [Buildroot] [PATCH 6/6] board/qemu/arm-vexpress-tz: fix typos in
 readme file
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typos in QEMU arm-vexpress-tz readme file where 'i.e.' occurrences
should be replaced with 'e.g.'.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
---
 board/qemu/arm-vexpress-tz/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index 3e84fe6391..920777afd4 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -26,7 +26,7 @@ If you want to emulate more cores, use "-smp {1|2|3|4}" to select the
 number of cores.
 
 Note: "-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic"
-brings network support that is used i.e. in OP-TEE regression tests.
+brings network support that is used e.g. in OP-TEE regression tests.
 
 
 -- Boot Details --
@@ -38,7 +38,7 @@ non-secure bootloader (BL33 stage).
 QEMU natively hosts and loads in RAM the QEMU ARM target device tree. OP-TEE
 reads and modifies its content according to OP-TEE configuration.
 
-Enable TF-A traces from LOG_LEVEL (I.e LOG_LEVEL=40) from
+Enable TF-A traces from LOG_LEVEL (e.g. LOG_LEVEL=40) from
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.
 
 
@@ -53,7 +53,7 @@ serial interface.
 The OP-TEE OS uses the QEMU second serial interface.
 
 To get the OP-TEE OS traces, append a second -serial argument after
--serial stdio in the QEMU command line. I.e, the following enables 2 serial
+-serial stdio in the QEMU command line. E.g., the following enables 2 serial
 consoles over telnet connections:
 
   cd output/images && ../host/bin/qemu-system-arm \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
