Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509FBC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 10:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE54F61036;
	Sat, 17 Sep 2022 10:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE54F61036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Be1tR1YkGpv7; Sat, 17 Sep 2022 10:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E877960C07;
	Sat, 17 Sep 2022 10:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E877960C07
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B66781BF5A4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90EE183FE4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90EE183FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QHValP45Sm0 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 10:17:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CD9F83FBB
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CD9F83FBB
 for <buildroot@busybox.net>; Sat, 17 Sep 2022 10:17:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k9so39784590wri.0
 for <buildroot@busybox.net>; Sat, 17 Sep 2022 03:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=mbero7v2XYkgCxw8QyXx1UzJJoFU5cjJ0VNGUhSJM4U=;
 b=lslge8Ttsx/3V2bk1TgCXwQ5XOkO1ciGoWrGHbWFlw7cv/o+AYFS++5AaFFi/spynr
 FX12bjnaO+AlkkFvHwjmE7R9HNg9lLgN2Ew5ZRtnLKs5UJnnoH/++T+W9P05FOjzjTPj
 0dzxVidr2HEZFZdwrur7u9oMTh9HChVPPNNZyk2EwmiYzlV6FF62aPYNGbgI8ViEDBj8
 UAM1/o1WXd5A+hx6LU6xzhVTOKLGBu5uqE/CPjRRsST1yTdCHORKtNOahDOtgEzJJTkS
 ExYIcnf/4voA6KO13QUnMt63Ywpy+CCjRRDZK0frdPJNH7nHEWbrlaBUnRWxzhVOlqRk
 fwoA==
X-Gm-Message-State: ACrzQf2xsImt3ADgN+7XEYy45KbmXLsVduu3qEOqCEoJv6dO1YyrTTJ7
 sKuT9xI+SLD1f60ujYqgq+QagUOd8lw=
X-Google-Smtp-Source: AMsMyM6OueXVAHGG/Vu90CzVbONBUUrlRRTrYD3jW3wtxAm/Djz5uD8bRQcUJ5IbvTcXw1ro+5xGfw==
X-Received: by 2002:a5d:434a:0:b0:21d:aa7e:b1bb with SMTP id
 u10-20020a5d434a000000b0021daa7eb1bbmr5557260wrr.619.1663409822500; 
 Sat, 17 Sep 2022 03:17:02 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b003b332a7bf15sm5734091wmq.7.2022.09.17.03.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 03:17:02 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 17 Sep 2022 12:16:46 +0200
Message-Id: <20220917101646.2761096-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=mbero7v2XYkgCxw8QyXx1UzJJoFU5cjJ0VNGUhSJM4U=;
 b=fi0kTITWQLlr7cjoWQqjnyL1VUPggMcKgrxQ5OdavEHfmdgbYkcekMxuRzOgpBaXBX
 Bj12xJGF5FTnVJkjto8Q01E93z4CFgiKMkpV0RxqpiVkNV6neOGGgSM8aITChomSv66h
 8ElvXsPFYnz9wMc5CXT7hZ8Q1O7d8LvazO0Py4IyU2B+nQiWwKtSZHu1TaLx2H8mm77y
 A+s/tQ3pA+QYY+qNHgkJc4IJXUmm7y51WaOAoT85a0dUMJnp6uMXJXp8Tvw9rlWqtV3W
 o+/CY49NvUeY21PXHhsEUJvHIYPH4XktcEC4GueAtSBGW8/z4p+XNsArjEVDv44KfOeC
 6Z+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fi0kTITW
Subject: [Buildroot] [PATCH] package/qoriq-cadence-dp-firmware: bump to
 version lsdk2012
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../qoriq-cadence-dp-firmware.hash                          | 6 +++---
 .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
index 88ac3db97..6e5c76146 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
-sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
-sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+sha256  e267655a47fbe118f6960bca7994bd6b8986ef955344fe006a424be96f868602  firmware-cadence-lsdk2012.bin
+sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
+sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
 sha256  53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  EULA.txt
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 8cc2200a1..2ccdd8b90 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk1909
+QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk2012
 QORIQ_CADENCE_DP_FIRMWARE_SITE = http://www.nxp.com/lgfiles/sdk/$(QORIQ_CADENCE_DP_FIRMWARE_VERSION)
 QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
