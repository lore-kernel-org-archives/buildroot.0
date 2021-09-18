Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D78C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:00:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D37610CB
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74D37610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1691B4016F;
	Sat, 18 Sep 2021 20:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88mg96huFrYP; Sat, 18 Sep 2021 20:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12525400F2;
	Sat, 18 Sep 2021 20:00:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 861D11BF40A
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06E01404F3
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZ6rXvSM2hqI for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:00:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A9D2404D5
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:00:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5E014B004EE;
 Sat, 18 Sep 2021 21:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631995200;
 bh=yuoGF9xfPjcyMThVbO1QvWMFlbqWebqlfAQUDV9YVXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NoqsB+ZRj0DSFSUBTLqd/M5Y1lslBXlpV1gTev/Z70wFP/BHI4KeJAenrG/wnoUGU
 LSFA/7k5BHOnhZSxUrVs/P7rUPrP+yTa8Ia72IpdkDdtVGYv9ehCKop8AYQuBT+WTt
 Cu1t+183fvCGH0Lk5R+iamGf90GSD/Gfy+u9NuoWWX4UkTwoxLrocmrcWAtMV4pzL4
 C3bitw/iu399G1IAVcPKu1zgBxsvoWHZqel0UgfhQ+trAb0ng4XOj6ZOP2wCT99IRB
 WBAfGvgY0vT57z+cXmJu5c7pxx3x8eN4q0xwSwWNMR0svCYFDVJ5IfYAsrNEaB7S06
 FSYqHI+feKzkw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 21:59:56 +0200
Date: Sat, 18 Sep 2021 21:59:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20210918195956.GK1053080@scaer>
References: <20210914172420.8824-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914172420.8824-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RESENT][PATCH 1/1] package/debianutils: bump
 version to 5.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Petr, All,

On 2021-09-14 19:24 +0200, Petr Vorel spake thusly:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/debianutils/debianutils.hash | 4 ++--
>  package/debianutils/debianutils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
> index 16a45d4ea1..bbedb6f72f 100644
> --- a/package/debianutils/debianutils.hash
> +++ b/package/debianutils/debianutils.hash
> @@ -1,4 +1,4 @@
> -# From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
> -sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
> +# From https://snapshot.debian.org/archive/debian/20210825T030241Z/pool/main/d/debianutils/debianutils_5.4-3.dsc
> +sha256 611b1268bee9d183886c94e5f34920e4b5b67ff45202aef3f6f2ba8f4a205163 103640 debianutils_5.4.tar.xz

I guess you forgot to fix this before sending:

    package/debianutils/debianutils.hash:2: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)

>  # Locally calculated
>  sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright
> diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
> index d2c41130fb..3dc9ad6e6b 100644
> --- a/package/debianutils/debianutils.mk
> +++ b/package/debianutils/debianutils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DEBIANUTILS_VERSION = 4.11
> +DEBIANUTILS_VERSION = 5.4

    $ make debianutils-source
    [...]
    >>> debianutils 5.4 Downloading
    wget --passive-ftp -nd -t 3 -O '/home/ymorin/dev/buildroot/O/build/.debianutils_5.4.tar.xz.fY4XQF/output' 'http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_5.4.tar.xz'
    URL transformed to HTTPS due to an HSTS policy
    --2021-09-18 21:57:31--
    https://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_5.4.tar.xz
    Resolving snapshot.debian.org (snapshot.debian.org)...  2001:1af8:4020:b030:deb::185, 2001:630:206:4000:1a1a:0:c13e:ca1b, 185.17.185.185, ...
    Connecting to snapshot.debian.org
    (snapshot.debian.org)|2001:1af8:4020:b030:deb::185|:443... connected.
    HTTP request sent, awaiting response... 404 Not Found
    2021-09-18 21:57:31 ERROR 404: Not Found.

Can you look into those and resend, please?

Regards,
Yann E. MORIN.

>  DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
>  DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils
>  DEBIANUTILS_CONF_OPTS = --exec-prefix=/
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
