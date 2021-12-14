Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E14C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 813C9408F1;
	Tue, 14 Dec 2021 20:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 025QT4wekWf5; Tue, 14 Dec 2021 20:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C24D3409AA;
	Tue, 14 Dec 2021 20:06:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1061BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AB0A40602
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJKmonEjFvQB for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:06:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C695340114
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:06:06 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g14so66141770edb.8
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UV0+8xFas235qorPo3jfjMSPlXoEKZQCWbVqgqm5HBk=;
 b=Yoyn1PiwaQUcZua/f/w9iGk2IOOAU/dvEuncl5m9fjGHTbcv5XbQM0n/I/5O/dtjH2
 LSQJA0CT5W6vUYyHdUmuF2up3z6m/yGJxq72ogvVhQJ+jAdaylmCMBqs2TfWPBqx1xkE
 Px5MFk8az+7PsEWpPLcKNTUPbpkFtsb/UsfUzHFsqiEnuoLZDvBxWVW8Wzlomp63rdFB
 TyRB2tatQY+xcnzAst26us0hEDeOHzRCgcy/kXejpUt4pIoYf18y5SqNW5DeancCAXQa
 cVGq9oy+ABmzmlCISgDLQiuN7HYD1j8v0KIhk63+AVX8ImfyjH3fReLvNBN8Zj926GhF
 MlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UV0+8xFas235qorPo3jfjMSPlXoEKZQCWbVqgqm5HBk=;
 b=EAUtGx8bHNzTuWrkFDUbrxQcUmv3P1d7n4Og0aFEnxh9Njrj8t/Oz1NyivFGjRtKBq
 AvQoiZ9rgvHnB1bZuwUZA5H10eqSFKXN5J4WFFjcmUB5QRa6L6bmXVHGp9E/zpR8+KzT
 0B9KLbi2p6SOV3s9QWD6cr1BkHeTacjb34Eh/cEmcCSi235RO0+N/ruyVw0Q90wyJ3uv
 bAafo5oJgDVa95NZXjxR4QmcUKYl00/oKk2XBvE48gXln+PoDkuBoWqxmRwYruW6+tO0
 W+TTeOs9CnA+B1NHs8K83eKW80aKBCziHyGBXUNFXhQ5avTI+5fhq09YBbNqmeDXGyWT
 9TOQ==
X-Gm-Message-State: AOAM530Bb7uYKeIbqkrWd3JkVuXnPhWW30Gpk5wLxRS64ndQpD0Ami2c
 9+09Tc8JsA/I9zIuSCQPUScm8KR3Lq8tTQ==
X-Google-Smtp-Source: ABdhPJxS7fWcuJKRllXF3Bp6ra7aDTno1s5YzgTCggdC48+2X7/srJkShYGgpA2I22WpLI7Q5Dcvag==
X-Received: by 2002:a17:907:9710:: with SMTP id
 jg16mr5170551ejc.115.1639512364961; 
 Tue, 14 Dec 2021 12:06:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g18sm237288ejt.36.2021.12.14.12.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:06:04 -0800 (PST)
Message-ID: <0ed4b17d-ad9a-7dff-9d3f-8969ba0423bd@mind.be>
Date: Tue, 14 Dec 2021 21:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Kyle Harding <kyle@balena.io>, buildroot@buildroot.org
References: <20211213151514.926386-1-kyle@balena.io>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213151514.926386-1-kyle@balena.io>
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.14.0
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
Cc: Stefan Ott <stefan@ott.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/12/2021 16:15, Kyle Harding via buildroot wrote:
> Signed-off-by: Kyle Harding <kyle@balena.io>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/unbound/unbound.hash | 4 ++--
>   package/unbound/unbound.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index 3c872aedf5..ca6fe174e0 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,5 +1,5 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.2.tar.gz.sha256
> -sha256  0a13b547f3b92a026b5ebd0423f54c991e5718037fd9f72445817f6a040e1a83  unbound-1.13.2.tar.gz
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.14.0.tar.gz.sha256
> +sha256  6ef91cbf02d5299eab39328c0857393de7b4885a2fe7233ddfe3c124ff5a89c8  unbound-1.14.0.tar.gz
>   
>   # Locally calculated
>   sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index 37456db416..61fdc5389b 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UNBOUND_VERSION = 1.13.2
> +UNBOUND_VERSION = 1.14.0
>   UNBOUND_SITE = https://www.unbound.net/downloads
>   UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
>   UNBOUND_LICENSE = BSD-3-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
