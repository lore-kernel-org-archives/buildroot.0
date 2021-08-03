Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799A6C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:24:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F0660F48
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36F0660F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15BD48440E;
	Wed,  4 Aug 2021 01:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FgkF0BL0p6aa; Wed,  4 Aug 2021 01:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B05184423;
	Wed,  4 Aug 2021 01:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2436E1BF3E1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 23:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11ECA42286
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 23:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EU4H5ECNFCil for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 23:51:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C25704227C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 23:51:38 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id o185so776581oih.13
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 16:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yk4orSKXWA30tIJnAt2prQlBMQ766pwlD0U84T7fo/o=;
 b=GkH1Bkj1kkR5DmgoEfCa6WbZlucFSFG8UA5mkcTfF2W6CVZaa1dqG55vQ7FDSPJaJE
 2q9zFhfSztkibcpsULwEIR6P0l/1jXL+AEBJO5i6hV71nttfqHzjE3rzTFLml/68myqU
 YJxXbZJzBufjDx+/lRr11b7zHm+r53El0ANRlwiWPe48g99boWzuzcUUBaaC0aOc6AZn
 UzmnuXeFD1Yb8qxd/Gw2BgswBRBIdGSTTIpEEUaT5KyW82P4KUgH8QLDFbdoyazJBg3Y
 7iO+j8rylKrkjQWKWbJAuJPZCvVIdHhLfggRBYyAr58cC4wq/N+dPbidSfJsak4ni9VD
 hN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yk4orSKXWA30tIJnAt2prQlBMQ766pwlD0U84T7fo/o=;
 b=hCjmd04Zvgk4ZN4uzaCt9678YzCSxEfpcGDE8SABI9FbIE/rtey9pfZLuzBcCFkNeJ
 Ba4QS0L5IpCOGCzS2v52UrQKpbI0dl+Y7a49cFFjOvUfxwROulavYyz4jwTLRUjGvvpy
 Add+RG166Sny7opLha7ylzww52qDxu0MQ0D37J1DiN6GN1ewXKNv7Va4RA5JyUPNTI5l
 Lz5e52DDp+H8N2Pm+9nWHG301mpzBtCGMcy7a1pHgeCT5LOXKSa6lJ6kibhSkdqjkQGh
 kPIdAsJGNbP9EHXdH8HBW5tQE9q/PHTDv6cII7ieM02HbH2Uj91oL5UZ8GHU+9KF98AT
 SOeQ==
X-Gm-Message-State: AOAM531I7u8Hn+X94+FRY2IDVqrMEOexP/aJy48EMyzW4BGEIXP7na+Y
 igZtaibsZ17ra3RwrGTv5gAp8gEjaETUlQQ8Itc=
X-Google-Smtp-Source: ABdhPJyiELx4SmaFnXSwfEYnsSzcOUbE+gUYWfNvBWyvN0WjoLBd/TnidTmoYr9iqCLsSzkwx/2nIPWqJ2Am/nnL18Y=
X-Received: by 2002:aca:2102:: with SMTP id 2mr4832817oiz.67.1628034697544;
 Tue, 03 Aug 2021 16:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210801225928.2486201-1-james.hilliard1@gmail.com>
 <20210801225928.2486201-2-james.hilliard1@gmail.com>
 <0b0b423d-cde8-c201-acc6-8781d641b05e@mind.be>
In-Reply-To: <0b0b423d-cde8-c201-acc6-8781d641b05e@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Aug 2021 17:51:26 -0600
Message-ID: <CADvTj4pCWX8J=2K9o19n5n3dF1_2=QHVa_Rv2r=Jn-r-ssr-Kw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 2/2] package/ripgrep: add workaround for
 cargo bug #3349
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sam Voss <sam.voss@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, Aug 3, 2021 at 10:04 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 02/08/2021 00:59, James Hilliard wrote:
> > To fix this bug we have to use an undocumented test variable to enable
>
>  That is pretty nasty. Since there is a patch that is merged upstream, it would
> have been nicer to just patch cargo instead. Especially because other packages
> (external, obviously) are likely to be hit with the same issue.

Well the merged patch merely allows this fix to be used in channels that allow
nightly features, there is no patch currently merged upstream that allows it to
be used normally in the stable channels.

See unmerged stabilization patch:
https://github.com/rust-lang/cargo/pull/9753

>
>  That said, since we have a choice to use rust-bin rather than building our own
> rust, patching cargo is not so simple... So OK.

Yeah, trying to patch cargo is a lot more difficult than just using
the undocumented
channel override env variable.

>
>  Both applied to master, thanks.
>
>
>  BTW, when you resend a patch, it would be nice if you could update patchwork to
> mark the old one as superseded.

Hmm, must have accidentally sent it twice, I usually try to do that.

>
>  Regards,
>  Arnout
>
> > the nightly target-applies-to-host feature so that the target linker
> > doesn't get used for host binaries like the build-script.
> >
> > Fixes:
> > error: failed to run custom build command for `ripgrep v0.8.1 (/home/buildroot/buildroot/output/build/ripgrep-0.8.1)`
> >
> > Caused by:
> >   process didn't exit successfully: `/home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build` (exit status: 1)
> >   --- stderr
> >   /home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by /home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build)
> >
> > Details:
> > https://github.com/rust-lang/cargo/issues/3349
> > https://github.com/rust-lang/cargo/pull/9322
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/ripgrep/ripgrep.mk | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> > index 2cc578383d..450bb020e3 100644
> > --- a/package/ripgrep/ripgrep.mk
> > +++ b/package/ripgrep/ripgrep.mk
> > @@ -11,11 +11,14 @@ RIPGREP_LICENSE_FILES = LICENSE-MIT
> >  RIPGREP_CPE_ID_VENDOR = ripgrep_project
> >
> >  RIPGREP_DEPENDENCIES = host-rustc
> > -RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
> > +RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo \
> > +     __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> > +     CARGO_TARGET_APPLIES_TO_HOST="false"
> >
> >  RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_BIN_SUBDIR)
> >
> >  RIPGREP_CARGO_OPTS = \
> > +     -Z target-applies-to-host \
> >       --target=$(RUSTC_TARGET_NAME) \
> >       --manifest-path=$(@D)/Cargo.toml
> >
> >
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
