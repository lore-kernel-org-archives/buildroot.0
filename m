Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DDFE77188
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 19:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31AF984EA7;
	Wed, 18 Dec 2024 19:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuz0NC5iWFIl; Wed, 18 Dec 2024 19:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A67284F24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A67284F24;
	Wed, 18 Dec 2024 19:46:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80F2FCE
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61482419BE
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tswfz7TQRP4I for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 19:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91EDF419BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91EDF419BC
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91EDF419BC
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 19:46:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3862d161947so27182f8f.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 11:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734551171; x=1735155971;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YvtuklQlKTmtkKJxsjhe0oQa7yxvZkEaxIS+aZ5x7fg=;
 b=EaThJJFjzMLYv2JksfCLi2wNer4fjTi+lYUbiH05Z5FWJU9oRcUzCkMe5n9Z3NLb18
 oE0Up1KwLBDXI5cZdZ+EHxV30xA8vjH7ubkSPmj6ztLatTqo+RSqzIiO3K/9O4XeWR3K
 RzAtBciaE8MmyY72ZQVHU+W0bgSsCkfFXouVwSlDQ/9QMste3X2JqvkFbFVOuGtDJdKu
 YNDckD2qRZq7pC745nDtmcwF8qr2LlpV+IR0MZ0ebhjdAnM3IUBSDVTDla6ebJdTcGvq
 7cpgK9VZdWvZFeaoz0we2Hpn2nKO65+3hnSJkZ+gw3JPPGzOn/Nm5KHMJO+SgdSb3+Ex
 Webg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1coRj1cmBBRJslK3N46taFOJDKUsXshTMJ98/iaRi24WbDUGyix3ScJCVn7pBpo71Sny9GpccKm0=@buildroot.org
X-Gm-Message-State: AOJu0YxJS05f1PJeJ1tVABwbmmntGr0NOZ3/BpAtnanh8NRBlqMa5fqm
 MO1ah9Spq0uxAE3qJVl7HcL104C+svoUU19hU2INnrIWkZOb51jHvzV0pldQKac=
X-Gm-Gg: ASbGnctEX959ekRVqmzOZ+f3z1Io/Jn26IjwifCNms4zU18wgwoUbKOLhGwuUt+1X9I
 a/N18SATsjB07no3llh19KDOep+qCKNhbRqvDSJW2njMNT5EswZa9+zUjTXKiUPR9b8G1zxX0+9
 4nM9ZW4Ov7OvpXCzxSD0LTu9m6me/k1Yxmp6RXJmzTIjVDrnuut/hhxO7u/zrVmHDQ3jdcJ3hjA
 J1H586VJVGanHE0slj+SJ7u7bOiNyfhkoyNhBTY4+TsBiiQ2tOWPLlXAVP+UC4Yrh2qfUyQV6FD
 oMmO5Jz+Gl5f0fdI6V1l/xnHi/LPRnJOdQXo9ziZixGsQ3lNbxcqt2u1rk9UnUNkJALGnnL1n+d
 Sd/htoX6VZT4=
X-Google-Smtp-Source: AGHT+IHz/8WjPEOynTGAMkr4YcNzI2I/GwxgZEcibytrKzV4L7GyP39GMq/YXJP4HPDYEgr8oJlFLQ==
X-Received: by 2002:a5d:64ee:0:b0:385:ec6e:e872 with SMTP id
 ffacd0b85a97d-388e4da50f7mr4214008f8f.38.1734551171010; 
 Wed, 18 Dec 2024 11:46:11 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c804a2f9sm15030408f8f.77.2024.12.18.11.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 11:46:10 -0800 (PST)
