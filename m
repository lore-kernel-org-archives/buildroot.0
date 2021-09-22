Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882B8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:26:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CF8D60FE8
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CF8D60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F2183F64;
	Wed, 22 Sep 2021 19:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SL3iO6eoYaYk; Wed, 22 Sep 2021 19:26:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35E6783F5A;
	Wed, 22 Sep 2021 19:26:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEFB71BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE40F401FD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xzBJjxXG9TZF for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:25:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5F8440121
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:25:56 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id ee50so14044078edb.13
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j7gR0VUYbZnEcMuOEviAaXLhp/lIk9Pv+1960Os5ZNc=;
 b=cyGPbCTQbBgAzsQ5LLDCGu0iOwX6IG+57h1trRNToyTKO0/KKWUhmM48rL7zCaWuOO
 wGQ7Ae6AkSWtoftYceQ/fbjkRUSzHYZmLJmMYtyTqvjmml2aZpBM7hLJvw0O98d0dO3N
 6zSG52qFnHENN9pABsRbWvCuRsptYzjS9CoglHPuycwVyZ2tLcG6jmVborp/g/BfgXST
 7BLAn7UgM6lGXiHqTyFS0mcgD/M5toyvNqZduexJYyv0nuL8SBZAefaS6TgSBBLeKLDN
 yGj8hLNT9LVIlM8ZhjdkOrG+/ga2m6DCNymJSQ46ikSnMJc0yUn6FnkV3ekXejAO3JHX
 xmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j7gR0VUYbZnEcMuOEviAaXLhp/lIk9Pv+1960Os5ZNc=;
 b=vBETaj+GAZtvgE+ZnwUEhGDlfZdI0astcgZ3faYQ2v0pUOWNfCSLLZCP3znri/z+JD
 L2RY1qUCqXMprsmgTzDqpRlHwheGVENgXHkOq5X1T1O/6PJYNHUooq5JlD73B4lYuGDU
 R3F7lbDbZ7QL9TzZ75h/5TkokcVmvbfamRfSgp6bG/9I5/zutE9h90C3rJMPPWW0tcN4
 5opuiLQyEgAQG9SyAEJMUtlf3CD/R4wu0dKjJvFvpOJJk23g3ost0CqmfyXunRwqs9u3
 wqmmb2qgrxj54hkr7Co3RwaP9GCxw63MtmI1QxA+5gRhlLdG84R85+S8xwA0ZnQOmJLg
 D6ig==
X-Gm-Message-State: AOAM5327XE3RoG2+Pel1lpZ2593kawkkoas0FpG65j4Lna9a2iVoLlPO
 cm5Cn9mKuceYLiSd6QsoFTkeJAFkVQVdxg==
X-Google-Smtp-Source: ABdhPJwZt5plG6No9su7x80gQIiRUbx8XD64l4ojJA35mzG4aaYxEySVRnctxV8nSbED3X7sBQLdsA==
X-Received: by 2002:a17:907:2bdb:: with SMTP id
 gv27mr877418ejc.483.1632338754879; 
 Wed, 22 Sep 2021 12:25:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s3sm1772271edw.38.2021.09.22.12.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:25:54 -0700 (PDT)
Message-ID: <f7c962c5-e58a-8e53-6d8d-aba72d1d0556@mind.be>
Date: Wed, 22 Sep 2021 21:25:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210922080347.150943-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210922080347.150943-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{python-}protobuf: bump to
 version 3.18.0
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
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 22/09/2021 10:03, James Hilliard wrote:
> python-protobuf no longer supports python2, so depend on
> BR2_PACKAGE_PYTHON3. Reverse dependencies already depend on
> python3.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - depend on BR2_PACKAGE_PYTHON3
> ---
>   package/protobuf/protobuf.hash               | 2 +-
>   package/protobuf/protobuf.mk                 | 2 +-
>   package/python-protobuf/Config.in            | 1 +
>   package/python-protobuf/python-protobuf.hash | 2 +-
>   4 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index 2a65156cb3..777f19d6b9 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -sha256  51cec99f108b83422b7af1170afd7aeb2dd77d2bcbb7b6bad1f92509e9ccf8cb  protobuf-cpp-3.17.3.tar.gz
> +sha256  7308590dbb95e77066b99c5674eed855c8257e70658d2af586f4a81ff0eea2b1  protobuf-cpp-3.18.0.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index fa8ea890e2..bb9c6bf37c 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,7 +7,7 @@
>   # When bumping this package, make sure to also verify if the
>   # python-protobuf package still works and to update its hash,
>   # as they share the same version/site variables.
> -PROTOBUF_VERSION = 3.17.3
> +PROTOBUF_VERSION = 3.18.0
>   PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
>   PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>   PROTOBUF_LICENSE = BSD-3-Clause
> diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
> index 1af82112b4..9b20881196 100644
> --- a/package/python-protobuf/Config.in
> +++ b/package/python-protobuf/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_PROTOBUF
>   	bool "python-protobuf"
>   	# host-protobuf only builds on certain architectures
>   	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_SIX # runtime
>   	help
>   	  Python implementation of the Google Protocol Buffers.
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> index 8eca476884..e9a5ac4904 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  3253c6d17ec0bb6f6382e555cf5ca0a9ffab8d81b691f100f96ce9f5e753018e  protobuf-python-3.17.3.tar.gz
> +sha256  4f792034070915819065c162a310142d66835333824e2e0a2ca26ed54b013408  protobuf-python-3.18.0.tar.gz
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
