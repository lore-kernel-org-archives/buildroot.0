Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2A9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 05:49:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA96960F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 05:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA96960F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 749F14016F;
	Tue,  3 Aug 2021 05:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsNRzmreuw88; Tue,  3 Aug 2021 05:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73F0C401CB;
	Tue,  3 Aug 2021 05:48:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B60E1BF363
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 05:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77EE040287
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 05:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IeOK2gjZwbBi for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 05:48:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C04440258
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 05:48:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f475:5bfa:f4b3:5a3a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B779B5FF27;
 Tue,  3 Aug 2021 07:48:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627969731;
 bh=tsn45h4x4xTY5eClLY+xZDT14mEOGfZIpm7lyMXYAlg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fnBo6jgGSj5n8q1doPkI6LaG8MvViJV6SDagfT2gtLIk4uxqlmMf8Aqf1OmE9vo8h
 Jzb6TCVpJ/CS2UzrGsksmdVwi3YD1c9CLjNcG3DkP0EqDB8f+TIQpwUo5Z1fVM01+h
 DHK4tS+FGt77iZ747XnXyeOwjjQ/VpKBuq594sgPoT7Hq9r6ONnUBDBeQgSOQa7xNd
 s7t48Ud5NN/q5+4Q3UkL9FJ/oXrP5OziSU/vneAllGqVimw8JZHWyoJBygLkb9Dw4z
 lCJ516d1SjDOBGZCfR+MFiM8QkaxXDDH/KZd6ZWfRIOJW+RRmvHxzhKiS4/pT76M2a
 0+8HPiLRQS0kQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Aug 2021 07:48:42 +0200
Date: Tue, 3 Aug 2021 07:48:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210803054842.GF27036@scaer>
References: <20210802162244.620782-1-arnout@mind.be>
 <20210802162244.620782-2-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802162244.620782-2-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC 2/2] docs/manual/migrating.txt: add
 "individual packages" section
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
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All,

On 2021-08-02 18:22 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Add a section to the migrating documentation to explain what changed in
> individual packages and how it may affect your build.
> 
> This section is organised per package, not per Buildroot release,
> because in general it's easier to check package per package if anything
> changed than to check release per release for all your packages.
> 
> The idea is that every time a package is changed in a way that is not
> immediately obvious (mainly: affects runtime but not build time), it is
> mentioned in this section. This may include:
> 
> - a new version of the package got a new name due to API
>   incompatibilities;
> - the default behaviour or config optoins of the package changed;
> - the Buildroot integration (e.g. configuration file, init script) of
>   the package changed;
> - what is installed by the package is changed (e.g. executable is
>   renamed or removed).

No. Please, no.

We already have two locations were changes in packages are identified:

  - git commit logs, the authoritative reference,

  - the CHANGES files

I do not want to have to maintain yet a third, ever-growing and
never-trimmed list. Also, we will always have to bikeshed whther such a
change is disruptive enough or not to warrant being on that list...

Instead, I would just suggest that people run "git log --oneline" or
"git log -p --stat" on the packages they are interested in.

And of course, that means we *need* well-written commit logs (but we're
already pretty good I believe).

Having a section about the core internals, like the br2-defconfig stuff
that is not obvious, or about the RPATH of host packages, is acceptable,
because it is not easily discoverable.

Regards,
Yann E. MORIN.

> To start with, add the recent changes of the installation defaults of
> bluez5_utils.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  docs/manual/migrating.txt | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
> index 9fd7d7e676..36e4aa4724 100644
> --- a/docs/manual/migrating.txt
> +++ b/docs/manual/migrating.txt
> @@ -22,8 +22,8 @@ To migrate from an older Buildroot version, take the following steps.
>    the existing +.config+.
>  . If anything is enabled in the Legacy menu, check its help text,
>    unselect it, and save the configuration.
> -. Review the CHANGES file to see if any of your packages and features
> -  are affected by the changes.
> +. Review the individual packages section below to see if any of your
> +  packages are affected by the changes.
>  . Build in the new Buildroot environment.
>  . Fix build issues in external packages (usually due to updated
>    dependencies).
> @@ -36,6 +36,17 @@ To migrate from an older Buildroot version, take the following steps.
>  . Run +make savedefconfig+ and verify that what is selected really is
>    what you intended to enable.
>  
> +[[migrating-packages]]
> +=== Individual packages
> +
> +This section describes changes to individual packages. For all packages
> +that are built in your configuration, check below if changes are needed.
> +
> +==== bluez5_utils
> +
> +Since 2021.08, the tools and all plugins are optional and default off.
> +Make sure to enable the plugins you require.
> +
>  [[br2-external-converting]]
>  === Migrating to 2016.11
>  
> -- 
> 2.31.1
> 

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
