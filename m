Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3B9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C0B410D0;
	Sun,  1 Jan 2023 23:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58C0B410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3OMwoIOoMTt; Sun,  1 Jan 2023 23:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48BF6410BE;
	Sun,  1 Jan 2023 23:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48BF6410BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8DD11BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2264402F5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2264402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dN2LT5fz19n for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F24824018F
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F24824018F
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:09 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id i127so23834895oif.8
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYNA2xjXfvDkzPizHpGzKH5l8L/GsRV/sI4cKcOubYk=;
 b=w4nrhX3767vIjKEBDo+bsqsc0yQaPYAU0Tx/+4m9KpGKssh7PxRYxF1HcJ1DPAJWWo
 07rc7GD9PKgo9F1yQXKQ7c9fQLIqbttr436w6U7SST9S8VaiCIy/58XslXL8kLtxP49n
 r7OZ6oJMia8+vaQT87pennlfnTlGOooVe1N5UwUeB3hKqecY90nN3GmTnPIunnNMzlDY
 Ea6hbkBKlvSraPA6eZJCFqSBoMb9jTgqmlnGhGzA1BIEl9zYM4s+2pGLTyw9AHJjlD68
 rWjoVmk/CHfr8c5fDFc9eP32W2oPktB1yg4i0BBEWEZyMY7khNXX2Dd4pjbDntNFfKqq
 g95g==
X-Gm-Message-State: AFqh2koNPIy/zX2n/283vNSpnB1Z5TECxDCP+oQ0eu/qAAryTEvacHGY
 wxBdwVELJRLenrE5EK4Ntd50cidAf9c=
X-Google-Smtp-Source: AMrXdXtW1jLp0jkbxJuw6bxhXCHdC/8UWM6VtykimFTatf2I5M21OQ3n0F7dsIQMDGwQjCqqA/clFA==
X-Received: by 2002:a54:4493:0:b0:360:fc47:d7b9 with SMTP id
 v19-20020a544493000000b00360fc47d7b9mr17473992oiv.37.1672616349028; 
 Sun, 01 Jan 2023 15:39:09 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:07 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:27 -0300
Message-Id: <20230101233653.487175-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYNA2xjXfvDkzPizHpGzKH5l8L/GsRV/sI4cKcOubYk=;
 b=V9Ob23Q+WJlj0iynB50wjjdqsHGF3I/TGSzRSl4FaEexIvF9iI9KfCdb06Jel0T6Ix
 VlYgHGqW9Y4Wm+te9byUX4Add9+7Bt394c4NUOxlmT/sQyHq13LfxfMxD9xqnT8XFTVi
 5+KRwOGpUHO7/4W0F23GsAk3FUzEImdDofI+xC2BZ0YmUKymR5Pbya9pIjnrBNmzxOns
 z5IYSTXZgYE9MyZ+VWBUf8ELy26cPIFZU4VNGBWLIQRn1OfvJw8yWhuUkCsm6lzXPYjX
 tpJSkaYzA4n5mPJsSe3rHwDoobKeR7TgsQEn3Dg2FW3Ixq3U0JETstyQvNfJllBvVcHc
 T2tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V9Ob23Q+
Subject: [Buildroot] [PATCH 03/29] package/qcom-db410c-firmware: fix typo
 for <pkg>_LICENSE
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
Cc: Mike Frampton <mikeframpo@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cc: Mike Frampton <mikeframpo@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
$ make defconfig
$ make qcom-db410c-firmware-legal-info
$ cat output/legal-info/manifest.csv

before this patch:
"qcom-db410c-firmware","1034.2.1","unknown","LICENSE",
"linux-board-support-package-r1034.2.1.zip",
"https://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware","glibc
[GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)]
linux-headers [GPL-2.0] skeleton-init-common [unknown]
skeleton-init-sysv [unknown]"

after this patch:
"qcom-db410c-firmware","1034.2.1","Qualcomm firmware license","LICENSE",
"linux-board-support-package-r1034.2.1.zip",
"https://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware","glibc
[GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)]
linux-headers [GPL-2.0] skeleton-init-common [unknown]
skeleton-init-sysv [unknown]"
---
 package/qcom-db410c-firmware/qcom-db410c-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qcom-db410c-firmware/qcom-db410c-firmware.mk b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
index 9ef32cc9d4..cf4b59b72e 100644
--- a/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
+++ b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
@@ -8,7 +8,7 @@ QCOM_DB410C_FIRMWARE_VERSION = 1034.2.1
 QCOM_DB410C_FIRMWARE_BASE = linux-board-support-package-r$(QCOM_DB410C_FIRMWARE_VERSION)
 QCOM_DB410C_FIRMWARE_SOURCE = $(QCOM_DB410C_FIRMWARE_BASE).zip
 QCOM_DB410C_FIRMWARE_SITE = https://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware
-QCOM_DB410C_FIRMWARE_LICENCE = Qualcomm firmware license
+QCOM_DB410C_FIRMWARE_LICENSE = Qualcomm firmware license
 QCOM_DB410C_FIRMWARE_LICENSE_FILES = LICENSE
 QCOM_DB410C_FIRMWARE_DEPENDENCIES = host-mtools
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
