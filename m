Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760D7C19F2C
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB33E411C6;
	Mon,  1 Aug 2022 18:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB33E411C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cspowuvc8KEs; Mon,  1 Aug 2022 18:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95632410E4;
	Mon,  1 Aug 2022 18:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95632410E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 614781BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C07A81CE7
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C07A81CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ig0YA9N8ublM for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:02:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5C9881CE3
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5C9881CE3
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 18:02:48 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kb8so7224015ejc.4
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 11:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dcMcSmbabVfkRnbqeM2c/fELZxU5xjdOvmyM1pKW+CI=;
 b=vON1J8i1kDunBJq0fvh32ht5KyVdJ2FI7mKrNuO5lyD+cXBQrbBaLZryat1EWLj9n+
 jWfL0ijSAOOy+lPDaP7G790N1PGJJ0IL5c39aGwgq7WidoDX/iteqfkRkjcPpIRBB8jP
 mtEp3zk4FWtqqF6acDyZra7A7QacFV/8DtFTR7jLEjb3XBfxhVdfPQpOL5ME95RvZfZu
 AFDbPAeV+x/ezXcDdHAcUNfxY9LDyoA4nQFEEUdH6AEBdyKDijuZ486W08v/ShCrNFKg
 tqPOixHZerTbPaVoyY0m+tYvzQtFOsRfyqufo5SRu0HOHyee3IjEDTMsMjQTP50Ydw2g
 cPwg==
X-Gm-Message-State: AJIora8QwJvBC1YaKxcV7E981AGu370MbXGyexmnmSZDfDcSQ88MoceM
 ruDFJd/s/PIns17lNHS+oFIbOHsnkD8uaQ==
X-Google-Smtp-Source: AGRyM1sZeTxQwiyAXTBDtZu5Bu3C+LL/E8/norQiBhl8I33+M4hAn4hcUlJw4fEaGtAFE/dgiNPSAg==
X-Received: by 2002:a17:906:5d04:b0:722:f46c:b891 with SMTP id
 g4-20020a1709065d0400b00722f46cb891mr13263456ejt.4.1659376967182; 
 Mon, 01 Aug 2022 11:02:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a17090609c900b0072f5fa11d19sm5411264eje.202.2022.08.01.11.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:02:46 -0700 (PDT)
Message-ID: <83ec6649-bd17-46dc-ae6f-ec30063358c2@mind.be>
Date: Mon, 1 Aug 2022 20:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220731113249.93158-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220731113249.93158-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dcMcSmbabVfkRnbqeM2c/fELZxU5xjdOvmyM1pKW+CI=;
 b=gz8i6jrdSsFNHCb/gdRXqLhv7c31faMfjuqEI6Gsg5JmuUqtJAWJPU8lGpCYW3mGre
 WU22uj/p1fHMZZ2tq2dIkRBlzW1n4aL73bXi2wCshp5TD0YxXhv6KQzbFlip6d1ojNMq
 2RKXPs/0v3uq/YkpmfAwHqDy+KhLHEUU1a86qlQW9B4S9TZpPlwm17VBxXQYjTpr2nXr
 U7mxlV2r6aPg9KPoulSK+SbPSJGfuccj6Dv2SjNOHXcP7muX2szoX3IlhAHRELHokReL
 wb4CMIrWJ/uyMepcrZ7nNaqejaSleIvVKc249/K5uBaxT2iuBaJZb53RufZlQ9znByKU
 UcDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gz8i6jrd
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: ignore CVE-2021-38291
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matthew Weber <Matthew.Weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/07/2022 13:32, Bernd Kuhls wrote:
> Fixed in version 4.4.1 by
> http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=1845c0c85c56d300b6b2ffea43d4adc610caa2f5;hb=refs/heads/release/4.4#l160
> http://git.videolan.org/?p=ffmpeg.git;a=commit;h=07dec5b0c383ebd6053bdf0a022dfe4aa01b9b70
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/ffmpeg/ffmpeg.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 82d229903f..d43274c4a7 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -17,6 +17,8 @@ FFMPEG_LICENSE_FILES += COPYING.GPLv2
>   endif
>   
>   FFMPEG_CPE_ID_VENDOR = ffmpeg
> +# fixed in version 4.4.1

  For this one, I went and checked, and it is the NVD that is wrong. It has 
cpe:2.3:a:ffmpeg:ffmpeg:*:*:*:*:*:*:*:*

  So the proper approach here is to fix it in the NVD. I'm not actually sure how 
to do that. Matt, Thomas, do you know?

  Regards,
  Arnout

> +FFMPEG_IGNORE_CVES += CVE-2021-38291
>   
>   FFMPEG_CONF_OPTS = \
>   	--prefix=/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
