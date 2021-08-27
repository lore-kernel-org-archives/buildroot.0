Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B39C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:58:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B859460EE4
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B859460EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C2E615AC;
	Fri, 27 Aug 2021 20:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euBIIzBzPkuw; Fri, 27 Aug 2021 20:58:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB6E615AE;
	Fri, 27 Aug 2021 20:58:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51BB91BF4D6
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4170383E99
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Ri46Gc5qtUI for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 20:58:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54128834B9
 for <buildroot@busybox.net>; Fri, 27 Aug 2021 20:58:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a574:2179:f8:908b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9ECC6B00515;
 Fri, 27 Aug 2021 22:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630097907;
 bh=1bHEgvktshzP7iE8PPT2XtjjD0bCyqVdXRtNjtq/eXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B6lWdLYKLHr1fw8iqdMWnp+w+pb2LSz4cffDU2hjIlqNUQhvixnuf9HR2OzUpIkkz
 r36cKe954qDvkwKx3Kn4RgmMjxfJ+Pr+RdJbq0uFTQh8sumIZcpOqqTzIIAKxrTlRh
 W9g0+rNUq/Y6Lyy255+C9k3ygbmCwf1Ysk4JJjbqSGGqDvfa5BgsYbJ/JSbBEz7R/R
 9xQBbESj4KjHT0uyZ7mSUApCSsiVJawzmcAOMzERZfj1VP7TFeXlj83Cbd07gUc90q
 GCPlj/9PECYWHkylNmsJwQHP9YL26MI7NyEgW0kbkWOSDihUai7Ou832KVWN4kr9yE
 YjcCTAxIr92Pw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 27 Aug 2021 22:58:18 +0200
Date: Fri, 27 Aug 2021 22:58:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20210827205818.GF2661@scaer>
References: <6b40b32e09ea0bb959413f6b6713198c364f90b7.1630040560.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b40b32e09ea0bb959413f6b6713198c364f90b7.1630040560.git.baruch@tkos.co.il>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/mtd: make ubihealthd independent of
 ubifs
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
Cc: buildroot@busybox.net, Matt Weber <matthew.weber@collins.com>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Baruch, All,

On 2021-08-27 08:02 +0300, Baruch Siach spake thusly:
> Since version 2.1.3 ubihealthd can be enabled without of ubifs-utils.
> 
> This also fixes usability of enabling BR2_PACKAGE_MTD_UBIHEALTHD.
> BR2_PACKAGE_MTD_UBIFS_UTILS is a blind option. The only way to enable it
> is to enable BR2_PACKAGE_MTD_MKFSUBIFS that selects it. ubihealthd
> dependency on BR2_PACKAGE_MTD_UBIFS_UTILS makes enabling it unintuitive.
> 
> Cc: Markus Mayer <mmayer@broadcom.com>
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

I was wondering whether that was material for master or next, but after
a quick build of mtd with just ubihealthd enabled, the build was
successful, so it was good for master, as it fixes a discoverability
issue without an obvious regression.

Regards,
Yann E. MORIN.

> ---
>  package/mtd/Config.in | 1 -
>  package/mtd/mtd.mk    | 6 ++++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index 57ad01971d5f..d0ca3ba6631d 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -146,7 +146,6 @@ config BR2_PACKAGE_MTD_UBIFORMAT
>  config BR2_PACKAGE_MTD_UBIHEALTHD
>  	bool "ubihealthd"
>  	default y
> -	depends on BR2_PACKAGE_MTD_UBIFS_UTILS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
>  
>  config BR2_PACKAGE_MTD_UBIMKVOL
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index a37594b16419..6385b9ee0a2c 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -40,6 +40,12 @@ else
>  MTD_CONF_OPTS += --without-ubifs
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MTD_UBIHEALTHD),y)
> +MTD_CONF_OPTS += --enable-ubihealthd
> +else
> +MTD_CONF_OPTS += --disable-ubihealthd
> +endif
> +
>  ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
>  MTD_CONF_OPTS += --enable-tests --enable-install-tests
>  else
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
