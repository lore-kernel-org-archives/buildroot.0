Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5461BC021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E579D40D00;
	Tue, 18 Feb 2025 20:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxLH7ECkyQuE; Tue, 18 Feb 2025 20:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFD6440D01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFD6440D01;
	Tue, 18 Feb 2025 20:18:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 780E6E05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6799961006
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXjIL_gbAn7e for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74E6760FE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E6760FE7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74E6760FE7
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:18:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4396f579634so22015915e9.1
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739909888; x=1740514688;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rkfUlg3bvDo4n4HvuV6lkVA47grVZKgSEacBG0PG0xY=;
 b=Hnt9NErJJiMo92DPdVWRD1Qz3SNrLNk3935wEdljEHe4VrVpQQ1QE2Ib0gEld4XOnn
 mgt1TwIVFgJ/JKh7FYZFKJJFAcffsETVtk9ZCx0mhDkIlODLXX8tVMY0OUUclKZIUgTC
 k965p+doXv9TCDkHdoPLksBc2TYNATCcrx/0L0VkQtRQZIg4zYQp8mJjk3fk7Fxt0phA
 JT757lvk+FVs3hZiYwmJtwtkVktEFCg3fZEEwUZbRxumif48mcDBYIc7xpZET+5yEHdb
 hzFq25nwvIm2YsD9UaWLDXCnSXpRodVq3Sy26lfBip5zz0bGQ+E1WZpST5DTiN+ArWer
 +srQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxa6ahZoBEs5dqSXVwxn5u4GDZ+wdfbiHfzaVFw8ToO3AYd388wdk6Jp4S6Iw0QXNiABPiu1jE+4Y=@buildroot.org
X-Gm-Message-State: AOJu0YzdOSydpgqdwZJjb3oh95L72S6M/ZRlkvGzVrb+Q99bR3STZnWz
 4RzjdsCjVshB2QXmnOfAcdWS5efVSagPc7VTVUDAlTcD2fNBvevofXqfDFto9RLOr9W2bzzf0a4
 h
X-Gm-Gg: ASbGncsqRN9O+kc/iqT6DHJAiqGNbZbmxpGZjCm0JaXYvSoc4JJIQ/IoP50IKhJDZCJ
 oxZ9svwfSsIBi4Ky9AutHslEGMu9xaxKi6/9N3BFEMewkgpcS6kppI20vijNb711D6uHyHQ9/lm
 MAw+bAZY8Z/yu939jMOx/J3ePu1ZMbueoxw9d+tfpZIRlVg0vGu6FUaek13cd/a2JybLUIIavPa
 R+Uni6uX2HupJj1y2gJf3qHHjpmJP2N4mNL8h1izsfvUSwqJDkGY2vXu6zxZ6PqO1sdh/r3SJOE
 8RZPgVBpdZGHqw7lh/OOem90qEVK2nVsezbCAzIW8Zo82WHQgcGASk8iIdYR5v0bFTpWTq4FPXX
 3BRjFzHr1kzNROyQ+7HsWrZubmrKs1GbfWzfYbGTk2ueTRQ==
X-Google-Smtp-Source: AGHT+IE8pnIXf5esVZS0KgL9Rc0UMSKi6cWOKspGhctXOre51Trs+g2In+SsYhfKmzy34wGK6KaSeg==
X-Received: by 2002:a05:600c:190c:b0:439:8a62:db42 with SMTP id
 5b1f17b1804b1-43999d92370mr9901655e9.8.1739909888127; 
 Tue, 18 Feb 2025 12:18:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439948eb34esm28170375e9.38.2025.02.18.12.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 12:18:07 -0800 (PST)
Message-ID: <85cb3482-118d-4c01-8413-fc701d3dec1f@mind.be>
Date: Tue, 18 Feb 2025 21:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1739865449.git.yann.morin.1998@free.fr>
 <4a834fd5953e048e156f2cba5161c9db464258a3.1739865449.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <4a834fd5953e048e156f2cba5161c9db464258a3.1739865449.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739909888; x=1740514688; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rkfUlg3bvDo4n4HvuV6lkVA47grVZKgSEacBG0PG0xY=;
 b=Tm7DVgnB05ZUqAZiRcmDYduXE9ub/7vJolsWBqlRr3k7XUyuY+2ZiReVyZCH6MRhxP
 lZG/wDWZYG6PaklSVuWOSsLidbaMRqKLfM6fx+x95XfG22lIRr+dRQrc3HCMUjY1BJQa
 z362FkQXmGZek7onEY5ASv8jnH5m83pKUDng/+lmM9djF+uIsDIvKPB/jEpxuCLLfatX
 tKk9HM6TCo4Gu1fQoy+C7cJvKauzj99e/h8MD2GY3su8oQD8il6pg+E9OUFuxufi0blb
 xoWGqhhWZqSY1VyZFZHun+jE9vqIZc/9FrJfL2ou4NKCt9RmDzIf3idP8vTkMKETFo4r
 AFtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Tm7DVgnB
Subject: Re: [Buildroot] [PATCH 2/3] Revert "utils/brmake: add option to run
 in docker"
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



On 18/02/2025 08:57, Yann E. MORIN wrote:
> All our documented uses of utils/docker-run, besides running it
> standalone to get an interactive shell, is to use it as a prefix
> to the otherwise standard command to run, e.g.:
>    - ./utils/docker-run make foo_defconfig
>    - ./utils/docker-run make menuconfig
>    - ./utils/docker-run make
>    - ./utils/docker-run make check-package
> 
> Commit 8aad67f1575f (utils/brmake: add option to run in docker) departed
> from that usual convention, by hiding the call to docker-run inside
> brmake, conditioned by an environment variable. The only reason is that
> brmake internally used ubuffer.

  The other reason is that the TZ setting is not propagated into the container 
so the timestamps are in UTC. But anyway, none of the local settings (e.g. 
locale :-) ) are propagated, so it's not so important.

  Regards,
  Arnout

> This is no longer the case, so we can
> now use brmake together with docker-run in the usual manner.
> 
> This basically reverts commit 8aad67f1575f1d8a9c90ccd70302e9a6823cf794,
> after resolving the conflict due to the removal of unbuffer in te
> previous commit.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>   utils/brmake     | 8 +-------
>   utils/readme.txt | 3 ---
>   2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/utils/brmake b/utils/brmake
> index e5437d8f2c..4b9179e415 100755
> --- a/utils/brmake
> +++ b/utils/brmake
> @@ -7,13 +7,7 @@ main() {
>   
>       start=${SECONDS}
>   
> -    if [ -n "$BR2_DOCKER" ]; then
> -        docker=("${0%/*}/docker-run")
> -    else
> -        docker=()
> -    fi
> -
> -    ( exec 2>&1; "${docker[@]}" make "${@}"; ) \
> +    ( exec 2>&1; make "${@}" ) \
>       > >( while read -r line; do
>                printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
>            done \
> diff --git a/utils/readme.txt b/utils/readme.txt
> index abff659d4f..b5862f1fb9 100644
> --- a/utils/readme.txt
> +++ b/utils/readme.txt
> @@ -7,9 +7,6 @@ brmake
>       front of each line, redirects all of the build output to a file
>       ("'br.log' in the current directory), and just outputs the Buildroot
>       messages (those lines starting with >>>) on stdout.
> -    To run this within a container using docker-run (see below), set
> -    BR2_DOCKER=y in the environment, i.e. call it as
> -    `BR2_DOCKER=y utils/brmake`.
>       Do not run this script for interactive configuration (e.g. menuconfig)
>       or on an unconfigured directory. The output is redirected so you will see
>       nothing.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
