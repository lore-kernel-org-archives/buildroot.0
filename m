Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67326CA1017
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FDD78303C;
	Fri,  5 Sep 2025 20:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVtod-19GZdJ; Fri,  5 Sep 2025 20:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC4678300C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC4678300C;
	Fri,  5 Sep 2025 20:31:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0235F1A9
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 20:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCC4E6114E
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 20:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDJ8GTK18PjF for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 20:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0675661222
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0675661222
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0675661222
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 20:31:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C7EF813F86E;
 Fri,  5 Sep 2025 22:30:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Sep 2025 22:30:57 +0200
MIME-Version: 1.0
Date: Fri, 05 Sep 2025 22:30:57 +0200
To: Andy Yan <andyshrk@163.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250901083109.284281-1-andyshrk@163.com>
References: <20250901083109.284281-1-andyshrk@163.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8fc454eb865be4d2a7e1c06d59c9c341@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757104258;
 bh=a3tAltZgU6so0VSfHWL3mGBzH6K+M6Q7ZhKY5OFtvCk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fiPYQw/QweC8pEp+8+QBASgtu2rW8j7quwhszQgWylMSFTfymHFu/IPNjJrg8EksT
 5fLGN35O2pEp+vGtrI9LADDA+7nXZTUBtSCzI/9pvPVK9AfBxSzRCDl/TGJf6ASMTh
 eDQ2p/4E+aVlfhBdS4ciu4fSIuVHsmGO0tuCarjWIUcBnNBJmQUFfxxdY6sgekC8iZ
 8AZ4fvHwH7xvxjtzSy/b/4RELEOPf5pShOhSdvAEtkAylihlJMKk1RR1PHgdfJRXhz
 pLhlQ96mN4zgT5SiwAnGlk/QeuUD7H4MniAfVSujCjbS8PC2y3mXoHgUKNKr8jdTKw
 3RxmxJGHDV+Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fiPYQw/Q
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: Add option to
 install cadence MHDP8546 DPI/DP bridge firmware
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

Thanks for the patch.  I have one comment.  See below.

On 01/09/2025 10:31, Andy Yan wrote:
> Cadence MHDP8546 DPTX IP used in TI J721E SoC needs the firmware to
> work.
> 
> Signed-off-by: Andy Yan <andyshrk@163.com>
> ---
>  package/linux-firmware/Config.in         | 5 +++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in 
> b/package/linux-firmware/Config.in
> index 778dfef8a0..21dff9768e 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -205,6 +205,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0
>  	help
>  	  Firmware file for the Broadcom 4366c0 FullMAC chip.
> 
> +config BR2_PACKAGE_LINUX_FIRMWARE_CDNS_MHDP8546
> +	bool "Cadence MHDP8546"
> +	help
> +	  Firmware file for the Cadence MHDP8546 DPI/DP bridge
> +
>  config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XX
>  	bool "Cypress CY cyw43xx"
>  	help
> diff --git a/package/linux-firmware/linux-firmware.mk 
> b/package/linux-firmware/linux-firmware.mk
> index 40758054e5..869e2d668f 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -913,6 +913,11 @@ LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw \
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
>  endif
> 
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CDNS_MHDP8546),y)
> +LINUX_FIRMWARE_FILES += cadence/mhdp8546.bin
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cadence

Adding a new licence file here also requires to add the new
file hash in "package/linux-firmware/linux-firmware.hash".

Running the command "make linux-firmware-legal-info"
with this firmware selected show the message:

     ERROR: No hash found for LICENCE.cadence

> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CX231XX),y)
>  LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
>  # No license file; the license is in the file WHENCE
> --
> 2.43.0

Could you send an updated patch adding the license hash, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
