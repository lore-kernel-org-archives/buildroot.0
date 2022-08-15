Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF7EC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951DE40990;
	Mon, 15 Aug 2022 16:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951DE40990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qt7BGuq32X1k; Mon, 15 Aug 2022 16:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F95240928;
	Mon, 15 Aug 2022 16:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F95240928
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28C231BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1082A81761
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1082A81761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJZwQazJRVI1 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:57:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A65EC8175E
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A65EC8175E
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 16:57:21 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso8074311wma.2
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 09:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=0g3uJ7CmoiyCw8PxbmX2jDXdK5wCe7NDND0NoDvRAM0=;
 b=VkVluzf0JLkKqbyUWa3yuCrPjaiYr67vfQYEojhoso4bWfZjbl1ataslo0KeTR4L0v
 IHCJjjbPL8suoIUDuvj+Mi3bWbeAjGMh3V14M68kAaK7/L7xEuBUfZpp8Vcv+7A8v8Ga
 78S768sT0Y2ey569+PUorVQLVNZNOL2u4CgRawhJLK1H/unc46S6JDSuhaCGGQSZXaz+
 0dyfygexuXsNVM74q/IJBTR+i3NSntDKe+kTt+eF/MxGRlhdWtt9Gk53TxxpUNaBYXWI
 +wXNv/K//SLhmAijTT5VIgya38Q1eeVat+TjFyh+3/ZAMdKjjzLPga1PBgJ86wAMMAwZ
 GEGA==
X-Gm-Message-State: ACgBeo1C9BKSs5Xl4hbTfkFSKj1lkDE0UfbJBjMUqqZkbvsTKI8DMI2x
 LkMrJ374p7KQCulihFCREX0emY30ZWI=
X-Google-Smtp-Source: AA6agR6Wz0d5jKkJ65zGSimgwau4fwS1wBakjN+5D7ek7HS/egg4SjQfYc/9/KGdK0L4x2+jjL9SnQ==
X-Received: by 2002:a05:600c:6028:b0:3a6:3cf:265c with SMTP id
 az40-20020a05600c602800b003a603cf265cmr577079wmb.83.1660582639555; 
 Mon, 15 Aug 2022 09:57:19 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb43000000b00222d512d96asm7905989wrs.75.2022.08.15.09.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 09:57:19 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 15 Aug 2022 18:56:29 +0200
Message-Id: <20220815165632.1278597-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=0g3uJ7CmoiyCw8PxbmX2jDXdK5wCe7NDND0NoDvRAM0=;
 b=loucOqsNhFKgn1mTQeKeaMMK2vb5LWWS7JvHhYR0EzXerYmx2rqFXZATDWNd9Kcbor
 DUpAQ7DN+00DNMaLZ+kJCzQN7ZjZ9y9XsePrlyH1oGLBobj0rnwb1xH7QRydZ8yDHTGw
 XXHYLYxP/BZU48EOGqkVIKo7OXgjMKnlmfpg5LwMsh6j5u1FgF0SfBl4Sc2+bccINBX3
 Maf5do3R70+UbA/soII8EtknzTgc4BT2BwEBUWUcnSWBow1muaYCmJ+RprCpX7m1prTA
 +tvE1cFtGWt7ZorZfuni57Vtk3jvFxXrMN0neImCgQZAZJb83fvExznRrH7uTNn0xe50
 wHSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=loucOqsN
Subject: [Buildroot] [PATCH 1/4] package/qoriq-cadence-dp-firmware: fix
 license info
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
 .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash  | 2 ++
 .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk    | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
index d302d9278..88ac3db97 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -1,3 +1,5 @@
 # Locally calculated
 sha256  5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
 sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+sha256  53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  EULA.txt
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 23643d24e..7d701c4ac 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -7,8 +7,8 @@
 QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk1909
 QORIQ_CADENCE_DP_FIRMWARE_SITE = http://www.nxp.com/lgfiles/sdk/$(QORIQ_CADENCE_DP_FIRMWARE_VERSION)
 QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
-QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP-Binary-EULA
-QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING
+QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
+QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING EULA EULA.txt
 QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
