Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5138AC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D40E283E18;
	Mon, 25 Jul 2022 22:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D40E283E18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTm7ltqhmi4A; Mon, 25 Jul 2022 22:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3A4183DB7;
	Mon, 25 Jul 2022 22:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A4183DB7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 644E51BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 242FC41020
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 242FC41020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qa3d6RAc7U7C for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:23:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2225540545
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2225540545
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:23:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v13so10069298wru.12
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hAF84F209mNpuwUK0QfwkF3fOxxO5lZPB/TnwAianxE=;
 b=ZnAmvAMXIkKgn1LNNaHLKt+5g55mC++QoIsLKh6lSGANKqNU+ZSEnrzCwGOieWaxuo
 q4t1PAC38m+Trzb8quvxZTUIIxYHtCWjjKZ/aIE2wFzDr8uKWX1NsUoGhLiZHzeYLazi
 ClpKVj4fZ5d1SwjE6OM6y8hUVlV+zgY8vTD5mQ3g5kUWAVhKh0NgVv8DsDOydVr7k0eY
 LTGjAAIxKIalSQjLDl0VSyW8r8J7pUAQTHSnNd6ernrkBEVJjWbc2x4V4d6/1OHRWkdW
 4dvKnrZR9aUGsje6gAJr9Tf36ceuh3uShp3PjzLidzJHagEJZZgV6o5m0MDiySOdn+95
 V3VQ==
X-Gm-Message-State: AJIora99zIduwh3WSReBsKxjl22Ohv4Z7d9JaeSzm26sxWQC1JfZjPQ8
 eAxtYfJ9rPL1A/5vNepJTaPefikemknEmA==
X-Google-Smtp-Source: AGRyM1v+NZlrfjAfWTMsaUhAFYhLSedpg4BxHbcmcr4v+AiVjUnyj6akNzGIYB+ddDgHbmDBXNDNvg==
X-Received: by 2002:adf:fb49:0:b0:21a:3ccc:fb77 with SMTP id
 c9-20020adffb49000000b0021a3cccfb77mr8466250wrs.280.1658787792143; 
 Mon, 25 Jul 2022 15:23:12 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adff2d0000000b0021d4aca9d1esm15319678wrp.99.2022.07.25.15.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:23:11 -0700 (PDT)
Message-ID: <9602d7df-cea2-28a6-760d-493c9c1f0924@mind.be>
Date: Tue, 26 Jul 2022 00:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20220620190115.541032-2-vfazio@xes-inc.com>
 <20220725132552.24631-1-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725132552.24631-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hAF84F209mNpuwUK0QfwkF3fOxxO5lZPB/TnwAianxE=;
 b=FwkNYLmcnvUWEgoHF/pwsfcsR/kZgA9ORYZl3QLS+pizjzAhcuDtJT8/kx4ALKfIDH
 EgV1maCnwy5ef6WaTXZ3exkPWXIiQ1enSh5tCfw+jyB6k4NoksqrxlEczpnVWZD3CeCA
 BI3HWH7XZ8Y+mRC/odF1zKON+Q1ne4crVm3OF9bjPBikp5ZxO1ljLJCR/ec/1Gkxs5IK
 XtbCbKvz0nEFdgPEzr70wdRl7MqkBfMYH8lXy3nNbf1O6sC4SlKEQMp/7ix6gDsXhN1t
 ujYRoC7tDAT/7fRadd91DK5N4UeRx52+VvEXfsqWRbZST/HD0UCm+b8d39f7PGbbCLSX
 fqpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FwkNYLmc
Subject: Re: [Buildroot] [PATCH v2 2/2] package/nvidia-driver: bump version
 to 390.151
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 15:25, Vincent Fazio wrote:
> Adds support for Linux kernel 5.17.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - use proper hash for x86 driver package
> 
>   package/nvidia-driver/nvidia-driver.hash | 4 ++--
>   package/nvidia-driver/nvidia-driver.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
> index 7f2248d0f9..b14e7ae194 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
> -sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
> +sha256 94e399b459659c12b1344e8c8f4f5eee1ed5915ff459fc8bb831c9e1d44677db  NVIDIA-Linux-x86-390.151.run
> +sha256 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  NVIDIA-Linux-x86_64-390.151-no-compat32.run
>   sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> index ec070e3ca6..f1217b00aa 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NVIDIA_DRIVER_VERSION = 390.132
> +NVIDIA_DRIVER_VERSION = 390.151
>   NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
>   NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
>   NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
