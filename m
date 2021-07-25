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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCDAC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:31:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC92360E0C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC92360E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C42C44029C;
	Sun, 25 Jul 2021 21:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUCThLmjarFd; Sun, 25 Jul 2021 21:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 224AB40295;
	Sun, 25 Jul 2021 21:30:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F99D1BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F413402B4
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7BDNNJ14Qda for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:29:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25B524026F
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:29:54 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 o2-20020a9d22020000b0290462f0ab0800so3399148ota.11
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rSc74zFUltR7K6WSK4kHE7h4WJvVAUHxp6eZWXshujc=;
 b=Qz0Iep8t61NNadyYY1rpt56PdgfZpFWRx5FApxwEDPpphconwSTtgzPigB/pPut9iB
 moRFsHNxWtalwU8z4IlQlH3M/tFBjEDhHoRaBd6+VS7ERtw+4KmMwXMWekhoL2ZmnRyR
 pX5MfUvJzLt/qAHsfNrJ7xQwy9TqIaQkEfXex4ai8dP2dHNiY1Apiu2teqip11rupMYR
 UzVG+INDxVZl4fha/mRqh5h5LWSCf/jtM7CGsxn2wcFmKKMViD7zZFfI/RLLpgObnkSL
 tmASBXn/igMJ/enS5pKU10qvEgHZCFPo39IrWhruevwljuztcoVuL8/Mr331zTIm2w/6
 bZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rSc74zFUltR7K6WSK4kHE7h4WJvVAUHxp6eZWXshujc=;
 b=oseiU1AKLnklbKqAnHByLCGbuacbfUMBF+yjpw3HDhk1VHScKI98l/o6U3614ldQPt
 75ZIW6xbeFgxqZb1wbQ1m7stlEgZM3MkvQZhDQIPd1Fx7znWVi1bpP46vRMpdRSmNyDD
 GJ3GoX+H1bcxRVEdwAxEHfZkyVcFl6yCsJBluJ4IE8PKwsSXrcgGCel7mUMUdZSz/en4
 ai4D4o6Gf6VKL7gKb+STyRC+dp7F7rJIAZHfr1yZvRl6/m270/R4SsLp2rD2qD7dBZX2
 Mxdu4dMozVzpZ1F3sDYq8y54ldVz3cuV63X7AnuSuPAlXohlMwtuAuMrHLojiIEH7vRb
 nzhQ==
X-Gm-Message-State: AOAM533C1aT1+DT78A8jg/T0v4iqtgFQ38ADfk5y8nuMoAIJcjVZ8ctr
 rEuCWzOzjS3uuxBuj/tIfnroES1s64NdwEt/85A=
X-Google-Smtp-Source: ABdhPJyoAyeH1095YMeqXFgJHh3+JIKVLZL82m2l3pIncNzfu9SqT9ohe7Q4ouMnEvgMx+PN5hq5U6Rp6hUpWevCVMk=
X-Received: by 2002:a9d:5f87:: with SMTP id g7mr7989488oti.278.1627248593092; 
 Sun, 25 Jul 2021 14:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210725204624.1620567-1-james.hilliard1@gmail.com>
 <20210725231524.512d0549@windsurf>
In-Reply-To: <20210725231524.512d0549@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Jul 2021 15:29:42 -0600
Message-ID: <CADvTj4ote=YJ4sWsqhwZof2hCw+8-uif68BpnidraEu-D3GfYQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: add missing
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, Jul 25, 2021 at 3:15 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 25 Jul 2021 14:46:24 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/libtirpc/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> > index 1899edefbf..6a900c68c3 100644
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
>
> Thanks, but a bit more than that is needed:
>
>  (1) A Config.in "comment" in package/libtirpc/Config.in
>
>  (2) The propagation of this "depends on" in places where
>      BR2_PACKAGE_LIBTIRPC_GSS is selected, i.e in
>      BR2_PACKAGE_NFS_UTILS_GSS. A Config.in comment will be needed as
>      well.

We do already have a dependency on this in nfs-utils via:
depends on BR2_PACKAGE_NFS_UTILS_NFSV4
which itself depends on:
depends on !BR2_STATIC_LIBS # keyutils, lvm2

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
