Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CF5C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:10:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF7F960E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF7F960E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD82382A83;
	Sat, 24 Jul 2021 20:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDAeBXJOMuBR; Sat, 24 Jul 2021 20:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D018299E;
	Sat, 24 Jul 2021 20:10:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABF7D1BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AAAE40374
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckwRsiV9aPIQ for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:10:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E1094028A
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:10:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 870B4780333;
 Sat, 24 Jul 2021 22:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627157430;
 bh=7X9/l3Zyj8wBcqSATVC073t5YfMFbPDpVTQatNl29CE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sewjgy2IY3rbn0PLcBPNmllAlaHd87QID+1lfy71EI5RcO7Jk+pCWcDYzSkntiwe8
 n6HMKVWS2BOq3pHT7VFma9meCQ7ou7+JIKdOTN4YoQu317JPX6RmjDLxz9sgJX65Z3
 8DnDbVmydlG07D5jXfZ6Ke4+RLharroawXvbB/SU7lG34XJBu+wvX+Uco7OK2PEXPh
 TYymirTqWsUxM0uou6PzWshA+gjpbLrgb5M78vse9iM4b5oYWuteKV7yCTa+p56L4A
 j90EqwF2iBcSMA6Tz4pJvHEvhTiPRH5EhZD6J1QlKiXN1kOd1lo1UhaImba1sjMfQJ
 RgdBM/FdpCPOg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jul 2021 22:10:24 +0200
Date: Sat, 24 Jul 2021 22:10:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210724201024.GF2382418@scaer>
References: <20210724122122.634455-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210724122122.634455-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/mono: needs host-python3
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-07-24 14:21 +0200, Fabrice Fontaine spake thusly:
> host-python3 is needed to avoid the following build failure since bump
> to version 6.12.0.90 in commit 4be06fa8aa054e59d97866dc5568f4e10762e353
> and
> https://github.com/mono/mono/commit/0f47ea5d8088ede472650da47bf58e5a0e063ad4:
> 
> checking for a Python interpreter with version >= 3.2... none
> configure: error: no suitable Python interpreter found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6a185e69fe8e123ba26c26b69091d001656693c7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mono/mono.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> index df3481a498..27f7886224 100644
> --- a/package/mono/mono.mk
> +++ b/package/mono/mono.mk
> @@ -53,7 +53,7 @@ HOST_MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-libraries
>  # ensure monolite is used
>  HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false
>  
> -HOST_MONO_DEPENDENCIES = host-monolite host-gettext
> +HOST_MONO_DEPENDENCIES = host-monolite host-gettext host-python3
>  
>  define HOST_MONO_SETUP_MONOLITE
>  	rm -rf $(@D)/mcs/class/lib/monolite
> -- 
> 2.30.2
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
