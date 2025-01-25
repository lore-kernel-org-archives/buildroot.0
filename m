Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC021C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 21:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DF7260D63;
	Sat, 25 Jan 2025 21:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GyK2Un4alq0; Sat, 25 Jan 2025 21:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9867760BEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9867760BEA;
	Sat, 25 Jan 2025 21:11:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5329A94A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3127982151
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCq2Mk4u6n6T for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 21:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F01358213B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F01358213B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F01358213B
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:11:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9A72019F5C6;
 Sat, 25 Jan 2025 22:10:59 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51432])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 22:10:59 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 22:10:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250106190748.763795-1-geomatsi@gmail.com>
References: <20250106190748.763795-1-geomatsi@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7cac004be67f141ae3fe0c332358b51c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737839460;
 bh=kgb7njgl4IBaRmClxQ2jq/rD7KiKnrXbecpJ5HgyMzU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dKAdM3PZFhtaQ7T9IoAYyM0LbJeSGaxVJwbmw/lZEo/0cLOPIRgrwTQjtOaX5Vbfy
 9n8mTw8Fr7YJPYUrk/M52vqxmd25iPieamttpaYjTf/idvqk7qdBhbZbfgWKRPIPe2
 OPKbbkUMyf9swDq2AOV2yLzNOqGE2rN4kfuwnKHEw/0Z3dgCrycO9LBTtkYvRFyvjX
 76nw07fxuSUb/7v2IF7gDXIZ1eWIipdxu7UT9j0F2x7ZGiooClE/uVzrsYT0R0POKD
 /DnC1ip6AA2FsfImpo/0ki6zjKIDJSUtFk9JYfWzb29Ws4fSKUUNqZXNMtx20nmkfY
 VwMEwaVnYiNPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dKAdM3PZ
Subject: Re: [Buildroot] [PATCH 1/1] configs/orangepi_5_plus: new board
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

On 06/01/2025 20:07, Sergey Matyukevich wrote:
> This patch adds basic support for the new OrangePi 5 Plus board:
> - 
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-plus-32GB.html
> 
> Brief summary of the board features:
> - RK3588 Rockchip SoC
>   - Quad-Core ARM Cortex-A76 Processor 2.4GHz
>   - Quad-Core ARM Cortex-A55 Processor 1.8GHz
>   - Mali G610 GPU
>   - NPU 6 Tops INT4/INT8/INT16/FP16
> - LPDDR4x: 8GB/16GB/32GB
> - 2x USB 2.0
> - 2x USB 3.0
> - 2x HDMI out
> - PCIe M.2 M-key socket (e.g. for NVMe)
> - PCIe M.2 E-key socket (e.g. for WiFi/BT)
> - 40-pin expansion interface (GPIO / UART / I2C / SPI / PWM / CAN / 
> I2S)
> - and much much more ...
> 
> BSP includes the following components:
> - mainline ATF v2.12
> - mainline U-Boot v2024.10
> - mainline Linux kernel v6.12.x
> 
> Unlike all the other boards from board/orangepi directory, this board
> is not based on an Allwinner SoC. It is based on Rockchip RK3588 SoC.
> So custom scripts and configs are used instead of common options from
> the board/orangepi/common directory. Suggested scripts and configs are
> based on those of Radxa Rock5B board.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
