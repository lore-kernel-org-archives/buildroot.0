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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127D0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:34:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C75CC60F51
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C75CC60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A33BF60622;
	Sat, 18 Sep 2021 20:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WD4VrgbUDWkQ; Sat, 18 Sep 2021 20:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1E6F60657;
	Sat, 18 Sep 2021 20:34:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1B21BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 979B6819D5
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQRR6w1vca4m for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:34:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FFEB80F80
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:34:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0A1D5B00535;
 Sat, 18 Sep 2021 22:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631997276;
 bh=gsGJjB6MmvQ1rv2aP9X0OARp4Dzo1jZfcZOKQ57oJEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f4jDOTcyty6hLOKS0cY59D0XxHdmPxV6Ab4tww8yhWTqgNG+/6zCXEQ5rckDGfdGk
 dp/XfM3v1nAoJyoMHqtU9dbo6GIm9x9gIC4V79o/0cP2Td2i/qi2YEMaXtfjZK7kRN
 1vJnxAcyFnkzEUGXHTQap8ZKDhWc0+dyhNWs/bcE+I6ssz5jPwG/t1uG/ey00x3aa6
 wVt68D8c4AEDhxxbbWBG4r9SCobIc43bJ/KfguNFSFhulPIOY03SaW5twa0vmDJkCI
 erIUiXm5ePMhZAmENf7455/H4PA9hdSO8WbBE9hUvZ3Yk7aZM7yD82dWb5KEZKNyLh
 y2utdj54eS6rg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:34:29 +0200
Date: Sat, 18 Sep 2021 22:34:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210918203429.GT1053080@scaer>
References: <20210912195333.2718045-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912195333.2718045-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot: drop host-gettext
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-12 21:53 +0200, Fabrice Fontaine spake thusly:
> AM_ICONV is not needed since drop of autoreconf in commit
> 03fbb81b8bab7bad135b59267533be7688babe39
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dovecot/dovecot.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
> index cd637f19a1..733917b062 100644
> --- a/package/dovecot/dovecot.mk
> +++ b/package/dovecot/dovecot.mk
> @@ -16,8 +16,6 @@ DOVECOT_DEPENDENCIES = \
>  	host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>  	openssl
> -# add host-gettext for AM_ICONV macro
> -DOVECOT_DEPENDENCIES += host-gettext
>  
>  # CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
>  # is part of the Red Hat packaging and not part of upstream dovecot
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
