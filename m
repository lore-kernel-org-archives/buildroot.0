Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F16E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 21:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2ECE40325;
	Sat, 14 Dec 2024 21:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaSTuDmsig1R; Sat, 14 Dec 2024 21:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C5D40346
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C5D40346;
	Sat, 14 Dec 2024 21:48:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B511C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 21:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28C424015E
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 21:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McFIeSmUuf-P for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 21:48:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA4784011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA4784011D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA4784011D
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 21:47:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C60B419F57E;
 Sat, 14 Dec 2024 22:47:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49594])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 22:47:55 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 22:47:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241211201146.4057892-1-geomatsi@gmail.com>
References: <20241211201146.4057892-1-geomatsi@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d2f330edc5dd1b36a2b4cb793444720f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734212876;
 bh=dWe4MrIhmjdf7Zobcj1+J0FtkXG+dtaxClDhlEtJHvg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XvEMnruNcOD/ER7YWdbj2gbVoMUccAs10JmxKI+2owiNA6AvLVu2p3L1T/ZSMmw3g
 lTObpS3iHHaTAcaJZ6SyhVwud8VOiO98W9QUXn7lo86GOYhZ9f4Do7fQoxCKRycozO
 6LSKFxNOQlJZzXKpBiLySMUWgXkjhdurNQB+ejTRKUZXCbSDUqpaVv2IVOHyRcerdQ
 VZwlmHJJRHL73hgm7ZCrFEjfRgS7VxedgQejGVk71mYCFP63+sD3B8/aKle5v+Koor
 2MpAWJBZHWaC9mG6iSUzfJXFTe+DqWwea0qkn8/Yb/HF3GMmt6YRo4D4UM8eagsJGu
 P8BOsWnm0/EAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XvEMnruN
Subject: Re: [Buildroot] [PATCH 0/3] orangepi: BSP updates, part I
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

Hi Sergey,

On 11/12/2024 21:09, Sergey Matyukevich wrote:
> Hi Peter and All,
> 
> These patches update BSP components for OrangePi Zero and One boards:
> - Linux kernel updated to the latest LTS v6.12.3
> - U-Boot  updated to 2024.10

Thank you for the patches. I applied the series to master.

I have made few fixes and improvements. See the commit logs:
https://gitlab.com/buildroot.org/buildroot/-/commit/3ef5975b795271a723b694160c8d50c62d518e8e
https://gitlab.com/buildroot.org/buildroot/-/commit/6ee9c706179076ec1d7772debb6390631da184ce

> Also xradio driver baseline is updated to make it work with new Linux.
> 
> Regards,
> Sergey
> 
> Sergey Matyukevich (3):
>   package/xr819-xradio: bump version
>   configs/orangepi_zero: bump BSP versions
>   configs/orangepi_one: bump BSP versions
> 
>  .../patches/linux-headers/linux-headers.hash        |  1 +
>  .../orangepi/orangepi-one/patches/linux/linux.hash  |  2 ++
>  .../orangepi/orangepi-one/patches/uboot/uboot.hash  |  2 ++
>  .../patches/linux-headers/linux-headers.hash        |  1 +
>  ...-orange-pi-zero-interrupt-triggering-xr819.patch | 13 ++++++-------
>  .../orangepi/orangepi-zero/patches/linux/linux.hash |  2 ++
>  .../orangepi/orangepi-zero/patches/uboot/uboot.hash |  2 ++
>  configs/orangepi_one_defconfig                      |  7 ++++---
>  configs/orangepi_zero_defconfig                     |  7 ++++---
>  package/xr819-xradio/xr819-xradio.hash              |  2 +-
>  package/xr819-xradio/xr819-xradio.mk                |  2 +-
>  11 files changed, 26 insertions(+), 15 deletions(-)
>  create mode 120000 
> board/orangepi/orangepi-one/patches/linux-headers/linux-headers.hash
>  create mode 100644 
> board/orangepi/orangepi-one/patches/linux/linux.hash
>  create mode 100644 
> board/orangepi/orangepi-one/patches/uboot/uboot.hash
>  create mode 120000 
> board/orangepi/orangepi-zero/patches/linux-headers/linux-headers.hash
>  create mode 100644 
> board/orangepi/orangepi-zero/patches/linux/linux.hash
>  create mode 100644 
> board/orangepi/orangepi-zero/patches/uboot/uboot.hash
> 
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
