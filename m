Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1D9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0763461B1E;
	Sun, 24 Jul 2022 10:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0763461B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FIuQ3MMoWbLC; Sun, 24 Jul 2022 10:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2160161ABE;
	Sun, 24 Jul 2022 10:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2160161ABE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56F271BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DA34424BF
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DA34424BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHZqCAfID2hy for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:30:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55E1A424BE
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55E1A424BE
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:30:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id n185so5151461wmn.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OwpU62NMh8/HioMRuUMXxbS5ijaWEAo/dAebO12Dui0=;
 b=n6OTC3ZbObXROMNRQfzJek/9TPmZ0adMppYt88vzdr8J3v3Qxhzebv7xIQYP/HrQQt
 ikNaf0djyghnlrDIs0kV1CRggqRyzFlXLdMb98YsRvpSl0vQCqoW/0TwKIQ8Lvex4mY0
 zq8TgAseVMjZWPOI0yv4x8zDgXHn+xzFrEgrxu4sMgYfseW7ljPZ0BJ2fAaNmN3oi7Z9
 IbBdFFb+sTy5MeKOk9nvhVefJ6pQyzTevx3G0k8ad14uu7VJctdVLbNnbiBtQmBfTpsW
 eYHzd07AJYae+PAkljx7rG9ZDW7TBFczvE6wthUglqq8Ul5C4Zmw7l8HGmXbX1QTGvcF
 nXyA==
X-Gm-Message-State: AJIora/w0+DdJm8h/njeShfbDHY+j0L9iL15OYX+R7tpmlZWqmEMmu21
 sLo52dI5Xbk6vZlGjF+NheBdE9JymMPa4g==
X-Google-Smtp-Source: AGRyM1smzm8nDz0e8yl2o4hexQw8/W2qgQjFH6Wi/TGc8s8ihbWQ359ozzE1ooN0wTFIlrScHKRDcA==
X-Received: by 2002:a7b:ce8f:0:b0:3a3:150c:d8ff with SMTP id
 q15-20020a7bce8f000000b003a3150cd8ffmr17750920wmj.152.1658658632373; 
 Sun, 24 Jul 2022 03:30:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b0021e4edba1e5sm9248885wrp.111.2022.07.24.03.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 03:30:31 -0700 (PDT)
Message-ID: <d550d304-a4b4-61a7-0f8c-5f48e4c629f0@mind.be>
Date: Sun, 24 Jul 2022 12:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220723211404.487090-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723211404.487090-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=OwpU62NMh8/HioMRuUMXxbS5ijaWEAo/dAebO12Dui0=;
 b=bnyRhdumsKd8ptCn90wz9QTNnzbNCFiu0PT4/KiTDbYjoZJBeypxSuo2e2rkXOkkkP
 gDKLJm36U2UnBRcn+1hp2tY6UcU08ilWRkzSA2xHTR+fW+Iq9LJmifFhOezU61aoWTPb
 FRpgjmsMIcPTE+NhYTBJZosbF3hm2re3M610/50QYqtYhC/t6WqVWUkwKHxlwx6uNm4T
 i/sLPUcDtLIRDexGJXVB2BasNxXmJyfxgcBwcTQUi0wnLZ/nUg9A/m6ULxV3DqigqC3E
 ZN4HBVToZrSGI+ejga2BVARi+0rKCpy6z/9YZGePf6bL18va1Te8W7opzNgPL0cmeZ7k
 6Kwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bnyRhdum
Subject: Re: [Buildroot] [PATCH 1/2] package/hackrf: drop unrecognized option
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



On 23/07/2022 23:14, Fabrice Fontaine wrote:
> Drop BUILD_HACKRF_TOOLS which has never been recognized since the
> addition of the package in commit
> 29b7cc88f401dcc69a085be5af067851f896da58
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/hackrf/hackrf.mk | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
> index d80f87e6b9..6d694f5fbc 100644
> --- a/package/hackrf/hackrf.mk
> +++ b/package/hackrf/hackrf.mk
> @@ -13,8 +13,6 @@ HACKRF_DEPENDENCIES = fftw-single libusb
>   HACKRF_SUBDIR = host
>   HACKRF_INSTALL_STAGING = YES
>   
> -HACKRF_CONF_OPTS += -DBUILD_HACKRF_TOOLS=ON
> -
>   ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>   HACKRF_CONF_OPTS += \
>   	-DINSTALL_UDEV_RULES=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
