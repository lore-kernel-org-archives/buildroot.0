Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974EAE7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 20:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EC7C81208;
	Wed,  4 Dec 2024 20:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHbaLfFt63iV; Wed,  4 Dec 2024 20:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 729208120D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 729208120D;
	Wed,  4 Dec 2024 20:12:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47CF51DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 432AA81174
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3l4KrLi7r48C for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 20:12:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C734880CDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C734880CDA
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C734880CDA
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:12:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e5db74d3so119877f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 12:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343150; x=1733947950;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=27XxxI0eWpuPiDS9Olvd+37w5OefYxJ8jdp1GPIAvR4=;
 b=Jpxmjxil08g/7kxAr0YLv3hFLkWlayU28pIE+uKZ/kL4C4T8QT3QnvY8hNIgyg+Xez
 RiuYkP6tNmTFA0yIwZENhUAlnCGcO2z8Q7xZ2iJyEAlmMWNqROwPYFazUPdn8CcT/7vZ
 dnn+4vtOKkqrh3DNfZliwwocLLkb2jruuE8rf8OcBGm67ct8QfTv5TkzWS8XAzsr7HoI
 Og5VyXPOH5fRgmTHOwhbo3fNhkI3/X3XnLYp3DXJkjOhoL6sj9GQBm2WyThSe/2yaA/g
 7AuO3pigw5eDT/sK3ts3ryOTnXS+ixR1y5vcBJBa4VmHqHc8GSdpac/7TXngwuxMOe4X
 ZV8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY74xsRzewRD2KRH9gvms2NwO7zDq4sIF9yDmVeR5wpq52QvUCFfyAPAonkXoTHhD6IxHkMVhFeks=@buildroot.org
X-Gm-Message-State: AOJu0YyMElNh3ifJ3GTPODt/s5Igx6o22+og1tDT7m5zC7VoUprbSBnC
 pTTj+S8x6zklIdiNrrYP/UT4nHazA3xqHQGVkf2CFIys9V45c6AHjgRxNKqorf8=
X-Gm-Gg: ASbGncullQ5ao6w8tctp7zY/j0nUJw06c1HGO8Vj2tHlIae8g5NkHrtN48ll97mHLzw
 J96SY2EOeUYqJE3NC4388j8DVG3M4B7e7nnEFiKJlnIqSpP/g62F89/Ir1Mk05/fgcwlbCdMGY/
 oABLun65aO75oC3hbCc4Xn2SBGS2ahvHjDUbjcC+X4Nliiia/P/wGDt2hY0VExIOgfpYeWVAL4z
 wkCWCrL4VgT5GuyFvUmCPVgu799QczB2HthA10QEjXCwzzVDniVgQJg6eXE3ti3/VKeLfiCqfzD
 UIsE7Vp74Nrf7s6IP/VspFhNzM9pRHh+dbuUb9YDXPyOK47druweF0Hv63Fp2zu3O3t2gMkvg6+
 7pvE2
X-Google-Smtp-Source: AGHT+IGMP8O6etZVZ/j/u/oTnhnViZrJjQZd5bwHobiYLHf3ITV2bTVKiDUty7bfWQuTgmNAm6vFyg==
X-Received: by 2002:a05:6000:705:b0:385:ed20:3be2 with SMTP id
 ffacd0b85a97d-385fd429a68mr6806712f8f.48.1733343149807; 
 Wed, 04 Dec 2024 12:12:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385df9ef1d6sm15949729f8f.102.2024.12.04.12.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 12:12:29 -0800 (PST)
Message-ID: <544d3a6d-3998-4237-b883-f9ed6176c95a@mind.be>
Date: Wed, 4 Dec 2024 21:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
References: <20241030145910.2523465-1-fancp2007@gmail.com>
 <20241030151126.2525261-1-fancp2007@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241030151126.2525261-1-fancp2007@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733343150; x=1733947950; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=27XxxI0eWpuPiDS9Olvd+37w5OefYxJ8jdp1GPIAvR4=;
 b=RvpnWHAOhuTW3IFpLkCGl3YBAHPPdIOepnGiWIBgmHsn+2L+ogHMnipEziw0dS8O5o
 j48bgZR6OcZHF4/JRCCN6EuLjNsUGQ04iknWaZ4WjPzqSLTzQM0HIvN/c1wxgzW3P2wA
 vaSHOuauCHTHKze1Ha4s2cEJYk2bieJRFCEkUQLvys75O8gtSRGiWfYx81ul1l5NMOwb
 B43eNG8oVKzjYb0HU6GBRrdG9GSMGs4ZScpNLnpMHafbNzQGn8tDK2YnfhoHzdcYtIPE
 v+Jj35SYYiB3Kvm4iSh8ZzSZ5tvd4agBuzx5RqnRu132znftfE0Kig21ts4yl3coS1it
 s1nQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RvpnWHAO
Subject: Re: [Buildroot] [PATCH v2] package/python-psycopg2: add config
 dependencies from postgresql
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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



On 30/10/2024 16:11, Scott Fan wrote:
> Also update site url to https://github.com/psycopg/psycopg2/
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout


> 
> ---
> Changes v1 -> v2:
>    - update site url in the Config.in file
> ---
>   package/python-psycopg2/Config.in | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
> index 4aa86c7690..6b07b0c06c 100644
> --- a/package/python-psycopg2/Config.in
> +++ b/package/python-psycopg2/Config.in
> @@ -1,6 +1,8 @@
>   config BR2_PACKAGE_PYTHON_PSYCOPG2
>   	bool "python-psycopg2"
> +	depends on BR2_USE_MMU # postgresql
>   	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_STATIC_LIBS # postgresql
>   	depends on !BR2_OPTIMIZE_FAST # postgresql
>   	select BR2_PACKAGE_POSTGRESQL
>   	help
> @@ -21,10 +23,11 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
>   	  customized thanks to a flexible objects adaptation system.
>   	  Psycopg 2 is both Unicode and Python 3 friendly.
>   
> -	  http://initd.org/psycopg/
> +	  https://github.com/psycopg/psycopg2/
>   
> -comment "python-psycopg2 needs a toolchain w/ wchar"
> -	depends on !BR2_USE_WCHAR
> +comment "python-psycopg2 needs a toolchain w/ dynamic library, wchar"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
>   
>   comment "python-psycopg2 can't be built with Optimize for fast"
>   	depends on BR2_OPTIMIZE_FAST

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
