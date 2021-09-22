Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261A1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:02:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC3F6112F
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AC3F6112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23C63841A9;
	Wed, 22 Sep 2021 21:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doemLfa-8loB; Wed, 22 Sep 2021 21:02:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 678F2841AC;
	Wed, 22 Sep 2021 21:02:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E496C1BF37F
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE946614E7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OI-HnxFD-LFe for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:02:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83351614CC
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:02:39 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v10so10357871edj.10
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Qh7t6mXfZuXHUdgVJx/qcGUKGZzedbGJjkaZHLIumqs=;
 b=VeewIL6+sC2k1aN6lDG/+74+oxFno8lCSibkbnms3E5Cg3O7tiz7s+XdaqI0Vb/oYE
 AFxHyKMj/RSgB0q3tqhpcG33riou2OChghBoJFOOraYyfXpmly9mAYzzG9NqJUlIv2/U
 7Rq+kfbIyeqCHd8PihvdODjKlDAc94bGdIMvbcgAGUILY+mVUR3LdUtuuJJWm1c/sYwQ
 ehHIvxAyWaTemcg6aB3DvbCK6hUedfrdtn0wy3q1M1J2tDIztosdibDWPe5M65GNcA7M
 aIz7rqQJfrlTuura9d0OHNuAVM884DAZZaIKqj7rzDvER0IHx5Adr2T5BWPS4tx5yhFc
 4utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Qh7t6mXfZuXHUdgVJx/qcGUKGZzedbGJjkaZHLIumqs=;
 b=wMUgtrUM6aUD7+oRP5KbkZnoqfvefYtxYXG2pfPaRdwR/jcVb0EEEkl5ow+OO+ypxQ
 +bQ58k8V6oI3fksbT7cMUFZMjVa2EfpX4xUA2ph/L9kATpTJyWHynRW8ozpuWTu59S2/
 v3p6+Tsv58pP6mE42Seo2RWc9LGSdGzgRtiaQc7JY6um+ZL/kPqXhTnr51wfta87r8Qe
 iMNcqD7QBW6iajSpZo5RvxiMqXhSizqBnXzwAyZXHSuDh8Gc2GOXaJtgL7uFF0lcN7ac
 HHfcSfvVTjQdO1fpht22TMraunsDzkkalDGv2ukLinx+A5/q8z4RkjMUvLYY6LQITKcV
 b6Ug==
X-Gm-Message-State: AOAM532y9EZ8867/woX3qAlhakBnBg+J9EBufMqff7sNO8sKgPuPTxSr
 8zd9AkavC/uaeWTJj8o2MlME/Q==
X-Google-Smtp-Source: ABdhPJy8B5bIxSeTl6JQJ0u6FxdsdkFZerujRDUwNxK0GWOcf6/OsYi9xJadNDe0T2T54Ut33NdImg==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr1600000edk.165.1632344557601; 
 Wed, 22 Sep 2021 14:02:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o22sm1767144edi.89.2021.09.22.14.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 14:02:37 -0700 (PDT)
Message-ID: <a59aded3-1f0d-4d9f-b6c6-957a9990ea4d@mind.be>
Date: Wed, 22 Sep 2021 23:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Takumi Takahashi <takumiiinn@gmail.com>, buildroot@buildroot.org
References: <20210914113130.267141-1-takumiiinn@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210914113130.267141-1-takumiiinn@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] board/qemu/aarch64-virt/linux.config:
 Support QEMU Virt UEFI Boot
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 14/09/2021 13:31, Takumi Takahashi wrote:
> QEMU Virt machine type requires ACPI support.
> 
> Example:
> 
> ```
> qemu-system-aarch64 \
>    -nographic \
>    -M virt \
>    -cpu cortex-a57 \
>    -m 512 \
>    -bios QEMU_EFI.fd \

  I wanted to apply and update board/qemu/aarch64-virt/readme.txt with this EFI 
option. However, when I run with it, it reports "Could not find ROM image 
'QEMU_EFI.fd'".

  I've tried with edk2-aarch64-code.fd instead, and that indeed worked and gave 
a few ACPI variables. However, the kernel booted just as well without 
CONFIG_ACPI (but then of course can't access the ACPI variables).

  So now I'm not sure what the point is really of this patch. I'm not against it 
per se - but I'd like to understand the reasoning.

  Therefore, could you resubmit this patch with:

- and update to readme.txt that explains how to boot with EFI;

- an explanation why CONFIG_ACPI is needed.

The latter can be as simple as: "It is possible to run QEMU with UEFI boot, 
which exposes ACPI variables. To be able to access them from Linux, CONFIG_ACPI 
must be set." - in the end, we *do* want a kernel config that exposes all 
features that qemu has to offer.

  Regards,
  Arnout


>    -kernel Image
> ```
> 
> Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
> ---
>   board/qemu/aarch64-virt/linux.config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
> index e3a4a92913..20e8367fc6 100644
> --- a/board/qemu/aarch64-virt/linux.config
> +++ b/board/qemu/aarch64-virt/linux.config
> @@ -14,6 +14,7 @@ CONFIG_ARCH_VEXPRESS=y
>   CONFIG_COMPAT=y
>   CONFIG_FW_CFG_SYSFS=y
>   CONFIG_FW_CFG_SYSFS_CMDLINE=y
> +CONFIG_ACPI=y
>   CONFIG_MODULES=y
>   CONFIG_MODULE_UNLOAD=y
>   CONFIG_BLK_DEV_BSGLIB=y
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
