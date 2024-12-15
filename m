Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA09BE7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 12:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 730F5605BD;
	Sun, 15 Dec 2024 12:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpfOXzS86d86; Sun, 15 Dec 2024 12:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79F4360604
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79F4360604;
	Sun, 15 Dec 2024 12:22:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4501C69
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 12:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3189B4023E
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 12:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8SrmCn66HXO for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 12:22:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 005EE40223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005EE40223
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 005EE40223
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 12:22:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 95DE72003CC;
 Sun, 15 Dec 2024 13:22:37 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46426])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Dec 2024 13:22:37 +0100
MIME-Version: 1.0
Date: Sun, 15 Dec 2024 13:22:37 +0100
From: Julien Olivain <ju.o@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: buildroot@buildroot.org, Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <20241215101353.3214256-1-geomatsi@gmail.com>
References: <20241215101353.3214256-1-geomatsi@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0cce07dac3bbb1aecafdd5d59743b4e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734265359;
 bh=OVObqHcNfQQDkcz46UTrjJnkylU/e9wcfPCp3wHimmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pq1Y6WgdWMFybpR2ULtPhPDK4qqLvkO5RCgW4socbcoF/XwlF2fTsGFc2RT8G/IfW
 cykJObusmcNW8hSqW2JJA4XPZ9MMyg+2q/7QPqtNP00EMe9dVV27ApodM1/smFM5pY
 HjR4uX6ySxRlGsfW3qsS163/NG8dZc2+UCssZx1Is0aaK1aUs0dpvGFa+2ndgpdj4K
 Qhm1iZhlQc7hXS5Z/2sydobaaDAxFUGDaWOX4r5oWJeDyTUVmdqR78QZcE8+DEjQbH
 Ub2Ij8FQv7B+HRV1048uDb/CC9SEzqEPP7zhj8iXesbhgeDcMJJ6Z44bZ/PHZFM4xP
 GqfqnJwUfi64Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pq1Y6Wgd
Subject: Re: [Buildroot] [PATCH 0/4] orangepi/linksprite: bsp updates,
 part II
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/12/2024 11:12, Sergey Matyukevich wrote:
> Hi All,
> 
> These patches update BSP components for the following boards:
> - OrangePi PC Plus
> - OrangePi Zero Plus2
> - OrangePi Zero 2W
> - Linksprite pcDuino
> 
> For all the boards the following updates have been applied:
> - Linux v6.12.3
> - U-Boot 2024.10
> - ATF 2024.11 (for arm64 only)
> 
> Besides, forced check of hashes for BSP components has been enabled.

Series applied to master, thanks.

> Regards,
> Sergey
> 
> 
> Sergey Matyukevich (4):
>   configs/orangepi_pc_plus: bump BSP versions
>   configs/linksprite_pcduino: bump BSP versions
>   configs/orangepi_zero_plus2: update BSP versions
>   configs/orangepi_zero2w: update BSP versions
> 
>  .checkpackageignore                                 |  3 ---
>  .../patches/linux-headers/linux-headers.hash        |  1 +
>  board/linksprite/pcduino/patches/linux/linux.hash   |  2 ++
>  board/linksprite/pcduino/patches/uboot/uboot.hash   |  2 ++
>  .../patches/linux-headers/linux-headers.hash        |  1 +
>  .../orangepi-pc-plus/patches/linux/linux.hash       |  2 ++
>  .../orangepi-pc-plus/patches/uboot/uboot.hash       |  2 ++
>  .../arm-trusted-firmware/arm-trusted-firmware.hash  |  2 ++
>  .../patches/linux-headers/linux-headers.hash        |  1 +
>  .../orangepi-zero-plus2/patches/linux/linux.hash    |  2 ++
>  .../orangepi-zero-plus2/patches/uboot/uboot.hash    |  2 ++
>  .../arm-trusted-firmware/arm-trusted-firmware.hash  |  4 ++--
>  .../orangepi-zero2w/patches/linux/linux.hash        |  4 ++--
>  .../orangepi-zero2w/patches/uboot/uboot.hash        |  2 +-
>  configs/linksprite_pcduino_defconfig                |  9 ++++++---
>  configs/orangepi_pc_plus_defconfig                  |  9 ++++++---
>  configs/orangepi_zero2w_defconfig                   |  9 +++++----
>  configs/orangepi_zero_plus2_defconfig               | 13 ++++++++-----
>  18 files changed, 47 insertions(+), 23 deletions(-)
>  create mode 120000 
> board/linksprite/pcduino/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/linksprite/pcduino/patches/linux/linux.hash
>  create mode 100644 board/linksprite/pcduino/patches/uboot/uboot.hash
>  create mode 120000 
> board/orangepi/orangepi-pc-plus/patches/linux-headers/linux-headers.hash
>  create mode 100644 
> board/orangepi/orangepi-pc-plus/patches/linux/linux.hash
>  create mode 100644 
> board/orangepi/orangepi-pc-plus/patches/uboot/uboot.hash
>  create mode 100644 
> board/orangepi/orangepi-zero-plus2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
>  create mode 120000 
> board/orangepi/orangepi-zero-plus2/patches/linux-headers/linux-headers.hash
>  create mode 100644 
> board/orangepi/orangepi-zero-plus2/patches/linux/linux.hash
>  create mode 100644 
> board/orangepi/orangepi-zero-plus2/patches/uboot/uboot.hash
> 
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
