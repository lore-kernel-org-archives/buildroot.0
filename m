Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE56C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DEF560793;
	Sun, 26 Jan 2025 11:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxF-gPqC4d5c; Sun, 26 Jan 2025 11:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38939607DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38939607DF;
	Sun, 26 Jan 2025 11:36:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D73CF10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A01C409E8
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GbIuRIohTg2 for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:36:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDB414097B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB414097B
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDB414097B
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:36:16 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso2046651e87.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 03:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737891374; x=1738496174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJGXC7fuwiVKXhErEEhCgT3AFIfvAO7yQBCxgmFWXLM=;
 b=d3DZEqvigwHA1ayFrliSaQDlMFo1+RCqj5dqADZ/ms5yq7RJDV2r/0JCofTQrS1OxN
 5kuXh6AWKUzHrOEsUU8OXptbPzUEAuvn02zNeuzevS7SPpJn6HFIoMsxU0CG0YjsWGxq
 yBgBW678xQZfIPCsSIWTaIrfinnS8haLUOCirSjAGWFLuSJgbp1tCwInXaHKlGwZwnm4
 vKHJ9Uh8KOp2p2EqekINCgjM5ZgE4LzNuwwjIzqZkDqsHECaTjnow/2gkVM7jvAQrsQD
 Gt75BRXhm2DFt4+qlAVl8peiK9vYkO7vBaMwdrucwO6iDO7C5zXvQRZcGhUeOsKjn+ct
 XUjA==
X-Gm-Message-State: AOJu0Yz3QwzHpUuyCrZdl4t7zeRK1tl1xUa1XPY0Tly28xMLeW+fFJhQ
 fi89Q389BIj5lm/shkXKDF03N7kq7kHJhr2AzbtVPT0vFA/x9EG1356MoNNR
X-Gm-Gg: ASbGncv6CbwVtqAaYd38xZS3v7JBNe5r1ByStp+ReSTvBE5bh6Y86eTrO9z/TEB/rBN
 ZxACaM2zctytsyCFJ2ZgrdNCCAK159VAHaGAOOMbYbx0SG7bOrHDyiqWBxcRUzIjIe4fP2+uaVM
 lqLa75TJd0kx50EImTn9Fb2e8v5ltAPko6TKc0/2gEVnpJE95vYvvnPfdd+3hothg+viPBKKTmq
 R1xldXDgldC6PANnIQmERJvtSlqOgcP3Cp4eq2HN9gCk8qgTqf71hvCF62oS02aCwvrHzol
X-Google-Smtp-Source: AGHT+IGwRuibvBxoeLFU7cJEPwQ+SULDAMAVKmibXoYiQ/zMjuvRuTco+ve6bVICu2oqLEDA9ad58A==
X-Received: by 2002:a05:6512:b24:b0:540:2a92:7daa with SMTP id
 2adb3069b0e04-5439c282032mr12179252e87.42.1737891374189; 
 Sun, 26 Jan 2025 03:36:14 -0800 (PST)
Received: from curiosity ([5.188.167.4]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c836834csm893281e87.149.2025.01.26.03.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 03:36:12 -0800 (PST)
Date: Sun, 26 Jan 2025 14:36:10 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <Z5YeKmQHSNJE1J7Z@curiosity>
References: <20250106190748.763795-1-geomatsi@gmail.com>
 <7cac004be67f141ae3fe0c332358b51c@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cac004be67f141ae3fe0c332358b51c@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737891374; x=1738496174; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LJGXC7fuwiVKXhErEEhCgT3AFIfvAO7yQBCxgmFWXLM=;
 b=QHXHLeUk+wFKbZKeK+Eb+p7m227xc7ovtKBV5SLMcKQaMBF+LoA7DZ10feAuZQLLF7
 2g+zudf856jQetqMbnFHs/vtbXcnDMHMxUIABSQVxs7HhPGkFcUvVc+TNh0IC4teupFE
 7Th2PjvHqXWHYbbBndiBC1VHGE8LSZ1tBjDhKQpM2F6QM68MYLAYolCZvHaekHNl7hdk
 hp0AtpfvEcgigC2tIISdRXGlKeCBWb2bwrZt0hTazu3egeDcGpU2kFB4hc0a1ktMempF
 muk4/j8v5cu5Ki4s6WvJ796NlFHEvT3U4W8sNT99ImLBxBHIDWGK3oQPRE57J7mn5csb
 xIXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QHXHLeUk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jan 25, 2025 at 10:10:59PM +0100, Julien Olivain wrote:
> On 06/01/2025 20:07, Sergey Matyukevich wrote:
> > This patch adds basic support for the new OrangePi 5 Plus board:
> > - http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-plus-32GB.html
> > 
> > Brief summary of the board features:
> > - RK3588 Rockchip SoC
> >   - Quad-Core ARM Cortex-A76 Processor 2.4GHz
> >   - Quad-Core ARM Cortex-A55 Processor 1.8GHz
> >   - Mali G610 GPU
> >   - NPU 6 Tops INT4/INT8/INT16/FP16
> > - LPDDR4x: 8GB/16GB/32GB
> > - 2x USB 2.0
> > - 2x USB 3.0
> > - 2x HDMI out
> > - PCIe M.2 M-key socket (e.g. for NVMe)
> > - PCIe M.2 E-key socket (e.g. for WiFi/BT)
> > - 40-pin expansion interface (GPIO / UART / I2C / SPI / PWM / CAN / I2S)
> > - and much much more ...
> > 
> > BSP includes the following components:
> > - mainline ATF v2.12
> > - mainline U-Boot v2024.10
> > - mainline Linux kernel v6.12.x
> > 
> > Unlike all the other boards from board/orangepi directory, this board
> > is not based on an Allwinner SoC. It is based on Rockchip RK3588 SoC.
> > So custom scripts and configs are used instead of common options from
> > the board/orangepi/common directory. Suggested scripts and configs are
> > based on those of Radxa Rock5B board.
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> Applied to master, thanks.

Thanks ! 

Unfortunately, your minor cleanup 'switch to human readable genimage.cfg
partition type uuid' breaks the build:

: >>>   Executing post-image script support/scripts/genimage.sh
: ...
: ERROR: hdimage(sdcard.img): part uboot-env has invalid type shortcut: u-boot-env

Latest available genimage release does not yet provide the GUID shortcut
for 'u-boot-env'. So I sent a fixup to keep using the GUID value directly:

- https://lore.kernel.org/buildroot/20250126113141.3258643-1-geomatsi@gmail.com/T/#u

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
