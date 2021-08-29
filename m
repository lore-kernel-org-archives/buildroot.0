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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A843CC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:51:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE1E60F4C
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FE1E60F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AEE8606BE;
	Sun, 29 Aug 2021 22:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-VuBJZSLD1i; Sun, 29 Aug 2021 22:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5834360708;
	Sun, 29 Aug 2021 22:51:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C41561BF962
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B42C580ED2
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bz78YTQ6m9C8 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 22:51:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B15D80ED1
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 22:51:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87f:483a:a09f:382b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E195D5FF20;
 Mon, 30 Aug 2021 00:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630277478;
 bh=IEeyx95mWF6Q/zSnep+p+4nzdERAyv0qys9aW0XyCf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WqHTkt6tMI5MUmShORHepi1Hkkww3XeelpzGsxMHjoxS97/t0LQg0irI1J4AWXwI7
 N0ShJDvXRojofmlujc/Y7qYKJbU3alQuTHoT336DysBCIsBm2btniMOZ7nDG2gxwOl
 MRudd+aiMcQsbqeu8jZts/ois+A9RInn4LqXHNAVcOYzwMjqO8j0Dn3fFKGH+EmuUn
 WQ9nNw+58uoTm0EF/hMndfYy4EJbVK7zn7Fc3ioXNKEZQut/S0490vYgY7trbimlFN
 fWSW5VS9uDOMeMUGgnFLobLQpzm1/N0SMRe7Y9orWBh7xfn334nVn2vz/eWoi34Drz
 eqvaQRX+3vJDQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 Aug 2021 00:51:13 +0200
Date: Mon, 30 Aug 2021 00:51:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210829225113.GH1053080@scaer>
References: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
 <20210828150604.946236-3-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828150604.946236-3-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] package/c-ares: add C_ARES_CPE_ID_VENDOR
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
> cpe:2.3:a:c-ares_project:c-ares is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ac-ares_project%3Ac-ares
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/c-ares/c-ares.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index 761aa73280..71bfa110a1 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -10,6 +10,7 @@ C_ARES_INSTALL_STAGING = YES
>  C_ARES_CONF_OPTS = --with-random=/dev/urandom
>  C_ARES_LICENSE = MIT
>  C_ARES_LICENSE_FILES = LICENSE.md
> +C_ARES_CPE_ID_VENDOR = c-ares_project
>  # We're patching configure.ac
>  C_ARES_AUTORECONF = YES
>  
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
