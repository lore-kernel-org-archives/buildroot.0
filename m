Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B40C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:35:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C106610A2
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C106610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58F640751;
	Tue, 12 Oct 2021 20:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFYSZKbUSWRn; Tue, 12 Oct 2021 20:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C9C40704;
	Tue, 12 Oct 2021 20:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2B7D1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D085281B8A
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXavvvUsZBbL for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:35:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9868A8175E
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:35:25 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id d3so1132271edp.3
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=3nqcAiZuKBItFpV0aYsAFJD8aC3kjPGgs7ombB9I4iE=;
 b=Dzte0ntbGTmGfPfP4fgGcVr5l5cv3Hwu7GmpkMxxXT78weyGrGAueHHecU9ahuJnrZ
 bVmcbqE7jtYeY8b/ooKYFKE6KdkjD2UnWGwftQ3ScGgvS9fF2CiHhHRi2d/A4bzwytq8
 xy+9Pu1BqUMg+oG3KwnRUdsPZq5zF0s8aZhGeKN+pnFTTF1zPslhz3u+HccwrLde/UdB
 8ldxoSm+fbsoCTvhrlFNGsnvHFtz37yDrNsuqV5+ywzHxzNmaBUxqxcwmRjD1j2La215
 ic/QO17ayX/un0rdBEdRAyHLg8Pf+/RRalxnIptQgjfrYhNv7HUdZtpdRnGCw5ng9j4/
 aDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=3nqcAiZuKBItFpV0aYsAFJD8aC3kjPGgs7ombB9I4iE=;
 b=IhkfQSa5U7pKN6048YGUB08FuDaC8k75BfNNH8KQAfInIxFb8pn8QmCgDFMSLRAoEt
 fNV1DCvd7GALdKmFakD2Rs793B1rInMQrNXbxEqUlvj647qXHL1LGtxzLvgciO/T8bZZ
 2ERlYCvs+E2RFdyO2FsrUuhBznhMxUUHS1DVajMrdSpZmg7/eBNMgbcF5v2SJPnHPVyt
 4Qz9sdci1jckNuOILtuo+6Eupmd6qoVBehHwqZwKBk0g04KCOu9LL7z6fM3HyKA9w7mJ
 jj0cMfjxYzaFDC/mAbizmgV4FUXX8kwwgUcjtFqgdKKnZF0KEIrdHU0WkuI9hbiFOD3K
 X6HQ==
X-Gm-Message-State: AOAM530VbOQIzUFP6yuttGjn3M5TzYQ6AVRMsHCbzhuGCRUkhiBWwOpn
 ZgW3UAs4W94g1PnS9BeYVxJiH2RG2WHtBkYY
X-Google-Smtp-Source: ABdhPJzkh1FbuGiNLS9p304sfvuaRI3GlvTXSWh0FF+GpywtMkq7v6ZnA19kB4z7eJxK1AYKVoJuTA==
X-Received: by 2002:a17:907:3f15:: with SMTP id
 hq21mr698619ejc.440.1634070923521; 
 Tue, 12 Oct 2021 13:35:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n16sm6400705eda.93.2021.10.12.13.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:35:23 -0700 (PDT)
Message-ID: <cc3fe11f-d3dc-0179-89e8-0b7dc64e4541@mind.be>
Date: Tue, 12 Oct 2021 22:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20211004174912.4736-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211004174912.4736-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/links: bump version to 2.25
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



On 04/10/2021 19:49, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Petr,
> 
> from Changelog [1] it fixed DST Root CA X3 Expiration [2] => IMHO worth
> to backport to stable releases.
> 
> 	Delete the expired Let's encrypt certificate from the builtin
> 	certificate store
> 
> 
> 	Set the flag X509_V_FLAG_TRUSTED_FIRST, so that Let's encrypt works
> 	with openssl-1.0.2
> 
> [1] http://links.twibright.com/download/ChangeLog
> [2] https://letsencrypt.org/docs/dst-root-ca-x3-expiration-september-2021/
> 
>   package/links/links.hash | 2 +-
>   package/links/links.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/links/links.hash b/package/links/links.hash
> index 6dbb9d13c0..0f8cd32937 100644
> --- a/package/links/links.hash
> +++ b/package/links/links.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  9b12f5ba2d068306d7ff7385b520cdcafdc0e55c87eec877abb0e78288525430  links-2.24.tar.bz2
> +sha256  2dd78508698e8279ef4f09a3a2a21e9595040113402da6c553974414fb49dd2c  links-2.25.tar.bz2
>   sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
> diff --git a/package/links/links.mk b/package/links/links.mk
> index 5f075a70da..1f1a7a9189 100644
> --- a/package/links/links.mk
> +++ b/package/links/links.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LINKS_VERSION = 2.24
> +LINKS_VERSION = 2.25
>   LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
>   LINKS_SITE = http://links.twibright.com/download
>   LINKS_DEPENDENCIES = host-pkgconf
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
