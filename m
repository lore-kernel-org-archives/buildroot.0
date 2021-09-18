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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC9AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:37:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0410A610CB
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0410A610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D67F6415EF;
	Sat, 18 Sep 2021 20:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDDnrsfW2j-i; Sat, 18 Sep 2021 20:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B646415CB;
	Sat, 18 Sep 2021 20:37:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC2971BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA2C340162
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ghtc6eLyAor for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:37:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC40940018
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:37:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 14134B004EC;
 Sat, 18 Sep 2021 22:37:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631997460;
 bh=ZJF/Mk22FQz8jq88ONmoGHhXmvJcbZ1KGlwKEU8/UHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NYkkl/AIjLPX7YPTwA9p7sFbn7WHu2A6NEeidm8/QiK/X85pySksj6WAmFY2SoqdM
 uDTkBhT7BrqCdUuLtYQiAR61mcPaj4zRpacMk6mBOnbLibaPLeIipzgNv4427xph9x
 P3xf64SZPi0Lpwlp1sX/3Rk+YIfczR4qKUMnviUQ1Os+YD3/4nJ5jyFiT0gRJi/VR8
 OAt5BgbXK4QS+CABH4HRjIvNvqNG6x0Dg50mN75U+un5KMwXFrif981K871w0w8uRS
 IwZaVsTwmyls1JK61Y8DZXp502spMmE+4eUIKOj4QXS+oPCdrr9SWmSUaeoG43z9Ik
 EO0rHXsACBPYQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:37:33 +0200
Date: Sat, 18 Sep 2021 22:37:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210918203733.GW1053080@scaer>
References: <20210918203437.6948-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918203437.6948-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/libxkbcommon: change
 homepage/download url to https
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-18 22:34 +0200, Peter Seiderer spake thusly:
> - change homepage url to https (and remove trailing slash)
> - change download url to https
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libxkbcommon/Config.in       | 2 +-
>  package/libxkbcommon/libxkbcommon.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
> index 4da12897f2..4e73a24abb 100644
> --- a/package/libxkbcommon/Config.in
> +++ b/package/libxkbcommon/Config.in
> @@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBXKBCOMMON
>  	  processes a reduced subset of keymaps as defined by the XKB
>  	  specification.
>  
> -	  http://xkbcommon.org/
> +	  https://xkbcommon.org
> diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
> index 790083614f..ee2bc1ee99 100644
> --- a/package/libxkbcommon/libxkbcommon.mk
> +++ b/package/libxkbcommon/libxkbcommon.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBXKBCOMMON_VERSION = 1.3.1
> -LIBXKBCOMMON_SITE = http://xkbcommon.org/download
> +LIBXKBCOMMON_SITE = https://xkbcommon.org/download
>  LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
>  LIBXKBCOMMON_LICENSE = MIT/X11
>  LIBXKBCOMMON_LICENSE_FILES = LICENSE
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
