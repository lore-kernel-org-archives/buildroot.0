Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D757EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8564D40566;
	Sat, 23 Jul 2022 19:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8564D40566
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyiIabodRpeM; Sat, 23 Jul 2022 19:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B454441698;
	Sat, 23 Jul 2022 19:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B454441698
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3DC1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3812F4245D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3812F4245D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GMIePsZqUdo for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:20:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31B9A42465
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31B9A42465
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:20:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q18so214633wrx.8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=c6TR4SedsQpo61Li0laL3RVXc+Bekh8+yuzd29+D7IE=;
 b=v1+lsclPcd4Z3cTeu44B5RgH/D3fxx2Uv3cu11z3d1G0r04Dlf6cYvmhqkgPh8JND0
 NerVbwb0vdfDM78N9XPBGI8kUDcMdhnDGadCEUjDY03/NY2nSi027EM08QOO9M5kQ//B
 KaoAYdwr5I6RwmX/89z5Fc9PfRSNk++20ih5ovhnsS31HdKjUxRIZr97DhbxBowAVo6l
 QG/+UV5ZfFOJVp7PjEHyjTMFUszQijRDTC0esMFehUoYAWgh+n/1P+A2mPYhBapUiRiO
 tISEmHuuAJ8Zclo4SzTx7o3efyw8FTM76w9JulqnoZs0zFvIMRfg/axetfPX4vbfWioE
 5QAQ==
X-Gm-Message-State: AJIora/OZsozlwGwW0BHLQyO8DW/Mg7eEGuy+/4ZmUs0Cg5kziDtrdpn
 h/uG2ELHb7IbkFZ8EjNZH177665rVZ9JPQ==
X-Google-Smtp-Source: AGRyM1ut1vRg9ZMhEksyJ8KF6PyE8hYTyES69jUzJjdHPCL14PHqCunFDqrQnPPy9y1+tFK5lZajhw==
X-Received: by 2002:a5d:6c65:0:b0:21d:b7c0:9930 with SMTP id
 r5-20020a5d6c65000000b0021db7c09930mr3365120wrz.500.1658604039054; 
 Sat, 23 Jul 2022 12:20:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adfe6c7000000b0021e4f595590sm7866903wrm.28.2022.07.23.12.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:20:38 -0700 (PDT)
Message-ID: <5659f28f-11ce-b6f1-3b60-b694150aed2f@mind.be>
Date: Sat, 23 Jul 2022 21:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20220620170940.513445-1-vfazio@xes-inc.com>
 <20220620190115.541032-1-vfazio@xes-inc.com>
 <20220620190115.541032-2-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220620190115.541032-2-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=c6TR4SedsQpo61Li0laL3RVXc+Bekh8+yuzd29+D7IE=;
 b=K1TRtJF+Iru/RQvKOTwpWH71isvHCa9nkMQDz8VSDhvIVJT4+fMjIPtQDsbEvmyGfj
 j6zESXZIPh63aypJFaD44cuzfEQzytDnSDkofZfV28VxnMo3P8PDzUJuJGJFJWenZGAg
 psa/BhlnChQzGB9UGkGV0ABjo5eJ5Q/z14yMUUA6gJy6o58maGoVPz0OhIGQ6u6Eftwv
 G7scFm3FvYAPQByFs640IYhkwXUh/e84adLb31MPqTUh1YUtjIvJL2nOCyTkcWAJhbY8
 zFXV37cADB7pNEkyOW5Cp2NvwGQSfPj/2u1mCQd7ToNFbbXyVGq/jFMj82tmNjpS2FMY
 GhbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K1TRtJF+
Subject: Re: [Buildroot] [PATCH 2/2] package/nvidia-driver: bump version to
 390.151
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

  Hi Vincent,

On 20/06/2022 21:01, Vincent Fazio wrote:
> Adds support for Linux kernel 5.17.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>   package/nvidia-driver/nvidia-driver.hash | 4 ++--
>   package/nvidia-driver/nvidia-driver.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
> index 7f2248d0f9..6564b8e821 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
> -sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
> +sha256 5226e4842044cffd9096deadaf68934c133da74e05b80ccd21236584b3afb1fc  NVIDIA-Linux-x86-390.151.run

  I wanted to apply this, but the hash doesn't match... Could you investigate?

  Regards,
  Arnout

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
