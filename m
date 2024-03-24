Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A14CC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 194C040490;
	Sun, 24 Mar 2024 16:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0vpHsk3HGOe; Sun, 24 Mar 2024 16:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD9A140296
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD9A140296;
	Sun, 24 Mar 2024 16:00:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84F281BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EBE640296
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10wd_FqDF3wL for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 450D140004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 450D140004
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 450D140004
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:00:48 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d2509c66daso43332701fa.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711296046; x=1711900846;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bU6CC/Zg8H2DQ7CxVcEec0EfLClZgLXgYvUbQkOpIBw=;
 b=DgNBDVGdQBTAkVRAD+Ig9NDbMpJcrEKh2yTSy9MMyt5O/ZEU4/vXcJeaGfMZlU7zmG
 Yg31OSGqbT2nKNyrwzUw9TDmfXGsICna/OGTr3DfBDmheq0o4A9kSPtDOrK95vQR9zBe
 Drf2CxzBDj4toVKPyq8Sa5a7vKcjW238WVll7dzHYNZ2Lqs8xgdZm0E9EDtVnrhUzB1y
 616WcS/G8tayHYsjD92TJcd+Rdee1lttUP2+ggGTRRHl6LWgR9kOke6B4cu6FDzEDsUm
 KdFFLcuJGu8PoE8fbJBOgfhvNTFSbJjy1aCC/+ckNurOmxtYVNpordz2KaSpPHQ5cau2
 Y+QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWxsbCdPofMvxgqN6j0kyg4i5QDpEL7Sei3QqeKbK+RDIOV29ETsvEzPAwmsv67k0tBBprtj34Gnu1wNeR3vOc79tFvfN3xQ==
X-Gm-Message-State: AOJu0YwT58zt91iY3o0jKnXEAhsIH0/oD86UUgURsWQGpoOAxjR6CNGF
 HhUAAN5Kuezxez0gZ9LFrOL+jI0v5yiPhtN6lsOVj+fyzJmvmuZRAdXSfDg625c=
X-Google-Smtp-Source: AGHT+IHDK0+toY2r7kmfXaXIItwVrx31lVt7z9yxBNlEiFtf+iudYYuXWrwaP6liik6P+ScAr91z0A==
X-Received: by 2002:a2e:b1c2:0:b0:2d2:ebc4:a75 with SMTP id
 e2-20020a2eb1c2000000b002d2ebc40a75mr2831131lja.5.1711296046385; 
 Sun, 24 Mar 2024 09:00:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b0041477f3f99fsm5556770wmg.30.2024.03.24.09.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 09:00:45 -0700 (PDT)
Message-ID: <1928bd30-77ad-4306-bf56-0a7e1c43ddcd@mind.be>
Date: Sun, 24 Mar 2024 17:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240316084335.20839-1-bernd@kuhls.net>
 <20240316084335.20839-5-bernd@kuhls.net>
In-Reply-To: <20240316084335.20839-5-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711296046; x=1711900846; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bU6CC/Zg8H2DQ7CxVcEec0EfLClZgLXgYvUbQkOpIBw=;
 b=f5OZ18WXsBFT+XpSHRziZ3ziRWAFjHNk7GFckh5L+fY6k0cA3sWoez4IYKbpnkMYqy
 SolKII5ZIqQkrOBEKTM94evi7J3dwOIbo2G3tfnPYi76+TP5pqX7pGoHKaaHBdTBAl07
 2KeZ2rZtZhpyDil7+SDGxFYaqMHo8Yb/aEMa4Su+HrsVZh+rWgmZ0eENNQ+MJVD0xrCQ
 cPKfNM5rvEQRBOK5sLyvDT5iyCXYWjN3pKkTdIy8FrPXFWWEplt5yPPsH3/OiKNetvUd
 m8mCOsjCUxyhT+CImAbW+/ATDsn1f7eW999U3dXQinX7fJTGOvhYImm6UkSLv9skA+h3
 Xp7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f5OZ18WX
Subject: Re: [Buildroot] [PATCH 5/5] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6}.x series
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/03/2024 09:43, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   linux/linux.hash                     | 12 ++++++------
>   package/linux-headers/Config.in.host | 12 ++++++------
>   2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 846e59d24e..4fa9f701cd 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,14 +1,14 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
>   sha256  8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68  linux-6.8.1.tar.xz
>   sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
> -sha256  ee0b430148da94d2b13608b8d80b007b7d281dc90e3f19b63cf9a9943810e457  linux-6.6.21.tar.xz
> -sha256  0ebd861c6fd47bb0a9d3a09664d704833d1a54750c7bf9c4ad8b5e9cbd49342b  linux-6.1.81.tar.xz
> +sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
> +sha256  d150d2d9d416877668d8b56f75759f166168d192419eefaa942ed67225cbec06  linux-6.1.82.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  8a1e760bf2660947234109aa4fdbbe3686238b4e852157b96c59356689107e49  linux-5.15.151.tar.xz
> -sha256  0cf3e467bd8d35533888327e9f8a9a9d354fdf83e8f82e9fe5a234f896a07493  linux-5.10.212.tar.xz
> -sha256  cdbc61334cdadbd3945b08f03ed197c65bdf358c3383a4334b3e5b483bd95850  linux-5.4.271.tar.xz
> +sha256  f0805225f4a5b24d0bba9302c2c2f261c04f737ac5dd931da9b112e9f3e4a47e  linux-5.15.152.tar.xz
> +sha256  84cf30223239ec3333a5f7b2a7fba2042bba70d1582a139f7543956af871ad80  linux-5.10.213.tar.xz
> +sha256  3599d5959a403e64be407d7f05e56cb270d6ddd154e89a596609919ab1e2e366  linux-5.4.272.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
> -sha256  95ada7aa6ef1c69d7a469432f936365e35b004d24e751d82c21a371edd2c84f9  linux-4.19.309.tar.xz
> +sha256  95ec94c4ab8f46d8a54430893f9bd653c46b0f1587d216818aa8f52fd313de69  linux-4.19.310.tar.xz
>   # Locally computed
>   sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
>   sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 227d41101f..4c3651450e 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -419,12 +419,12 @@ endchoice
>   
>   config BR2_DEFAULT_KERNEL_HEADERS
>   	string
> -	default "4.19.309"	if BR2_KERNEL_HEADERS_4_19
> -	default "5.4.271"	if BR2_KERNEL_HEADERS_5_4
> -	default "5.10.212"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.151"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.81"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.21"	if BR2_KERNEL_HEADERS_6_6
> +	default "4.19.310"	if BR2_KERNEL_HEADERS_4_19
> +	default "5.4.272"	if BR2_KERNEL_HEADERS_5_4
> +	default "5.10.213"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.152"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.82"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.22"	if BR2_KERNEL_HEADERS_6_6
>   	default "6.7.10"	if BR2_KERNEL_HEADERS_6_7
>   	default "6.8.1"		if BR2_KERNEL_HEADERS_6_8
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
