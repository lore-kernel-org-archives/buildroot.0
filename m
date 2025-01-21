Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95EEC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 18:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80A11417E6;
	Tue, 21 Jan 2025 18:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbQ4WFXB-KNv; Tue, 21 Jan 2025 18:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A281417E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A281417E8;
	Tue, 21 Jan 2025 18:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4489C1
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 18:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A7C61086
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 18:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HvKOkTgAMmf for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 18:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 669BD61096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 669BD61096
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 669BD61096
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 18:10:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB607E0002;
 Tue, 21 Jan 2025 18:10:45 +0000 (UTC)
Date: Tue, 21 Jan 2025 19:10:44 +0100
To: yann.morin@orange.com
Cc: <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20250121191044.36864ead@booty>
In-Reply-To: <Z4/IZbYmCGQLMG4m@yd-6wlzhs3>
References: <2d128a40f7b030365fcc63e13dbd48a641d912aa.1737456332.git.yann.morin@orange.com>
 <20250121165545.0acdc63a@booty> <Z4/IZbYmCGQLMG4m@yd-6wlzhs3>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737483046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o52sj0ua7ECUa+ro2pFNX0C0fDEKqX0DI4PLn+57kcI=;
 b=F615rwGKMZB2ksIZavVJQQa+73bSRP6YWcaK99w7lPJi6FTlIrl76pcxav9uhpXsOc+oZ/
 apTUovzUtphYG9vPwbjLr8KCGmEmEfV0pPbvwrm6aWtZeiP4fwetElsa/h84MbVXagKVBR
 /IRxd1bJ/TUtaTiuOiTn5Br3rG+3aSSUO7/NLPEdHQezjHl9gnazQ0/PHxF7CEA/dgRAAO
 Dpc28b2Esb//yoQFEfEhxSQKzc6C+W/FZTtGHGChQT22jBPCzLFtUKg8uxZM0NEaP4nof1
 LwAmV7zx08/ejYgnpahdis79ccic1AaTX0sVtBy94qtRviepmHwUxAUPTzkHbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F615rwGK
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: store reall version in
 legal manifest
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Tue, 21 Jan 2025 17:16:37 +0100
yann.morin@orange.com wrote:

> Luca, Al,
> 
> On 2025-01-21 16:55 +0100, Luca Ceresoli spake thusly:
> > On Tue, 21 Jan 2025 11:45:32 +0100
> > <yann.morin@orange.com> wrote:  
> [--SNIP--]
> > > Change the legal manifest to include the actual, original value as
> > > was set in the .mk file.  
>  [--SNIP--]
> > Subject line: reall -> real.  
> 
> :-)
> 
> > It would be nice to shot an actual example in the commit message. I did
> > a very quick search and couldn't find any package where the problem
> > happens.  
> 
> There is no package in the Buildroot tree that is affected, when the
> version string is a constant. There are a few packages (linux, uboot...)
> where the user can specify a custom version from a custom git tree, and
> those could contain a colon or a slash, even a space (but let's be
> honest, that space would break so many other things everywhere!).
> 
> Also, packages from br2-external trees may have versions with any such
> character. For example, I'm looking at Apache ant, where the tags are
> something like "rel/1.10.15" for example:
>     https://github.com/apache/ant/tags
> 
> Finally, private packages (used from a br2-external tree) may have such
> tags as well..

Sure, make sense. If it were me, I'd add an example with one of those
packages for which one can specify the version in a configuration
setting, like U-Boot or Linux, in case you send a v2.

> [--SNIP--]
> > > -	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
> > > +	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_DL_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
> > >  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> > >  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))  
> > Not strictly specific about your patch, but IMO reusing the _DL_VERSION
> > variable makes code less readable. The _DL_VERSION name suggests it is
> > for downloading, right? What about renaming it to e.g. _ORIG_VERSION,
> > and then using _ORIG_VERSION for both the download, the legal manifest,
> > pkg-stats and whatever use is currently made of _DL_VERSION?  
> 
> Vast subject. I'm not going to revisit that; my non-work alter-ego
> previously tried, and that was not easy *at all*; talk to the people
> who were in Vienna if you want a bit of details (one point is that
> some packages may already make use of _DL_VERSION, especially in
> br2-external trees, so we want to keep that as well, but I can't
> remember the key problem I stumbled uppon, just that I went "Ouch,
> burnt! No touching!").

I hereby forget about having suggest such an improvement. O:-)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
