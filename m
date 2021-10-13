Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8401C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:58:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70631610F9
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70631610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41BD340845;
	Wed, 13 Oct 2021 18:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Nzsxauv-Uhz; Wed, 13 Oct 2021 18:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F67A406A4;
	Wed, 13 Oct 2021 18:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A870E1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9809F60D4F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Luh6V0QgUWDJ for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:58:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C816A60AF9
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:58:32 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y12so14714173eda.4
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7eI9JPl+ByufXlHHZGnqKvCD9yDkxkvaZtKGuVziX8U=;
 b=fqS2NPLrk1NkTS87OMqLqPb8+j7UyBk95FVW+mYnYMs2H8RyokIyIZMbGh8SbDt3Np
 PPb262xYgSzCHUU+lOkbpXX8VeQNNJ6W/11LPjn3q0xUGFz2HJZTnof684BE8bltYEag
 kcjFnsHpwr1KWSV9kh2zC8a2b5aGR2i3MJ5QV0XSFmQpbuDdBoMzgSQUeD1HWIXdggpf
 bymBc5CLyMBVILiGBL1i0VhdL+ZRPFd781MKRpansrYXCbfenyyH7wzxwkIp+2mjbi+y
 FzIjdSdzMaspipHkpw7Xe84RqLDXc4BQb4laCI/lkw5qN+cPBylI4hAPD03G6LC3t5XD
 vfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7eI9JPl+ByufXlHHZGnqKvCD9yDkxkvaZtKGuVziX8U=;
 b=JVDXTJRuMA5K/xR3CzdKxPTfd3/hPsRqeSBibLOU5sC2xHwe7LbT/IlUjrASE5+vVV
 Eq8xT5nwQTKUKK6eClNv2KOX+/XCz89wxTIIDNtSUWC8S0miF5R7/08RP4CqUBD79fKC
 +b1ka2FKjqje+xIJD0lCWZUftwq7/9cw7qum3zrBZXsqLRSZRAESKnTlvwfgfj5DxDHr
 /dDr3tz8ZFp/W3BRbv0ApErR/NEPEN4DlofJEi0ccPhkJd2lPiF8wZpPx4szt0gHF/FQ
 sQTO//DLTKBsZuTQFMk5PZIYtLuVGqM2i2cMRgTJqkZyq0+MBSpUW0ACuCYJXC8bLWst
 7oAQ==
X-Gm-Message-State: AOAM531QzzqwEdbYMnB29bajN/+9ENvYNK3vxZyWNNfXDViROBsEOpcV
 4GaNwSd/L/2f5wBPiPUvATA28br6LDIwIHk0
X-Google-Smtp-Source: ABdhPJxEtw/ciHX91DvpZ/cggLIROw2QjFbYE+SFXch1exEupsic7sZr9RT0dM0IWDdM2s0m6qsz2w==
X-Received: by 2002:a17:906:5051:: with SMTP id
 e17mr1112355ejk.481.1634151511012; 
 Wed, 13 Oct 2021 11:58:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm339014ede.79.2021.10.13.11.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:58:30 -0700 (PDT)
Message-ID: <5e3d08b1-210a-f012-be56-c76c2bcfb987@mind.be>
Date: Wed, 13 Oct 2021 20:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-2-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-2-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 02/12] package/freescale-imx/imx-gpu-viv:
 bump to version 6.4.3.p2.0
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
> ---
>   package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
>   package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
> index 6c0dacba60..312eeb6f82 100644
> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  0f139f5544250a3059c0a0266d44f70e89632694861de3e186272b170b37c464  imx-gpu-viv-6.4.3.p1.2-aarch32.bin
> -sha256  3de60afb1f54c0888d9849c5a27f938ba229f9f35675456a173bdf00e3538c5d  imx-gpu-viv-6.4.3.p1.2-aarch64.bin
> -sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
> -sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
> +sha256  1324b1aaf190110b80ad9a6f6533f4f50dce9e9ab8d49d8503f59764b151d219  imx-gpu-viv-6.4.3.p2.0-aarch32.bin
> +sha256  003c30baefb1655790b475c3cdfa5cefbf81ea89ef37c6649b64f151dd23a52e  imx-gpu-viv-6.4.3.p2.0-aarch64.bin
> +sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
> +sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA

  When the hash of a license file changes, you *must* make a comment about it in 
the commit message.

  I've added:

Various updates to the license files, but still NXP license.


  Applied to master, thanks.

  Regards,
  Arnout

> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> index fec19523a3..ace025c656 100644
> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   ifeq ($(BR2_aarch64),y)
> -IMX_GPU_VIV_VERSION = 6.4.3.p1.2-aarch64
> +IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch64
>   else
> -IMX_GPU_VIV_VERSION = 6.4.3.p1.2-aarch32
> +IMX_GPU_VIV_VERSION = 6.4.3.p2.0-aarch32
>   endif
>   IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
>   IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
