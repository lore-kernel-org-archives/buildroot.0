Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968B4C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F71681E8A;
	Tue,  7 Feb 2023 17:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F71681E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FvimEIniW8QK; Tue,  7 Feb 2023 17:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D35E81E2D;
	Tue,  7 Feb 2023 17:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D35E81E2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23D7F1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A7544085D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A7544085D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEChPrE5DTnZ for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:23:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C0E40342
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6C0E40342
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:23:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51E9560F6F;
 Tue,  7 Feb 2023 17:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AB6C4339B;
 Tue,  7 Feb 2023 17:23:51 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4894314a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 7 Feb 2023 17:23:48 +0000 (UTC)
Date: Tue, 7 Feb 2023 18:23:45 +0100
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Y+KJIYsO+RuI7Qp2@zx2c4.com>
References: <20220420170326.1901572-1-Jason@zx2c4.com>
 <f365639e-6baf-a8f9-5e89-4d02de2843ed@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f365639e-6baf-a8f9-5e89-4d02de2843ed@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zx2c4.com; s=20210105; t=1675790628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3RnhHjZc0Tu0xvzM+v6rb5zdi+FMBU23zZDtT1RdCyU=;
 b=YhQufJ6F5xjzXt4xCcvi6smB3cR/9kODqKooXMoVJEDBf0XjoGt4W+30m7LUOrZu9SsDoa
 ykdsRAVekPNagMKqEEdHL2K1gQc9/G6SAR+9HsYzDe4jpUhTpwCqCFEyOCItFsPu7K1ahy
 Ty960OdWXflgR3eQXa0FDxtQm9HJILI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.a=rsa-sha256 header.s=20210105 header.b=YhQufJ6F
X-Mailman-Original-Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="YhQufJ6F"
Subject: Re: [Buildroot] [PATCH v5] package/urandom-scripts: actually credit
 seed files via seedrng
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
From: "Jason A. Donenfeld via buildroot" <buildroot@buildroot.org>
Reply-To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Michael Fischer <mf@go-sys.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Feb 07, 2023 at 04:06:16PM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 20/04/2022 19:03, Jason A. Donenfeld wrote:
> > The RNG can't actually be seeded from a shell script, due to the
> > reliance on ioctls. For this reason, Busybox now contains SeedRNG, a
> > tiny program meant to be called at startup and shutdown (and at
> > arbitrary other points in between if desired).
> > 
> > Since this is currently in Busybox's git tree, this commit adds it as a
> > patch to the Busybox package. Then, it wires the init script up to call
> > it.
> > 
> > This is a significant improvement over the current init script, which
> > doesn't credit entropy and whose hashing in shell scripts is sort of
> > fragile.
> > 
> > NOTE NOTE NOTE: While I've added the patch to the Busybox package
> > directory, I don't really know how to wire this up and what to do about
> > the various config entries. I was hoping that a Buildroot maintainer
> > might have a better idea of the best way to do this, and could just take
> > this patch as a starting point for whatever the real commit winds up
> > being.
> > 
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
>   Applied to master, after some reworking and heavily rewriting the commit 
> message, thanks.
> 
>      package/urandom-scripts: actually credit seed files via seedrng
> 
>      The RNG can't actually be seeded from a shell script, due to the
>      reliance on ioctls. For this reason, Busybox 1.36.0 contains SeedRNG, a
>      tiny program meant to be called at startup and shutdown (and at
>      arbitrary other points in between if desired). Note that initially,
>      the way seedrng was included in busybox broke things quite severely, but
>      now it's been reverted to a reasonably acceptable version.
> 
>      This is a significant improvement over the current init script, which
>      doesn't credit entropy and whose hashing in shell scripts is sort of
>      fragile.
> 
>      Because seedrng is part of busybox, urandom-scripts now depends on
>      BR2_PACKAGE_BUSYBOX. This can be removed again if later we add a
>      standalone seedrng package.
> 
>      Add a decent explanation to the init script about the need for a
>      persistent directory to make this actually work.
> 
>      Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>      [Arnout:
>       - Remove busybox patch, it's now part of busybox 1.36.0.
>       - Depend on busybox.
>       - Fix shellcheck errors.
>       - Use DAEMON and SEEDRNG_ARGS.
>       - Don't bother with "seed_dir" and "skip_credit" variables.
>       - Rename to S20seedrng.
>      ]
>      Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Looks good. Thank you very much for following up and bringing this
across the finish line!

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
