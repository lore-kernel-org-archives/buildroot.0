Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FF5EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 09:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1667C60BFC;
	Sun, 20 Aug 2023 09:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1667C60BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnMPqxptJGxd; Sun, 20 Aug 2023 09:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EAD260BF0;
	Sun, 20 Aug 2023 09:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EAD260BF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC57E1BF5E6
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 09:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84D2281B10
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 09:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D2281B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXBMeoU9oN2g for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 09:58:41 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 185CF81A16
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 09:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 185CF81A16
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ffa94a7a47so2257470e87.1
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 02:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692525518; x=1693130318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VGr0salNXg1Khxfoyj46jji7ux0O7lu5J/cdgx7uH5Q=;
 b=DJ7QXxV5DrFcBbRZNmLfhP3jLdflmeqv/UHJvwLWJz4i8PnDr90mOHGvzK2AtfChiu
 +vzSVtEsE3WALoUA452lqfHoKKYanXXszK9kp9WIep0pFN9lzYqzlgg1AmcjAA4zgL6z
 7+fQbjk+nyE+fbQ8vASzv6ym1/Ufxb/JEYbp7361bcJ1Rri+BKf7H2J7C307sqaQUp9P
 IyQLveuiSOxXhZ/OlpyPwtuSaRivqnAyexAiFdSSmC3uynd9z1vuwIgtXvD1VOj1TZPN
 yqUU2k75cce3hNXzn2c3yQr7AZ7pbxD/Vzvwykga0Cp++RpZLHv2YlrBVs3Nz234faoJ
 3mPg==
X-Gm-Message-State: AOJu0YxGENJkmZx8NQDgYhG4kS1vh2Ef329qJDlYu88pR/Qws/eCPDa2
 rWVbNhn5d3Hx1VTHO1A0nab4+fV7aGc=
X-Google-Smtp-Source: AGHT+IGasVLQIwLqVwMrvjMH63S01dW5SFS+Iq8LLggtdr3Jz7ixSw2IfHYffxe2C0pWc2w7m+ToNA==
X-Received: by 2002:a05:6512:78f:b0:4fb:7666:3bbf with SMTP id
 x15-20020a056512078f00b004fb76663bbfmr2386024lfr.26.1692525518131; 
 Sun, 20 Aug 2023 02:58:38 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194]) by smtp.gmail.com with ESMTPSA id
 q22-20020ac24a76000000b004ff9f88b86esm1187344lfp.308.2023.08.20.02.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 02:58:37 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 12:58:32 +0300
Message-Id: <20230820095833.602364-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692525518; x=1693130318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VGr0salNXg1Khxfoyj46jji7ux0O7lu5J/cdgx7uH5Q=;
 b=fpSQcZE9CvMEIC9cDnQfVj1MR6cDuVloPh1FFBpTd9b/gCn0cBexZyVos+J2rpI9S4
 zVfEO+b1djCXo3NRIdSHSinDCtN4rZkKz6SHQ9jW9p/lZnmjQb1F7VpT/6Wxe2U/FPsq
 nu+r0DqYQzjhHTNr/LmMstJ2taCJsYii+u6+WCwvlZTYd88932n3Z7bxzasMeD44vjhM
 3FgJdybwP8gp7ZOFEvNNmXyiOdFC7kRUGGdHg7dxShzoEA8HiPrO5OtYs2//wMjH0IJr
 gkBqV/27e1e7EPK4xygSKmZRuX2RcS7wU3vvIosBTFe8aeeNQ6cdQf3uGdmc4ha7n8q3
 zniw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fpSQcZE9
Subject: [Buildroot] [PATCH v2 0/1] package/ledmon: new package
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
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Enclosure LED Utilities

v2 changes:
 - add an entry in the DEVELOPERS file for this package
 - use "select" instead of "depends on" for For pciutils and sg3_utils
 - add patches for musl builds
 - drop "v" prefix for LEDMON_VERSION variable
 - add host-pkgconf dependency
 - add comment about licenses
 - bump ledmon version to 0.97

Maksim Kiselev (1):
  package/ledmon: new package

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 ...nstandard-on_exit-function-by-atexit.patch | 223 ++++++++++++++++++
 ...-Fix-unknown-type-name-ssize_t-error.patch |  44 ++++
 .../ledmon/0003-Add-disable-doc-option.patch  |  63 +++++
 package/ledmon/Config.in                      |  15 ++
 package/ledmon/ledmon.hash                    |   3 +
 package/ledmon/ledmon.mk                      |  18 ++
 8 files changed, 370 insertions(+)
 create mode 100644 package/ledmon/0001-Replace-nonstandard-on_exit-function-by-atexit.patch
 create mode 100644 package/ledmon/0002-Fix-unknown-type-name-ssize_t-error.patch
 create mode 100644 package/ledmon/0003-Add-disable-doc-option.patch
 create mode 100644 package/ledmon/Config.in
 create mode 100644 package/ledmon/ledmon.hash
 create mode 100644 package/ledmon/ledmon.mk

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