Message-ID: <5910c950-46a3-41ad-9a0b-e9debb07f966@mind.be>
Date: Wed, 18 Dec 2024 20:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>
References: <20241212205619.259476-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20241212205619.259476-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1734551171; x=1735155971; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YvtuklQlKTmtkKJxsjhe0oQa7yxvZkEaxIS+aZ5x7fg=;
 b=BelWbuHpY/zAk/fzNrpgUTmzvd33QGv0bFnhxVf9sR2KBA0cCPlbco3CwqmFfC3ddu
 14sc/EIskyNExbzwzeAQkxrPP28X6hkxm+k5wFJ6uQ/eQPJrJ2P+00PcIOCVFHXPkg41
 QbhIFTLn5UH6+FMja9i93ni29uoNRuTVyeGkW9oYUKJJOxG+5N1NCBFWQhk/u4wjbEhR
 /MVIEeXNHv1SdK/B4EjyDtA5d0AaNe+atus6vjbaxfod5+nxz8tGdduXtvRSZAOxDfE9
 t1XePk4BVPuDtuP88puBUC/igf6F9LEsomDz9JZBx/DMZ3d2LMba+lcBn5cZJUGV+ng6
 wNTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BelWbuHp
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: bump to version 1.5
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



On 12/12/2024 21:56, Julien Olivain wrote:
> For release notes since version 1.3, see:
> https://github.com/riscv-software-src/opensbi/releases/tag/v1.5
> https://github.com/riscv-software-src/opensbi/releases/tag/v1.4
> 
> This commit also updates the package home page url and the
> download _SITE to reflect the change of github account from "riscv"
> to "riscv-software-src".
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/opensbi/Config.in    | 6 +++---
>   boot/opensbi/opensbi.hash | 2 +-
>   boot/opensbi/opensbi.mk   | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
> index de2f0aae20..7604be29d9 100644
> --- a/boot/opensbi/Config.in
> +++ b/boot/opensbi/Config.in
> @@ -10,7 +10,7 @@ config BR2_TARGET_OPENSBI
>   	  System-on-Chip vendors to fit a particular hadware
>   	  configuration.
>   
> -	  https://github.com/riscv/opensbi.git
> +	  https://github.com/riscv-software-src/opensbi
>   
>   if BR2_TARGET_OPENSBI
>   choice
> @@ -19,7 +19,7 @@ choice
>   	  Select the specific OpenSBI version you want to use
>   
>   config BR2_TARGET_OPENSBI_LATEST_VERSION
> -	bool "1.3"
> +	bool "1.5"
>   
>   config BR2_TARGET_OPENSBI_CUSTOM_VERSION
>   	bool "Custom version"
> @@ -57,7 +57,7 @@ endif
>   
>   config BR2_TARGET_OPENSBI_VERSION
>   	string
> -	default "1.3" if BR2_TARGET_OPENSBI_LATEST_VERSION
> +	default "1.5" if BR2_TARGET_OPENSBI_LATEST_VERSION
>   	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
>   		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
>   	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
> diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
> index 980fb141dc..c69bcf7150 100644
> --- a/boot/opensbi/opensbi.hash
> +++ b/boot/opensbi/opensbi.hash
> @@ -1,3 +1,3 @@
>   # locally computed
> -sha256  2c0501eb3475f463b15f5b8531996f64604ea49e0e3ed040ecbd1fc27ecd8c5c  opensbi-1.3.tar.gz
> +sha256  9880485672a3a2c48a81d373df6707517b568402f2d3f9eecbfa9d83f8e6f22f  opensbi-1.5.tar.gz
>   sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
> diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
> index dd113a0bf8..0142769a12 100644
> --- a/boot/opensbi/opensbi.mk
> +++ b/boot/opensbi/opensbi.mk
> @@ -16,7 +16,7 @@ OPENSBI_SITE = $(call qstrip,$(BR2_TARGET_OPENSBI_CUSTOM_REPO_URL))
>   OPENSBI_SITE_METHOD = git
>   else
>   # Handle official OpenSBI versions
> -OPENSBI_SITE = $(call github,riscv,opensbi,v$(OPENSBI_VERSION))
> +OPENSBI_SITE = $(call github,riscv-software-src,opensbi,v$(OPENSBI_VERSION))
>   endif
>   
>   OPENSBI_LICENSE = BSD-2-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
