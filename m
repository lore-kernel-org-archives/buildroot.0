Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37DCC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E262409A8;
	Tue, 23 Aug 2022 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E262409A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmny_cOmiNSl; Tue, 23 Aug 2022 20:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA2E94092D;
	Tue, 23 Aug 2022 20:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA2E94092D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6444F1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DE7640941
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DE7640941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWIBgCjUA7rf for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:58:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F5A4092D
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13F5A4092D
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:58:49 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id sd33so8462218ejc.8
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 13:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=INjWzSE0YIIR34flCs1+vOA0jUkJf0ClKZ7R8j03Wvw=;
 b=LTzWBYGnqcsHS0TeKZwXr7e1n3X5zqjXspPM2zDddOB1YpgK89RtVAoCdPyVgFTRF5
 kJZWSBJGZqfNpOnDALx76Zyl2BEwRIEiyoUBroSlyJPHCto5O0ttzpCGhlVTV4v6JAfr
 /t+/wID2hwi5hrOu4M9DE18swmtjgweiOW/BwYSK/zegodJapdYSCy9WBxRR8BhqOdGb
 01CP/smqq6JXxwP4yv8Yk0HLkZYUvQRilQpJHpQFm+PTjp0jGMv0HlmgaZvE4LoInCFd
 4S6q0A42b+p4JxkxepMWi6LULcOqRh5X45a2AgwbivwvJA7HjmMMlvDURI3lIR2MWchR
 xrew==
X-Gm-Message-State: ACgBeo30+qvtrCtGLDRuf34bK1InU26OsWV232e9Mdkw1uc/WaIuD3vo
 7oF1zSKNPF0wi3KEkUGmshfWUdiU5EdHpA==
X-Google-Smtp-Source: AA6agR66Yh0uApfOXqmLEPKm4MZFMXNumwOViiSiT31VrodF4gGxwAWrmrLfx3D+KPODOXVDk5BFrQ==
X-Received: by 2002:a17:907:9495:b0:734:e049:3d15 with SMTP id
 dm21-20020a170907949500b00734e0493d15mr903127ejc.187.1661288328211; 
 Tue, 23 Aug 2022 13:58:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a1709060f5500b00730df07629fsm279210ejj.174.2022.08.23.13.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 13:58:47 -0700 (PDT)
Message-ID: <09686b20-b8ca-d698-7416-f24a8c01a376@mind.be>
Date: Tue, 23 Aug 2022 22:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220607202828.1130778-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220607202828.1130778-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=INjWzSE0YIIR34flCs1+vOA0jUkJf0ClKZ7R8j03Wvw=;
 b=ZrfUfKggZrfakjL6Rb7EmlF0yragwjwZHJdeQL9X/WbeZtFzux4AV65iJLeXoLlWbJ
 WeXXorc0Zw2N84YB/ZDH/Wiex/Jrzl4ZiuP04zlooqiPSN81fuFus0lfHIsNG6jxsE/X
 HnoVMMJY3scqEv/2ycIGcnw54WxA6zrzlBBGDwPUrDsjmgfXa9tNdh5yesTAchtLXSbP
 Yo0++aT5E94E/VkFuRpyaAwjXINmYPj/VVmO51dVdjz/nL84uzETEY1UBkM7LPHMEYbu
 TeCWAxzjJPwOGp6C7j+OW2au8nxy0o//W0b/pzwKtVXoxkSL+dSn0lUA7W5i+hNlqkzm
 7QgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZrfUfKgg
Subject: Re: [Buildroot] [PATCH 1/1] package/jpeg: SIMD needs VSX with
 little endian
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



On 07/06/2022 22:28, Fabrice Fontaine wrote:
> SIMD needs VSX with little endian to avoid the following build failure:
> 
> In file included from /nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jccolor-altivec.c:25:
> /nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jccolext-altivec.c: In function 'jsimd_rgb_ycc_convert_altivec':
> /nvmedata/autobuild/instance-12/output-1/build/jpeg-turbo-2.1.3/simd/powerpc/jsimd_altivec.h:93:26: warning: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vsl'? [-Wimplicit-function-declaration]
>     93 | #define VEC_LD(a, b)     vec_vsx_ld(a, b)
>        |                          ^~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/be6d5ad0cee4ee19eb25e595d44555a1af6e073b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/jpeg/Config.in | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
> index 0a786060d7..371f89aa49 100644
> --- a/package/jpeg/Config.in
> +++ b/package/jpeg/Config.in
> @@ -3,7 +3,8 @@ config BR2_PACKAGE_JPEG_SIMD_SUPPORT
>   	bool
>   	default y if BR2_X86_CPU_HAS_MMX
>   	default y if BR2_ARM_CPU_HAS_NEON
> -	default y if BR2_POWERPC_CPU_HAS_ALTIVEC
> +	default y if BR2_POWERPC_CPU_HAS_ALTIVEC && !BR2_powerpc64le
> +	default y if BR2_POWERPC_CPU_HAS_VSX && BR2_powerpc64le
>   	default y if BR2_aarch64 || BR2_aarch64_be
>   
>   config BR2_PACKAGE_JPEG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
