Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FB3C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5848D40BC8;
	Sun, 24 Jul 2022 12:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5848D40BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t80yVvKw2AYG; Sun, 24 Jul 2022 12:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7572940B97;
	Sun, 24 Jul 2022 12:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7572940B97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 866DA1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6186484C44
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6186484C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FhFQZkX1w4xm for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:17:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABF7984BD2
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABF7984BD2
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 12:17:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id a11so5223199wmq.3
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 05:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aAOsLVQBWR1ZvTD9+rCl4sDekFiTpEFMhW8NOo6p2nM=;
 b=8JTQq/9w+/Xk9dZoL9ATtVw0IFQp9TiVMM5BPESnScNquVJcysYBgzXBmfrKRi5DNN
 Fx76WQC+B60N0aSX4umtIy535Zf7eQbotDWydP9NLKAekNkvcVARLAduUr2lMrA0NK5C
 wQupgeoamkfJOmxYPhCqhjo2akO30HlOqwv3xQlV+Sg8rdytEPlOWWUFJlYGkGCCpSar
 aUUx44Y3G7aGOmFOOohQV8AEUmya0MWQabuDSZll5PCRkCtx0xC/xmpXpxMT7zJVlrVm
 ZUf7NTqcS48mMt2iSN7y34hEMeB0EbDBE1nOWHPxXHswKernDGyXldHzj8/Mfbk62ope
 dEBg==
X-Gm-Message-State: AJIora9VTx98XF/WUrOyaBgKK+btuMA5H4SQtGDt4tGTPxk6EBj6KqNA
 sPr5XnDTnAju61DId1e1s0BOxayheeL9cA==
X-Google-Smtp-Source: AGRyM1sXY2rGioeHeiNKoIhGwM7yTRl4PIHAvjt+6gxIBY83qNmoul0pTHm0kz6uadCwWcKZT+vI0g==
X-Received: by 2002:a05:600c:4f05:b0:3a3:18ed:6cda with SMTP id
 l5-20020a05600c4f0500b003a318ed6cdamr18365600wmq.34.1658665064921; 
 Sun, 24 Jul 2022 05:17:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b003a3199c243bsm20138210wmq.0.2022.07.24.05.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:17:44 -0700 (PDT)
Message-ID: <9999c03a-4d3b-6ce8-63e8-f7490bc40425@mind.be>
Date: Sun, 24 Jul 2022 14:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220724063303.3305416-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724063303.3305416-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=aAOsLVQBWR1ZvTD9+rCl4sDekFiTpEFMhW8NOo6p2nM=;
 b=EKIJmSP9L5jiqtTcND2zmXf6ywVZhKeKUoGyaP5d2yrfxwHIRd49nHML0M3HjU52P5
 6tnTIMcheKh00/dlvP9CdafEilbjvBebHzPI7oCys7IO8UE+6L7bDU9VBkzU9r+B7bku
 GWCEDcoei/Ia8c+AKnShqnSMvo21DWjUo/3Xot5Qnhwq9dVPMtjikmJicOv7XlWRlQuX
 c/7L8LyRAP4Wf/k21+yMe6EsXIaljwD04lzuX9VGjTDSm8VqstlGHuYEwSLle7uRFZuE
 zfVBt4uOci+AmS4ycaD97YArp64XacXi3/sXI7Twu7KL/PbHN+BxAzU3nzL/6+DndMQD
 SW4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EKIJmSP9
Subject: Re: [Buildroot] [PATCH] package/luajit: bump to
 5677985dc1f19cf0a67112f4365c7fb79237fa16
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



On 24/07/2022 08:33, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/luajit/luajit.hash | 2 +-
>   package/luajit/luajit.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
> index cfc00e852..648d6eb18 100644
> --- a/package/luajit/luajit.hash
> +++ b/package/luajit/luajit.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  e3f9c04e82d5c776335dfb4e53ec1532914ab010b60bffbb0176a8390f100666  luajit-f2b37f51f69ba7e9f8defd05e5aca648121f0fe6.tar.gz
> +sha256  e0389c7669f8e455383d8f0c9d9354d44cdd1885bbf8fd0d4bcdb8fc6f794063  luajit-5677985dc1f19cf0a67112f4365c7fb79237fa16.tar.gz
>   
>   # Locally calculated
>   sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 6155cbba8..2c1e3216e 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LUAJIT_VERSION = f2b37f51f69ba7e9f8defd05e5aca648121f0fe6
> +LUAJIT_VERSION = 5677985dc1f19cf0a67112f4365c7fb79237fa16
>   LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
>   LUAJIT_LICENSE = MIT
>   LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
