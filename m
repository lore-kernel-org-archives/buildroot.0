Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EDCC54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B92B60F7E;
	Fri, 15 Mar 2024 19:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjfwZruY335Y; Fri, 15 Mar 2024 19:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FAA560F85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FAA560F85;
	Fri, 15 Mar 2024 19:22:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 875BA1BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E7744192F
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFTcVgazh69R for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E672340399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E672340399
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E672340399
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:22:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-413fea12b50so12874535e9.0
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710530518; x=1711135318;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FY5owr0yUz3+wJptqZmOiVS41iKkwolGVz3OoOl+EY8=;
 b=bxwdNa2qvNU4rGPmV/bR77B3eHGUgm8cfwOC0FtD2cpjv7Qa3Fp/HOKnzveUp/H0jA
 +lvhTadduBsJ/VKQoTMbvsfcyBk+6bjklJJs7WsxZwr2LELnv0mYN48/SiiYlu7x/2WF
 Fw2L67pQ72S/A32/zBSQlpBeYGR8aT5GKAxjwEcIDE1zaSNKNKTK2vUS9HRRj+1GH8HE
 XlqP5F2gP5YiSUWSiGrnGxuv/VUirSLx9AS/Gr8TfViCqOcE4W3o/HaS0lQ3eElg1uBQ
 GppsXurfBpZ0oB26wOA52PWIZnzp7PEK9lSawA9EMHqYcgZqNavYqjSNwp60hGI623AI
 QJUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTjbiyX4FLVUP5cEUAybRfIuCxhaECcoObvafWRbx6xlrW48bwerjQLNMpynUCIsH8fq3Jl/HNsfpOCdLWAGbejqVKx7KtWQ==
X-Gm-Message-State: AOJu0YyLHHfSWviUtNkh9ufNXQJ2llU2q1FrSx/O3sZ7F9c0bAB6J2rO
 55FgvkwhJZlumiP0KBpsXqs0XTltmhSlkRZeYljNo6Ra1OE1zNP86H2aYpN4pbg=
X-Google-Smtp-Source: AGHT+IFg/K0vI+c8iltsmeaZOJzmN8VMJBtLFp5MECI9nekV/1mlm3wZ+IIWIKMs5M/5C6B+z2BkTQ==
X-Received: by 2002:adf:f3c2:0:b0:33e:bb67:9596 with SMTP id
 g2-20020adff3c2000000b0033ebb679596mr26126wrp.64.1710530518404; 
 Fri, 15 Mar 2024 12:21:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bq22-20020a5d5a16000000b0033ebf702e17sm1863302wrb.21.2024.03.15.12.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:21:57 -0700 (PDT)
Message-ID: <7305a589-deb5-4823-935b-1d1862f00989@mind.be>
Date: Fri, 15 Mar 2024 20:21:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240315150803.22545-1-peter@korsgaard.com>
In-Reply-To: <20240315150803.22545-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710530518; x=1711135318; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FY5owr0yUz3+wJptqZmOiVS41iKkwolGVz3OoOl+EY8=;
 b=OLHKT+ebQOiBFRzWtgFLbx2+Lkc33JcaI/P1osvcoLZX2JamL2PFIojoC9eowQ9U9T
 XfTDfLXIBEPjq1zrfA9PLFvoZU0pDJAWvm3GR41EZUnuw0tOT3YzrY72uvnCJHU9aKe0
 /2R3FQ6mGWJhla0gHL1fAniky64rXVNm1Wm+0jKOhrx6VlOuqTgfu2rASp8NUxBkDxmv
 748lJi81HSi1LM587EXhx90CKVKXmsEQUeesRclUV7RR5D7RKDckiT6HtxIsLddGNA0r
 CeE45Z9jE7G5+A/vm6nDXKCKjt0PqtubE5KckhIy7dPeuDz9Fww1peQuxquVGK2NjeXn
 +oQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OLHKT+eb
Subject: Re: [Buildroot] [PATCH] package/rauc: bump version to 1.11.3
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2024 16:08, Peter Korsgaard wrote:
> Contains a single fix for a regression since 1.11.0.
> 
> https://github.com/rauc/rauc/releases/tag/v1.11.3
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rauc/rauc.hash | 2 +-
>   package/rauc/rauc.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> index 6899ca94fe..391d89a8f6 100644
> --- a/package/rauc/rauc.hash
> +++ b/package/rauc/rauc.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking pgp signature
> -sha256  e47070e97f89136ca8d0b2b044c40e68ac0f44432046176d08d66717320df4a7  rauc-1.11.2.tar.xz
> +sha256  ef82ee452939c03a24fd40649afa96497f3cec965994e6c9c0d94239b640bc10  rauc-1.11.3.tar.xz
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> index 7bb374259f..7239d84cc7 100644
> --- a/package/rauc/rauc.mk
> +++ b/package/rauc/rauc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RAUC_VERSION = 1.11.2
> +RAUC_VERSION = 1.11.3
>   RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
>   RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>   RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
