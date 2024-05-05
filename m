Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE515C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 15:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7936E4058A;
	Sun,  5 May 2024 15:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p14Rt9tzyV4k; Sun,  5 May 2024 15:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F35CB40592
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F35CB40592;
	Sun,  5 May 2024 15:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB7C1BF82D
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0674980BDA
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qx0uRq6juT9q for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 15:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBBB08141F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBBB08141F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBBB08141F
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:44:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 101E713F8B5;
 Sun,  5 May 2024 17:44:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 17:44:22 +0200
Date: Sun, 5 May 2024 17:44:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <ZjepViPtMWJL05DF@landeda>
References: <20240505153103.2031941-1-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240505153103.2031941-1-geomatsi@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714923865;
 bh=oRQrf1rxUxHiTuUjWr1XSRQDrnSq7ykrtKdmsH5ndfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j+XFPnHifzoF6LfVchStpdWMPOCPoboaxW8Zi99HZzD74lDXJRWEQqUSCOpRfwCTH
 EcNOF3ZpJpSXCGfp8kCHK7UwWRfVwOjELtFYh0Sb44M1isGwU72lPa3DgpiupMs0hN
 xDXAFUxaDwaFdVvgv7I1f8k4jW3TephRbQjq5QAYM88fAl0o5SZ2VRscoeNDlY4Jul
 GZmEdxshRP6eCq4RVY2NS3teqwxqM/OI0y9MTQDB2cxtNk3wEQWcewcW20dpsC0Xp8
 JGWZcF6j+UkkjbbMIHC3zgaxh46vKcJ7b+PnyMa0OBeMeVm+zQgSYdsR2itgeVHfsE
 Tt7eI43lsxHkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j+XFPnHi
Subject: Re: [Buildroot] [PATCH 1/1] configs/orangepi_zero2w: new board
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sergey, All,

On 2024-05-05 18:30 +0300, Sergey Matyukevich spake thusly:
> This patch adds basic support for the new OrangePi Zero2W board:
> - http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-2W.html
> 
> Brief summary of the board features:
> - H618 Allwinner SoC
>   - Quad-Core ARM Cortex-A53 Processor 1.5GHz
>   - Mali G31 MP2 GPU
> - LPDDR4: 1GB/2GB/4GB
> - Wi-Fi5.0+BT 5.0
> - 2x Type-C USB 2.0
> - 1x Mini HDMI
> - Wi-Fi 5.0 + BT 5.0
> - 40-pin expansion interface (GPIO / UART / I2C / SPI / PWM)
> - 24-pin expansion interface (2x USB 2.0 / ETH / IR / audio)
> 
> BSP includes the following components:
> - mainline ATF v2.10
> - mainline U-Boot v2024.04
> - mainline Linux kernel v6.8
> 
> No custom scripts required: all is covered by common orangepi scripts.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  DEVELOPERS                                |  1 +
>  board/orangepi/orangepi-zero2w/readme.txt | 32 +++++++++++++
>  configs/orangepi_zero2w_defconfig         | 55 +++++++++++++++++++++++

    $ ./utils/docker-run make check-package
    configs/orangepi_zero2w_defconfig:0: missing BR2_DOWNLOAD_FORCE_CHECK_HASHES

We're now requiring that defconfig files ensure that all downloads have
their hashes checked, even for cutom versions.

Please see my previous explanations to Francois earlier:
    https://lore.kernel.org/buildroot/ZjeDWeQ-Jnutgk0G@landeda/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
