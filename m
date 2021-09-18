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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B33C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:12:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302F4610F7
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 302F4610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 014BC83F59;
	Sat, 18 Sep 2021 21:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLmAgrCN1ZMd; Sat, 18 Sep 2021 21:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BAD83F4D;
	Sat, 18 Sep 2021 21:12:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1C061BF842
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFDE840135
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCpIXzXQs5Zb for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 21:12:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD09C40018
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 21:12:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F0A0EB0051E;
 Sat, 18 Sep 2021 23:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631999573;
 bh=66/eZ6UvxrehOUG4CtJStRZZFHnWGT8yQOA0ifILcwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NmldRWAFZT6znBP8xwjR+z2vX8Kgd1lXtFaqnRSdgJVsm+YnZFhJdsB9TZt3dS4Gv
 I1zSYQvc9IAEYwqmthBRp5KLeD9VOkn8UX1dQYFfU+eN3n54b+51AoJzvxGfjwyoqs
 CE8NUeBYoLGq/v2auLpxCCA81pGEbb1NQkQ/9Km6k7D80GXJp7GMiM8clbgLMhl/xZ
 Y9i9+Cq+cLryy8GjxYyzHh5befgZdv6xYVgZPko+MjGDIwTXGsR1Qcf1JCOGao24HQ
 96QjHwwSQE4O9lnDRlGmvdOAnExFu85TCMs/if5l0oe2almT94LaQwSzR+8uh8kdki
 GpGBPmR63x/mw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 23:12:46 +0200
Date: Sat, 18 Sep 2021 23:12:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>
Message-ID: <20210918211246.GC1053080@scaer>
References: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210913142652.942533-1-martin.elshuber@theobroma-systems.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/strongswan: fix broken
 dependency relation
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Martin, All,

On 2021-09-13 16:26 +0200, Martin Elshuber spake thusly:
> The AKA backend for 3GPP2 requires libgmp (see
> https://wiki.strongswan.org/projects/strongswan/wiki/Autoconf). Since
> the AKA backend for 3GPP2 is included by BR2_PACKAGE_STRONGSWAN_EAP,
> when selecting a crypto backend different from
> BR2_PACKAGE_STRONGSWAN_GMP, there is no guarantee the gmp package is
> selected as well. When doing so, make fails since the package is in the
> dependency chain but not selected:
> 
>   $ make
>   Makefile:585: *** gmp is in the dependency chain of strongswan that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
>   make: *** [Makefile:23: _all] Error 2
> 
> To fix this, select BR2_PACKAGE_GMP when selecting BR2_PACKAGE_STRONGSWAN_EAP.
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>

Applied to master, thanks.

I was a bit confused as to what would happen if both gmp and other
crypto backend were used to gether, but there are explicitl options to
select each of them at ./configure time, so it seems it should be OK, I
guess...

Regards,
Yann E. MORIN.

> ---
>  package/strongswan/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 47c7107f59..368cd1ecc0 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -75,6 +75,7 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
>  
>  config BR2_PACKAGE_STRONGSWAN_EAP
>  	bool "Enable EAP protocols"
> +	select BR2_PACKAGE_GMP
>  	help
>  	  Enable various EAP protocols:
>  	    - mschapv2
> -- 
> 2.30.2
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
