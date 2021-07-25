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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4548DC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:59:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08A0E60F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08A0E60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA6FF60675;
	Sun, 25 Jul 2021 21:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eFltN2Bj0g_2; Sun, 25 Jul 2021 21:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C094605F1;
	Sun, 25 Jul 2021 21:59:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C40D91BF20B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3D5240281
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id laNynJa8xxYt for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:59:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09DA740278
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:59:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id n2so8008036eda.10
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=d0eXa4Db04IF0QoOzzQJ+WKsfnm2nFjDlZynvwbzM+Q=;
 b=MV1ZYnIglYRus2KPnsW7SXXV8KmlsCyZyChHkvGq08uplLl63TD3gWUKtrSbdV0kLO
 Scs1E1f+72bY45crL+50EsFdYQrxlHDVLA3N+oTpiqestJI68VNUhwzX3l8yAEC/scAW
 Xpt/OrX1IPoYj7/YoBAAA4OKWzyZSQNWBpCWbz1MR3z+Tz6H2O/FhGY22vzAeo6uPsb2
 NFvTl2GoXQxk/PdOAa+/h8IkUMo9rvCk7guscQVG6xz7h/ZP1XeuoQrmUh1EVtogDJ5t
 W2jgi1LMFhnYNRKvG8R444+Itd+TLZkiNaoFTjyiWjwyhIaiqXdz/nUnlSZb2TzlqRbp
 cntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=d0eXa4Db04IF0QoOzzQJ+WKsfnm2nFjDlZynvwbzM+Q=;
 b=hvWdOWIzRxPFyAgGz/6hty+yBrUUXkOcY2TYYGZ3+YkMBFMfFUdluIKTzIoemfLrXp
 n+dIYIagqsrzMqjbqIlOjDjjw3I2VDz7R1UMxWV87kOe4in4oEeSEyg+R72KAF+ZlUyU
 rl3ks1I7DVpr0PkGeutzMCUC/wPo/nvs9q9h3Xlum3rtNI6o1uCUQLUbb48ntpRRnLwX
 yvqlyZKs/0J3+X/+mcWzVW4TzdXfzZwgP4PuxZUhqGb9u4AraQyduIBIno9PfVV7pVdR
 2lOoA93TVeBP9DTnNeZustxz+gLOf4XTZNGZ2Owf+2HBZtHvHCEyF006BuR2bQz/8mMa
 d5ow==
X-Gm-Message-State: AOAM531m5nwDd+cuOZZ9wZWDyx8vglJyVjPy46cD7emCnS+rT5Qel8Rs
 flIPysZqlx/eLeRW2iI+YBc=
X-Google-Smtp-Source: ABdhPJymInjxQC/ZclG7au2LRJbh2yMBh4oryNaxD5FiViFbge2i4rq99RwB+62SVOu2uZfKgNVT9w==
X-Received: by 2002:a05:6402:60c:: with SMTP id
 n12mr17782629edv.189.1627250350330; 
 Sun, 25 Jul 2021 14:59:10 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id cr9sm17996780edb.17.2021.07.25.14.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:59:09 -0700 (PDT)
Date: Sun, 25 Jul 2021 23:59:07 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YP3eq3aM48U1SR84@pevik>
References: <20210725213422.1622027-1-james.hilliard1@gmail.com>
 <YP3bauBN+MKEb18i@pevik>
 <CADvTj4pmrEavk++tgHuLihp56qRBLi+-P7GkKKq9P_rb3CW6MQ@mail.gmail.com>
 <YP3eMwPzJSID6dq1@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YP3eMwPzJSID6dq1@pevik>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

> > On Sun, Jul 25, 2021 at 3:45 PM Petr Vorel <petr.vorel@gmail.com> wrote:

> > > Hi James,

> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > ---
> > > > Changes v1 -> v2:
> > > >   - add comment requiring dynamic libraries
> > > > ---
> > > >  package/libtirpc/Config.in | 6 ++++++
> > > >  1 file changed, 6 insertions(+)

> > > > diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> > > > index 1899edefbf..31f1636ef5 100644
> > > > --- a/package/libtirpc/Config.in
> > > > +++ b/package/libtirpc/Config.in
> > > > @@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBTIRPC
> > > >  config BR2_PACKAGE_LIBTIRPC_GSS
> > > >       bool "gss"
> > > >       depends on BR2_USE_MMU # libkrb5
> > > > +     depends on !BR2_STATIC_LIBS # libkrb5
> > > >       depends on BR2_PACKAGE_LIBTIRPC
> > > >       select BR2_PACKAGE_LIBKRB5
> > > >       help
> > > > @@ -17,3 +18,8 @@ config BR2_PACKAGE_LIBTIRPC_GSS

> > > >  comment "libtirpc needs a toolchain w/ threads"
> > > >       depends on !BR2_TOOLCHAIN_HAS_THREADS
> > > > +
> > > > +comment "libtirpc gss support needs a toolchain w/ dynamic library"
> > > > +     depends on BR2_USE_MMU
> > > > +     depends on BR2_STATIC_LIBS
> > > > +     depends on BR2_PACKAGE_LIBTIRPC
> > > Shouldn't the last item depend on BR2_PACKAGE_LIBTIRPC_GSS?

> > I don't think so, then it would never be shown AFAIU.
> Looking into package/apcupsd/Config.in shows 1) comment should be just below
> config (problem also on previous patch) and 2) IMHO "depends on
> BR2_PACKAGE_LIBTIRPC" should not be there at all. Or am I missing something?
Yes, I was missing something :). "depends on BR2_PACKAGE_LIBTIRPC" is correct.
It works, not sure if 1) is relevant, thus sorry for confusion.

Kind regards,
Petr

> > > I'd also name it "libtirpc GSS support ..." (capitalize GSS)

> > I kept it lowercase for consistency with:
> > config BR2_PACKAGE_LIBTIRPC_GSS
> >       bool "gss"

> > Maybe we should change both?
> Well, probably better to keep it lowercase.
> I thought that first is identifier, other is abbreviation in the name,
> but again, looking into package/apcupsd/Config.in shows I$m wrong.

> Kind regards,
> Petr

> > > Kind regards,
> > > Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
