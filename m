Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E9EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 21:09:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC67610D0
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 21:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DC67610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 136EE40221;
	Thu, 21 Oct 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOAPJKvbQfEb; Thu, 21 Oct 2021 21:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F5EB401E1;
	Thu, 21 Oct 2021 21:09:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 919EE1BF4E6
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AD27605EF
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6HzkNamlzW0 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 21:09:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABC20605ED
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 21:09:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso1077118wmc.1
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6I5CPrducCNV7PyR0OgYXGRxUZFsf73ojXtozWbFYQ4=;
 b=Y1Z4mdNEZlWveMP7QrV+QqAiscLF7lpjUFJn2g8B/0P7ANBz9QN+aFu3RrUr9DgGyF
 LhvQRLbr1MNMPoYwhapPn11qkSgPHV0h2ukWqr+egzCPRqEB9rn3ajA+DGnzgpjlB+dI
 vwkz8L/7YRbmEITooV2ZfviajislON9fkU2m4+OLZmxandqYws44tRQetVYKIqE8Gik6
 39DHMhYGvhM5RLG4k3TBC5jVp7REBa2iLeUFR/TXK05w7NPV6T7I5XewIUdFOMtqp+6A
 fKqFRrEydCHqmCP3NzUx7R9QlvRgJBAgWs9tanVxE3p/KTxrhEXMCB3X1BVqi7rmZ6i1
 BAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6I5CPrducCNV7PyR0OgYXGRxUZFsf73ojXtozWbFYQ4=;
 b=3EHob2UAGSqKqD0x0G33d8qtM+2sFlmCSUdgPjTvb0BHI6FzrOBeQ3gcS9A+tS/bue
 jDP4mF7bOwC0Q9jArELVmv2FIqjnZS2Q8+CcaUxgMaoKRiru3CUuvYsamm/nOnHzWsFR
 EW2/y3sYyrX8YEb2hb6cCclpq4TUEefM9Sp2NeJdOHhFc0u3b0qmZj/IMU+vh8jh/yjy
 NZIBZ4xnPqOd3bUcbuDcaNg2VmigEiPqgUaHTl15Nnm6zmHJj7XI0wVJYFKmg+Y3t7Js
 a2CzqnMXKcz24KDiBd4RBoTC6i2sB7ZGktRrrKYB01A5DztysE9V9utYGSxCo+cT976d
 JK4w==
X-Gm-Message-State: AOAM531RTq4JU81tqd9K4k0K8jnJ6loheH4Mu/7pDtzhSo+k32qpEPpO
 /NpKXYu96FtXirSY3AyoVH8jy44EJKk=
X-Google-Smtp-Source: ABdhPJzlgyHzF1Zt4sS4tYYfbHtvmG31t24+5qzRHjWrABQ4+chbseYhNu+no/sNDpZABUOj0lkj8A==
X-Received: by 2002:a05:600c:4f53:: with SMTP id
 m19mr9315188wmq.118.1634850591708; 
 Thu, 21 Oct 2021 14:09:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id h8sm6200693wrm.27.2021.10.21.14.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:09:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 23:08:23 +0200
Message-Id: <20211021210823.148802-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the rework of boot/config
file handling in commit 689b9ac439ab7b507c8982b6102bddf59d03efbf:

/usr/bin/install: cannot stat '/home/giuliobenetti/autobuild/run/instance-3/output-1/build/rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342/boot/startx.elf': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/88b2137ea81c4944cbded11fa68adcbca02e83d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 8a6a435f63..c0beef7b42 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -13,7 +13,7 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
 RPI_FIRMWARE_FILES = \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN), bootcode.bin) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
-	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), start_x.elf fixupx.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB), start_db.elf fixup_db.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
