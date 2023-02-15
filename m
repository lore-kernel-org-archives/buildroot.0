Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C15C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E0D4179D;
	Wed, 15 Feb 2023 21:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E0D4179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZEur1BqhNDb; Wed, 15 Feb 2023 21:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7494A41773;
	Wed, 15 Feb 2023 21:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7494A41773
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E95A1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D77B960AB1
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D77B960AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Clw0VlN-cj9K for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:24:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7561D60A70
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7561D60A70
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:24:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h16so20560386wrz.12
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 13:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5hcGk7L/GazluwnLY3fP+ltRIpKG4GsYmE66mUfmaY=;
 b=fTa/Il8yya5gf/7NIxUqZc0nTDTNJ1b90Q9wTKit8cGHaL7GFETxbu9yCrLXeFsNCz
 31y0tuqcfLY/Zc04RcV38hg8D+LBr9XpCV0NTkCBlGaPLa1yxt3hRnAb0SCz55FgCz/+
 l0n9+xdIzKZLKz+iaUp2U6JJqkeTAsLHPWfNwq/b6Nd16Zx8voeCrVWbaskXs6fV/zPg
 SD3FpSxz9tuKX3B8IG0LmpTSdTXMuZoMEkgtPNI6PSzgvZbXVlnGChCnhW5mzwj6A9JO
 h9imlLK3yuXH1YcsF786q95Ci80gefMfOV0v766stOFbM68VhQs3pK5p/TxRTbBb2MJT
 eJ9A==
X-Gm-Message-State: AO0yUKXjp0zS95BDPizzGvLBBjiGyQg8fAKYYwrdID7voHvVBHK+3eua
 iJLwBSyAW7aNshiVOG6s8ZgPpw==
X-Google-Smtp-Source: AK7set/OxmeYWJPQD8o4UyMBbflFtLA+iLW0iifnfFal2yKMTfY2AUAG2S26PTqVjVkbAy4qijjBzA==
X-Received: by 2002:adf:ea4f:0:b0:2c5:57d5:ef6e with SMTP id
 j15-20020adfea4f000000b002c557d5ef6emr2594419wrn.46.1676496291530; 
 Wed, 15 Feb 2023 13:24:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a056000181500b002c56af32e8csm2898854wrh.35.2023.02.15.13.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 13:24:50 -0800 (PST)
Message-ID: <242cceb0-476d-3a5b-5dcf-fc16b2ecf906@mind.be>
Date: Wed, 15 Feb 2023 22:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230213181120.907459-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230213181120.907459-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y5hcGk7L/GazluwnLY3fP+ltRIpKG4GsYmE66mUfmaY=;
 b=BfQMhS/+v4lcjyLDmdc4d5WL26ufXq9sBpUHgYJ37swE0fIC/9Grgov3Ir/uUsMIi5
 +NKLaEQj1bEw/aURBBz+oAF4Yfu3SEs8t1IvgUHZGFrEMpoqsz+/5feqGPiA/fswNuo4
 sav4nXfsDPl/hPKpZuJy7lSjiZMEKWqJqt0Qr2rSL+bYAEzp9P5bpsG3Y6gpQGQGcDJq
 slpDTR7yxMeeeg1eBhMgmRSlsiAuTIem+gKgI04sjxtQoQQ3DINuTEAllxYEtm/CsdG3
 zsmeuAQRjcylje+roKzKx4itV55o6VvqMurc47mB4LXK2Ru64QQnVgWtNlGzWrIcWwsW
 A6vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BfQMhS/+
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: compress-offload
 needs kernel >= 5.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2023 19:11, Fabrice Fontaine wrote:
> SND_AUDIOCODEC_A{LAC,PE} are only available since kernel 5.7 and
> https://github.com/torvalds/linux/commit/0f546d6f0292fb624b4cf0cc70096ddb9ea070e6
> resulting in the following build failure since bump to version 0.3.65
> in commit 247e2d0eb1e60f483044d58bed58c5ed321528f7 and
> https://git.buildroot.net/buildroot/commit/?id=247e2d0eb1e60f483044d58bed58c5ed321528f7:
> 
> ../spa/plugins/alsa/alsa-compress-offload-sink.c:183:11: error: 'SND_AUDIOCODEC_ALAC' undeclared here (not in a function); did you mean 'SND_AUDIOCODEC_AAC'?
>    183 |         { SND_AUDIOCODEC_ALAC, },
>        |           ^~~~~~~~~~~~~~~~~~~
>        |           SND_AUDIOCODEC_AAC
> 
> Moreover, flac_d is also only available since kernel 5.5 and
> https://github.com/torvalds/linux/commit/d2522335c92c090bf58531a2b696d7fe80ab2a7a
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/9ecd9aca5edc3756154da59573157954f06e6537
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pipewire/Config.in   | 12 ++++++++++++
>   package/pipewire/pipewire.mk |  2 +-
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
> index f038291e87..4929e5d3d1 100644
> --- a/package/pipewire/Config.in
> +++ b/package/pipewire/Config.in
> @@ -15,6 +15,18 @@ config BR2_PACKAGE_PIPEWIRE
>   
>   if BR2_PACKAGE_PIPEWIRE
>   
> +config BR2_PACKAGE_PIPEWIRE_COMPRESS_OFFLOAD
> +	bool "pipewire Compress-Offload"
> +	depends on !BR2_STATIC_LIBS # tinycompress
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
> +	select BR2_PACKAGE_TINYCOMPRESS
> +	help
> +	  Enable ALSA Compress-Offload support
> +
> +comment "pipewire Compress-Offload needs a toolchain w/ dynamic library, headers >= 5.7"
> +	depends on BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
> +
>   config BR2_PACKAGE_PIPEWIRE_EXAMPLES
>   	bool "pipewire examples"
>   	help
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index 976d7783b9..ecf4a035ec 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -215,7 +215,7 @@ else
>   PIPEWIRE_CONF_OPTS += -Dsdl2=disabled
>   endif
>   
> -ifeq ($(BR2_PACKAGE_TINYCOMPRESS),y)
> +ifeq ($(BR2_PACKAGE_PIPEWIRE_COMPRESS_OFFLOAD),y)
>   PIPEWIRE_CONF_OPTS += -Dcompress-offload=enabled
>   PIPEWIRE_DEPENDENCIES += tinycompress
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
