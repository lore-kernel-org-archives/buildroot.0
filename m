Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91BECC6B39
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 15:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5231E80DE4;
	Thu, 15 Oct 2026 15:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzyH1DXfKKuC; Thu, 15 Oct 2026 15:15:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E66280F39
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792077351;
	b=CoLZKxG0c5wiWzZ/D0d+AWDqaXP2tXTYe7RhXSNOPdEWlx06ScycckO4L9NY0YHpMkX/
	 BUzRNhVAjAA8Jn4hs35LfGXnDSidZnAL4cTHodcdeqKKNKHa4OXZ3Y+rFYYLULzn8SEcF
	 reNBgAfKrmOjWJlMdC4y6jDqYNL5SV7EmWAeugK8uBsB+d4K7rrcLDihJseQ7xXdRgvKq
	 imOhi+mNPTUjdrtc+6XGphgK5WbU8NG8C180bTIG4cTJGV4JyiuYyMKwRmmLaQ2ZlTt2w
	 tnKhKpM23hNt2ZyWzRiM+Utkj6DmYKw8yCirz1H4/sYKDwh2sCxwMmi0xImJ0UE52qQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792077351;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4xCF3mhrfCkOlPzWsNS11dfoiUP6CwRTcnQBZ/LemTE=;
	b=EV5Co1uIySbu7/PfS3RfliyHDw7cfpgxCn9B9bRy/T29Nojir5+xu8Vkjzvpt66jqPki
	 tEYdpTD8OM3cO4xNe8eAIn/oA6EhopRkwOGse0pFmdDvuwyfFNCpA6VaSZuhvwX3N7Oc+
	 JUROHwg4xZasmDFHHiy7J6ZWopFz6dfD+ksF+NGh9xC4oy9rb+o0aq81gLP4RoM2rPi32
	 UfU3yUo/RIl68vvHzKJyaq3eZR1K6+QImOfVXfmo5zuxbWUQKEsCdT0qv2p0DsE7XC2K9
	 VKH/UHBW9P9WfMmSkSphdxjuCzsbMaL4R0+WQ7h0TwG3BC+iW/zjf1I8STNVo1vg/iA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792077351;
	bh=4xCF3mhrfCkOlPzWsNS11dfoiUP6CwRTcnQBZ/LemTE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QGiiu4lpiGOtlMKWu9eJXvnAIBWeltN7aN2bzDQb6IoK+vvadVY4mT0t4d5lZ31lE
	 28PIM05XVWf+NgYq4+/RfwCVWVtKhxURNdU8BaV8gY4SEmTjBHJJceIKXqQ3ZiRT3d
	 7to8kkJRfXaTeyEWPKhq3JMnFWOxHTw4yNj+ETKIlv6ZJDgk8+b/aeOo4p90lraK2o
	 1jVxrqBpGUcN6xt0qVAnKEEEAXU8RVKVXyUvEYCWxonW4lJO8H8lpBuswKoKpG/DCR
	 JiSyx7hwAnIGXhyxZWpi1YeW2Cn5stuz3YED//VnA+uhJb7T2ZJxL9rGJgEan7AcGA
	 xJe07efBQYbxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E66280F39;
	Thu, 15 Oct 2026 15:15:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF65249D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 15:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D55AC4018B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 15:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-0tpZEPzuaU for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 15:15:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9286A400CD
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792077349;
 b=tUJxyIdsPmMPA1F1wlAkWqvXsoCQ3z1RqF0qttnkO3cv6bykawqpN/oPJpu8QokuqhqM
 BnZlYZtEp5sr7f4H9a+rrZVI+BniSlLZP6pcSlt7y5v9y7dhJIoqIcoCubf21cxWzLLO+
 hsd7xA5xwsxg4tci0wIAH0P/hAMyXe5UiXi0qNvT8AJh3AkuMrxIREz6AHF80xDfqYjfm
 bCd3LclzoKw8wnCo8Xefnb/poXNWGPaWMjWERoFSIHjVghJlY3CGDTpID4H8t3PHTIniR
 EER2krW9YAnxFojgY3b+AqNgPn5FUVtfh+bbX4nejmcPOGwSeLFM144N2ZX/ietykCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792077349;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=23jGCua8Qf9hODScAqGDXll+q+t2YiKBuvk3z/TyaPE=;
 b=iYr5c1yeDSrS5r7Ulc8i+ubN6S6gitF493yuYmkPHdi6SQX1TexQ5KRrArBCl1JVbprb
 lUVIaAXf09v5WGhIv5FI00LnpIk0dK5qEdUd59dujhqleYn9lz5w6YWJKUjsbQUTE7OHf
 hfB1af+zEKlS15/UHI2ZlfDKYvzJFwfd6F4xkLwI9jrBcbm38ovvOOJjURemW1d4X/OwG
 yMiToZ3tL7sMc9svDC1p+huOGXGpAwX/0B05IzGmwxI3T1biqiFALGxqOOWQ3hvLPBLK0
 igUzlWYXZleG+XNNjwcApGKkPfUSrgMLSn2gj0gV32KactXiZeEYKZRrRE0Ci/nu5HA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HyxMC3j3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HyxMC3j3
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9286A400CD
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 15:15:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48dfb76b304so10183f8f.2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792077346; x=1792682146;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=23jGCua8Qf9hODScAqGDXll+q+t2YiKBuvk3z/TyaPE=;
 b=HyxMC3j3Y6TXVhTAjs+l9Eer/h5GAzwpTn+Abw5KzwHWpxoCw/LLAKPJjxVkCtOAa8
 K1ymCW2UYXfLVosjEWRMgajzCosJ/1twWuhA2XihuQsKSvgYvtJRYn8sR42UCbF3FkIE
 QQCiZ6jPBnI5jW+n3ZcEtfFyW5BnrrY4YvaQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792077346; x=1792682146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=23jGCua8Qf9hODScAqGDXll+q+t2YiKBuvk3z/TyaPE=;
 b=ctTwbm3jggnld4wkP9wX6H6/41DuGCu1nAoR09gPbp8BRvMTzfgukohFGJO/1p2kBg
 VHaSmMjHeWpMyMcc3MwgA7J3LT9azGwO6RaW/KTI/zY49NrOWsDmp8xm939IaIMFTcs2
 IegwmJrXCheY27AW8t7X1sMCA8cR+bOmbKEUq/dPqxwaMniGX6fwvyQoHs5RTb8ce8TV
 XmvX69GduHu0TTQJk4OXBPTvoOAt8QaLnwHlR/7loCEPEfjOyRPdO1QeATZNL2fKd8+e
 w1af0QE5UISjd4bsc7iJw7HiMvsFoDfoDmAGNWQkyslubcdw65KHwjWfjLkOnTh/Mm7s
 C1sQ==
