Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0F9C04AA5
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 20:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B0981462;
	Wed, 24 Aug 2022 20:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B0981462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2KP5ezKGT8DY; Wed, 24 Aug 2022 20:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B4DE82725;
	Wed, 24 Aug 2022 20:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B4DE82725
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53F151BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F001401C2
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F001401C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1PlDyY0nLMV for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 20:00:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E6C5405EC
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E6C5405EC
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 20:00:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id w19so35603885ejc.7
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 13:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=HmTmo9WuDGsDkt7NSUdlnbLhRsm+D3Tcm2eEeEgQUrM=;
 b=etA8xP3z//uh8OJpm7RXxu5GHY1r9yqOq7dtMwZLcEuscs4c6s1SqmpX/hY/hYnPm/
 c2kk2CW1YJr1hbcdGkM8Fc+DDKK3opEjTGJs8qS7TjlifTz27VURTl7slDko4I0IUBwZ
 ny62kag/zK31dKWFI+QvOWVL6rYgX901GbmR6s1d2H6gRuW1wWwSwFy8LU7csEfD+mHO
 x88Tz0mhAjKqPnmBHk7ymbE0YS45VgH6co/0LVOuF5thP3ARdho5+uQoU/R9Ype1Lgh7
 /0F8nzowiqmnud2LbaaRcIS6vXS5UXR6+Vobw344qdJoSdWNIUCSySqFAnP3ycxop10S
 VLKg==
X-Gm-Message-State: ACgBeo2FS9ARAdwRsrdkclf96453wgQ1Zk6uum1FmYKj2sYHI95a+TSn
 /aD/A4tclvAlIdnH2/qX4wgFmVAB6hsUdQ==
X-Google-Smtp-Source: AA6agR5aVs3snO3wZpeERIzEpWaXKT7kZHwWEMd8RabEyB0Oo1waxdWCIdHzrRFYAfQhlPt89YwfAg==
X-Received: by 2002:a17:907:2722:b0:731:201a:df9c with SMTP id
 d2-20020a170907272200b00731201adf9cmr338937ejl.149.1661371233304; 
 Wed, 24 Aug 2022 13:00:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 gh35-20020a1709073c2300b0072f0a9a8e6dsm1470810ejc.194.2022.08.24.13.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 13:00:32 -0700 (PDT)
Message-ID: <b318e3f9-571c-6b78-673d-6bea967529db@mind.be>
Date: Wed, 24 Aug 2022 22:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220820130651.507543-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220820130651.507543-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=HmTmo9WuDGsDkt7NSUdlnbLhRsm+D3Tcm2eEeEgQUrM=;
 b=CssEx+OG+7dEV0L5/r6FazLkZA8gLl1Jq9MyKMggNLT0WA9Et70+4xpfm6bTHN5i9m
 p4FK7jDb1zz7cuhtchePERSoa7q09zmy6Eltjd5DGSRQyAbXM0XfMryRcS7KLIdfbwit
 mNY36Z8qHfYesbm2TEwY6fvIEk8q1ZZ/K6OtrB1NCasMZtIbWHm8y/Eztetoow0SZvrO
 oLYozIwRhoWdAeWyuhmuonaSg4h4S0uZxJrPIDmHdkSVdosNtSVUp+yghNE5LkjM0E1h
 3Ok9Z+CO1LkJlzOT4EP+SZAADEAJDykV+O/fIU8W/NGvZix8lZAHIHHLhwpDAMaPKjRU
 pLzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CssEx+OG
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: fix build with libressl
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
Cc: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/08/2022 15:06, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since the addition
> of the package in commit 8aaa7ecbce1d10cbcd880c3da5e429988f96176a:
> 
> In file included from internal.h:45,
>                   from card-authentic.c:32:
> /nvmedata/autobuild/instance-29/output-1/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509v3.h:802:10: error: expected ')' before '*' token
>    802 | uint32_t X509_get_extension_flags(X509 *x);
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/7b50ab363c174636fb27d554223287d7496676ed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.


> ---
>   ...02-added-compatibility-with-LibreSSL.patch | 172 ++++++++++++++++++
>   .../0003-Fix-build-with-libressl-3.5.0.patch  |  46 +++++
>   2 files changed, 218 insertions(+)
>   create mode 100644 package/opensc/0002-added-compatibility-with-LibreSSL.patch
>   create mode 100644 package/opensc/0003-Fix-build-with-libressl-3.5.0.patch
> 
> diff --git a/package/opensc/0002-added-compatibility-with-LibreSSL.patch b/package/opensc/0002-added-compatibility-with-LibreSSL.patch
> new file mode 100644
> index 0000000000..1e13a070c8
> --- /dev/null
> +++ b/package/opensc/0002-added-compatibility-with-LibreSSL.patch
> @@ -0,0 +1,172 @@
> +From 302ad70471efa279b033d4d5511d979ec5d965fe Mon Sep 17 00:00:00 2001
> +From: Frank Morgner <frankmorgner@gmail.com>
> +Date: Thu, 20 Jan 2022 17:01:46 +0100
> +Subject: [PATCH] added compatibility with LibreSSL
> +
> +[Retrieved (and backported) from:
> +https://github.com/OpenSC/OpenSC/commit/302ad70471efa279b033d4d5511d979ec5d965fe]

  You forgot your SoB here so I added it.

  Regards,
  Arnout


[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
