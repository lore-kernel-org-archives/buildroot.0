Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89799C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:58:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD8760F24
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AD8760F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1084405D5;
	Sat, 11 Sep 2021 20:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HD2I3Cz4pk62; Sat, 11 Sep 2021 20:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1304B40292;
	Sat, 11 Sep 2021 20:58:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 289EB1BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2487A61BD5
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3ykpRmQO-Gt for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:58:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24BDD608CF
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:58:39 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id h9so11814053ejs.4
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W4OvE9DgAsT+h5ksnzQVG65LoLGVtTNGr3PaIx71OBc=;
 b=QAZzyCyvhpGZSxK36sjXqgx0JNAurw/v43NRdxxFjkRVemiDIlwMQLXBHD+Uk8qlqK
 lHZi3bdGAQAOQQbh4M+AZxayhMevY/CwonktsrIbD1TL46DLE1C1bAV6OJ878ohYGnIN
 YJpAUsoj6eOkP3ETKLQlrCUY68daUWOTCzS28ELI0zS1L8CGFAWtKUqr/rpDNchZ5+dj
 XPb1tuoXqbIOb0fnLnjnbFb9BzIU9yau06ITEFgPI9QHugy64uiL8pHXBcA0y1DCrPZS
 3Efg17nxOyezpKpf8IxziN5tYgpooPqBBFsaggM/so48i9+AylMtrnsS92BSLlm/4FoG
 dkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=W4OvE9DgAsT+h5ksnzQVG65LoLGVtTNGr3PaIx71OBc=;
 b=kLR8a+UQHP1B/r+XH1mOQHupqE9iz/Ejo8t/XXZ8U1FEM1NU/i+WyxcYpCFMjYfpyq
 oGnz8XJYodl1jzzE6VDl4Ya0CWjg9YMbxpEX3f+VNPX+14oqYkOtv1i3FDGuKudjUtvG
 7SgbWO4f4wx1vpGIxjJ8mqC9pa5/ibjLeFiZpDYwkeZbrsSUl4TFcEYbk3otbYnz4CAD
 0isRs2Tzq5dbdFf6nqADeXGD4vC+UPewasTn0FW3BfWhlXzJMGD4IgbIq4xTSLgTcw/x
 dq9L+HqXAqNQ6iMGy9BNBrwyVJVyJZfz8tn1wcqk2r4w172X7OsbkXRmaOAmDMu4thTa
 DUbA==
X-Gm-Message-State: AOAM531cxQZgJoNhwz06JBFc5LP6qMJnDkgxjV4fAkKm9avcq6+RcTAv
 pq8Aml9S/PS/JU4VoRP5dCb/0+ERT5H8/g==
X-Google-Smtp-Source: ABdhPJwsQRhw3T+Pkya9HNXAYADiWEhkBM7GGpTTWBxsch+VcJKnRJfwfGwfcaj9PCzkqaWNDGzFYA==
X-Received: by 2002:a17:906:c56:: with SMTP id
 t22mr4500033ejf.153.1631393917321; 
 Sat, 11 Sep 2021 13:58:37 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d10sm1411847edx.57.2021.09.11.13.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:58:36 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210905182508.1151818-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <d1e482e8-3c3e-3ca6-0258-48e10a228b3a@mind.be>
Date: Sat, 11 Sep 2021 22:58:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905182508.1151818-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: fix fiber dependencies
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 05/09/2021 20:25, Fabrice Fontaine wrote:
> Commit d39d8f7cee9b4634e6f490020204f63fae419e8e forgot to update fiber
> dependencies resulting in the following build failure:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_BOOST_FILESYSTEM
>   Depends on [n]: BR2_PACKAGE_BOOST [=y] && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_BOOST_FIBER [=y] && BR2_PACKAGE_BOOST [=y] && BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && !BR2_MIPS_CPU_MIPS32 [=n] && !BR2_MIPS_CPU_MIPS64 [=n] && (BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS [=n] || BR2_TOOLCHAIN_GCC_AT_LEAST_6 [=y]) && !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 [=n]
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/40b8af6ce273ebd5fca56d6734f64dacd562efb1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/boost/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index f6409769c6..536e5b8486 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -149,8 +149,7 @@ config BR2_PACKAGE_BOOST_FIBER
>  	# mips support uses the "pause" instruction, only available
>  	# since mips32r2/mips64r2.
>  	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
> -		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6 # boost-context -> boost-thread
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
>  	select BR2_PACKAGE_BOOST_CONTEXT
>  	select BR2_PACKAGE_BOOST_FILESYSTEM
> @@ -160,8 +159,7 @@ config BR2_PACKAGE_BOOST_FIBER
>  
>  comment "boost-fiber needs a toolchain w/ NPTL"
>  	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
> -		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  
>  comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
