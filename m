Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0347FC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 20:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE9C040297;
	Sat, 12 Aug 2023 20:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE9C040297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P48325Kks_ZW; Sat, 12 Aug 2023 20:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0F5840556;
	Sat, 12 Aug 2023 20:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F5840556
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3AD71BF4E4
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C53F4052A
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C53F4052A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mv_S16NV7W05 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 20:08:26 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEC2840297
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 20:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEC2840297
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe2d218eedso28637005e9.0
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 13:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691870903; x=1692475703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+VfZWkqROf1T8oQQWJuyZNnM/AF5+NM6F0O9n+cptx4=;
 b=mCh68hU9dlYWvjhHnuixbG4NQAITVR8O/PJ/OGLhH50lvl4+4b60su8TfVp+PLnTwQ
 0HEs1izyLHtt1JuB+NzMmZ50Yd/M1tYMVjTZJ1sK+jotiXS9pFomx/4Vegtyrsn0qboI
 2LllHiWcUkIj8OHJKRPBE3ExQ4tTqAlh1dh6ygi0Y+zj3yzWv4wi1/L6w/P2WtwXPmXs
 09AgMB+5CyL4G3+kz3cFUXUulIED665c0XvSAEiXKSJ+TBe453zTeWaH1Xt9oHLJeJku
 c6oBuD1sZ9mZy/wJ+hdy2x4FGF7b7kjHNlEgrT0iqR0wIMAn4s64+OKzce7YpJuTPGbc
 GYjg==
X-Gm-Message-State: AOJu0YxtFrAMs4xkZWDjZKgreva7frqg82xEp1dFqKfwiKqx5pFb1pO2
 i2Xa88ADitktiWycJWxDE3r8hl+3Tf8=
X-Google-Smtp-Source: AGHT+IGar3jrSX0IRZV4MyYuoUsF1YJDAMokA1CycMiKNmM3/yQyov+zVwu78NxUTxS53Xx0zEDliQ==
X-Received: by 2002:a1c:ed17:0:b0:3fc:9b:9e85 with SMTP id
 l23-20020a1ced17000000b003fc009b9e85mr4071412wmh.18.1691870903083; 
 Sat, 12 Aug 2023 13:08:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e34:eca2:2100:dea8:bf43:866b:a7e4])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a05600c0b4100b003fa95f328afsm12159766wmr.29.2023.08.12.13.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Aug 2023 13:08:22 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 22:09:03 +0200
Message-ID: <20230812200908.8960-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691870903; x=1692475703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+VfZWkqROf1T8oQQWJuyZNnM/AF5+NM6F0O9n+cptx4=;
 b=GlqufcUtrAchxNjdXOpGKW863Rp2+iSi0pK659HlJPU0JQmy7aPwmyyfU5oIB2kpBA
 HXdZVQiQHzPprJjI0TM4y0tHXYUyFRPfdahJBYjMYMzOiCA+1DjgaRiYRB8mJNWipWUD
 rstqZoJSpMJafCMMHUpUXJMCVgyKgkPbj6Kkz2nmzs7grLMsTww7WPfit2E3SyeHm0oD
 qBkpT0ArwBllMt9ci84vFw9FWZOX/iMmnB/hZ1xdVh6eNZvtoHbTPS9rUQr7CDJspOha
 Jf/MfJfo9b07BgtgSZb1H1AhUzf7hwtGY6vyv0i+Cub3v4g7+5c4UKmFD5Fuya81Us7b
 lLVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GlqufcUt
Subject: [Buildroot] [PATCH v4 0/1] configs/roc_rk3399_pc: Bring back and
 update the configuration for the rockchip rk3399 built by firefly.
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
Cc: kilian.zinnecker@mail.de, Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v4 -> v3:
  * Fix DEVELOPERS file with path to `board/firefly/roc-rk3399-pc/`.
  * Clean-up the commit message.

v3 -> v2:
  * Several fixes after reviews from Thomas Petazzoni.
  * Add myself to the DEVELOPERS file.
  * Remove the binutils version from the defconfig file.
  * Set custom version of Linux to 6.1.45.
  * Ext2 size needs to be increased a little to produce the final image.
  * Fix the tag for TFA to v2.9 instead of v2.9.0.
  * Set custom version of U-Boot to 2022.04.
  * Remove U-Boot host tools.

v2 -> v1:
  * Use a more recent version of U-boot.
  * Built-tested by Kilian Zinnecker.

Roberto Medina (1):
  configs/roc_rk3399_pc: Bring back and update the configuration for the
    rockchip rk3399 built by firefly.

 DEVELOPERS                                |  4 +++
 board/firefly/roc-rk3399-pc/extlinux.conf |  4 +++
 board/firefly/roc-rk3399-pc/genimage.cfg  | 22 ++++++++++++
 board/firefly/roc-rk3399-pc/post-build.sh |  5 +++
 board/firefly/roc-rk3399-pc/readme.txt    | 40 +++++++++++++++++++++
 configs/roc_pc_rk3399_defconfig           | 42 +++++++++++++++++++++++
 6 files changed, 117 insertions(+)
 create mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf
 create mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg
 create mode 100755 board/firefly/roc-rk3399-pc/post-build.sh
 create mode 100644 board/firefly/roc-rk3399-pc/readme.txt
 create mode 100644 configs/roc_pc_rk3399_defconfig

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
