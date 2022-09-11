Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B04ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 20:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A2583265;
	Sun, 11 Sep 2022 20:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A2583265
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TsbAl_E1qiuL; Sun, 11 Sep 2022 20:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5558A83196;
	Sun, 11 Sep 2022 20:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5558A83196
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71A121BF4E2
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 20:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D00C83196
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 20:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D00C83196
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKURhbzprd0B for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 20:19:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 000DD83143
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 000DD83143
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 20:19:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CCE3E13F87E;
 Sun, 11 Sep 2022 22:18:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 22:18:56 +0200
Date: Sun, 11 Sep 2022 22:18:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220911201856.GK898622@scaer>
References: <20220911195724.3296064-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220911195724.3296064-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662927540;
 bh=S7DP0Xp+fFy6ysJgSTYSNJ3Vlwy0O7kjYYIoSpdyyVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KOAzyCME6mRBwab0IiTURtd3EDC7thBkTFZ4vZNzwf/NfN4FdogYHd3Fs3t8AXkYK
 qF/TeUXt9xie7cO5OMwZtju8UeIp9/k0Ws+XdVJTIyxyIkkjPpwwrWoRdiCOSvbPP/
 Gw3h0zCNtTtH3xX+2q/IHDCkUmiaIbAJjaz7NPOwBaF6nJVydXUCHYKfIjXJVKRM5E
 sccv2Ivq9W8Q2nrR40zBE/pD5Vg8e3s+3qt1z6hC1LoLah3fNQYkXxJ1utEuiwS6vi
 pD7CFveesbIAEM6ZNnt4S+mVptBtPw9a0X4TEUst6jREQHYG4zfO/roQhu2W/BNUgj
 QYh9HIMcVVULw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KOAzyCME
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: fix build failure due to
 missing Linux options
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-09-11 21:57 +0200, Giulio Benetti spake thusly:
> This driver requires CONFIG_CFG80211 and CONFIG_MMC to build so let's add
> them to RTL8189ES_LINUX_CONFIG_FIXUPS.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8189es/rtl8189es.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
> index 51477ccc97..a283852a11 100644
> --- a/package/rtl8189es/rtl8189es.mk
> +++ b/package/rtl8189es/rtl8189es.mk
> @@ -13,5 +13,10 @@ RTL8189ES_MODULE_MAKE_OPTS = \
>  	KVER=$(LINUX_VERSION_PROBED) \
>  	KSRC=$(LINUX_DIR)
>  
> +define RTL8189ES_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)

    Symbol: CFG80211 [=m]
    Type  : tristate
    Defined at net/wireless/Kconfig:20
      Prompt: cfg80211 - wireless configuration API
      Depends on: NET [=y] && WIRELESS [=y] && (RFKILL [=y] || !RFKILL [=y])

So we need NET and WIRELESS (RFKILL is just to avoid it as a module).

WIRELESS depends on !s390, so rtl8189es should also not be available for
BR2_s390x, but that's rthogonal to this change.

> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)

MMC, for a wireless driver? I've loked at the code, and MMC is not
required. It can be used, yes, but it is not required, i.e. the code is
springled with "#ifdef CONFIG_MMC", so it does not look like mandatory
at all.

Regards,
Yann E. MORIN.

> +endef
> +
>  $(eval $(kernel-module))
>  $(eval $(generic-package))
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
