Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5846EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:36:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC398611C5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC398611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C90D1408B9;
	Tue,  5 Oct 2021 19:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSC89nXq6gcO; Tue,  5 Oct 2021 19:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27A5C406D6;
	Tue,  5 Oct 2021 19:36:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47C9B1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44CD583D37
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUIj0TE3rvsc for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:36:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48A7483D36
 for <buildroot@busybox.net>; Tue,  5 Oct 2021 19:36:06 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id d8so789578edx.9
 for <buildroot@busybox.net>; Tue, 05 Oct 2021 12:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jZN031y9BM3bCLhRpToDMkMwc0LOIwXQdqQhDc13WnM=;
 b=Sfs6pCiBvIYpl90v0kjydZWsxjURHc7JEse0/Oq+j3qKpeqpw9aZoQo6bsLe5orFeQ
 M76WpHnvtpRRAwOn0ugobHdEV8qPYQplAIRh/anAsfTiKTE5L2XL27NmxtACeeOPG7Rk
 cDSr78eGro6PLiMosCmb892OqvwzZUCgH3zzVfRX5/Q/WncHOi2yRR/bb0s5bHWtjOsn
 oXIa0GeLBxVFgBQ/IFJI3IVH9BsScYXG0/ANtTHe4mSTpXOgUW7opQIJkDzHhyELMPcp
 9dHqFHuOQBjBUZFcSVoo9VAMET6T5/AagtOrSFV8dbyl0QAJvjBlREq9LoiQLe1bAXkm
 wXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jZN031y9BM3bCLhRpToDMkMwc0LOIwXQdqQhDc13WnM=;
 b=kdJ662oJZIO25BmkdldnC6egeiBBm0bljjyJUlVnmwdZ4CoBvwfMqACuDYq7AW/SrR
 h3KDTrkOw9D6eVLohnoZsZIRGIDiVMxjNrKW1KLDmRz1UduaJB5/MREFxUW0CG2+V2ZI
 4cwZ4NX46lBSEF81fz+ny5Bug/iILH9Eqhm89GmQ+b45d9MbQo7/vA/3aoxvWfBLsTv7
 UsYwWjWnJs6uwjKaGaiaN9lnrYrAxu88Ws0oiuk2I6HUHZrC/lFcNl3ZZzW2aIeSuXqJ
 6b+fYTFe7gItZS0Uv3jTcycmioxEPIegQXoZDX8xAQw/vzWLgcR58D4aWv3qNFTebGnc
 zYxg==
X-Gm-Message-State: AOAM530ZNu0td04u2PShT1ryiGsXGEJj1t3ZixGCqJSonADR763RtSX1
 h9xmqnnXrewrbC/RmDmoVQGXwA==
X-Google-Smtp-Source: ABdhPJyhhdGfUc5FSrsEt7UHObxPNCzgJ2ZdA/wEjp1GbKnc9fIzwb33ueW6YdRMUILTpYIxfMGIQQ==
X-Received: by 2002:a17:906:1f95:: with SMTP id
 t21mr137440ejr.234.1633462564305; 
 Tue, 05 Oct 2021 12:36:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d10sm8048674eja.81.2021.10.05.12.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:36:04 -0700 (PDT)
Message-ID: <298b4c58-9c48-1ede-caf4-23ff120a4e54@mind.be>
Date: Tue, 5 Oct 2021 21:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210927201753.122703-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927201753.122703-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/pcre2: bump to version 10.37
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



On 27/09/2021 22:17, Francois Perrad wrote:
> diff LICENSE:
> -Copyright (c) 1997-2020 University of Cambridge
> +Copyright (c) 1997-2021 University of Cambridge
> -Copyright(c) 2010-2020 Zoltan Herczeg
> +Copyright(c) 2010-2021 Zoltan Herczeg
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pcre2/pcre2.hash | 6 +++---
>   package/pcre2/pcre2.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
> index b30a29096..130ce1f59 100644
> --- a/package/pcre2/pcre2.hash
> +++ b/package/pcre2/pcre2.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.bz2.sig
> -sha256  a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c  pcre2-10.36.tar.bz2
> +# https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2.sig
> +sha256  4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270  pcre2-10.37.tar.bz2
>   # Locally computed
> -sha256  8937734bbb1ba65d9f8ac7a7c8fc9016759a09aa2fb37d2175c06c9e7a856a24  LICENCE
> +sha256  9c9488256e3612ec5ea40fd12abe7ec55a58f23bd36e6f465116c2b3cbffba02  LICENCE
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> index d02772650..220eb8a99 100644
> --- a/package/pcre2/pcre2.mk
> +++ b/package/pcre2/pcre2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PCRE2_VERSION = 10.36
> +PCRE2_VERSION = 10.37
>   PCRE2_SITE = https://ftp.pcre.org/pub/pcre
>   PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
>   PCRE2_LICENSE = BSD-3-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
