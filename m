Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E5C61D97
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 22:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B266E4090E;
	Tue, 21 Nov 2023 22:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B266E4090E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eALcKwtaieQ5; Tue, 21 Nov 2023 22:07:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ECB4408FD;
	Tue, 21 Nov 2023 22:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ECB4408FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F9101BF2C5
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 22:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC81F408FD
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 22:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC81F408FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGsM5zcp3wBd for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 22:07:28 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3030408F9
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 22:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3030408F9
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso1262305e9.1
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 14:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700604445; x=1701209245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mrd1c+YhoXucaWI00iije6eDowAvCnijdCX3/5SCSqc=;
 b=DBBsXG9bgiEwz72MxJFQcMt7sE6Eill8C+WYafiJ0uhAw5g6swUP+gFDOCpqIvGzvE
 VSmJKudBrWYoJzDao5zhYdpVAtApYZj5BqwOc9bdkcUhO3K0dh7z8h12gvZ1g58rRDfU
 RmodvFiF73Khy6shiISv0Jjb//mJ/+sTju0jj2WYskuhsNCeu95IblPnB3vytYebR//k
 sMNzmszlp7QHVrUXuMQTpuOVWRnv1gpoKqXV+L6ea0iQRxaP1qc6QTtXxJtb9M/Irsti
 VDfbBCF9M/f33U2DuAg2+HZNP4C44Z27027niZrkC0e8IUh1ALu81it3r/J407XrP56B
 mdxw==
X-Gm-Message-State: AOJu0YyiYKEG1P8LvbRKqIN6JXVIuDttk8sKOXfeCLFLQ81LK1vhOlXB
 bOVt4ieHb7H0Z7cF7p1dk1WEn1qRzJ8=
X-Google-Smtp-Source: AGHT+IHxINqC3udmTHj5vmgP7+fCSoh4PZ3R9p67kfF5jqplIsZaOSfUeXaWUAomyd/rNno/6Vk0yw==
X-Received: by 2002:a1c:7902:0:b0:405:3ab3:e640 with SMTP id
 l2-20020a1c7902000000b004053ab3e640mr3361518wme.20.1700604444779; 
 Tue, 21 Nov 2023 14:07:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b0040651505684sm41031wmo.29.2023.11.21.14.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 14:07:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 23:07:06 +0100
Message-ID: <20231121220706.506553-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700604445; x=1701209245; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mrd1c+YhoXucaWI00iije6eDowAvCnijdCX3/5SCSqc=;
 b=gl6BQV/WWUXqlrcARu+23cBIPY9qAGho5mdtB0fgODkSqtx9CnKLPLiPUHskUD6OWP
 +bBMXR3Bds6+FX/Z7nlPhpHbROX1yHOPMIOTMvHAqcBj4uzx0icf6FmzL5/CJPi+c7G2
 RRgaBLx0D8L2JH1dCtGWKPpK1DJxDAklD7qpGz83RDnbVGqBvtJA9tJUz1A7bjATVd+T
 zShQNlu5w04Ux0sDdHmHrla9G7qKaE28yGJVdePWBLL3R6mZqx0gJZNEp616gG8FebsO
 pFKUKIhDfYlN4n0zdGIF2+zNWvkKFWUN7I+QqiUYownbhzFNPKp9uGCyvQJ4Dhfj9xcR
 vDtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gl6BQV/W
Subject: [Buildroot] [PATCH 1/1] package/libblockdev: drop unrecognized
 options
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following options were wrongly kept when bumping to version 3.0.3 in
commit 18420d9b6b424492741cba495cc2e7a28a409e8b:
 - dmraid (dropped since
   https://github.com/storaged-project/libblockdev/commit/d174944a85169efae3bac0b6e76498e3d0c6c240)
 - bcache and kbd (dropped since
   https://github.com/storaged-project/libblockdev/commit/c1ff1c87e31fb2820a5694637eb221f590eb9451)
 - python2 (dropped since
   https://github.com/storaged-project/libblockdev/commit/8fc33b834529d3d18a73112e4c77ea0a5d26d62c)
 - vdo (dropped since
   https://github.com/storaged-project/libblockdev/commit/e51faac2a952da33925e3ccab0f4f0fdf3986cd3)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libblockdev/libblockdev.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 3bbc221cc5..e0fca2b95c 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -16,20 +16,15 @@ LIBBLOCKDEV_AUTORECONF = YES
 LIBBLOCKDEV_CONF_OPTS = \
 	--disable-introspection \
 	--with-loop \
-	--without-bcache \
 	--without-btrfs \
 	--without-dm \
-	--without-dmraid \
 	--without-escrow \
-	--without-kbd \
 	--without-lvm_dbus \
 	--without-mpath \
 	--without-nvdimm \
-	--without-python2 \
 	--without-python3 \
 	--without-s390 \
-	--without-tools \
-	--without-vdo
+	--without-tools
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_CRYPTO),y)
 LIBBLOCKDEV_DEPENDENCIES += cryptsetup keyutils
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
