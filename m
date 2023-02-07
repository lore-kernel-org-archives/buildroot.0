Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC0EC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8919340B3A;
	Tue,  7 Feb 2023 21:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8919340B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dX8IBe6IpNcz; Tue,  7 Feb 2023 21:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBCB940B24;
	Tue,  7 Feb 2023 21:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBCB940B24
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4FFD1BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC24940B24
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC24940B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fR6gk7qiROOk for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:57:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F64B4057A
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F64B4057A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:57:32 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so46443621ejc.4
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 13:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gGn6JZshxa934horL40NVWtTrE/9hPEbYSVP0bkHNV4=;
 b=sadFThOFIMJ2pxMtZl1Aa03g7b4E6KqwVxHaHdskPLGXFDMooxBSTcZjbhhlgdSdJZ
 vWN6FUAWO7sT0cx51604kF2q4Uw6nfb2NaY3lJpF35Q4gNFxEIp7PB8YPfXCF6Y7862h
 SPh7z/Se/wZmbFRiwVQ45UP4nKzmeDuzbJ6ESr7DbaqolpsI8+Pu7hp83GUa5WrmI05u
 3rbybMK3M0/AFm0LD3MQOme370UHkvT8RdnIMd5xh6uYn2Yi/Golk8CNl3AMRCrZeY9V
 0tcdGSSlW9sZuPQXfO81kSa2PQROkCV0kCZi+FQEYlWd5J3VM/R6k8Ej/IAbdtMIgUfu
 YbCw==
X-Gm-Message-State: AO0yUKWJqAigJ409UujTkjvdAlk24OCH9rZ1/wwYHFijzspnJZiHTmYY
 e4sEbE0Df/4GNjjOP8DcomA8Ow==
X-Google-Smtp-Source: AK7set+MJrkvgLe6aV1YZyRwCR9Zp0NhO+vDnkYnRTerZHbQ4NrIOZUtm3mpfAOAoNZldWSWIjhtsg==
X-Received: by 2002:a17:906:a0c:b0:87b:db29:61af with SMTP id
 w12-20020a1709060a0c00b0087bdb2961afmr4807428ejf.24.1675807051276; 
 Tue, 07 Feb 2023 13:57:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170906a00700b008aac35b1c2esm186600ejy.173.2023.02.07.13.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 13:57:30 -0800 (PST)
Message-ID: <d31cf7cb-40e3-de90-1d12-05b60229b87d@mind.be>
Date: Tue, 7 Feb 2023 22:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20230115114840.9027-1-nolange79@gmail.com>
 <20230115114840.9027-4-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230115114840.9027-4-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gGn6JZshxa934horL40NVWtTrE/9hPEbYSVP0bkHNV4=;
 b=MpTuuXjfP2K2weIA2xqa461zx9cTPRAbmF89TUvbmYOb12GqcdE4vmH9tpBK+PYgCf
 MJMFZHDtT9hA2rSjBRVChB4z3Hdsp/L1s2kVAfUeqN9iVyAxpyBdd9/pBUxHk9Es6JT4
 vFr3EPNb4+mxMiUMx/UlPWBzvXBpigs42BIrLM+q9277DmVoP6ZxgGXfBz4w3Fvo0ey0
 4xmo+H+PMvKKxPNrzun8HdDAL5WlpX1b+gk1g6G5H2ZHNZ/tbd1zFrV1TtLsMq33ADyF
 djzmCYc7gYa7W3Iss7xM4kE1+/L5H5mrRt1I3QVukNfYumTrdSKu4x3atL+2FPKSshca
 /rMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MpTuuXjf
Subject: Re: [Buildroot] [PATCH v8 4/4] system: Warn if systemd is used with
 kernel < 4.15
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2023 12:48, Norbert Lange wrote:
> To quote the README:
> 
>> Kernel versions below 4.15 have significant gaps in functionality and
>> are not recommended for use with this version of systemd. Taint flag
>> 'old-kernel' will be set. Systemd will most likely still function, but
>> upstream support and testing are limited.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> Reviewed-by: James Hilliard <james.hilliard1@gmail.com>

  Finally applied to master and pushed.

  Regards,
  Arnout

> ---
>   system/Config.in | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 232bdfe763..70ddf8df3c 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -141,6 +141,15 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and targe
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
>   		!BR2_HOST_GCC_AT_LEAST_5
>   
> +comment "systemd highly recommends headers >= 4.15"
> +	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_TOOLCHAIN_HAS_SSP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	depends on BR2_HOST_GCC_AT_LEAST_5
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
> +
>   config BR2_INIT_NONE
>   	bool "None"
>   	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
