Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334E5C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 17:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF5F409EF;
	Mon, 10 Apr 2023 17:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF5F409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzhfbGTKhEMT; Mon, 10 Apr 2023 17:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87C340AB9;
	Mon, 10 Apr 2023 17:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87C340AB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFC161BF380
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5DAD60BE2
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5DAD60BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euIhcd5dFlo0 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 17:50:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89CF60BCD
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D89CF60BCD
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 17:50:24 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id r27so7359013lfe.0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 10:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681149022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vyuU7fQ7Idg7Xu4+MEVNji6pqpN+TZmT6vtAh1t/cO0=;
 b=I/MktK7VAEshz67kLmHs41K4fQebs/llp8mnlK/F8Qs9brgDS8ZKZ9fYYPfUTzcSL2
 tmy6s3vDpf3kmXKpjlZwmIfMmRfXA+pCkSBlByfrI8lg4TKw9QERkxNFEElGnoA+aSWz
 ZxedJT9PVT4biaCY0di286mVrizhqd3yx/uAX78N6u1IZGHfRz118Q5IH+sdMNQM0mzM
 iZmkuSvtwSABnukpjUUbF0jB63LWHN1ACfCbuypQc9mHkCWS8dv0xZ1EkIH/Gyo3VE/4
 sVxz0JNUvU+j4Svr3qOSbkHchkofo7CJj/QJUFMbuOfvTVuNjiYQ0hmAebfsG7WtPi6t
 jw6g==
X-Gm-Message-State: AAQBX9fk5ZozbYPmW1Qkk2yRFiv/wV3Wr+iEugeP/Q422EdmMYex9V/V
 0XnNlAir5/8BbAzBnY9YdiKMf7qStYxY0w==
X-Google-Smtp-Source: AKy350b4oRP5Oa6Nz4wSgDF6/ogoKYIF9EKVajTEXGHjkaIRyOAFOPptZkWm2yKPR7nHc+dMeRBwYQ==
X-Received: by 2002:ac2:456f:0:b0:4e2:523:4451 with SMTP id
 k15-20020ac2456f000000b004e205234451mr3486325lfm.9.1681149022195; 
 Mon, 10 Apr 2023 10:50:22 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 a8-20020a2e9808000000b00295b842c2dbsm2343994ljj.133.2023.04.10.10.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 10:50:21 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 20:50:15 +0300
Message-Id: <20230410175018.2283807-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681149022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vyuU7fQ7Idg7Xu4+MEVNji6pqpN+TZmT6vtAh1t/cO0=;
 b=PmRk39GhvMRRarWaVFiXV8ga4nCPrSYXGfZHsHMXKL/ac5K+cGd5RTxGXYyTKf3PRu
 WvJFEnKxw+p2kLxjK6zsvxwGTBYJ7uV4w96MKxgU37XF2MMPPkr29gCf/BvNW63N8Cbe
 vGeuScXGVk0DVH8fC9jfaE53AyZcpWv+5Mq+KgrADHpPrv7C8ON4cr7ukm0rQne2thgH
 XIluvpmjYku8o81B5CnoHsC/XAjRw56u+Ipv310IDLYTq9siAiJI1Vph0KHlynTOb2KB
 6AVw2zQ6KbvIZnSVmcR42i4D0Z23J2/vPvQsTOQgk2/eMkTBQFg2AgykKkI5PlsXIcAB
 7WqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PmRk39Gh
Subject: [Buildroot] [PATCH 0/3] allwinner: second part of misc bsp updates
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Here is the second patch series with BSP updates for several Allwinner
boards. This time xradio driver and boards with WiF are updated,
including including OrangePi Zero and OrangePi Zero Plus2.

Regards,
Sergey

Sergey Matyukevich (3):
  package/xr819-xradio: bump version
  configs/orangepi_zero: bump BSP versions
  configs/orangepi_zero_plus2: update BSP versions

 configs/orangepi_zero_defconfig        | 6 +++---
 configs/orangepi_zero_plus2_defconfig  | 8 ++++----
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
