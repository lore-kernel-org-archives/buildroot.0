Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CF1C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E7F541A33;
	Fri, 12 Jul 2024 20:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agIayl9_HP1s; Fri, 12 Jul 2024 20:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D513E41A35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D513E41A35;
	Fri, 12 Jul 2024 20:11:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAAF21BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9745141A30
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwGF1jTcZR3l for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:11:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5806841A35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5806841A35
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5806841A35
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:11:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-367b8a60b60so1344287f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720815090; x=1721419890;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s5st/fMoMqsiIEnpEl7eh0etA9J626vLY//I4Wq7N6A=;
 b=nfKtxexGeL9XDHUMlI5yubPQwm3fV0Ktd/n18nY23mBB3edAQ3RaDwgEYa86ogdb6l
 FAzAXpR98UbkJXuz7XzPkq7sIruc0w/1cNKX4IXul7q/rRbiu+XMJGHoblEhw7zYYvzN
 8D7eJ9Vjoz4aRXCvyDcsWkXFsAf1RwdPyYlFe9BcMW8QsFiyWT1a19ZIzKoT+B1h8c1z
 1hsYpH5QwagJMuzmCZcNBHqkZPbTX2UYnb931hes7DsJejIqsP2QuVIJtWRprOBEmXLh
 QgNxMW0gTlnShTCro0o0ip2PiY+wYJZdNcHjjR9FJX43zvyGckwyHT0k7bSG9Ip7vDai
 M5VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbflhOoWh6fWBYzwK9CafM16i8F7RSwkzY7Wn5rMaVGq0U31tjhOdBUrQEnFduvVAGwlrKSmJ0soMlzIDrTLwmKZt+x6SwHA==
X-Gm-Message-State: AOJu0Yw0GDGQBXeIeaN8XIfa2EFmWvNlbzytScRl0mvCfyXR8JF0Oq6t
 DZX5VhmlPFlggv71PLUADYpxlDppIb2w7Y/rgIxowK6wyiXSACXq8zsBDLLH1zA=
X-Google-Smtp-Source: AGHT+IHj+cjqAa6h/tQmEw7SuJxxfTHsE4OENx5OmpMUUHlmke8tcAx0ayh2+sO8pEkgaUNOUkyNNg==
X-Received: by 2002:a05:6000:402c:b0:368:75:26d1 with SMTP id
 ffacd0b85a97d-3680075279fmr3092137f8f.4.1720815089956; 
 Fri, 12 Jul 2024 13:11:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7df3dsm10860824f8f.16.2024.07.12.13.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:11:29 -0700 (PDT)
Message-ID: <f019c0fa-2779-4c37-b817-813c37197756@mind.be>
Date: Fri, 12 Jul 2024 22:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230916151015.723729-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20230916151015.723729-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720815090; x=1721419890; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s5st/fMoMqsiIEnpEl7eh0etA9J626vLY//I4Wq7N6A=;
 b=E8Dhdec0oy0vcSrMHarSFABFei6h5V1AitXLpCxYA9K5SJSwfpbB2DPNj5y5Jaueu3
 IOpUERlCkAnYDf3SXM44jEb8Wwk9HGg9JdUuJa/V6It5cQcy/MObUUZ4kLXJtReaIuZM
 6VVwRg+pvlXE09lSSK3qJzXIgTfG4QThJ5wHFs8aTl5tEtK0dXQBd6W0YerPhnU41nY9
 yQGNoW6GmTuEQuifQtBzFGI+EOWdFqEYbtQ6xfNsEV5jRATEzV+HWzVKJ05XUeFCnIdY
 17kE1r8BL5U0cvt8jycMJ7d0mrA3n4d0RLymEiD4dv0Kog2M1VulieJJjZkNRjfCLcvP
 a78g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E8Dhdec0
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: add bsdunzip option
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/09/2023 17:10, Fabrice Fontaine wrote:
> Add bsdunzip option to avoid the following build failure raised since
> bump to version 3.7.1 in commit 7991d2c48a859f9c0333ade8192868c21b1a8a31 and
> https://github.com/libarchive/libarchive/commit/c157e4ce8eb170a92945cc2d292fd7106bdfcce1:
> 
>    CCLD     bsdunzip
> /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/12.3.0/../../../../powerpc-buildroot-linux-musl/bin/ld: cannot find -lz: No such file or directory
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/aaf7fdefa0b7bd7e5ac743487c197544c1a2ce6f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libarchive/Config.in     |  6 ++++++
>   package/libarchive/libarchive.mk | 10 ++++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
> index ffa4cff7b3..2c8d813ccb 100644
> --- a/package/libarchive/Config.in
> +++ b/package/libarchive/Config.in
> @@ -30,4 +30,10 @@ config BR2_PACKAGE_LIBARCHIVE_BSDCAT
>   	  The 'bsdcat' program is a simple replacement tool
>   	  for zcat, bzcat, xzcat, and such.
>   
> +config BR2_PACKAGE_LIBARCHIVE_BSDUNZIP
> +	bool "bsdunzip"
> +	help
> +	  The 'bsdunzip' program is a simple replacement tool
> +	  for Info-ZIP.
> +
>   endif
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 2db36156b8..7e364e3902 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -42,6 +42,16 @@ else
>   LIBARCHIVE_CONF_OPTS += --disable-bsdcat
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDUNZIP),y)
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBARCHIVE_CONF_OPTS += --enable-bsdunzip=static
> +else
> +LIBARCHIVE_CONF_OPTS += --enable-bsdunzip=shared
> +endif
> +else
> +LIBARCHIVE_CONF_OPTS += --disable-bsdunzip
> +endif
> +
>   ifeq ($(BR2_PACKAGE_ACL),y)
>   LIBARCHIVE_DEPENDENCIES += acl
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
