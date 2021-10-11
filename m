Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298CFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:18:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87E160EE2
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B87E160EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2FE8184F;
	Mon, 11 Oct 2021 21:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bAGH19BSAaxV; Mon, 11 Oct 2021 21:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF8C481839;
	Mon, 11 Oct 2021 21:18:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58C121BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D93C404DA
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fcry8RBj28On for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7043F404BE
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:18:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z20so72583076edc.13
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=X2e7y7WLxl5TrQYlHrVehOm01on2+RiUqPIQrWbPFAQ=;
 b=eKJ6T87ljOaJRhzDwfGnoG5qZsoOerpKPdFvgurH8wu9vUCjH7BLPTKzOdMKZEXQSE
 wjqO5VgZAlC3uE3E+UIhrO3m0gtZ15Oxp0jUEnk3Q1RQdbModasPcBiUu4HqopcTh7XD
 09qsr4IsJ0Li2lsWnKtFmNpaMBrhJD3IzYiTE3HFsPN4LRgAV9aEotOiM2uFJnwW09cU
 uo+t6k3VtHE7whtHporgxrbkttPFEx7CtKm40cnRD+5iRrkRwThSSEN1vvZiDbFtCXQk
 Mop/FPVe7ol6Ol59NeLcFlhlalFeHl9+BM/PpYa8LoLQNSWWY9O/lVKEVmm9ySjusLoo
 NCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X2e7y7WLxl5TrQYlHrVehOm01on2+RiUqPIQrWbPFAQ=;
 b=U3WNcV+2C+y9WA/q6pueo5Ck7bhPOXlGwEt4n0gBhRQFxA8o800A38s72y/wIsfYrr
 K8D0wJmyDWoiTGk3JGmR56D5MOqbKTWi7Nb75FXMEvHIeBbo/bS0+Y6u7Egdbx6/Ak47
 Syg34ccgp7ED7nsKzoX0y2YZaVBhuty9vIwfMQywr1z99QJo214Kd6lQiAUsGf1C6ata
 jYdE24Sp6hmyXJmclgoXDKvvz22MyspGbAxGAtaHgrPgt4muvfcs50P9dB3QxiHO1rrn
 325SSlw8L9XOGoZoPFe0yE4W/wDOW+NEanHJW57psHeYNYOXnzMMgfY7X8V+5FEaPNBL
 kQ8g==
X-Gm-Message-State: AOAM533tvoESAkTJ2cFoT+Z/322dcPi4EVTUI7yrT5yI7w8m10iJxm8E
 rTg1KF1Kdy/uUJ0IFTRnBELMZJXIncftbyPU
X-Google-Smtp-Source: ABdhPJxlV+G48SIXehyM9eUQ2tnFlSz2JHrZeKe4GIhbFw9O0H/j1B5Fgc2Mxldu560MS6JicJr8Tw==
X-Received: by 2002:a50:cfcd:: with SMTP id i13mr45389449edk.24.1633987104674; 
 Mon, 11 Oct 2021 14:18:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q11sm4830138edv.80.2021.10.11.14.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:18:24 -0700 (PDT)
Message-ID: <6bc221b7-ca3d-17b3-8642-05113b66564a@mind.be>
Date: Mon, 11 Oct 2021 23:18:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
References: <20211001115407.3229128-1-zhaojh329@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211001115407.3229128-1-zhaojh329@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rtty: bump version to 8.0.0
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

  Hi Jianhui,

On 01/10/2021 13:54, Jianhui Zhao wrote:
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> ---
>   package/rtty/rtty.hash | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
> index b2e9db2436..1b46aff47c 100644
> --- a/package/rtty/rtty.hash
> +++ b/package/rtty/rtty.hash
> @@ -1,2 +1,2 @@
> -sha256  9bc5d30dfa9bd664a62711b6229f47505b83adb364907f24e3a404aad52a4802  rtty-7.4.0.tar.gz
> +sha256  b9c555005b76c1ad0f5af891964375bbdf50ee22b9a9f53ddd48d2cdb4e53b49  rtty-8.0.0.tar.gz
>   sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE

  As Peter already observed, the update of the .mk file is missing so this can 
never work.

  I wanted to fix that while committing, but it turns out that a basic build 
also fails with:

-- Could NOT find OpenSSL, try to set the path to OpenSSL root folder in the 
system variable OPENSSL_ROOT_DIR (missing: OPENSSL_CRYPTO_LIBRARY 
OPENSSL_INCLUDE_DIR)
-- Checking for module 'openssl'
--   Package 'openssl', required by 'virtual:world', not found
-- Could NOT find WolfSSL (missing: WOLFSSL_LIBRARY WOLFSSL_INCLUDE_DIR)
-- Could NOT find MbedTLS (missing: MBEDTLS_LIBRARY MBEDX509_LIBRARY 
MBEDCRYPTO_LIBRARY MBEDTLS_INCLUDE_DIR)
-- Could NOT find ZLIB (missing: ZLIB_LIBRARY ZLIB_INCLUDE_DIR)
CMake Warning at src/ssl/CMakeLists.txt:46 (message):
   No available SSL libraries found


So clearly from this version onwards, an SSL library is required. That means you 
need to update Config.in with a select:

	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS && !BR2_PACKAGE_WOLFSSL


You'll need to test a little with menuconfig and randconfig if this works correctly.

  With that, I've set the patch to Changes Requested in patchwork.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
