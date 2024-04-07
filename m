Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29C7CD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71BE64035D;
	Sun,  7 Apr 2024 19:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8jZnDmqz4NQ; Sun,  7 Apr 2024 19:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A2444043A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A2444043A;
	Sun,  7 Apr 2024 19:35:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7714A1BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63B2240780
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHkgDXv4tw-O for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:35:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD8EB4077C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8EB4077C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD8EB4077C
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:35:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41649860cecso5096065e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712518508; x=1713123308;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YIbEJBbEF43SjpxhT4UhSxr6b/jF8heUIqJitK6cLIQ=;
 b=QRHN9iQlJOJI+s0SRVR00UyWTdU/XZj5QSPKWqldsFY6jqTrz3gvhb9JdfrwXw9sr3
 mRubvUSLjaWn15Dwst37cpmCrbFd0bfXQXkb36o8TspuiEBH2CrPEydXJNUttwdbT55x
 dxS1fg+7IlrEzNWd02QwOq7FMigHdzbwdZZ8PClOcV6yRR5DgjTds58E20z6w0/QEn8C
 9cYl8oXh8wfX01DiaYn+dUKgmiU7drGNa2v04IO9e8mhFTc8ty2OvfWYHbpBhuRhYra5
 fG/CYZAnTNIvSAzIP/6GrzSKL0Wc9CGlROIeBpFe76Bk0REnbAY4qjXIkTD2zPkFOAW8
 tzSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzrey+70kKIXuDKEczehpEt156BViIvSsFjNzpIZSBNYTaIdls9f5v2JPHabLBYj8RDOAawmiOWf2LxzWSUxUfDafArEd1uA==
X-Gm-Message-State: AOJu0YxzFFVgYDV2cq/aeiKKJ4AOq/cpK3FJ5MWtp+dx4z0YofNqY0XH
 +5+eKi5oCHN1zBJnooFI1bB/VevNyip45vINNTOa8CFJuB1UTZE3lpkFQpvOg9iXeXCSDjBsQct
 /
X-Google-Smtp-Source: AGHT+IF8v11O/+xt1QjhiSzBBFLCFvHeu4BDEGLpV5MqC5AGIRj151RQ/7N+UVQrj80sZ8SAtJLDTg==
X-Received: by 2002:a05:600c:3acb:b0:416:7222:8a78 with SMTP id
 d11-20020a05600c3acb00b0041672228a78mr519190wms.37.1712518507782; 
 Sun, 07 Apr 2024 12:35:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a05600c0a0200b0041624ddff48sm14272839wmp.28.2024.04.07.12.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:35:07 -0700 (PDT)
Message-ID: <7f38234d-2ca6-4648-aec1-de2cdeeea8dc@mind.be>
Date: Sun, 7 Apr 2024 21:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407124550.1282517-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407124550.1282517-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712518508; x=1713123308; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YIbEJBbEF43SjpxhT4UhSxr6b/jF8heUIqJitK6cLIQ=;
 b=S7mZX0m4ZeL9ZVyFilV5esQI8z/m6wxUsd5VMVjE1DtMPKO0D4HErf9ypplvl6NwLH
 TOfcbI2qsDIiHU0EVPYodzWwI4uaScu7dNX9bUzcm85nbcobk/eoAJswP357gIsR73Z0
 DszhFaC/Q5u3hbPOhQTLS8qpes8nXewVEwxzKnqh4YSZx4UB6wuLuQAC/c6tZwf285Cd
 pUFvWaH2fQAOH0pa0R4eJSKpdraUti3IfE0ghKYYa1CTwJ8VHBqcABfOHydArK+uY8K/
 GZ8Jc9+TWY1pkBSl7AcScN4ssEpVvTBY11rnOCv/MYMvO2qpxFNhfmPar+NFOspTO8RS
 a/UQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S7mZX0m4
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-net-ssleay: bump to
 version 1.94
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



On 07/04/2024 14:45, Fabrice Fontaine wrote:
> This bump will fix the following build failure with libressl raised
> since commit 9d8f9c73a2fd087dd2e8d8853a80da605fa64e4b:
> 
> SSLeay.c: In function 'XS_Net__SSLeay_X509_policy_tree_free':
> SSLeay.c:17730:9: error: unknown type name 'X509_POLICY_TREE'
> 17730 |         X509_POLICY_TREE *      tree = INT2PTR(X509_POLICY_TREE *,SvIV(ST(0)))
>        |         ^~~~~~~~~~~~~~~~
> 
> https://metacpan.org/dist/Net-SSLeay/changes
> 
> Fixes: 9d8f9c73a2fd087dd2e8d8853a80da605fa64e4b
>   - http://autobuild.buildroot.org/results/974b7cdd275249c888fc6205f6ca31a3cf28b18f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/perl-net-ssleay/perl-net-ssleay.hash | 4 ++--
>   package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
> index 9caff68edd..219edd4e0f 100644
> --- a/package/perl-net-ssleay/perl-net-ssleay.hash
> +++ b/package/perl-net-ssleay/perl-net-ssleay.hash
> @@ -1,6 +1,6 @@
>   # retrieved by scancpan from http://cpan.metacpan.org/
> -md5  c73821e9790b3bdb3471d9b8faf48bbb  Net-SSLeay-1.93_01.tar.gz
> -sha256  876d022fbc719631b11d6bb4b6e78db3c19bbca578093c376c8f9900a4432aa3  Net-SSLeay-1.93_01.tar.gz
> +md5  1b22c764e5a094c6261e37a4b1f148ce  Net-SSLeay-1.94.tar.gz
> +sha256  9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d  Net-SSLeay-1.94.tar.gz
>   
>   # computed by scancpan
>   sha256  685e534b60d4e2b4fbb1a259a83b5a86e877a919bbb9efc95994276f706a3a71  LICENSE
> diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
> index 8b7b2b973b..7f58093082 100644
> --- a/package/perl-net-ssleay/perl-net-ssleay.mk
> +++ b/package/perl-net-ssleay/perl-net-ssleay.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PERL_NET_SSLEAY_VERSION = 1.93_01
> +PERL_NET_SSLEAY_VERSION = 1.94
>   PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
>   PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHRISN
>   PERL_NET_SSLEAY_DEPENDENCIES = openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
