Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E10C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 04:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 067D460BD4;
	Mon, 22 Aug 2022 04:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 067D460BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UFJL6in8eMI; Mon, 22 Aug 2022 04:52:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E6B60B3D;
	Mon, 22 Aug 2022 04:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32E6B60B3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC5EC1BF5A1
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 04:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0E4781AF5
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 04:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E4781AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aC0GTR6hrYPR for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 04:52:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78EC381AEA
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78EC381AEA
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 04:52:08 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id w129so4963068vkg.10
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 21:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=IJC/zt2hOHzqkhYh2C6+TMQqJQ4UFXyaCAkyoZQeemY=;
 b=2Lde/XG5MCTowMrvekDfRYfAMFMt33+CEYj9NFV8E1Lr2k5QKgAWJGz8m42PvMLVr9
 FSLiqHgHTyh2LhqYLTupjsLjeMPeLMQWyusl8mjBMKdo4sXI/Ym5Y1APQv0FYY621xxg
 rymB5yBJnJ+DjitkasWq5940mMi27gYLq3wEqb0NWA21/8Nzj8GzC4MwV3SATvYDvdsp
 i2hgRlydfG2E/hAITxm1tMl41NgN7gZuQW/VvCRWoK7h1DS9djkuzC0B2P3TZPTJ5rGd
 307fZ4yaYf07cSHh+lWPnXi88t7knC+H87v+GFHuFnOCNiDA5E+9t/1fFF/zEnrSfTPu
 Rmmg==
X-Gm-Message-State: ACgBeo3SA+5BS4xRiZM2RmdDHDoypfHc+bO1bHpUES099lddBzMLlEpN
 gSrBbIwNOoEl6Xw/aV0f4jq0NsjYUXzFtw==
X-Google-Smtp-Source: AA6agR7E3wABdmF51xcGC9x+6ligsGllzcPO69NLzxlgxioiqfw3Oc4wTWUUwIzp9DIAbRqa9hTATQ==
X-Received: by 2002:a1f:6e42:0:b0:384:cbd3:bcad with SMTP id
 j63-20020a1f6e42000000b00384cbd3bcadmr6411654vkc.40.1661143927142; 
 Sun, 21 Aug 2022 21:52:07 -0700 (PDT)
Received: from rawyouth.ads.eso.org (pacol70.hq.eso.org. [134.171.6.24])
 by smtp.gmail.com with ESMTPSA id
 125-20020a1f1383000000b0037703f67014sm8693719vkt.46.2022.08.21.21.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 21:52:06 -0700 (PDT)
From: Federico Pellegrin <fede@evolware.org>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 06:51:49 +0200
Message-Id: <20220822045149.13931-1-fede@evolware.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=IJC/zt2hOHzqkhYh2C6+TMQqJQ4UFXyaCAkyoZQeemY=;
 b=l5hb8ZzsXEsPwt/ShBQRj2h77Rh8sHmZadfqJZ1nR8kQMqL0Qq5iHEWB90Erhf0tEA
 4IUfutyf4mSoKhn/PoYbKL9kKhGoMSGVQ8hvnHa8JIqbwE4bZcyRLbFvoB0mTrTzDacE
 Slug6MkK6LmQfvSuY1qtM0IB47HahNst2oqn/RdF5QpeVSXInUdD6wA0YtV6EQ2qJH2F
 SCnPmVcqo4yvTb7uTwsIaoGffzTmzgudzCnL5/LUZrXxljSuNRTXq1xv0kdpdmGtL7hm
 kyV+o+D1VfbFAthRK8atGicJAj/5IDaIR0p9Wq/OVaMqcyqS1ltWdd8gu50MqnFlLwlE
 Frag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l5hb8Zzs
Subject: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.25
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
Cc: Federico Pellegrin <fede@evolware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.spinics.net/lists/kexec/msg29887.html

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index dcf661cce4..34e17339b9 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256  af230ce6430deb6c2ab35762f8028888ac9d6ebefc2c4c83224a9c109143c0e8  kexec-tools-2.0.24.tar.xz
+sha256  7ce2e5def38ec04f79feb107d02243dd586fbc68569eccf02f44bad3a13ec07d  kexec-tools-2.0.25.tar.xz
 # locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index c08a9155f2..ced7009ed3 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.24
+KEXEC_VERSION = 2.0.25
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
