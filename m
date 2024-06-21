Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E8BC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 07:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A7081BCF;
	Sun, 23 Jun 2024 07:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bat_LMp6mKLB; Sun, 23 Jun 2024 07:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 266C181E03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 266C181E03;
	Sun, 23 Jun 2024 07:40:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BFE11BF59E
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08C27406BA
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bO_zUNDavUwq for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 07:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B6C3406B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6C3406B9
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B6C3406B9
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 07:40:49 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so35776891fa.2
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 00:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719128447; x=1719733247;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hNE4UZUHEWT7kIHCXXbQOuwDWRbv253Abw4u4lZW3j0=;
 b=sOb+VkmYdHfpLTxsjWnHSsgJrEcaUD56KmZV/oA0OjxlbPiBcQ/UkNeME8cF6gmCi5
 FaFsTcKIlOXlSipWFfK+nBonQ6r0StoPPQRypkEimySg9VQ63MCozdc3AhMhFmQEXSyz
 JIBmTpUCVOrP5xUnCEVXX1SLh2f+5167cXXDEB4bw2Zg9dXGyNtuo0TrUwtZiIXhkCZx
 7XqVDnhqWBHnsAOu7yQ9iauxTGUzSZdAsJhd3KFxN1HXSO7Adoys5dzj3pkk0LGJwEuj
 tOg4RC/x/JRlr7TDa28TN6DGRiB/BX83fPWYKI1Wr2gq/h9cIe7XhkR+/9F3fsAADQDQ
 9CIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHwTLlbzjF0hYavPzNjzK2CGKx/Q7cidtG0CyDa6ymG7cjCDw2pQTLst80QRViH/c5Tm6DVSGTSWiqYALDennPrbVmWN1BEg==
X-Gm-Message-State: AOJu0Yz2dYAGi2OFgY80J9USLWXHAOSqkxAunf5glQ8P/iMCP4C/aVfY
 XNkzf0BfzTkO49kQNtnLl5AX3lg1RDP83K+5SJShJbH8TAbf9V/q+VJTCY2OYLL4gfqQhnyrfiU
 7
X-Google-Smtp-Source: AGHT+IGgWiN2H+HasD/4zCF7kdxqibHt3uQSqzTH5TyoW8BhWfXku7ZlPf92ZEHfjwkryhvjJsyEVw==
X-Received: by 2002:a05:6512:1154:b0:52c:e17c:3741 with SMTP id
 2adb3069b0e04-52ce1832467mr936884e87.5.1719128447086; 
 Sun, 23 Jun 2024 00:40:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c789esm6683167f8f.91.2024.06.23.00.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jun 2024 00:40:46 -0700 (PDT)
Message-ID: <b4f8412a-f9db-458f-91b1-47163c52dc13@mind.be>
Date: Fri, 21 Jun 2024 23:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 buildroot@buildroot.org
References: <20240530080240.12909-1-nicolas.cavallari@green-communications.fr>
Content-Language: en-GB
In-Reply-To: <20240530080240.12909-1-nicolas.cavallari@green-communications.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719128447; x=1719733247; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hNE4UZUHEWT7kIHCXXbQOuwDWRbv253Abw4u4lZW3j0=;
 b=dId07d/FmwxiaehgQWl4tikU6N8t+xQHqCb+833RRiCFooCHqZdO1m3d6GPzK3Xm3h
 y4pc/J85NfT+fy9le9J1vpocps9O5WbzyxXZOeCiOZ7ZAaNHAbXjN9dU6BR0piOR0DCn
 cRgVMakodWeAvZQ/SoKqAxoMfXdzznL2I+mbhuCQhPCyWgkjJalZucCqnwqnA6Je7IQv
 WERAe0+dkIu8+4qOizDnbdzavTRVEVRAQmPLhPXbGgTxarhAx9AQs5kYDkZp378uA0Il
 MSTihxMX71ouc77kOzRJz/dMmTJHjpC0Fiy9rVmnExr2CNILRKj9K0glwD3Mn7odPB2N
 WcQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dId07d/F
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.8.1
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



On 30/05/2024 09:52, Nicolas Cavallari wrote:
> Upstream notes that libhttp-parser is unmaintained and suggest llhttp
> as a replacement.  This version bundles llhttp (and includes its license
> in COPYING) but still allows to use a system-provided libhttp-parser.
> 
> llhttp (https://github.com/nodejs/llhttp) is a C library that depends on
> a nodejs interpreter and more than 10 npm dependencies to generate its
> parser code.  The bundled version contains the generated sources and
> could be built without nodejs.  But distributing this generated code
> as part of libgit2 would probably be legally dubious because of the
> GPL's original source code provision, even if llhttp is MIT-licensed.

  Actually, we just need to make sure that we also make llhttp's source code 
available to downstreams. So we can use ACTUAL_SOURCE_TARBALL to make it available.

  Well, except currently only one of them is supported at the moment, so we'd 
need to modify pkg-generic.mk first to support multiple actual sources (because 
we need to keep the main libgit2 tarball as well of course).

> 
> Packaging llhttp would be a daunting task and its build will require
> considerable time and space, so for now, keep using libhttp-parser.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgit2/libgit2.hash | 4 ++--
>   package/libgit2/libgit2.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> (So now nodejs is an indirect dependency of cargo...)
> 
> diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
> index 20e6929265..c02a149a68 100644
> --- a/package/libgit2/libgit2.hash
> +++ b/package/libgit2/libgit2.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  9e1d6a880d59026b675456fbb1593c724c68d73c34c0d214d6eb848e9bbd8ae4  libgit2-1.8.0.tar.gz
> -sha256  08041a7e9c4d0e5e84f9711c824a0bd0366ee782ec29c6d7275fdab73e2ca115  COPYING
> +sha256  8c1eaf0cf07cba0e9021920bfba9502140220786ed5d8a8ec6c7ad9174522f8e  libgit2-1.8.1.tar.gz
> +sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index 3364841e8f..e817a5916a 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBGIT2_VERSION = 1.8.0
> +LIBGIT2_VERSION = 1.8.1
>   LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
>   LIBGIT2_LICENSE = \
>   	GPL-2.0 with linking exception, \
> @@ -22,7 +22,7 @@ LIBGIT2_CONF_OPTS = \
>   	-DUSE_GSSAPI=OFF \
>   	-DUSE_ICONV=ON \
>   	-DREGEX_BACKEND=regcomp \
> -	-DUSE_HTTP_PARSER=system \
> +	-DUSE_HTTP_PARSER=http-parser \
>   	-DUSE_NTLMCLIENT=OFF \
>   	-DUSE_XDIFF=builtin \
>   	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
