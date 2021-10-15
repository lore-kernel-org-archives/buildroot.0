Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B47C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:15:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38ACF611C8
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38ACF611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D511605F9;
	Fri, 15 Oct 2021 21:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7xIU_a09eV1H; Fri, 15 Oct 2021 21:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C45FF60661;
	Fri, 15 Oct 2021 21:15:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39F251BF417
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36A7083B01
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 29PN_3L9oUbl for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 21:15:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2514A83AF1
 for <buildroot@busybox.net>; Fri, 15 Oct 2021 21:15:38 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r18so43041493edv.12
 for <buildroot@busybox.net>; Fri, 15 Oct 2021 14:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=NuQdUJ9kgbk0BB2khvrn/UYSgLizqAWjazPJKCc/8PM=;
 b=ditLXMVZYgCeVlEGtzUDXDSrzBQ/Dn/1qjd5y0boYcV3tMje5ggOlIbiMCJXdW+q4Q
 YpH61aFpWN3247uiD7hl5JuaALk7rkv0WKjgo6gNLaPkRep4nQXkz9Kl0FW1hYc/Vq3I
 7VLq1dW/PvskdPIxF1BUUWtykGgK28OcGEVbOZZ9lce7eMJ0KAA1AUtuPMObMTuaoiZY
 a1Q9zKPnaNGDxnk7+2sr6vm2MRJr/wnoTuDawI6tuR56o/unbIOgJFz/tbsbe0BkD10u
 GOrPmBvCf8Gmepzx39VKoPUryoAWzeKZnoKhGQ1ThhIVvHlIFGyiX6O4/7rITmU3Gscz
 9vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NuQdUJ9kgbk0BB2khvrn/UYSgLizqAWjazPJKCc/8PM=;
 b=NOV+nhQQaCCQp5C3CxB3FhIHrUW9Wr8v94DUh3F4PcUIf9rWhmdsPrchPiBvGJr5TH
 ENd54mWZ03IRl5O7kGVVQOQMgk6A3ucBBLr1J/6RVvexILEzX2R4b9yi+wnRNepmCDmx
 ZpE1vVoUKhfgtHXXrzwSvBEMK6KIl+iYfvLqTnE1ivx/6CMo8j+OmhAxppv1SMarw8zW
 F5OWiVeBAhQCjVKGPBL1HIGCbcLUuX5uL9aBBNQG8t//iGHS3xSWVnSKMF0K292PElc7
 NuWu3y12do9KmmF3kNXT5ty1I/BquMJcKVWXgEE59pTrlQ0dg8pKpCF1zQQWucmAPETj
 7krw==
X-Gm-Message-State: AOAM531OoK67cCA2PBfqEbtgtiu0qVl+Mwy6ibBQ2YzPxRtAHwv3yaLb
 kZR3kbg4jLtWg07SgXfumLgCBw==
X-Google-Smtp-Source: ABdhPJxR0KeoxoZNZo3S1tV6WSjFr/ek064pe1FfIdJxlLMAKmDFGYxDnpyy2xO+2IxaF2wAyOSGPQ==
X-Received: by 2002:a05:6402:5255:: with SMTP id
 t21mr19861128edd.103.1634332536111; 
 Fri, 15 Oct 2021 14:15:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g8sm6619695edb.60.2021.10.15.14.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:15:35 -0700 (PDT)
Message-ID: <8e120a87-76c8-2396-615c-80f7c6eba0f0@mind.be>
Date: Fri, 15 Oct 2021 23:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20211011103700.153400-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211011103700.153400-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 5.9
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



On 11/10/2021 12:37, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nano/nano.hash | 4 ++--
>   package/nano/nano.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nano/nano.hash b/package/nano/nano.hash
> index 277f22401..c2af67a0f 100644
> --- a/package/nano/nano.hash
> +++ b/package/nano/nano.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://www.nano-editor.org/dist/v5/nano-5.8.tar.xz.asc
> +# https://www.nano-editor.org/dist/v5/nano-5.9.tar.xz.asc
>   # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
> -sha256  e43b63db2f78336e2aa123e8d015dbabc1720a15361714bfd4b1bb4e5e87768c  nano-5.8.tar.xz
> +sha256  757db8cda4bb2873599e47783af463e3b547a627b0cabb30ea7bf71fb4c24937  nano-5.9.tar.xz
>   sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
> diff --git a/package/nano/nano.mk b/package/nano/nano.mk
> index 2a20eca21..fba318b03 100644
> --- a/package/nano/nano.mk
> +++ b/package/nano/nano.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   NANO_VERSION_MAJOR = 5
> -NANO_VERSION = $(NANO_VERSION_MAJOR).8
> +NANO_VERSION = $(NANO_VERSION_MAJOR).9
>   NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
>   NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
>   NANO_LICENSE = GPL-3.0+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
