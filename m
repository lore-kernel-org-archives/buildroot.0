Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C807AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4ED41A58;
	Mon, 25 Jul 2022 22:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F4ED41A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYZBpubUYVZw; Mon, 25 Jul 2022 22:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6A9E41A51;
	Mon, 25 Jul 2022 22:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6A9E41A51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96F8B1BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D37441A4F
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D37441A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vMXuDTWv_y7 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:22:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A55341A4C
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A55341A4C
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:22:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b26so17860652wrc.2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xx7XFaAr54ReRv8flR8715ah9ZY7GIZ8h/fiEwQjLR4=;
 b=ZcYgp/KYM5nkHLwkee6AbgQDE49wJAo/t+oIbo46wu7E8tFLzhoowmxpR8wncVhxfx
 VqwPdRGdYxcX8CXOklhWJ5hvve77BFXcs5sBi9CJN/9uoiFkCjYtDUuyb8+D6I2FZigS
 yLlzTBSxME2BDlORw39Z0Nq55uI1wzUwF0+ns6IBhnicogo0SKzxBUWr08P+Rj2yAUkt
 ElJ+QRho/hKhQsQId/xFhBDB8PotXxPEPHtwukLAplk0oSwS27pGMZOfkXbRPseSmebU
 J9J7KNpb9oak0xjreeJV6AuDfe3gxx4zpclb8cJOG/NAdgiV+XjEPfcbWst3dDWghaY0
 wTfw==
X-Gm-Message-State: AJIora/LKil32CTpK8wpfF3V4/jZq4HVgEB2E94g3wGTdPqxR5muBQNm
 av0yzDPwlfcGf6LK4KvXiQAb4Q==
X-Google-Smtp-Source: AGRyM1sx6pnaHKEdoUD58Az128U/isJr3ek5aOrtaW4D1Fk2TwEzpmKg38j1e1oLKGWqfDK+lqJ7tQ==
X-Received: by 2002:adf:e193:0:b0:21e:626c:d082 with SMTP id
 az19-20020adfe193000000b0021e626cd082mr8632608wrb.159.1658787731559; 
 Mon, 25 Jul 2022 15:22:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d52d1000000b0021d68a504cbsm12749694wrv.94.2022.07.25.15.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:22:11 -0700 (PDT)
Message-ID: <eb0fce57-fcf7-c470-0f97-f249c88d6f29@mind.be>
Date: Tue, 26 Jul 2022 00:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220725071059.3067736-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725071059.3067736-1-christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xx7XFaAr54ReRv8flR8715ah9ZY7GIZ8h/fiEwQjLR4=;
 b=e6jlNCsLRu1ueYbG/7X/u2CsOG49PUSDQQkADNQadgiYA7uh4LPsdv6VsITSvtooO6
 /nCYwA+I/zy2tScp9Ko0DrkJxcDvFmSNNvofSYGw8a5/XgExQYzfHYEfoysK7H0jGiai
 ZRV7VX5wyJLIjm+25VGudd5zfS9N7W7I02I5pq9uDp3dcb393iYgFbzX+tj87DHyqaUy
 q14GYFsJ2wu6Q+qiXsOlpK5xtXNuJhsepbB21E7I67JNM+w0ggFRvYuIpSIMjSAd4b4c
 nf0yfipblT7Bd1O7NJT8erVWpszpZ+YhKbdC/gp988fM3l/za1OnFUX+VT/HDQIiC3pt
 hHMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e6jlNCsL
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rtl8812au-aircrack-ng: bump
 to latest 4ab079
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 09:10, Christian Stewart via buildroot wrote:
> Bump to the latest commit hash as of 2022-07-25.
> 
> Fixes the build against kernel 5.18.x and GCC 12 and ARM64.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

  Applied to master, thanks.

  Regards,
  Arnout

> 
> ---
> 
> v1 -> v2:
> 
>   - update to 2022.07.25 version
>   - add some Wno-error to fix build failures with GCC 12
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   .../rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash   |  2 +-
>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 10 ++++++++--
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> index 667cf34efc..0e61e95780 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  749ba2e77d0364381445e40f7f0b7041d861cf9a356dbe53085e3abaef888c1d  rtl8812au-aircrack-ng-37e27f9165300c89607144b646545fac576ec510.tar.gz
> +sha256  ad30e61bc3100861b995617672193ab027ec51061dfe1fea9f8625b99cd27995  rtl8812au-aircrack-ng-4ab079f7cb172740c7abc8cbd6e6383bef0f65dc.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> index 55c118a825..111fd520a4 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> @@ -4,15 +4,21 @@
>   #
>   ################################################################################
>   
> -RTL8812AU_AIRCRACK_NG_VERSION = 37e27f9165300c89607144b646545fac576ec510
> +RTL8812AU_AIRCRACK_NG_VERSION = 4ab079f7cb172740c7abc8cbd6e6383bef0f65dc
>   RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
>   RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
>   RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
>   
> +RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
> +	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
> +	-Wno-error=address \
> +	-Wno-error=array-bounds \
> +	-Wno-error=cast-function-type
> +
>   RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
>   	CONFIG_88XXAU=m \
>   	KVER=$(LINUX_VERSION_PROBED) \
> -	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN"
> +	USER_EXTRA_CFLAGS="$(RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS)"
>   
>   $(eval $(kernel-module))
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
