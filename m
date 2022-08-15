Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB65DC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 18:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 552646058C;
	Mon, 15 Aug 2022 18:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552646058C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKOPfRwlNhga; Mon, 15 Aug 2022 18:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7480E60592;
	Mon, 15 Aug 2022 18:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7480E60592
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47E991BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 18:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21D0840359
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 18:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21D0840359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LG2LqNMY7oTe for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 18:03:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC6D940358
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC6D940358
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 18:03:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E96A36012A;
 Mon, 15 Aug 2022 20:03:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 20:03:11 +0200
Date: Mon, 15 Aug 2022 20:03:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dimi Tomov <dimi@tpm.dev>
Message-ID: <20220815180311.GD2854108@scaer>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
 <20220814233845.2247022-16-ricardo.martincoski@gmail.com>
 <8e524c0dd15e9f344bdf10cedea33548@tpm.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e524c0dd15e9f344bdf10cedea33548@tpm.dev>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660586595;
 bh=LTTWYz/uJIbozJI5s1s1N5Sbl11dZ3BOGt7uw/1/KNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HfB0XGgV5z945RRL2LlZPlTgz8ZR3OkBGd2crSBSTNSaiImkLCX9FIRrLgYK9fTaf
 jj+s/AAjOJpfDiMFibbfy3W3cddiEUotu121J4XmBfoVWSwQoEJK7kPJWBPcTQzTTF
 Yrd/0uzS1RXVoBNo2f/wr/aaxGx3oVDkuxqbAd2tRdSktwdyFFsfN20SJuRiOqLwwk
 m4DoV8pqadB+NFwx2t4DIEe63BrFwtsZX7//MICr7injb0pyEVjoUpYJccqRmSOZyV
 Ziq9I+jhpj+vmy3VLwNKnzM9jnMUNCjtU2uNQRz3DP/tOsSeFgN2JdYkrfxzntKuYn
 xMEKuqQvNchAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HfB0XGgV
Subject: Re: [Buildroot] [PATCH 15/33] package/wolftpm: fix typo on
 BR2_PACKAGE_WOLFTPM_NUVOTON
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dimi, Al,,

On 2022-08-15 20:46 +0300, Dimi Tomov spake thusly:
> This is intended and not a typo.
> 
> If you rename BR2_PACKAGE_WOLFTPM_NUVOTON to ... NPCT750 it would not match
> the actual wolfTPM options that is "--enable-nuvoton".

I am afraid you got it wrong. The option is still named
BR2_PACKAGE_WOLFTPM_NUVOTON.

However, in the .mk, it was referenced as BR2_PACKAGE_WOLFTPM_NPCT750
which does not exist and is not defined anywhere.

So, all the patch does is use the correct option from Kconfig:

> >-ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
> >+ifeq ($(BR2_PACKAGE_WOLFTPM_NUVOTON),y)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
