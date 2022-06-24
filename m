Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F47C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Jun 2022 14:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB1D784574;
	Fri, 24 Jun 2022 14:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB1D784574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uC-FbckaAOEP; Fri, 24 Jun 2022 14:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2E9684523;
	Fri, 24 Jun 2022 14:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E9684523
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4685E1BF40F
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 14:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F62541BA4
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 14:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F62541BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dy_BrMgGY7-c for <buildroot@lists.busybox.net>;
 Fri, 24 Jun 2022 14:08:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49B3641552
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49B3641552
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 14:08:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n185so1373995wmn.4
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 07:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TD0fwCdWlwBu8DdrAeh7tMBTKa7WW6x9uVR7+mCb9KM=;
 b=MwL3pkX4ig7yvAMq728y7Zq/f+IwNbAcKcWstuFN00B9gIOSa5ifEHTNjllbXxipW9
 u2MpQdzOCzcUalo+JrXW/MgeGK8L4rT3NQPQeqMCM5xNna7ljCa4cq9J5bE6543w92Rf
 kWGQlgu/p8iz2KezlZmr0yCyNmEvLuIiulcFDmk8Z8gLtGTKNqw16Hl14clr+cUGsjxM
 LtFeeo162jShEcZY9XCw54xDFrEISZL2m8y5cT7i239Cg3SKw9USxSO8GMUf2BIobt6c
 0X3sM6r7A9T/j/nnZ+tk08aNekXr8JxaVuSsIHuEhuOv+43O641q/X4dY5MYDiNZ048o
 srbQ==
X-Gm-Message-State: AJIora8jj5c+wDcsbdWfrHpafc8rhJZ+u7dWmYnQYM0TApANmJ0N8q2l
 QpHSqE4rQw66ldYH4UXtN/h70mSLwYkQruKM
X-Google-Smtp-Source: AGRyM1uq2n6LWgT117CXY93Vk48LIhprDnexBGGwDCWRhLwoEl4uRugLX8b6l3odXqa5OgZyuawVCQ==
X-Received: by 2002:a7b:c456:0:b0:39c:5d1e:661d with SMTP id
 l22-20020a7bc456000000b0039c5d1e661dmr4024725wmi.15.1656079682603; 
 Fri, 24 Jun 2022 07:08:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:61bc:9e00:725c:af7c:8d:b8e5])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a5d5105000000b0021b88ec99cesm2354008wrt.94.2022.06.24.07.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 07:07:59 -0700 (PDT)
From: vsvoboda@forkoder.eu
To: buildroot@buildroot.org
Date: Fri, 24 Jun 2022 16:07:40 +0200
Message-Id: <20220624140742.78223-1-vsvoboda@forkoder.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forkoder-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TD0fwCdWlwBu8DdrAeh7tMBTKa7WW6x9uVR7+mCb9KM=;
 b=6i3SN9x8m0EQOcfp1/tmEQ4PX3QFzyaHAtNpFWCcK0RMZ9C7kv+SRXS9RxlLKKd/xn
 yvidrhpzZjfPyucbyLhESaUvFfwkBHbSFVXk0RU9elduxbTxb5x1iYpk9hkGmxi7lRCY
 9IwRdr/cNeDC0rjjN/XpJFL5Z8h0Ndh/viL1J/rCex0v2yuyUelK2PMg983IOpcNmaaZ
 0HHViTv8QMkBaTn7Kh/zjuSLs0819fI9B0GX+eyxIWMZxwiwcK5I3mlx4hbxmixdsFJt
 yQ+n8ykXPnfmsnrfwXFCDOn07KykrX+kSNWJXU9uFGYLQpt0kL0AwjvA7i2P2WB3SsNT
 q+xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=forkoder-eu.20210112.gappssmtp.com
 header.i=@forkoder-eu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=6i3SN9x8
Subject: [Buildroot] [PATCH 1/2] fs/ext2: add option for zstd compression
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
Cc: Vladimir Svoboda <vsvoboda@forkoder.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vladimir Svoboda <vsvoboda@forkoder.eu>

Signed-off-by: Vladimir Svoboda <vsvoboda@forkoder.eu>
---
 fs/ext2/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index 333ead95fe..705446df57 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -131,6 +131,11 @@ config BR2_TARGET_ROOTFS_EXT2_XZ
 	help
 	  Do compress the ext2 filesystem with xz.
 
+config BR2_TARGET_ROOTFS_EXT2_ZSTD
+	bool "zstd"
+	help
+	  Do compress the ext2 filesystem with zstd.
+
 endchoice
 
 endif # BR2_TARGET_ROOTFS_EXT2
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
