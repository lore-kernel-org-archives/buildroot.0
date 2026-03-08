Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DE8EA8545
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 21:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669E940B43;
	Sun,  8 Mar 2026 21:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-wFo0wvRtT7; Sun,  8 Mar 2026 21:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A5340B07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773005636;
	bh=5MphM1qZHKcHMrqQndnjvVkPWmQQayZKE50F6/v1xc4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sreslO9/eqEIV1HtJ6Dj5kydxFYw7hNZ/9ufK1iQ1me9j1K+D0V9LgrrfuMAX0RP+
	 ia395G+SENOTauD2fn3U9mJElSAyKQl/MBLl51UWke59chvxdMXi80Dtxlzt32zTnQ
	 0wzkdS2oyxLAt8VgSNMimFK+Cg95W2HIIRYuZJ+PwwtDg28Aupa9WggNwMprAuPPDg
	 beT/f9ulUMnjySuSMPgWt5qLAT6AZhMmrNcP0TiXxcq5hugxx7+GYp84mK4wzw9V9u
	 PGoHyIv1h8PkLBfTrNSlQcvreauUFJ5lYY7zWFp1+bhY79kFfzSn9oAJ3BRMgZjuGw
	 guB50StzlSfWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A5340B07;
	Sun,  8 Mar 2026 21:33:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCF60358
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2D3982300
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mabw4ocZ-GT1 for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 21:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 928A6822E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 928A6822E8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 928A6822E8
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-483a233819aso109216805e9.3
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 14:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773005631; x=1773610431;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cWh2Ezlhh5mDxzgqwotjJT3qr48f20D02795otR93Xs=;
 b=k41qNX+iC4qE9iVQGAwnE4VDOIse+b62z2nxPi4YmmO3hAEMM+JUsyO/T2U5cGJ/1f
 ifk4f/acRL/iZ1XEaucXiKWGXmbKfREdg1993jhjwEhYoAEUGAbqhkloVVLnNj0OZXhE
 4nYTuxE6LDFT7oJ8nlJHBbtEHy3GmjZc8RUJp6pTvbiogrUzUBxltN09Tdj4K/f6OIti
 wiVlUNFMYpbdQeOPq8IvfrHsUMxEkGFWBjKlqnE9aWIZBDG/Gur5gai151SvUu81+1a5
 m1f6h1gjMV05TOjfi629356WFOOZRnSpd9B1osE7Bb9i3ubZlsVOVfwk9yBK+hIB8tmN
 EGpg==
X-Gm-Message-State: AOJu0Yw1jSa7Yf8N61JOB0Fn5+t85w81wKBxPZlzLN+Ed/+lJES7i2PR
 /QryISU7ijz9GlkMzGnCgr7AVFJluAqi05FsQHieaDfrIOFisun6+99aWwHsMiq4I8IDdj/GaZ4
 0o346
X-Gm-Gg: ATEYQzwDpZrb24UEMk7q+Z/BEeGvo5PvmzSz7uFj2xpqI3RuaTGgRkjtZqrlvM1wlHs
 n4uV7TFTVGnnuUQrjTAkr7iHokSpG9+5aDZWrttK8cPDZ/N4N7WumDBFvZHVehSl2iadaJTP48L
 er4Cy7dovrqY+3hQ4f0J792v0nt3OJtRj7aFjyS7TXu+l/1NpBjjlmd0vw0QLDgfGmzkThBGphX
 x6Vnb5PeKPAI/GJS450i0iU2jU090pCAAxhvMPfLI1eXD6C876xj4fg7nm27h7EM41A48UdlKtd
 Wi5F6G8G8dGhfyruxyXbh3NPdNUaOdAUlCr7pywJobAt0CmVXr8+HksiwRKIy1cfjT4M+tYzCFh
 T2nBkdoxW5tJp/ROao63lMKTTz1Z9yzc15EZ5PZNOLKRzM+5/ZX19YKtKGW/NCXP1FT6Fp8660A
 LvD/LJmQyaWtsuHAzD0ebrVKZ/Cn8jKAf9IfR/w4YiLt55TvFZ//rqK8JYUu/6Sy+vMxy9lyI49
 vT7YraPFUINJlsSLtFk933jVw==
X-Received: by 2002:a05:600c:3b0c:b0:477:7bca:8b34 with SMTP id
 5b1f17b1804b1-48526918923mr149070105e9.6.1773005631175; 
 Sun, 08 Mar 2026 14:33:51 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb3668csm458929445e9.13.2026.03.08.14.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 14:33:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  8 Mar 2026 22:33:44 +0100
Message-ID: <20260308213348.708846-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773005631; x=1773610431; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cWh2Ezlhh5mDxzgqwotjJT3qr48f20D02795otR93Xs=;
 b=EonJAOA0pXeha9SZdjJQAbzA5GddjQSTf6q51jQv1LkMY2CuC1DWVu4Hpqzrf3MR63
 SYCJEBJFt4f1a+1iz7YLcsf+OPr5qPfbvnA/ahCipOz8YFsqC8JM1S1dZNmAEz0V/HPK
 ryJ6RQsspieOXomGyxeK9/52VLer7b6pIUxuE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=EonJAOA0
Subject: [Buildroot] [PATCH 0/4] beagleboneai64, beagley_ai,
 beagleplay BSP update
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update linux to 6.18.16 and u-boot to 2026.01 for all tree boards.
The same ATF v2.12 LTS and OP-TEE version is now used for each boards.

This series is based on a previous series introducing
BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN option [1].

[1] https://lore.kernel.org/buildroot/20260304213528.1380898-1-romain.naour@smile.fr/

Romain Naour (4):
  configs/beagleboneai64_defconfig: remove unused file hash
  configs/beagleboneai64_defconfig: bump to kernel 6.18.16
  configs/beagley_ai_defconfig: bump linux to 6.18.16 and u-boot to
    2026.01
  configs/beagleplay_defconfig: bump linux to 6.18.16 and u-boot to
    2026.01

 .../arm-trusted-firmware.hash                    |  2 --
 .../patches/linux-headers/linux-headers.hash     |  1 -
 .../beagleboneai64/patches/linux/linux.hash      |  2 +-
 .../arm-trusted-firmware.hash                    |  2 --
 .../patches/linux-headers/linux-headers.hash     |  1 -
 .../beagleplay/patches/linux/linux.hash          |  4 ++--
 .../beagleplay/patches/uboot/uboot.hash          |  2 +-
 .../patches/linux-headers/linux-headers.hash     |  1 -
 .../beagley-ai/patches/linux/linux.hash          |  4 ++--
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash |  2 +-
 .../beagley-ai/patches/uboot/uboot.hash          |  2 +-
 configs/beagleboneai64_defconfig                 |  2 +-
 configs/beagleplay_defconfig                     | 16 +++++++++-------
 configs/beagley_ai_defconfig                     |  9 +++++----
 14 files changed, 23 insertions(+), 27 deletions(-)
 delete mode 100644 board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 delete mode 120000 board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
 delete mode 100644 board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 delete mode 120000 board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash
 delete mode 120000 board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash

-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
