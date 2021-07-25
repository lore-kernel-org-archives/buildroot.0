Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C4BC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:48:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6DED60F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6DED60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F771834E8;
	Sun, 25 Jul 2021 21:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgzoJqxZ37Cm; Sun, 25 Jul 2021 21:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032DD834D5;
	Sun, 25 Jul 2021 21:48:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA6B51BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C731740286
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldPp0X62DkaQ for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:48:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27C5B40278
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:48:46 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id o185so8695611oih.13
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hPTRykB9wfXqRyHzUV9vfPUFB7vU0Vb/kvGf6lOwxbk=;
 b=tuvgaPAKT7lOiQAdazwj0ZLXT7vvG6wEG3tKH3ub1Z5UzqiFf0iMl1xruw6Oc+sOOs
 s+Anh8PHrYP1CO0trsFMp0XL7Y2XTtOe5mGu57WzU6VDlO1tDXyRgHk7+WeK5BtcmVrF
 NUOEoaiynweDB6fd5n7P+kDRjvgckEY1qrdQ024pdmGtUizivbDqoNDbzb61sXZmchdn
 5GfEcEaU2cEBSUn3P7Q6yDoUclvwWYwngqfWyIlBoeg6R2tTJUV2DOKQFAhQC/V5UEq+
 o/GGhUN0UTuHPCNnPx+wAYt1O2I5mmIHEp8SXxkU29uUuZp2wM88pJ/p30B0+2p9odEQ
 HDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hPTRykB9wfXqRyHzUV9vfPUFB7vU0Vb/kvGf6lOwxbk=;
 b=nS+q5EUhOF7WzA3PKp7138GIAuxse/7CQ8ThR3rCdUagL337WW5JgOaS+zWjI8EzHb
 RDJdJEQTj31eiPJpyZD1tft4uMBdQ43vfap637KZffRnrThcz162vDLXLe6yInjPpGTg
 UDG4PmL5MATWQBrxcCC3TUs7PRKU+fsnSN85hVb0pgLExE6Nh9j1QtxR559qQzRdaevl
 3jg+oHP3SLiIFqDHhH2znILMLb35u2icAV0ZAY+0GM5eLZdUPgx2URWlKCNl7M1AUJ4u
 1tDLz8tWWjEhbf7LAKfA6tO7yAfTy5a+6T043nzT/fdQqBXhk3ryLB7TXkuehody8CUV
 aCPQ==
X-Gm-Message-State: AOAM533YQcLLJE23Pu7WhApcWhHkTbsDNWJaP3pFTe5ns7EqeJ24iJSF
 nnB4rq2CJz1sgQ3RYuulokb3I72GDQrZKgVcjFc=
X-Google-Smtp-Source: ABdhPJwh1siFa54xM9uIM3ArJMh+goj8vxmtvjKrm2S9eUDaciYowPy/iK36NoHnQkX3c3SeppfctzOOMPZBlIvCoCA=
X-Received: by 2002:aca:c0c3:: with SMTP id q186mr3684420oif.39.1627249725189; 
 Sun, 25 Jul 2021 14:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210725213422.1622027-1-james.hilliard1@gmail.com>
 <YP3bauBN+MKEb18i@pevik>
In-Reply-To: <YP3bauBN+MKEb18i@pevik>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Jul 2021 15:48:34 -0600
Message-ID: <CADvTj4pmrEavk++tgHuLihp56qRBLi+-P7GkKKq9P_rb3CW6MQ@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libtirpc: add missing
 !BR2_STATIC_LIBS dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, Jul 25, 2021 at 3:45 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi James,
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v1 -> v2:
> >   - add comment requiring dynamic libraries
> > ---
> >  package/libtirpc/Config.in | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> > diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> > index 1899edefbf..31f1636ef5 100644
> > --- a/package/libtirpc/Config.in
> > +++ b/package/libtirpc/Config.in
> > @@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBTIRPC
> >  config BR2_PACKAGE_LIBTIRPC_GSS
> >       bool "gss"
> >       depends on BR2_USE_MMU # libkrb5
> > +     depends on !BR2_STATIC_LIBS # libkrb5
> >       depends on BR2_PACKAGE_LIBTIRPC
> >       select BR2_PACKAGE_LIBKRB5
> >       help
> > @@ -17,3 +18,8 @@ config BR2_PACKAGE_LIBTIRPC_GSS
>
> >  comment "libtirpc needs a toolchain w/ threads"
> >       depends on !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +comment "libtirpc gss support needs a toolchain w/ dynamic library"
> > +     depends on BR2_USE_MMU
> > +     depends on BR2_STATIC_LIBS
> > +     depends on BR2_PACKAGE_LIBTIRPC
> Shouldn't the last item depend on BR2_PACKAGE_LIBTIRPC_GSS?

I don't think so, then it would never be shown AFAIU.

> I'd also name it "libtirpc GSS support ..." (capitalize GSS)

I kept it lowercase for consistency with:
config BR2_PACKAGE_LIBTIRPC_GSS
      bool "gss"

Maybe we should change both?

>
> Kind regards,
> Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
