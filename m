Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77C2EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 18:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57E2260AFD;
	Sun, 25 Jun 2023 18:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57E2260AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riE9Qu-e-pq0; Sun, 25 Jun 2023 18:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8530160AD8;
	Sun, 25 Jun 2023 18:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8530160AD8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 485E21BF27C
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 18:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 201244109B
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 18:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201244109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X__NwCaKhZ0P for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 18:59:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8400409F1
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8400409F1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 18:59:06 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso304792666b.0
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 11:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687719544; x=1690311544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kPotePjW9k3mZJ5zRz3NIv5qu9+gpd3/Azc4cGJy65I=;
 b=B8CvQ/+CPt2khckQEabJAMjX6LuESYLy9tcaGxlbli2uD1rCKykxzLgjp5QXG1LB0b
 xZs4e4cqrrW0q3NOM4DJQ+z/1cfkZ/LAAPXwtIuLcq9CbIGCO+OPNxcEnCTaqYquwYyV
 5LfbAStYrPQdAo67hS9YYReKZMfS6u4Rqgg4aZXZUgApzxnku8H6Po9BVIezWvYh3L41
 aSX1x3zmqlD9LPYPW3adKFQ57sIBGnZOcGhHAsouIX8/GAiCSQgpk7s8zPTaxU0r2xD0
 j7P/Z4UD1/c6Tsf+Oa+qggJ1tKXJv33EC5V9eQTlyKi/tN9oxMB6LN8a4OrBZjKFX8wg
 VqDg==
X-Gm-Message-State: AC+VfDzijt4Gx13OPQmCspRAayw5tHMtXTB3dkTyklVKYUdQrWIltw9W
 8DIF3lw8JkvRV1u3SOQ6fyfnnw==
X-Google-Smtp-Source: ACHHUZ5bNi6cNzaY4WhrrWetZqhl8TQWc/MIPcRylYPCSzWZ/mAKfMvo56I6MehDgfP1+smFCM2enQ==
X-Received: by 2002:a17:907:1c19:b0:973:e5d9:d6ff with SMTP id
 nc25-20020a1709071c1900b00973e5d9d6ffmr25103497ejc.66.1687719544397; 
 Sun, 25 Jun 2023 11:59:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a170906499500b0097404f4a124sm2370947eju.2.2023.06.25.11.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 11:59:03 -0700 (PDT)
Message-ID: <1383cf3a-fa81-75b7-1e3f-45a82ebb4c7d@mind.be>
Date: Sun, 25 Jun 2023 20:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-7-dannenberg@ti.com> <20230625135435.GC589277@scaer>
 <bd293d20-a3c8-d76d-e711-75daaa5ec136@mind.be> <875y7bpnwk.fsf@48ers.dk>
In-Reply-To: <875y7bpnwk.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687719544; x=1690311544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kPotePjW9k3mZJ5zRz3NIv5qu9+gpd3/Azc4cGJy65I=;
 b=Nh/so52QXkHUKaPKAhXTxu/Jwo87FY++ZVwtENSKmuyJAQuAg7bPgb1P59770HP0Ar
 eRm8Xy1IlCjKP3WQsAtg936ZLwaKsA4cW0vLC0tvTP1DGVBPwPjCa1T6uQNfcxyil9f3
 gdekRCmIUghMTVC9xv/fH4yd+Cc3Z1k4m7BCER5UNkgeTC5/JkrFR0m8qh7UB3utRi5a
 8yDiaElnPgY2NwhUjpOrCWQP1nQghnuVvKO7587whEf9onvTBhvWwbA32PVcydCib13y
 fZyWvC5TPbtiE2Vs09sg6KZzBZvvZ/GlxPHbGJCdHh9l+D0cUCoa0yommbdYYoWOuXNm
 1uHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Nh/so52Q
Subject: Re: [Buildroot] [PATCH v9 06/11] board/ti/am62x_sk|am64x_sk: switch
 to TI SDK v8.6 sources
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 17:22, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>   >>> * TI Linux Kernel v5.10
>   >> So this means going from a 6.3 kernel back to a 5.10 (the current
>   >> latest
>   >> if 6.3, which is what is used in the defconfigs from the two previous
>   >> patches). That's a bit unfortunate.
>   >> Do you have plans to update to a more recent kernel in the (near)
>   >> future? Can't we keep using 6.3 anyway?
> 
>   >  We don't actually have a clear policy on whether to use upstream or
>   >  vendor kernels for the defconfigs. We have a few boards with both,
>   > but IMHO that's not a great approach either.
> 
>   >  Personally, I think it makes sense to focus on vendor kernels for the
>   >  defconfigs. Using upstream is generally easy, you just have to find
>   > the appropriate device tree. But for the vendor kernel, you have to
>   > find the repository, which branch is "current", and often also make
>   > sure you sync up with U-Boot and OP-TEE etc. versions. @Andreas don't
>   > take this as law, though, it's just personal opinion.
> 
> Correct, but given the poor quality of most vendor kernels, using a
> board with mainline is typically a lot nicer (if the IP blocks you care
> about are supported naturally).

  I'm not sure that you can claim most vendor kernels are poor quality. At least 
NXP and Microchip have decent vendor kernels. Conversely, when vendor kernels 
are horrible, mainline is often not super usable either (because, of course, 
those vendors don't invest in upstreaming either).


> Same about the support, E.G. we had issues with various vendor
> kernels/bootloaders breaking with newer toolchain versions.
> 
> 
>   >  That said, I think for each board we should look at what the vendor
>   >  kernel really brings. If everything, including GPU, is working with
>   > the upstream kernel, it doesn't make sense to use the vendor kernel. I
>   > don't know if that's the case in this specific situation.
> 
>   >  Yann, Peter, Romain, Thomas, what do you think?
> 
> Agreed. I would in general say go for mainline, unless there is no
> decent support in mainline. I would not necessarily think that GPU
> support is a requirement, but at least the things used by the defconfig
> (E.G. storage, serial, network).

  That's exactly the opposite of what I was saying, so not agreed I guess :-)

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
