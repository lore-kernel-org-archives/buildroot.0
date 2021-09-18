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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BBAC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9734F610A3
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9734F610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 678F960604;
	Sat, 18 Sep 2021 20:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1Eqloq_5J-f; Sat, 18 Sep 2021 20:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C257E605F5;
	Sat, 18 Sep 2021 20:08:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9B21BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 485FE83FAB
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6MjEWrex8Ha for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:08:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59FD783F8C
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:08:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C2A3FB00535;
 Sat, 18 Sep 2021 22:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631995733;
 bh=+TfpRRZdrbtNtle3HCdHGT3LQ+gtqo8J8nzWhk4MGEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IrHSGygRCfejcp7SDZ3KgijNDeE3YYPLjF/ZwuGRw46qX+qwLgK5Wn9BH4eSRxXvQ
 6VKg+bfl0kjLfmeWpldABYTaqF10/QiTvJEW3RKl7Q1ZNSGMlHU8TJNilBmn7EmoIx
 Rvcf5VEId+PAB4iuG6VbG0zRStmSaevFATEr6ptxJpMuqC4feScrVgSh90HBv/J4uC
 a+Z4XPAeNhyDrZ+PDns33Fpha0MGgAmHIxF+exU6g/lIc7P4BWVSeTOXHKmQmoGmpP
 358LLzPciXzM7XLfYOL+3Z32tVPh8XhxorLNLFyz7gGManbP6IcscRz66S47MAUJXF
 r/vtswG9Dx6Xg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:08:49 +0200
Date: Sat, 18 Sep 2021 22:08:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20210918200849.GL1053080@scaer>
References: <20210914135059.87663-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914135059.87663-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/botan: fix boost dependency
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

Michael, All,

On 2021-09-14 15:50 +0200, Michael Nosthoff via buildroot spake thusly:
> only build --with-boost when both required modules (filesystem and system) are
> also selected.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4fbf2a63f9ddfbc540ce7dabd10964b311477c06
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/botan/botan.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index c23aba99dd..2d4d11bd71 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -50,7 +50,7 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>  BOTAN_CONF_OPTS += --without-os-feature=getauxval
>  endif
>  
> -ifeq ($(BR2_PACKAGE_BOOST),y)
> +ifeq ($(BR2_PACKAGE_BOOST_FILESYSTEM)$(BR2_PACKAGE_BOOST_SYSTEM),yy)
>  BOTAN_DEPENDENCIES += boost
>  BOTAN_CONF_OPTS += --with-boost
>  endif
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
