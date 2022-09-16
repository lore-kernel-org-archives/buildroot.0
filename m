Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596C4ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 18:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A673740C1C;
	Fri, 16 Sep 2022 18:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A673740C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcBDIBBNkzN9; Fri, 16 Sep 2022 18:32:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3AA1402EB;
	Fri, 16 Sep 2022 18:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3AA1402EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70C571BF3E9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 18:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58D47843A6
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 18:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58D47843A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rpMvQjBBxsn for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 18:32:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B517843A4
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B517843A4
 for <buildroot@busybox.net>; Fri, 16 Sep 2022 18:32:41 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d2so1747908wrq.2
 for <buildroot@busybox.net>; Fri, 16 Sep 2022 11:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=uKQWq4Nda7C8nGaBjy3/T2U1kflCcPCvzoOIVc7nDQs=;
 b=g/JxC+AxYZ5GdD10h8TEG/HFAy/39HlDq25A4quEBn/ggUUMCsuVpnjJLh5ZOdn751
 kvvR950XWyhzHP0cyD2eLaj9g37EV4WvH2ZQqWwzCZWeN1WH+EvcIeHYJydAHksN5Baz
 7CljaJx0vGDDANMeDomsm1eVMJjVp+6wXXOu+A3hLVOHbmo1oy+X72OeZ3H+4eCmGZAG
 xnERG7XHAIlT+teDKgATB4NMdWGZT3AvLH1ggvKLNIBaPQlIzf6pKMdPVouuSu48MmJ2
 AMEpJ3HcxW9yrWkAlg1CGmjN9nUC36MmvzDb3SlWZEfxJzwJDr7X3ee0ZhmjigH4yFFP
 UOWA==
X-Gm-Message-State: ACrzQf1k377D5UDhWsT2Mqc18EiRZCL5XQhJpz9Ev3aoEv+f+a76S99n
 voK53ojwa2YWKyUAUBosUiLn2GZ9Ykc=
X-Google-Smtp-Source: AMsMyM4ya/ghJDL+TYJ59tAbHOq0PMUq4yYVFsZafkXKlbfBNJaRCN9j+ai031KN7y1l2SNg+OsgvA==
X-Received: by 2002:adf:fb8d:0:b0:225:4d57:17a6 with SMTP id
 a13-20020adffb8d000000b002254d5717a6mr3709145wrr.251.1663353159578; 
 Fri, 16 Sep 2022 11:32:39 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a5d4f81000000b00228a6ce17b4sm5538796wru.37.2022.09.16.11.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 11:32:38 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 16 Sep 2022 20:32:31 +0200
Message-Id: <20220916183231.2710697-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=uKQWq4Nda7C8nGaBjy3/T2U1kflCcPCvzoOIVc7nDQs=;
 b=Plrf2g7y2S2JMvru9SwIu7KYsn1d5DL8MHES8Sb2vdjBsasHVWnZkoBeSz0n5XYOVn
 xsmD9V43h+5LA7J7J7LK7AhxxGo1pUO/Wqcxa9ZmFEoTOrn+SfxLYvDC90aXv+qar5tE
 j0fhgOuTeA1zGQ3GvHjJbU7LiNm+XlcCY9hGweSv7zNCNkd8YdPid+9+SXuw8Dpaan4n
 sWt+SOYogxzRhg8ToO4Ym9yAI9hXbPR+9Bvoi5DukxhNHfUboKS4e6MmxGZSLX1flZAw
 NERc9TIHvjBa03zvYrSEYS9jETxLIVmUiZ3Vim1/mhqgXcRMksKNwMem1UUzW1/8awAw
 HlZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Plrf2g7y
Subject: [Buildroot] [PATCH] ls1028ardb_defconfig: configure eno0 with DHCP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

eno0 is the main ethernet interface

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/ls1028ardb_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index b6a5a0467..22b9eb426 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -10,6 +10,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="ls1028a"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eno0"
 BR2_ROOTFS_OVERLAY="board/freescale/ls1028ardb/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
