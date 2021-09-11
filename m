Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFB6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:53:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA83260E97
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA83260E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BD6460604;
	Sat, 11 Sep 2021 14:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFe7tDACESnq; Sat, 11 Sep 2021 14:53:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B3F605A7;
	Sat, 11 Sep 2021 14:53:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71A8D1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B653403C8
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVP3ZAv9Cfkm for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:53:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A42EF400BA
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:53:25 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id i21so10586316ejd.2
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3cwflq0V48/BXWKocuBjhpm7FmKDzarVa2gRddCOhlM=;
 b=OQXOCoTW6DKeWgnGcHN+I4nsgwV8EVNx8i4YGloNIFZPFjLPPY8ruCAIdbXKxXnzyd
 p8BX5ouNlXiXKGloaV3zpT4MjWVZOHcQeBw5hFXuAsmXpVeDRW+7A8bs97urXiSpzGe7
 qYzBKRlv754AAeydgUmLaDOunCLaEMDeZIL4XFx7qAd+GT/HpcxdzqgCA+GjRUhCz2S8
 yxZV68gChxB2J/ca3KLAbhQ9ACJFFbtoSPfI5cGKHX2RhYwHWkj7+AA8t5o4tGYXA6Sx
 XktnVgnlsAV3uQVLKqsVYfCS7vX+QyaBEp2i1/dMLAjCPkg3Y6xhLOPKaRiFm//Ln+EO
 eieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3cwflq0V48/BXWKocuBjhpm7FmKDzarVa2gRddCOhlM=;
 b=RAWCVsNiaQVVuijD3FDaiZFTcT0uPy+QjvgEV6GYi2ihRc4j8m5768WL1uxRcWEfRY
 GYJXrMuSuPmEK4DD43CXBmriCuoB36cl8x5Cr3ChweVCQxuVCW1+Vdq2wZNJhy+5etFi
 98U6p0xNrFAoMYs1cbjMp9gghxugMhuruWwngbelQsCHBEfPPXw8yxhbQgLqwSoflZ6I
 qfjrgA5cvMw62MsOVUvSvIkNxWvuC6oRqVEPOPO9ZUbNulSmL09+qo9wQe12Nc/BecHZ
 2ZvBVrBVMjrQslollduafyiCCvxuCezWaywaxGClsFqAeLUQr9g8vmEyg8QheUK/rJFU
 O5Eg==
X-Gm-Message-State: AOAM5324oKgAFbAvjM0qkZeekCbQrcn9LujvrwRC5uvcCHJbqnKquLJ9
 ubxcJhZBlgwuBtnSAQnJ6gXuWmnOfoDOeQ==
X-Google-Smtp-Source: ABdhPJw2urpNTLtMzbTe2fwH6c4/OfiC97u3iXfhv3mkaiXPS7sbl8n48YybfBIgydjcKHZup7+GcQ==
X-Received: by 2002:a17:906:138a:: with SMTP id
 f10mr3134035ejc.89.1631372003891; 
 Sat, 11 Sep 2021 07:53:23 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jl12sm857352ejc.120.2021.09.11.07.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:53:23 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210901234917.13980-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <fc33670a-98d5-7abc-7f65-7a76f0bd412c@mind.be>
Date: Sat, 11 Sep 2021 16:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901234917.13980-1-petr.vorel@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/1] package/debianutils: bump version to
 5.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 02/09/2021 01:49, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1->v2:
> * Fix DEBIANUTILS_SITE & DEBIANUTILS_SOURCE
> 
>  package/debianutils/debianutils.hash | 4 ++--
>  package/debianutils/debianutils.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
> index 16a45d4ea1..d6889c9ba4 100644
> --- a/package/debianutils/debianutils.hash
> +++ b/package/debianutils/debianutils.hash
> @@ -1,4 +1,4 @@
> -# From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
> -sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
> +# From https://snapshot.debian.org/archive/debian/20210825T030241Z/pool/main/d/debianutils/debianutils_5.4-3.dsc
> +sha256 611b1268bee9d183886c94e5f34920e4b5b67ff45202aef3f6f2ba8f4a205163  debianutils_5.4.orig.tar.xz
>  # Locally calculated
>  sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright
> diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
> index d2c41130fb..0e436daa3f 100644
> --- a/package/debianutils/debianutils.mk
> +++ b/package/debianutils/debianutils.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -DEBIANUTILS_VERSION = 4.11
> -DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
> -DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils
> +DEBIANUTILS_VERSION = 5.4
> +DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).orig.tar.xz
> +DEBIANUTILS_SITE = https://snapshot.debian.org/archive/debian/20210822T204137Z/pool/main/d/debianutils
>  DEBIANUTILS_CONF_OPTS = --exec-prefix=/
>  DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
>  DEBIANUTILS_LICENSE_FILES = debian/copyright
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
