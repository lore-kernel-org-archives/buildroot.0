Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323A5C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E72B540355;
	Mon, 22 Jul 2024 08:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZZXa3jFY8Zo; Mon, 22 Jul 2024 08:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A63140340
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A63140340;
	Mon, 22 Jul 2024 08:03:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE57D1BF29F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAE19810B6
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5d5_PZIJtXj for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90C4F810E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90C4F810E7
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90C4F810E7
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:03:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-367963ea053so2633250f8f.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 01:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635390; x=1722240190;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=THnL8mEdlSuzHYOh3Z09usbUnki8VNQ0pZ/3TR4C+os=;
 b=Lj+m2Hqx9jWxXDndy+S5vczXAKIhhHTnDumPd4kYv/pU1mX5kqb1EmaFe/mR6qBGiN
 CEndcA6yMMPsT7RHFeJDVTZ16aHj42BeqqJwcx/rZjZv4IVO5+xOiiqXSZEfTn4RRBN2
 IeDK+F62Yz/tfmQGRVMtklkfwkp7gIOITQGMEixm3jizg8CE0dA0gOEsJSGHDW5ZEEz1
 q6CN2VKrVfPTNeGmspMgxhlOHGq6NL7wZGmVhVRhN/UZHwEA1AnDOEpKvt603e6ArMaZ
 n1JSPVDwuUOB+ZFbTjEB8tPiNZmE/kIal+lQ2PUDgeJ9esVoSVbA6Sb7s3nsb3HTnj42
 LWmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/VQirTaxgHLmoTU4+jhqe/+BQGP3T/6dOUYoun2bODWHTSVO4DSEkpCXz9UZ4keMv3IgPKh1krdiFg5MPwxGozQsxUqgelg==
X-Gm-Message-State: AOJu0Yy+2YHCWSKvQFqbKHMGFkiEYYtc90gQEDWT8rSu9bNts9HwtRkO
 RfM0lT3CGAjzoAAvxC1ysTtLIgio3P5Ra/BqmOzOhB/QhAcYIWJRNjs7UIxmIeE=
X-Google-Smtp-Source: AGHT+IFlArazZ73V/vZAW20fCfwH05PQAim9rdcPwNcEK79QEYh27XHeXp1z94zfvTHILkrYpQcrFA==
X-Received: by 2002:a5d:4444:0:b0:366:f50a:2061 with SMTP id
 ffacd0b85a97d-369bb2b40cemr4236893f8f.50.1721635390598; 
 Mon, 22 Jul 2024 01:03:10 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ed580sm7732452f8f.112.2024.07.22.01.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:03:10 -0700 (PDT)
Message-ID: <4e49c953-04f9-4ca2-bafc-8f8175bccbd8@mind.be>
Date: Mon, 22 Jul 2024 10:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240721211628.3485003-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240721211628.3485003-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721635390; x=1722240190; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=THnL8mEdlSuzHYOh3Z09usbUnki8VNQ0pZ/3TR4C+os=;
 b=WZhsg+sh9tWP6DmgJjIM0c6snHZ9yw/0BQf1buPeOhUGuPmgeBxZOS6GOBLqWTPlzc
 a4IqNx/6lODcgsNOm+TTMcaQfQZaD6mhGe0fG1IrZ2jYuAtx0oPU8TAyJVtQboaCqVPM
 kDhVrhhWzvT5OkEDGJA5kyiYLVOyEAcgcnwyOnkzLKMF1Lz7EtSpj6DYelxfdxZJV8Qo
 +Mr9AleYGPJPWfCBlrNdw7wAAiKxAMNJz3tTlNsxR8oN+bLEk9tO7FRbXQzP7NM9NF4l
 PnhBtkOZCn7pMtQNQKGobho2Mgk61b5zF+nqNnK9mRTKtfCKagQ3y2eLF/v4vePyq10l
 pKHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WZhsg+sh
Subject: Re: [Buildroot] [PATCH 1/1] package/apr-util: requires DES in
 openssl
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/07/2024 23:16, Fabrice Fontaine wrote:
> Enable DES in openssl to avoid the following build failure raised since
> commit a83d41867c8d69a77d5cd0a665aa216af5340359:
> 
> crypto/apr_crypto_openssl.c: In function 'crypto_cipher_mechanism':
> crypto/apr_crypto_openssl.c:385:27: error: implicit declaration of function 'EVP_des_ede3_cbc'; did you mean 'NID_des_ede3_cbc'? [-Wimplicit-function-declaration]
>    385 |             key->cipher = EVP_des_ede3_cbc();
>        |                           ^~~~~~~~~~~~~~~~
>        |                           NID_des_ede3_cbc
> 
> Fixes: a83d41867c8d69a77d5cd0a665aa216af5340359
>   - http://autobuild.buildroot.org/results/4b1088a705f8564f85e629316f5cfc92953f0047
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/apr-util/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
> index f7c119db48..06b6c2684c 100644
> --- a/package/apr-util/Config.in
> +++ b/package/apr-util/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_APR_UTIL
>   	depends on BR2_USE_MMU # apr
>   	select BR2_PACKAGE_APR
>   	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
>   	help
>   	  The utility library for the apache runtime project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
