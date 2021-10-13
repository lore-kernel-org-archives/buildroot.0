Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790B2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:57:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA0D60D42
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABA0D60D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D9CC4083E;
	Wed, 13 Oct 2021 18:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IH5P_p96Sqw5; Wed, 13 Oct 2021 18:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF4240837;
	Wed, 13 Oct 2021 18:57:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37D201BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3422860C33
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hXKPBKKZw2m for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:57:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5511460AF9
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:57:26 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id p13so14595772edw.0
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=otTmtJysiW0ApjMfamv9EXg50GrbJ+5OmikoKZNjHdM=;
 b=QUuNa/LJDWdFBmFirhI6D7s/+rAoMay0tBK4x1kRimv14ZAw1dxvaGv/XN/9wUng9P
 T0FaUjEuThED7eeIQc2XV+7VDIVJocpwUQuPqGFOLec8qgw+A62zGhQXGnKvX5TSmtqU
 ja94wj7tTelxn5dPLORQqyB7Uy4LsMPXMsSDlSrUyEGzeBrd50mMXSUeddKlRLt82h4X
 0eWUO3+1TOZnr99X8zHGj+sfxd71HyCTZBvBUbUeEIwsow5yK/1rdb01H4LxDJK7aOyV
 Stx/puvkDNpCwZwKvBEwRo77no5+yDo0weg7HCpxmiUv4YVBVLN0BIkc6tZxFPDEhNs4
 zV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=otTmtJysiW0ApjMfamv9EXg50GrbJ+5OmikoKZNjHdM=;
 b=lOPRMwtCFJFoxTPrvhsnEQ4D4Nc6SbEbLWnZPMgjOYIfxV42Wiev2il9VtofJaBtMv
 u7nj28iKwuOZY2W/gEFgepq0ldUqdLyU/y/HhwZ4mmffDDQa/ujee5SZYlYacfTcuKux
 J0fY/uNhVO+MM89Yqm+cu8cavotMhsU4+IgPsgzb5MJmIAufRweeZdPnygoQc22g+VoF
 MPcf8OCvs0BebSmPUyD33i9NO6e5/faU56zxdcxv2pNmb8TUz5cTt6bfhAA0zAZP0gOe
 nLDSBx+u/DLi4cMNZq/7oR6beGBgQFf3RbFJF+cERhGjWEOBmgBCHW6Afj+wDn6NIDI1
 /cyg==
X-Gm-Message-State: AOAM53107j0DhV0ZwguDE/bDUnzIrVClYQZXGx+c/B05U7bdyI627Lem
 SUaR6Np69B3plS+zAjKiGLzr9A==
X-Google-Smtp-Source: ABdhPJxJxZVNrcfi8AsdbOxXCPe9Ss3bnHJIocF8lodD/zDY9oVVSRyFEEkrf7EybLvZd3Tkue7dpQ==
X-Received: by 2002:a17:906:c252:: with SMTP id
 bl18mr1055297ejb.519.1634151444554; 
 Wed, 13 Oct 2021 11:57:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l19sm358602edb.65.2021.10.13.11.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:57:24 -0700 (PDT)
Message-ID: <8c06543b-8a8e-697a-99d6-e8bf6d854d9f@mind.be>
Date: Wed, 13 Oct 2021 20:57:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 01/12]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p2.0
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 22:41, Chris Dimich wrote:
> To match NXP 5.10.35-2.0.0 release.
> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
>   .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> index ab021b6849..ee105ef82c 100644
> --- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> +++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> @@ -1,3 +1,3 @@
>   # locally computed
> -sha256  fbf400adbeaa52af0be234a5dcd96059615db4535cda2bd101d65d468e49e288  kernel-module-imx-gpu-viv-3588f2f6e64082153baae116dd393aa15061473d.tar.gz
> +sha256  257c6cd8b01cfb6543827cbeb78409e6a2ad4ae321891751dcea1abc47d89379  kernel-module-imx-gpu-viv-ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5.tar.gz
>   sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
> diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> index 3afcc9d228..10505fdf17 100644
> --- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> +++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KERNEL_MODULE_IMX_GPU_VIV_VERSION = 3588f2f6e64082153baae116dd393aa15061473d
> +KERNEL_MODULE_IMX_GPU_VIV_VERSION = ae0f3be0b7240f11cca191a3e2bdd4a445ee46e5
>   KERNEL_MODULE_IMX_GPU_VIV_SITE = \
>   	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
>   KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
