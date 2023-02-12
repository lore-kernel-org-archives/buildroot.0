Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E72C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 09:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81CAC40420;
	Sun, 12 Feb 2023 09:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81CAC40420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7e0_W4lOgM7; Sun, 12 Feb 2023 09:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A8F24040D;
	Sun, 12 Feb 2023 09:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A8F24040D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 894771BF332
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 09:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63A0A41676
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 09:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63A0A41676
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zti09Tq0dc3 for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 09:42:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B095A415E4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B095A415E4
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 09:42:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 654EE5FFA7;
 Sun, 12 Feb 2023 10:42:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 10:42:05 +0100
Date: Sun, 12 Feb 2023 10:42:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230212094205.GK2796@scaer>
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018034605.800593-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676194928;
 bh=GZUoezZqL2PiEjPAbBkc9Ipxs/LkcDKNQ8S2ZAZJpvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rIQ4CiXwQFIzJwp4miqPluTgRh2Abmb6Z0Exm7VD7uaPidwULfl93YGSip0C7yRL1
 7f6h9PfBTVCNl3sQCq/LYAKgypxLVJ1I6+PR+WMn1LD+KaLeMCsADGdX76wa0ABLsR
 Shid45tBrQ9Cs4SZyTcQMFVdcJ41O27KKturFCYtupSq4t2KDA115z6nYR9IF5pz7u
 OD78F/HgyhZf0GuJdH7ZXATv/vHMHMxhHv6MV8tlSOFonGGLb0+3xr4ztSm5ORWef1
 OJ5IZxqGUsuogi3eqR0fDWhmibeenIsV0z3WfFcWX+jLB2up5SbIpgw2JN5wyO436v
 yZ/qo+Buf66dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rIQ4CiXw
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

Thanks again for working on such grunt work, it's much appreaciated!

On 2022-10-17 21:46 -0600, James Hilliard spake thusly:
> These command rely on the clean operations being first so that the
> stamp files being deleted will rebuild the targets.
> 
> The execution ordering of the clean and rebuild operations may
> change, for example if --shuffle=reversed is set.
> 
> To ensure the evaluation order is always correct use double colon
> rules to make the evaluation order explicit as per make docs:
> 
> The double-colon rules for a target are executed in the order they
> appear in the makefile.

I am not convinced that we should switch over to using double-colons.

As I reviewed your other related patch about legal-info [0], the make
manual [1] suggests that double-colons are rally intended for cases
where "the method used to update a target differs depending on which
prerequisite files caused the update" and "double-colon rules really
make sense are those where the order of executing the recipes would not
matter".

So, we'd use a mechanism where order should not matter, to solve an
issue with ordering. That'd be weird...

Yes, the manual states that "double-colon rules for a target are
executed in the order they appear in the makefile", but that really
looks like a side-effect of another goal.

Also, we'd need to carefully review all our Makefile to ensure that
there are no other cases wehre ordering of prerequisites matter. We'd
also have to be careful every time we introduce a new rule and remember
to check whether it depends on the ordering prereauisites or not, adn
worse yet, also whether we can afford the rule to be parallel-safe or
not (see the explanation for that in the legal-info review).

Having colons and double-colons is going to be quite a headache... We
already have issues with remembering that we need to use $$ to expand
variables in some places, and the rules there are relatively clean and
explicit, but for the :: case, I'm afraid that's going to be a bit more
complex.

We currently have a single location where we use double-colon:
    support/kconfig/Makefile.br

which is added by our patch against kconfig:
    support/kconfig/patches/10-br-build-system.patch

which dates back to 2010:
    7c524dd0b683 Clean up our patches against kconfig

which got in three in 2007:
    a665ed34960b - pull kconfig from linux-2.6.21.5

So, I'd like that we get another way to fix that, if possible...

Again, thanks a lot for spending efforts in that area, this is really
great!

[0] https://lore.kernel.org/buildroot/20230212091914.GJ2796@scaer/
[1] https://www.gnu.org/software/make/manual/make.html#Double_002dColon

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/pkg-generic.mk | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f24e03a325..6cb461af90 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1057,17 +1057,20 @@ endif
>  			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
>  			rm -f $$($(2)_TARGET_INSTALL_HOST)
>  
> -$(1)-reinstall:		$(1)-clean-for-reinstall $(1)
> +$(1)-reinstall::		$(1)-clean-for-reinstall
> +$(1)-reinstall::		$(1)
>  
>  $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
>  			rm -f $$($(2)_TARGET_BUILD)
>  
> -$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
> +$(1)-rebuild::		$(1)-clean-for-rebuild
> +$(1)-rebuild::		$(1)
>  
>  $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
>  			rm -f $$($(2)_TARGET_CONFIGURE)
>  
> -$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
> +$(1)-reconfigure::	$(1)-clean-for-reconfigure
> +$(1)-reconfigure::	$(1)
>  
>  # define the PKG variable for all targets, containing the
>  # uppercase package variable prefix
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
