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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C94C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:57:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7175060551
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7175060551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36304834D5;
	Sun, 25 Jul 2021 21:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hD1aib2PCppK; Sun, 25 Jul 2021 21:57:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C1B83388;
	Sun, 25 Jul 2021 21:57:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AEE31BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A76740281
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWEy4ws2RdIW for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:57:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12CD140278
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:57:11 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id h8so8037955ede.4
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=Faja7WTAdJi1w+tzfUggkXyzyTSxuWQeBatRyjCo4c0=;
 b=WMKWvRnddYUMRpcAKcMj/pFuaTlZF7Xf6MnRzFoYAyysvKewVIlPfDhS3nVzBjQOAi
 G40lRservkq0Zc1rkq/c1/RpGbuWTXhMta+GiZbAPzUqLJ7rqfnySpQFSQF47FP73/T/
 gZ8T4DMefyxiRJsl4+bS+ETxkX8cEEpGacV8C2tgZCMxkE6MLiEDMAeaHNvqkKNui+k8
 qxLJ40wC+MUjwl9XpEfl05GgJiXAFTCovp6JIiYhsy9SPt1l/Rjj2W5qe9uzdo49t3mL
 Enyom38/g/D2GMqWBSVK78fTWYwI/c0CDmfnQP2dmFqfBMJ17OFgztgQBr+CCSK5sdhY
 hoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=Faja7WTAdJi1w+tzfUggkXyzyTSxuWQeBatRyjCo4c0=;
 b=WuUIBfNCHOQWSMfw3WZDLgBgkwYD/ZhTCt+jvCkw18/FN9kmf/GdXtJrLCBkA+u4W4
 vtLwbhvgQVunjOnA3fbSSC6KQzriyEOWAICVgPP2vM+TBKV8CZhixMU8IXaS/eY3Rtv6
 h5vLWbXuiZOXa9ZmqxuEg3IlY+ZZ+1PdiU1IZKhil3CRl++/RwJL1WEWdHu0vGmfJmjx
 J94V/+CD/6RW4O29empwp3q7r5ceixPJHIDO33kez/SpoL21fUnHN0QVoVVJEiRdkuzK
 GaBiXqab48SnhZXe8YjS0vtTT15Lg66ZJ+sGww2c14KwJkECCHxT4jAmqjPM4z3PrVIS
 70oQ==
X-Gm-Message-State: AOAM533RU5bXf+8n67VPuatkaNxnLHQ3XGqDeBD3RbqEiXE0o+50IsGU
 Vi+syUcAwwfRv3Dj4AIRczLJ2upmcG6dJA==
X-Google-Smtp-Source: ABdhPJwZ+Y7ikvwHQY2L//IR2Fhun2ZfGEqA383dzFCvc9qabJJwIcxeOf4H2U0Dbg0NUgqCjMvu0g==
X-Received: by 2002:aa7:d543:: with SMTP id u3mr18168696edr.37.1627250230222; 
 Sun, 25 Jul 2021 14:57:10 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id qb32sm2176928ejc.18.2021.07.25.14.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:57:09 -0700 (PDT)
Date: Sun, 25 Jul 2021 23:57:07 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <YP3eMwPzJSID6dq1@pevik>
References: <20210725213422.1622027-1-james.hilliard1@gmail.com>
 <YP3bauBN+MKEb18i@pevik>
 <CADvTj4pmrEavk++tgHuLihp56qRBLi+-P7GkKKq9P_rb3CW6MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4pmrEavk++tgHuLihp56qRBLi+-P7GkKKq9P_rb3CW6MQ@mail.gmail.com>
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

> On Sun, Jul 25, 2021 at 3:45 PM Petr Vorel <petr.vorel@gmail.com> wrote:

> > Hi James,

> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > > Changes v1 -> v2:
> > >   - add comment requiring dynamic libraries
> > > ---
> > >  package/libtirpc/Config.in | 6 ++++++
> > >  1 file changed, 6 insertions(+)

> > > diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> > > index 1899edefbf..31f1636ef5 100644
> > > --- a/package/libtirpc/Config.in
> > > +++ b/package/libtirpc/Config.in
> > > @@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBTIRPC
> > >  config BR2_PACKAGE_LIBTIRPC_GSS
> > >       bool "gss"
> > >       depends on BR2_USE_MMU # libkrb5
> > > +     depends on !BR2_STATIC_LIBS # libkrb5
> > >       depends on BR2_PACKAGE_LIBTIRPC
> > >       select BR2_PACKAGE_LIBKRB5
> > >       help
> > > @@ -17,3 +18,8 @@ config BR2_PACKAGE_LIBTIRPC_GSS

> > >  comment "libtirpc needs a toolchain w/ threads"
> > >       depends on !BR2_TOOLCHAIN_HAS_THREADS
> > > +
> > > +comment "libtirpc gss support needs a toolchain w/ dynamic library"
> > > +     depends on BR2_USE_MMU
> > > +     depends on BR2_STATIC_LIBS
> > > +     depends on BR2_PACKAGE_LIBTIRPC
> > Shouldn't the last item depend on BR2_PACKAGE_LIBTIRPC_GSS?

> I don't think so, then it would never be shown AFAIU.
Looking into package/apcupsd/Config.in shows 1) comment should be just below
config (problem also on previous patch) and 2) IMHO "depends on
BR2_PACKAGE_LIBTIRPC" should not be there at all. Or am I missing something?

> > I'd also name it "libtirpc GSS support ..." (capitalize GSS)

> I kept it lowercase for consistency with:
> config BR2_PACKAGE_LIBTIRPC_GSS
>       bool "gss"

> Maybe we should change both?
Well, probably better to keep it lowercase.
I thought that first is identifier, other is abbreviation in the name,
but again, looking into package/apcupsd/Config.in shows I$m wrong.

Kind regards,
Petr

> > Kind regards,
> > Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
