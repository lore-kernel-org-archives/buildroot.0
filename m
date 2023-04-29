Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028B0C77B60
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 20:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80D2960F8D;
	Sat, 29 Apr 2023 20:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80D2960F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8jxj4F18p6A; Sat, 29 Apr 2023 20:45:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C32E460C2C;
	Sat, 29 Apr 2023 20:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C32E460C2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8A931BF405
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 815D860C2C
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 815D860C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XUf-7Iotpmc for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 20:45:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A576460A6D
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A576460A6D
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 20:45:20 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8b766322bso10006961fa.1
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 13:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682801118; x=1685393118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZkP9Go+Wrcjjuv/D/25/zJt8CZMhZbl4OIQVGU/6/d4=;
 b=YP+qlVbHcDlAV96dZ75/6vPTvHNYpQaCzhtZR2O0BSMXVLsICjwgJ0PjNfu8yxbo2p
 1fFzr1cDFdbDPirv1OJXfOqxD41HIdma/3VEGfSmKpqItRG6TlJy92hW0AnApva+xpR0
 T/DH/YNijw/d5EQsJ5O/hsCj9A/vv2fPEyyUFIfMWi8OvpkIyoDIdlzti7w/pQErbod8
 FT8u8R/cHqkz3Cto5Am9L9M9BeJBpaa7ACVy4yBY7C3ud1kok/b7B92IFFCm906XBWoA
 8ZwOc+oo05Yytq7tgVOpY46rRqt1UNN6cNlhJe/MrmSTykuQ6e+wKf3rcTAWt7AkICkY
 OjdQ==
X-Gm-Message-State: AC+VfDw3R1qyDFGCzcXE9QpzwhRgaX8mFfnUV9hvFCJvqLoDjkA8Zd0T
 WrDmz3Gz+9t3oqEwUWi+5bOtA9nZ1+cDkw==
X-Google-Smtp-Source: ACHHUZ5YSwXToTFERUPZeoA1P+OyUCppVl7WHwvGOi4gIf7EAMTXJbg7yfP6iM/iFEPmqcHsxAMfCQ==
X-Received: by 2002:a2e:9f4b:0:b0:2a8:e670:c3cc with SMTP id
 v11-20020a2e9f4b000000b002a8e670c3ccmr2547689ljk.16.1682801117853; 
 Sat, 29 Apr 2023 13:45:17 -0700 (PDT)
Received: from localhost.localdomain ([80.211.22.60])
 by smtp.googlemail.com with ESMTPSA id
 z10-20020a2e350a000000b002a8abe6f094sm3721906ljz.104.2023.04.29.13.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 13:45:17 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 23:45:08 +0300
Message-Id: <20230429204511.750377-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682801118; x=1685393118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkP9Go+Wrcjjuv/D/25/zJt8CZMhZbl4OIQVGU/6/d4=;
 b=JlX4eC1p6h1bjwrFWbW9VOdurOA7y/qpAzKTn70/7GuvPW4It2KeqcK+gcFMlb1u31
 KQyt4da7d3HCIKh+GeAVAJ0GP+qcgi3x9tUc2aC6/LnFnIowfXZyXIX8+1jksyEqLSZ8
 OTWgDSJiQo1EgmBywYkfsaZKVfLM/Mb+gWlhiysUPEPu2hapyoN1x43lUiJ70RRIVhsX
 X0CaSkT8mHXYMVDhy2BTDruT+Xp8PhS1XNXDBa7T14YDG4XNKvSdXkpbA9uP3JIJ1a92
 Np0BGTfaMcSP/J61yoNBRlIbl2nVsURa0FWgaHLINOyi/HMT/xO8F+SMd8nxY1kNbFwX
 9NoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JlX4eC1p
Subject: [Buildroot] [PATCH 0/3] orangepi: U-Boot needs OpenSSL
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

Fix build issue reported by Buildroot CI for OrangePi One after recent
BSP updates. And while at it, also introduce the same fix for OrangePi
Zero and PC-Plus boards. Possible build issues are masked only because
Linux kernel is built before U-Boot for those specific images where
where extra kernel modules are enabled.

Sergey Matyukevich (3):
  configs: orangepi_one_defconfig: U-Boot requires OpenSSL
  configs: orangepi_zero_defconfig: U-Boot requires OpenSSL
  configs: orangepi_pc_plus_defconfig: U-Boot requires OpenSSL

 configs/orangepi_one_defconfig     | 1 +
 configs/orangepi_pc_plus_defconfig | 1 +
 configs/orangepi_zero_defconfig    | 1 +
 3 files changed, 3 insertions(+)

-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
