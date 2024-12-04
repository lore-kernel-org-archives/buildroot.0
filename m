Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C993E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5565403FF;
	Wed,  4 Dec 2024 21:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nxIpeZPHIrg; Wed,  4 Dec 2024 21:51:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C41405CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91C41405CA;
	Wed,  4 Dec 2024 21:51:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A79511DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75135607B1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6ZvuYRQv4_I for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1023760697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1023760697
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1023760697
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:51:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434a1639637so2664685e9.1
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 13:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733349102; x=1733953902;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+D5s5Hg+ejtsxCgHd8FyGh32d2keJfdMlhSM6Qtgu2A=;
 b=Hl//BoJKe4JG7endTStVjUJN97GNGKnAMHwDAsiCwBm0R1/5kNsDA7z6x2pTzv5CgZ
 nh+jqzRdH4ATIB2iqruFH6kVKyU0GmIIlGLderzBtbbFRveb72cQPoOkPUtBIFyQSbbj
 MTMFch++CyMt2+gBKfKfeRPyM1343zHm3R1ZH0SVVqMuNBDUyDaxDn7sPWoEb8jBjm6n
 7LT2+yXhDoNyI/LPGPQPfsvBkMUd/BnKQeLmHWPjEuSlVjhaUw+sg1rBdxKvypa5Fg/z
 pH4AyW/epeH5hIm9hiDEihm/DHc3tQxJPgVKomjWm+vsrUPGUsnzA8NmnpBbT1ccZ71G
 GeyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPz7y2sZTKujcxrYFMHi4zBrcffbq/4ytq/JDSgkhJXLnqtFEJ0hvCSl6h3J3vnkUM9CzGm/fOXLs=@buildroot.org
X-Gm-Message-State: AOJu0Ywjg75GHz10TR5jxwwHzd4kyeKApquw9X7/kmj/Lr9hLpdwsAj3
 uB2rSaAJEEi4EBBQ9uRUTdtSnwUNnWZXad3jcTkG6Gdc0ES0rlTfK3bN6s4jeqY=
X-Gm-Gg: ASbGncvF5MvaQZZqe6kjPp4lKHDAGlcfQVm1rGsPYWESABjx446+an3QXHYhBvViG4w
 ERBbI9leNugCLPz+MHiGjoniixzsJLFcS/yQlmOjbVDei5ChPzIYjtKXNpwi2pUXrqYUZmm/Gv3
 ekLKkpU/veUgvHAIexNnMi+dGQ+xlViVIU8AnjADruwFdt3JdY42vCpQvEkCHlDKYDzTPzixzG4
 AIKRrW8OwARiZbFf6StLoWjlcb53sTPtsT5EwV+nQIHyGYWyVnYCMdAep42vPXDydqrCqKP1yD9
 yfscMmX3VQJvk7E+TSzKe3CIzLvyIDO0CeMlyRup6NUVh1LUI24jS2DJYJ2SwAVmkkKvP+gNb+V
 stujN
X-Google-Smtp-Source: AGHT+IFPGdsZbaZ16FIIsFs8D8AJoNPqUETd4mG4dijB11z38XAgMwkLn8Vz/aMQ/RCXW/e1qSqxfA==
X-Received: by 2002:a05:600c:5105:b0:434:a6af:79f6 with SMTP id
 5b1f17b1804b1-434d09c2594mr74091165e9.15.1733349102075; 
 Wed, 04 Dec 2024 13:51:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0d25cbsm624015e9.5.2024.12.04.13.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 13:51:40 -0800 (PST)
Message-ID: <544b4ef9-04bd-43e5-8655-23556a740f7b@mind.be>
Date: Wed, 4 Dec 2024 22:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20241107134342.4306-1-tianyuanhao3@163.com>
 <20241107134342.4306-2-tianyuanhao3@163.com>
Content-Language: en-GB
In-Reply-To: <20241107134342.4306-2-tianyuanhao3@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733349102; x=1733953902; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+D5s5Hg+ejtsxCgHd8FyGh32d2keJfdMlhSM6Qtgu2A=;
 b=WVcbzqf0TqEAZ2b0WInI5RivRd0H5dTSZtZFuRq/kj13vBObY7c0HQG80waXcaimQH
 naujTxLT3+KrnBKFQG+fUBDbBbePZHvmvrkA0xzPi8NByr2jCSAD4HTSOMxbxDF3HlSg
 rxFHtGavnPwxTa/3nvn+CLOhklAJcTGZqH/onTEM8t1PF9QSMDavkXlOp7IljsO1dSpl
 N7xZ72ass4pCWZoOjWLF05ZEpqYIhNmQgdOXrfBxkCG/mdd0rQpizaPbk9WYOz36TjVW
 BPj8ZAtQnPQCNyodHoYprJFuGqClJOHZgBo3uwrA694ERoam7g6scu/WwDcA0fbt2vpv
 BSQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WVcbzqf0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnutls: fix configure options
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



On 07/11/2024 14:43, TIAN Yuanhao wrote:
> Two configure option names have been changed since version 3.7.5 [1]:
> 
>> Old: --without-libbrotli --without-libzstd (also --with-*)
>> New: --without-brotli --without-zstd (also --with-*)
> 
> Fixes:
> 
>    configure: WARNING: unrecognized options: [...] --without-libbrotli, --without-libzstd
> 
> [1]: https://gitlab.com/gnutls/gnutls/-/commit/6b794e49d1a14e43f9e08023f958364712c3c89a
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Since this is a fix, I applied to master, thanks.

  Patch 1/2 is for next, not master. I didn't apply that one yet.

  Regards,
  Arnout

> ---
>   package/gnutls/gnutls.mk | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 67b3c16b94..a977093bd5 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -62,11 +62,11 @@ HOST_GNUTLS_CONF_OPTS = \
>   	--without-tpm \
>   	--without-tpm2 \
>   	--disable-openssl-compatibility \
> -	--without-libbrotli \
> +	--without-brotli \
>   	--without-idn \
>   	--without-p11-kit \
>   	--without-zlib \
> -	--without-libzstd
> +	--without-zstd
>   
>   ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
>   GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
> @@ -77,10 +77,10 @@ GNUTLS_CONF_OPTS += --disable-openssl-compatibility
>   endif
>   
>   ifeq ($(BR2_PACKAGE_BROTLI),y)
> -GNUTLS_CONF_OPTS += --with-libbrotli
> +GNUTLS_CONF_OPTS += --with-brotli
>   GNUTLS_DEPENDENCIES += brotli
>   else
> -GNUTLS_CONF_OPTS += --without-libbrotli
> +GNUTLS_CONF_OPTS += --without-brotli
>   endif
>   
>   ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
> @@ -110,10 +110,10 @@ GNUTLS_CONF_OPTS += --without-zlib
>   endif
>   
>   ifeq ($(BR2_PACKAGE_ZSTD),y)
> -GNUTLS_CONF_OPTS += --with-libzstd
> +GNUTLS_CONF_OPTS += --with-zstd
>   GNUTLS_DEPENDENCIES += zstd
>   else
> -GNUTLS_CONF_OPTS += --without-libzstd
> +GNUTLS_CONF_OPTS += --without-zstd
>   endif
>   
>   # Provide a default CA cert location

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
