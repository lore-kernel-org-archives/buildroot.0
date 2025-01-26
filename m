Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3439C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 847746072B;
	Sun, 26 Jan 2025 15:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTM0G7XyX9np; Sun, 26 Jan 2025 15:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95F416070F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95F416070F;
	Sun, 26 Jan 2025 15:41:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDA0A941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3C9140585
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCXj6-Hzez_C for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F8BA40B0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8BA40B0B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F8BA40B0B
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:41:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8FCE3B00592;
 Sun, 26 Jan 2025 16:41:39 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47568])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 16:41:39 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 16:41:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <Z5YeKmQHSNJE1J7Z@curiosity>
References: <20250106190748.763795-1-geomatsi@gmail.com>
 <7cac004be67f141ae3fe0c332358b51c@free.fr> <Z5YeKmQHSNJE1J7Z@curiosity>
User-Agent: Webmail Free/1.6.9
Message-ID: <d0942ad2ff729c48c1b1c93bb71c8c5e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737906100;
 bh=IV+RKfZMFdP6L1E/4xpHeABpHmNY1Fha4BzTzWmmCKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j+oVrHFHLPLK51SbJDwZ0Wf9QJa7lYAHeGgEdLl/Wri/CsHQ6tS9Wl0wrteLK+QuD
 /IRt3vyPsb4JwuyCOJiNnhGmcyQpb7Zl3RTz+mgIbOoP2bySHOA3ZGQwJHYefY8x+P
 wdY2K6DRdoBlRjbWfBnNMw8WmAOCH797WZ0v4SBU/qNNELDW/VF1sMCLDLZbahJnG5
 D5tZemL7iBefV0XZXfeSIgBM+9JEU8Dja03gJzDLEs3Ufy2/xqwX6/iH6hmXUDHSkm
 RhL1EXHezvnwQ4mNb7QkNUhhnW860ZCOPgK7+YNmRN876g0o3IdRmViNWj3svHG6jE
 qVZrP3fI9D5qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j+oVrHFH
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

Hi Sergey,

On 26/01/2025 12:36, Sergey Matyukevich wrote:
> On Sat, Jan 25, 2025 at 10:10:59PM +0100, Julien Olivain wrote:
>> On 06/01/2025 20:07, Sergey Matyukevich wrote:
>> > This patch adds basic support for the new OrangePi 5 Plus board:
>> > - http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-plus-32GB.html
>> >
>> > Brief summary of the board features:
>> > - RK3588 Rockchip SoC
>> >   - Quad-Core ARM Cortex-A76 Processor 2.4GHz
>> >   - Quad-Core ARM Cortex-A55 Processor 1.8GHz
>> >   - Mali G610 GPU
>> >   - NPU 6 Tops INT4/INT8/INT16/FP16
>> > - LPDDR4x: 8GB/16GB/32GB
>> > - 2x USB 2.0
>> > - 2x USB 3.0
>> > - 2x HDMI out
>> > - PCIe M.2 M-key socket (e.g. for NVMe)
>> > - PCIe M.2 E-key socket (e.g. for WiFi/BT)
>> > - 40-pin expansion interface (GPIO / UART / I2C / SPI / PWM / CAN / I2S)
>> > - and much much more ...
>> >
>> > BSP includes the following components:
>> > - mainline ATF v2.12
>> > - mainline U-Boot v2024.10
>> > - mainline Linux kernel v6.12.x
>> >
>> > Unlike all the other boards from board/orangepi directory, this board
>> > is not based on an Allwinner SoC. It is based on Rockchip RK3588 SoC.
>> > So custom scripts and configs are used instead of common options from
>> > the board/orangepi/common directory. Suggested scripts and configs are
>> > based on those of Radxa Rock5B board.
>> >
>> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
>> 
>> Applied to master, thanks.
> 
> Thanks !
> 
> Unfortunately, your minor cleanup 'switch to human readable 
> genimage.cfg
> partition type uuid' breaks the build:
> 
> : >>>   Executing post-image script support/scripts/genimage.sh
> : ...
> : ERROR: hdimage(sdcard.img): part uboot-env has invalid type shortcut: 
> u-boot-env
> 
> Latest available genimage release does not yet provide the GUID 
> shortcut
> for 'u-boot-env'. So I sent a fixup to keep using the GUID value 
> directly:
> 
> - 
> https://lore.kernel.org/buildroot/20250126113141.3258643-1-geomatsi@gmail.com/T/#u

Sorry for my non-improvement ;)  and thanks for the fix!

> Regards,
> Sergey

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
