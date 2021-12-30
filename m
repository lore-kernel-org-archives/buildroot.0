Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20F2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B840B60D50;
	Thu, 30 Dec 2021 20:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbhmOkWVXWhA; Thu, 30 Dec 2021 20:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12AF360BCB;
	Thu, 30 Dec 2021 20:43:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3A841BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A370D409B1
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3RFLdaMF43D for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:43:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CF96403ED
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:43:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8B87B6000A;
 Thu, 30 Dec 2021 20:43:20 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:43:19 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211230214319.2c2fe3ec@windsurf>
In-Reply-To: <659c748d4a2913f6bc9ea8cb5e2693fac0bf0542.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <659c748d4a2913f6bc9ea8cb5e2693fac0bf0542.1636810092.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 04/16 v2] package/infras: do not
 conditionally set empty variables
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Nov 2021 14:28:15 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Setting an unset variable to an empty value is useless in make; an unset
> variable just expands to an empty string anyway. So what we do currently
> has no side effect:
> 
>     variable set and not empty   -> variable not modified
>     variable set and empty       -> variable not modified
>     variable unset               -> set to an empty string
> 
> However, additional variables do have an impact on the parsing time of
> the Makefiles, and the more variables, the more collisions in the hash
> table used internally by make, which slows down the parsing.
> 
> By dropping those conditionally-set-empty variables, we gain about 3%:
> 
>     Run     Before  After
>     1       5.572   5.325
>     2       5.434   5.354
>     3       5.490   5.320
>     4       5.525   5.330
>     5       5.476   5.330
>     6       5.511   5.434
>     7       5.498   5.388
>     8       5.524   5.371
>     9       5.479   5.346
>     10      5.637   5.324
>     Mean:   5.515   5.352
> 
> Yeah, 0.163s does not look like much, and this does not make
> autocompletion any more usable. Still, that 3% gain is not to be
> ashamed of either.
> 
> Note that there are 3 others case where we do set empty variables, but
> those are unconditional and serve other purposes:
> 
>   - pkg-virtual: this is done on purpose to avoid a bug when the
>     environment may have TOOLCHAIN_VERSION or _SOURCE set, and we really
>     want those to be empty, so the assignment is not conditional;
> 
>   - pkg-python: the reason for setting those to empty is dubious at
>     best; it's been there since the inception of the python infra, back
>     in 2013; still, the case is different than this patch addresses;
> 
>   - pkg-toolchain-external: this is the case for a toolchain already
>     installed, so indeed we want to set _SOURCE and _VERSION to empty.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-autotools.mk |  4 ----
>  package/pkg-cmake.mk     |  4 ----
>  package/pkg-generic.mk   | 27 ---------------------------
>  package/pkg-kconfig.mk   |  3 ---
>  package/pkg-meson.mk     |  4 ----
>  package/pkg-python.mk    |  4 ----
>  package/pkg-qmake.mk     |  4 ----
>  package/pkg-waf.mk       |  5 -----
>  8 files changed, 55 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
