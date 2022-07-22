Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C954C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB9EB41620;
	Fri, 22 Jul 2022 17:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB9EB41620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liGe1p-rCPOp; Fri, 22 Jul 2022 17:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACAEB41598;
	Fri, 22 Jul 2022 17:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACAEB41598
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C84F1BF316
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 17:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26A6F84989
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 17:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A6F84989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fjDLplFEGdC3 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 17:46:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDAB98498A
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDAB98498A
 for <buildroot@busybox.net>; Fri, 22 Jul 2022 17:46:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id n12so7470854wrc.8
 for <buildroot@busybox.net>; Fri, 22 Jul 2022 10:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aenX/8AFGINK2j5Jz8AZqvg3BmDwLOxW+mQ0cYGUlIA=;
 b=wlcTjdsaXJfAkT0/T5+aMu0oNSaC72VP87gfeI7HGDALRtijm/TCynavpbkU8ONyvP
 UPJeHU/VAwpibNlw96upPsFUuXlNwrYqGgXFO7ZfRtBeO3MbiuOf9y5CahgiWug6HgH3
 Co/WABngODZRcgoX/UYPhC/AhnaHVBDvcYXsbNzl/m0iTgIzClTeOSXnEmeEA2+POBbN
 UJlf/Kgv6LMFKoVBg9mnQUuhT6yr4QBP1yKVoozan7klgbitG2c4GsS0AEYLILcg2mff
 9o0GzwLVCKLnq6D0I5SFLn223vu4OENfMAUJs0jX88lsY37uZCZWIGBdaod1Y0H/GdUn
 sCTw==
X-Gm-Message-State: AJIora92Wkfd5d3L8rb+WcQU3ywLbee1caVOQZDeMZWTQuztEPgsdblR
 bXUdLQSokjCZCvPh0yYMqjtIMQ==
X-Google-Smtp-Source: AGRyM1uzUYzFn/TUjJ51HmIwNCp5UHs5C/u+q7gvXyMkCE0R5c9qJTzbpSry6m1H97vhCUcPCuEXyQ==
X-Received: by 2002:a05:6000:d1:b0:21d:ad67:c320 with SMTP id
 q17-20020a05600000d100b0021dad67c320mr684675wrx.27.1658511979715; 
 Fri, 22 Jul 2022 10:46:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adff2d0000000b0021d4aca9d1esm6043685wrp.99.2022.07.22.10.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 10:46:19 -0700 (PDT)
Message-ID: <25e1a7d1-4c1b-3d6a-ce81-24d23dc91d0b@mind.be>
Date: Fri, 22 Jul 2022 19:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <4a323dc9772af9a5b5295ae2d1a65f0d314765d3.1658478797.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <4a323dc9772af9a5b5295ae2d1a65f0d314765d3.1658478797.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aenX/8AFGINK2j5Jz8AZqvg3BmDwLOxW+mQ0cYGUlIA=;
 b=XEmLDScbG+2MipT73JHmVXDJibP2yfVQAXDdQr/AGDlsli2oC36lTPLnAYnlPW36dZ
 wBjVrNNAe1qSh+mdXS4qqRbFulEqv0YmEpLPrsYhkMrqI/cV6tlR99BXn6DcLBVv1yZh
 AlL6FBg0+KWRqknl57WTKKo/M66g6vHAlJsQGOFAt8YNS8vkq0ZaBlmXXJo2644IhSNO
 l+xEsfYseAhDPbjJLPYoA6eTqp+Cvl7kCwLMe6LEIbkw9EEC/6/8cew221DNAE8qOhBf
 8t8Q7ognhfH0MhCyoRZCLTsAe+Jjkh/6IgpxxmFpf5lNF//XJDy/o7Vv2nR6T9gzxUyU
 vWNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XEmLDScb
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix dependency symbol typo
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
 Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/07/2022 10:33, Baruch Siach via buildroot wrote:
> Commit 6d07e2618c0 ("package/uacme: requires TLS support in libcurl")
> mistyped the BR2_PACKAGE_LIBCURL_FORCE_TLS dependency making the fix
> ineffective.
> 
> Fixes:
> http://autobuild.buildroot.net/results/56ea6cb146df63d1575da9dae3035b3220de875f/
> http://autobuild.buildroot.net/results/280b0ed7f9cdb424917373f98c3e4e6b593c6d21/
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcurl/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index bc2f8f47f21d..218309ed56ff 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -83,7 +83,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
>   
>   config BR2_PACKAGE_LIBCURL_TLS_NONE
>   	bool "None"
> -	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
> +	depends on !BR2_PACKAGE_LIBCURL_FORCE_TLS
>   
>   endchoice
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
