Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88B6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:56:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 533D060F6F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 533D060F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A32580F0E;
	Mon, 25 Oct 2021 18:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6JQxl8vSepp; Mon, 25 Oct 2021 18:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F0A80F02;
	Mon, 25 Oct 2021 18:56:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E39281BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E04004046C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eViufHx8k6F for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:56:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31248403DF
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:56:14 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id l13so3197851edi.8
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=v+pcqDA6RqmfkfVP4fGPpqkDS1bWH3B6WMUKXAX2D0A=;
 b=CV8cL2ia9Pyg7LFJkhJ2NOi4w5qDpQw9ZgOgfXDRVhL3AVrb8ct3u7RGWfdxRg0a8u
 /xivD9aQUIMppGDCSraE46Y89s/mG65K8Gh7BcHy6CQUt0wxOrqgqZLPVlyKlnaPP5N6
 /oQODZfZ+l5EWLeObCg86fztewZiNG3v3vmYW9wOd6JkQHW/Khgj0mXtxhNiNtwSMESe
 kHewtieTaUyG59/Yti2MnS/0Y/FpdTfeKyBZpp/YFn9TQB9N0dqdY0w5dYZGYtnMQfwY
 xo7EGcjiTLM7QCglvopOOQCCLBaVtG1Vaqm12+DSJzeRCM8u8LHwqYAad1NLizI0gvV5
 fcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v+pcqDA6RqmfkfVP4fGPpqkDS1bWH3B6WMUKXAX2D0A=;
 b=lXslv/EOYk1iHZ31uN+u/wRQHooG40zLuoEskQd7KdWtJqfHDoSnUicprRKnS7aKIT
 Y5YTCX3tltuwyLOUV8UK3+BzztdI/u0p2UbXiaBt0UNDgkxEszdIj9ZDUPWtVUeZ9TGH
 I5hoLL98/x7gfFfsuu4dBrRoUUoueETRPodL7h0BlcTLnnEC/4t4KhYxDCfwspEJDgqq
 3eAjnvHvbZfanxkjUa5FJ/jLMHMaY5Z/VHl28AULh8fFqbQNHQhaldyLcFUl0lJhSrDc
 zIFewSJQ17BzxKK+A9TEM18YYx9NmiZMDUflp1S0reU0gNRNqDPtz20VJgVXVmC5Gr4G
 7wmA==
X-Gm-Message-State: AOAM533J6ymu0y1key0YtDXlMdf/lj1s2K2iO5fQ1kGJ2yUPpM7vuI1s
 otMRIaqeB/dm0lhXUCQocOGhETpIfyLJjuAU
X-Google-Smtp-Source: ABdhPJzLpnfXXskvx0ihVStkQdjgkVDIWLvKjZiOB8lLYO9VqmGVANUmVbjn0nhoi5T61wUhY6qr7Q==
X-Received: by 2002:aa7:de83:: with SMTP id j3mr29408076edv.312.1635188170202; 
 Mon, 25 Oct 2021 11:56:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j15sm9668105edl.34.2021.10.25.11.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:56:09 -0700 (PDT)
Message-ID: <3690e2c7-27b0-7a45-1cea-e17d062d1fdb@mind.be>
Date: Mon, 25 Oct 2021 20:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211014204607.2433581-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014204607.2433581-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to
 amarula_rk3288_defconfig and asus_rk3288_defconfig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/10/2021 22:46, Giulio Benetti wrote:
> Add Giulio Benetti to amarula_rk3288_defconfig and asus_rk3288_defconfig.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9950dd5d8c..4a0917d208 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1054,6 +1054,8 @@ F:	package/webp/
>   F:	package/xapian/
>   
>   N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
> +F:	configs/amarula_vyasa_rk3288_defconfig
> +F:	configs/asus_tinker_rk3288_defconfig
>   F:	package/at/
>   F:	package/binutils/
>   F:	package/erlang-jiffy/
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
