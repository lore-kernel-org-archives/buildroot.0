Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F8DC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030AF60F36
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 030AF60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3FE80EBA;
	Sun, 29 Aug 2021 22:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoOLvKPftd3G; Sun, 29 Aug 2021 22:51:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD5280EBC;
	Sun, 29 Aug 2021 22:50:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9BAC1BF94B
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4A996072E
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gy8wBB6sNaqb for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 22:50:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC3E460600
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 22:50:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87f:483a:a09f:382b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CC53C5FF13;
 Mon, 30 Aug 2021 00:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630277437;
 bh=GRGN/crqT7TjNf8glDbaStDAhZ4C9do3SyQgGonrPuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hn+vjfpZKFWQE4EeBeXcI5PcIeAuA/JGbsf1AQbL4noTyU4TuB7h/6tbmAbhETJhj
 Uvcx5KyvvzXLS4RynXLxcoEfzr0MBcHmA2zjDS5/+HKOK5NCtyRbZ1qkbe3Tu00zBD
 o5RCE66XEDh73MUNtDPChP1RBNHQVdx4vlGAcqG7vIy80PYzp/x7US1l/NT2yVznbq
 CV8OhO362+4SW9IwLeoffSn4rJDENnUg4XqmsFrN/jtxBjM3NsbAdzDtZpM5M3H+6w
 kOuM6ib0L5xssfii0uWlSw/l4DI6aZWAyrF3hYnEo2Qwvs9pgAPAxQZlTRv7Y7Q6TB
 9E9BZdQL9tepA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 Aug 2021 00:50:33 +0200
Date: Mon, 30 Aug 2021 00:50:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210829225033.GF1053080@scaer>
References: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/c-ares: security bump to
 version 1.17.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-28 17:06 +0200, Fabrice Fontaine spake thusly:
> - NodeJS passes NULL for addr and 0 for addrlen to
>   ares_parse_ptr_reply() on systems where malloc(0) returns NULL. This
>   would cause a crash.
> - If ares_getaddrinfo() was terminated by an ares_destroy(), it would
>   cause a crash
> - Crash in sortaddrinfo() if the list size equals 0 due to an unexpected
>   DNS response
> - Expand number of escaped characters in DNS replies as per RFC1035 5.1
>   to prevent spoofing follow-up
> - Perform validation on hostnames to prevent possible XSS due to
>   applications not performing valiation themselves
> 
> https://c-ares.haxx.se/changelog.html#1_17_2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/c-ares/c-ares.hash | 2 +-
>  package/c-ares/c-ares.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
> index 235b7dbc66..28657645df 100644
> --- a/package/c-ares/c-ares.hash
> +++ b/package/c-ares/c-ares.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  d73dd0f6de824afd407ce10750ea081af47eba52b8a6cb307d220131ad93fc40  c-ares-1.17.1.tar.gz
> +sha256  4803c844ce20ce510ef0eb83f8ea41fa24ecaae9d280c468c582d2bb25b3913d  c-ares-1.17.2.tar.gz
>  
>  # Hash for license file
>  sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index 8f200237cf..3a7c6e0298 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -C_ARES_VERSION = 1.17.1
> +C_ARES_VERSION = 1.17.2
>  C_ARES_SITE = http://c-ares.haxx.se/download
>  C_ARES_INSTALL_STAGING = YES
>  C_ARES_CONF_OPTS = --with-random=/dev/urandom
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
