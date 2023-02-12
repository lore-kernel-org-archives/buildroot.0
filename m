Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846C2C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 10:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3183A40135;
	Sun, 12 Feb 2023 10:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3183A40135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6ZpW45GzwXB; Sun, 12 Feb 2023 10:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4265E4014E;
	Sun, 12 Feb 2023 10:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4265E4014E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96BFA1BF378
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D1DF60E1B
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D1DF60E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20p95djRiYq3 for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 10:12:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244D060BFB
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244D060BFB
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 10:12:54 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-16ab8581837so11995142fac.4
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 02:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d/7yw0iO+HjLdLkh02/dO0olnzilhv8t/Pt6Otom3yo=;
 b=7lPz9w2m8dfzonxVIJJWU2qGt08PdSqXuj8WJgzM9Roc6/hzuiijs5PfyQGkSrWA90
 LnZO2i5G/ZE5hB1m5zTS2D4pINc6ZZpXYJY7/0OsLQoD9JHBEuWhz40ksgx/erOh+oMu
 WMM1HJkVLASVJbgJNg10WXFGBs1O6xorc0yufmS1Lsb1KidTdj4stG/KEfm7o994RAq7
 qt5UCU09q87w5clBfsjXA5MDtwA+81f5LyOPJNef5Kk3yKs5jNa9bs2Bt5c3Cp04FGYF
 8sbSYz7tgP3WKByTxDXWWqzCH9C+6cQwqNkdJrRNSgnERsoMiKMGRxXTxkGRJkDuow5O
 Dz3g==
X-Gm-Message-State: AO0yUKWrpqqRvvMHdtO+dDJXPBHEHm/eqeD86m97yyElAoQFSa8WTGoa
 lr5Pf7mH0uTSiBOKZY4qDR2h2n+i6c6dGYo0vn1X9qWJ8F8=
X-Google-Smtp-Source: AK7set9ZMolc60UeGA9FwHdnMVUXOvdVnpwa+gkMn6vHfUWX73hDwWK0shQdZ+3m5Ncvh8VOmzGI8O0hQRa3BAiTuVc=
X-Received: by 2002:a05:6870:829e:b0:16d:f057:bf55 with SMTP id
 q30-20020a056870829e00b0016df057bf55mr182354oae.93.1676196772764; Sun, 12 Feb
 2023 02:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20230211184346.1192333-1-james.hilliard1@gmail.com>
 <20230212091914.GJ2796@scaer>
In-Reply-To: <20230212091914.GJ2796@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 12 Feb 2023 03:12:41 -0700
Message-ID: <CADvTj4pWs_a+Qbx8ZWZKoUY+H1vJpTEpdZF7Ruz6inV8eCXV-A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d/7yw0iO+HjLdLkh02/dO0olnzilhv8t/Pt6Otom3yo=;
 b=Me6YHvKdgrqxQqYa/jTv01YHb76jI5NKhuty/5EW2Ib3FVcmMK8iL7m7sb8dC53ynx
 HON0e1umiYbXJMbdZR+XEjG/GzI6ioxI6N3KL1deDY5ip57mbpmLRyjIRwQLatPvkfwm
 2o++xythN9+fXRIjxCOzf/bgfzgKkX7Fkcb+o/QwAdRjEhmOalu2n8ONAH/EX3eYEfJ2
 TWU8LhND88tL7dXFKskvU33pv0z3PV6/+ELfza7RgkybEhFTyiaWAyECPA/KrZ4ZKSzJ
 n/j+nGqGvKFJSjHqvAdZRv1Kvh6ZK0djwN8BUbYMpb5skmipvRV3uzQdiZa9+NJvlHjs
 O8wA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Me6YHvKd
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: fix rule order for legal-info
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

On Sun, Feb 12, 2023 at 2:19 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2023-02-11 11:43 -0700, James Hilliard spake thusly:
> > This command relies on the clean/prepare operations being in a
> > specific order.
> >
> > Currently the execution ordering of the clean/prepare operations may
> > change, for example if --shuffle=reversed is set.
> >
> > To ensure the evaluation order is always correct use double colon
> > rules to make the evaluation order explicit as per make docs:
> >
> > The double-colon rules for a target are executed in the order they
> > appear in the makefile.
>
> Thanks for this patch!
>
> What bothers me a bit about using double-colon, is that the make manual
> explicitly state that "[d]ouble-colon rules are somewhat obscure and not
> often very useful; they provide a mechanism for cases in which the
> method used to update a target differs depending on which prerequisite
> files caused the update, and such cases are rare."
>
> So, I understand that it does fix the issue, but I'm afraid that it is
> going to be so easy to forget about that issue, and what I get from the
> make manual is that we should not use them unless as a last resort in
> very special corner cases, and the case at hand is not identified by the
> manual, which somewhat implies that double-colon rules were written
> specifically to handle the case where "the method used to update a
> target differs depending on which prerequisite files caused the update",
> not specifically to ensure that the order is guarantedd. It even goes as
> far as suggesting that this should not really be relied upon:
>
>     The double-colon rules for a target are executed in the order they
>     appear in the makefile. However, the cases where double-colon rules
>     really make sense are those where the order of executing the recipes
>     would not matter.
>
> So, to me, the ordering is only a side-effect of the original goal,
> which is to have different commands to generate a target, based on what
> prerequisite caused the the update...
>
> I am also afraid that there are so many other places around where we
> implicitly rely on the order the prerequisites are listed, and that we
> can't easily spot (that I spotted the legal-info issue and asked you
> about it, is pure chance, as I was looking at something completely
> different).

Well we should be able to flush them out using make shuffle mode.

That's how I caught the other issues at least.

>
> However, in the legal-info case, the rule is definitely not
> parallel-safe, and we do really want it and its dependencies *not* to
> execute in parallel in fact.
>
> Indeed, all PKG-legal-info rules will emit a little blurb that is
> appended to the manisfest.csv, with commands like:
>     echo 'PKG,VERSION,blablsablab' >> manifest.csv
>
> So, if we run that in parallel, this is going to explode [1].

Hmm, might just need a flock operation when doing the manifest.csv
file echo append.

We do something like that for downloads already:
https://github.com/buildroot/buildroot/blob/2022.11.1/package/pkg-download.mk#L113

>
> So, I believe in this case, we do not want to use :: rules, but really
> ensure that legal-info and all PKG-legal-info rules are never run in
> parallel, *and* that they are executed in the order they are listed in
> the prerequisites.

Well legal-info can take a while to run so it might make sense to make
it work in parallel.

>
> We probably want to just add in the top-level Makefile:
>
>     .NOTPARALLEL: legal-info
>
> and in package/pkg-generic.mk, something along the lines of:
>
>     .NOTPARALLEL: $(2)-legal-info #(2)-all-legal-info
>
> Thoughts?

Might work...but it seems like using flock may be simpler and faster.

>
> [0] https://www.gnu.org/software/make/manual/make.html#Double_002dColon
> [1] with very nice and bright colors, but a bit too loud still
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  Makefile | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 4880b426b5..09575a5e3c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -839,7 +839,9 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
> >       @cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
> >
> >  .PHONY: legal-info
> > -legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
> > +legal-info:: legal-info-clean
> > +legal-info:: legal-info-prepare
> > +legal-info:: $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
> >               $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
> >       @cat support/legal-info/README.header >>$(LEGAL_REPORT)
> >       @if [ -r $(LEGAL_WARNINGS) ]; then \
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
