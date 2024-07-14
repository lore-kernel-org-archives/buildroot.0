Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93A3C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F74811CC;
	Mon, 15 Jul 2024 07:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPOyrXtFNePa; Mon, 15 Jul 2024 07:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 222B781185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 222B781185;
	Mon, 15 Jul 2024 07:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32B951BF969
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 204D0403B5
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpBwXxZGkESJ for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:44:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07B73403A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07B73403A1
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07B73403A1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:44:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52ed741fe46so540972e87.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 00:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721029479; x=1721634279;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zRr5dw5YJZjNw33+jnToSa/2OPFh7NDrWaU9+SplwJ0=;
 b=luTRv227dBJmh2L3jbRcSF8t0NIXXFUF+sxx+N31vhWFEW5k6SrXUgvowyL7rXPahr
 0MeqajLdmiIDaTVG3RjyEw/Mo1qbyaAh2uXCL0ksXksaJpv05IrzGBlLDnwgiDWCqqRw
 8uyfRvN4zo5GiZkssbSIHRvaZ+CKc6K0QprvZ4lj8SQK7C/IU9bwzIoZv227xrFcOHqC
 qdFpp0klqlr1z+FYZy8HL75+6vKThkGOPtN6gmn59KuGqhnl+8wCzw4Nyunwd6K2u7sm
 52Sy0VSySRbPKDnc6jnFq7SbhkPbjWEw4f4cWCBHHxTrSSVP8UbR2J+jjK97WKlsB4F0
 yF9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPRMifATGWbMSHlpbrUC6S69uhJhEScbqiRJzh0G0Ak+pn49Z8/oCuHS5s09hGMPeQjs4RZTbHJ9or+MZy3FPmtMoop0RHOQ==
X-Gm-Message-State: AOJu0YyggFrJCHwncFAlOGvsZDT9QaJWaiE+xYTuy/UOPxqdm8gL6Uju
 5DlYL7YdzBgq8qQyxbXMpdK38ulosCF1BMkKOsB763dhXdHfKPgCPq7kBLSVUarQgWZ4LPzqlgj
 QXy0=
X-Google-Smtp-Source: AGHT+IG8vlLl3tW+SqzYg6Z3wt3mBefSZsc5o30SnbA4sCnwUdA6G0q34oRwMxjCacLMGY1LehFAcg==
X-Received: by 2002:a05:6512:5c5:b0:52c:8979:9627 with SMTP id
 2adb3069b0e04-52eb998fd49mr9233686e87.3.1721029478597; 
 Mon, 15 Jul 2024 00:44:38 -0700 (PDT)
Received: from [10.3.160.38]
 (laubervilliers-656-1-158-76.w82-127.abo.wanadoo.fr. [82.127.106.76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm75899585e9.3.2024.07.15.00.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:44:38 -0700 (PDT)
Message-ID: <592c0387-e1c5-4c8d-88b0-e77d34df0dd0@mind.be>
Date: Sun, 14 Jul 2024 22:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20240712151744.831475-1-buildroot@heine.tech>
Content-Language: en-GB
In-Reply-To: <20240712151744.831475-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721029479; x=1721634279; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zRr5dw5YJZjNw33+jnToSa/2OPFh7NDrWaU9+SplwJ0=;
 b=LWW1hdbw7PE8ImVb5FGo3XLEni74IVQnE1Z95Q7wmMA/m8yAVdRxAio8kmbDhkLvQc
 bM+oGBum+Wtvywh1gjFvzlfe77xfxMUO/Ny9/LaOxblTwxs6HIr32Spi9PnIoYmL6rtZ
 WxBQvj7OYJc6dqwkHaJGqDU6d1K4hRG07t3EifaMz64oCZqzl3cv8tQEE5dAy0FFTZ3W
 Hk2mrm8lxMSsyEjY9CmUyRbSIBBwlQQDKY0BK4YBFZV708uzrYGPTVe/CALR7mX5hEti
 kGftNjsMPrBjVqU21yTCPQvGnbcoFlA+kcINwDPd4ErqZLA6X4LT1wHUiE8UKmfAV9GO
 3hfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LWW1hdbw
Subject: Re: [Buildroot] [PATCH v2] package/boost: cleanup HOST_BOOST_FLAGS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/07/2024 17:17, Michael Nosthoff via buildroot wrote:
> - fix alphabetical ordering
> - put one module per line
> - add comment explaining why options are enabled
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> 
> ---
> 
> v2: break the wall of text into one module per line
> 
> remark:
> writing it this way leads to the generated list starting and ending with a ','.
> It's working fine but looks a bit weird in the output. Is this okay?
> 
>>> --without-libraries=,atomic,chrono,container,context,contract,coroutine,date_time,exception,fiber,filesystem,graph,graph_parallel,iostreams,json,locale,log,math,mpi,nowide,program_options,python,random,serialization,stacktrace,test,thread,timer,type_erasure,url,wave,
> ---
>   package/boost/boost.mk | 37 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 9b1baec5bf..bb73edfda6 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -13,12 +13,39 @@ BOOST_LICENSE_FILES = LICENSE_1_0.txt
>   BOOST_CPE_ID_VENDOR = boost
>   
>   # keep host variant as minimal as possible
> +# regex & system are needed by host-riscv-isa-sim
>   HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
> -	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
> -	contract container coroutine date_time exception fiber filesystem graph \
> -	graph_parallel iostreams json locale log math mpi nowide program_options \
> -	python random serialization stacktrace test thread timer \
> -	type_erasure url wave)
> +	--without-libraries=$(subst $(space),$(comma),\
> +	atomic \
> +	chrono container \
> +	context \
> +	contract \
> +	coroutine \
> +	date_time \
> +	exception \
> +	fiber \
> +	filesystem \
> +	graph \
> +	graph_parallel \
> +	iostreams \
> +	json \
> +	locale \
> +	log \
> +	math \
> +	mpi \
> +	nowide \
> +	program_options \
> +	python \
> +	random \
> +	serialization \
> +	stacktrace \
> +	test \
> +	thread \
> +	timer \
> +	type_erasure \
> +	url \
> +	wave\
> +	)
>   
>   BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
>   BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