X-Gm-Message-State: AFq9FYIOlwwcHGnOMjMEe0AczlLUqQnI41XyA70p7Ec2NQt50eA1a5aE
 Kb9g0GNMwUSBumYS3VYRxByoolPkJS9biZkkZutXi8VicHhYaxGz2/ekKWUul1EN2F8Zq2okSoD
 1fWig
X-Gm-Gg: AYBFou1CSRccem1QYsfdJTf4sAis396Qbm9gQTtqbmfBewJNdoUZJfQaY0w7zrWQ+0c
 eVoHeOV+dYnkCIJlruX/IH0qt6xxn5u95fm1jktu5GNJ1xmzN86jXJ8teEIQbuQT4+OcQOm2imn
 DHPviliHK83uNYe7yfQuR/KiIBzU8w1aJtKMWHmOh5CPC6bFGT3rWHytVA8Kb2mVeqf0sIX0I/9
 TKhRm2m84yiHvqmnBMA5Rii4HxWNOUnV8/ulJW+xIiOWF75dfxet/tjpinTshwyzx5YJ0k8+5zn
 5EqE02Bd6575hfmBCxjYr8MAqiS3+P2Wj/5DVtoNjq98VnqYnqqxW5+XdFmM41xWA5a9r0ZOAwQ
 JlyNY+jxJTQYEZNJqYxTVnc9mUcg9+vAr/vTp0mkCgmKlUV5TRNkFg26pFNr1qFDe03ZcfYOjUJ
 FzKzVHQNF0rHlI+ELIaeA31R8wWPket2jM4RCPnBlmq5ZDwPpHq3gBU6mzct3nvt2ZHI9OfzWcs
 DLBNBMGLOiLtLprTBwxZyyPEwOLx8HfBwnVqdkVzpSgLWm4zLQdrX3JXLqItrUWTXM=
X-Received: by 2002:a05:6000:299c:10b0:48a:fb3e:d93c with SMTP id
 ffacd0b85a97d-48dba784b80mr27899380f8f.5.1792077345140; 
 Thu, 15 Oct 2026 08:15:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:81b2:a12a:b337:b231])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaa5dbsm20201856f8f.12.2026.10.15.08.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 08:15:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Thu, 15 Oct 2026 17:15:35 +0200
Message-ID: <20261015151535.2820435-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.12.112 and U-Boot to 2026.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.12.112 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index 5adce2bab48a..1a1d6e9a3ef6 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7d2e1b5d5ab36b3a01856e71782dad2a54e634fb2b37c0a42998def3bbf957c1  linux-6.12.96.tar.xz
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index ff6e4ed2e2f6..66c72d3afd51 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 23c23cd758d1..9b817e9d0265 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.96"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
