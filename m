Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948C6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:22:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56150610A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56150610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F144D40352;
	Mon, 20 Sep 2021 19:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1L3qgG6AeSu; Mon, 20 Sep 2021 19:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57BC840389;
	Mon, 20 Sep 2021 19:22:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43A501BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EBCA401B6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3QsEnfyqz26 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:22:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D05EE4012E
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:22:18 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v5so64211271edc.2
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y0RI7GFignlfbfdmxk9x+ac1oFsJc00dpZ+OLgrc6NM=;
 b=K7NQHWaQH3otVKOZsfuUv4AjD8RwDZbHz7ynm3jREQpB+72GJ8qJjvdO/6abT2t0D0
 w/HFHXkZiDhivETamHtB/mVbZz3T9j7GoCZOD9nTAIO/T0r/E7QgED+7E7qU5KjM7t1C
 aKSVhboLQvtafP8V8BxXAui58GplcLe8WTiG8aQRw1utQ3sBhOEh/DeyvadQ/YSyBlGM
 64ZGCXz9r5cefoJN7yKNaHoNTylaLkjy85tHcMYMpG3XIc6fifP4TOkXpGbTk1xyv9f1
 NDRW8YHtSUV9YfMCPw8VGutrEwaWgjCa7u2RiyCBHdUdAwBl1+Rrw2ma6gR6nSjP8poj
 wmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y0RI7GFignlfbfdmxk9x+ac1oFsJc00dpZ+OLgrc6NM=;
 b=s2krXapJSym7dlxBz0GckEPYYh7+RKqklg0gPTFvn/VjPikPvQQLhSLdoJ8Q1j5Kli
 +PwxzaepqcSuOvDTCz54bsKyNnpsFZJ0EBRNtCfCgO9PiLDGz2oOCXCaB9aVPi8N8vxX
 SVvC+6FMnyfP8fOBneITbhmvnkYhUZKdpZWf8iFXcyzyR9gZm7bH1W6DlNEOXVppkTSX
 7OXFqBhV2apic+zjRQEvx0FaQiNwqTwM+A6pMOx2RjpT1OQVw8Ie7utIr4CzErkFnloX
 ymH+60TRKD9YNSd+HAWgrQyy6WMVYzd8HNUDIt5bVZGvD7TRdF3llWK8QdWvkGfCAZZy
 jKWA==
X-Gm-Message-State: AOAM531BMDy+xWICnInmlsSX+m4S7TOaWWyoeHGU/Cf62lawKTyd+Bup
 eRq6bkQ9Clp9CgtEko08UOkOrw==
X-Google-Smtp-Source: ABdhPJxSRTeKiA0GSAfS0ZnuBCzTYIfp3pXuNrSGfZeJzAPKk3SAP5xk82Y1ZdhVMYbJpVofTKGc6A==
X-Received: by 2002:a17:906:2f10:: with SMTP id
 v16mr8512565eji.434.1632165736842; 
 Mon, 20 Sep 2021 12:22:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id br21sm6598857ejb.112.2021.09.20.12.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:22:16 -0700 (PDT)
Message-ID: <58de71ec-a4ab-23d8-739f-052b3ebb8513@mind.be>
Date: Mon, 20 Sep 2021 21:22:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
References: <20210909080221.6143-1-david.gouarin@thalesgroup.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210909080221.6143-1-david.gouarin@thalesgroup.com>
Subject: Re: [Buildroot] [PATCH v2] package/libtalloc: bump to version 2.3.3
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
Cc: David GOUARIN <david.gouarin@thalesgroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 09/09/2021 10:02, David GOUARIN wrote:
> license is now LGPL-3.0+ for both talloc and pytalloc
> 
> Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
> ---
> v1 -> v2
>     update license informations
> ---
>   package/libtalloc/libtalloc.hash | 6 +++---
>   package/libtalloc/libtalloc.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
> index 9d48a965d0..84b0320df8 100644
> --- a/package/libtalloc/libtalloc.hash
> +++ b/package/libtalloc/libtalloc.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz
> -sha256  15c2767545d1e43dc35832736253bde5be956f8ffec0474a6d0f70349b646ed3  talloc.h
> -sha256  8742f2dad3aaf885c7b4b699c20bfa0e9edeab380689f91a88aa90af03e6947b  pytalloc.h
> +sha256  6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa  talloc-2.3.3.tar.gz
> +sha256  f8340c449dd64a55c6605b02fcad2aec6f473612ac6026739a22995380a8043c  talloc.h
> +sha256  cca17b31b2f00d7a737764b70e2be3a32f3b047ac8535c3b53759eb2946e5053  pytalloc.h
> diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
> index fb382cff76..03414a9f53 100644
> --- a/package/libtalloc/libtalloc.mk
> +++ b/package/libtalloc/libtalloc.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -LIBTALLOC_VERSION = 2.3.1
> +LIBTALLOC_VERSION = 2.3.3
>   LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
>   LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
> -LIBTALLOC_LICENSE = LGPL-3.0+, GPL-3.0+
> +LIBTALLOC_LICENSE = LGPL-3.0+
>   LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h

  Since pytalloc license is now the same, we don't need to include pytalloc.h as 
a license file. So I removed that from here and from the hash file, and applied 
to master, thanks.

  I see that there's actually one file left that still has GPL-3.0+ in its 
blurb: pytalloc_private.h. Since this is clearly a mistake, I kept the license 
as is, but could you report this to upstream please?

  Thanks!

  Regards,
  Arnout


>   LIBTALLOC_INSTALL_STAGING = YES
>   
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
