Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7515C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FA3B60B4E;
	Thu,  8 Dec 2022 21:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FA3B60B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aFNVAAbXGcF; Thu,  8 Dec 2022 21:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BE8060B3A;
	Thu,  8 Dec 2022 21:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BE8060B3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 752111BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C895820EA
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C895820EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ww4Ovu4-eg5 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:11:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F860820E8
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F860820E8
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:11:19 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id vv4so6992441ejc.2
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:to:subject:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2UhacGJAO83zMHlZFrO24lcp1n8wqhBkTi3s0by7kMQ=;
 b=mCgk59GHoQx5MhHVy0t/LMKzV+APxH82uSaQEBY3e41sAoc13+hoFoJXqh0fyCImpw
 aNkZV38ZD2J2d1nzT/ocVxJ5eNh2ra7m7TTK+t1EKXIPckN5ulJrgSlkD/2stXy1Stqe
 xu5nL4GErFgDBiUXukUlzk6UHniNNOb5Y9nEuR9xTKDgsUtj62bnCVUUnwmoWy3y6tl/
 V0fwPdrwkZJhY3jTuXbD2fLKlH8iIFfdI11H8Tbt/QEDuCQMxSnOdrXvFFSNffEoDvZA
 D6GP3jv0l+a/SornGjZZNJMa+PLPyQ0HZUWp7DUYmJl2s0twoSSLY1IjX1Y3RHm5HAP7
 MxwA==
X-Gm-Message-State: ANoB5pkgO8kVUxwJ57n7nnYfJoC73eSuKGMNfC998R8kcktEC+17ar24
 SxmpIhroIQ5M4bw/LukONzf28N006Joqoej+8vQ=
X-Google-Smtp-Source: AA0mqf6AfhL6ZDP+HdQpGGsd/6cVrco/OtIgLJmzK2mdYCB7oeseFa/maFCsaHAXY7en6s9m8NYqRg==
X-Received: by 2002:a17:906:a3c1:b0:7ad:7d4a:ebfd with SMTP id
 ca1-20020a170906a3c100b007ad7d4aebfdmr2722333ejb.62.1670533877542; 
 Thu, 08 Dec 2022 13:11:17 -0800 (PST)
Received: from [10.0.0.222] (5.186.52.63.static.fibianet.dk. [5.186.52.63])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a17090630cc00b007c0bc6860a0sm8279738ejb.37.2022.12.08.13.11.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:11:16 -0800 (PST)
Date: Thu, 08 Dec 2022 22:11:10 +0100
From: Stephan Henningsen <stephan@asklandd.dk>
To: buildroot@buildroot.org
Message-Id: <M6CLMR.WAXSW1IX7UPU3@asklandd.dk>
X-Mailer: geary/43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:to:subject:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2UhacGJAO83zMHlZFrO24lcp1n8wqhBkTi3s0by7kMQ=;
 b=1aMQLS+QNRuHewc6xjYLZhPJkGufYSdDTN/avJeMuj+drNcxx3h0MN+BgDoXv5arsI
 sFMmacneQRXp+x/+VFK01a8nTIsDUAvvXKZMx4Lx4op46xLQlAqhkf2G0cMdZ54cRfUU
 pPQq04LrNRJjuNlgER4p+n1DhONT3gkRMTN9aDyCsnTs2e6m6dV74W5oysSScy8LVbUj
 4Y/v7ZDQLjquYzXNOd1p+UpxfPwLyvJTQhBeu3C6U5x5EDg0f4oHFm9XVQ0xsgDjDyyt
 HfP4TJdy8/grDobK4BRKVFVrPUwuHD6cE3cztxONnPEb4bnyKe8SbRsozUCycx32h5Ty
 mRNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=asklandd-dk.20210112.gappssmtp.com
 header.i=@asklandd-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1aMQLS+Q
Subject: [Buildroot] linux-firmware-add-intel-6e.patch
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Config.in: add option for installing firmware files for Intel 6/6E 
devices
linux-firmware.mk: add target for installing firmware files for Intel 
6/6E devices

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>

diff -purN linux-firmware.orig/Config.in linux-firmware/Config.in
--- linux-firmware.orig/Config.in 2022-12-08 21:35:15.051696882 +0100
+++ linux-firmware/Config.in 2022-12-08 21:45:49.730000447 +0100
@@ -268,6 +268,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIF
    Firmware files for the Intel Wifi 9xxx devices supported by
    the iwlwifi kernel driver.

+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E
+ bool "Intel iwlwifi Wi-Fi 6/6E
+ help
+ Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devices
+ supported by the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
  bool "Libertas SD 8686 v8"
  help
diff -purN linux-firmware.orig/linux-firmware.mk 
linux-firmware/linux-firmware.mk
--- linux-firmware.orig/linux-firmware.mk 2022-12-08 21:35:15.051696882 
+0100
+++ linux-firmware/linux-firmware.mk 2022-12-08 21:45:09.536584391 +0100
@@ -514,6 +514,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-9???-*.u
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif

+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
+LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
 LINUX_FIRMWARE_FILES += tigon/*
 # No license file; the license is in the file WHENCE



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
