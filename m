Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC286C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:47:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E025604DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E025604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50A86403B1;
	Sun, 25 Jul 2021 20:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqNRpz_ii_wA; Sun, 25 Jul 2021 20:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BE864036B;
	Sun, 25 Jul 2021 20:47:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57E611BF25F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47C0B40269
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8R2BeGqae0QH for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 20:47:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72E2740263
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 20:47:28 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 v8-20020a0568301bc8b02904d5b4e5ca3aso7146596ota.13
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f8JflRf5d4Wt7JJDrFP8qRARN7JN/sRMhi0eZX0FrbI=;
 b=a9FWs2jYxhnQBjquW8Xctu9QutvJEZJLXRrjbSPx5jd/yEZtnyOmBa6j04afrtyIDK
 QbfyI6RWsrqjlACuC43K5OPiItBB9H0iAk9CvaZNj6QdGK7hxN7nONz4xz00esz3VfdP
 w2EM+MQAXfbYRwQA4oAnMINcrr0EV1rRXQisOS7x/IiwI63uIlxlKVP5quxLHxEFhE6v
 9xTOL1JZZDAs29mEivyJU+UzOnubkP0huXOHs7pjJDx9NJhKSCE5G6g2F51jOsCRL5QZ
 F/tORd+ZRyTBBS3uh5VsdZ9dwrYWD+gxcHsdj8w6jR1KGlWUAyMub8m/gy2U0IUeIFtL
 Jecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f8JflRf5d4Wt7JJDrFP8qRARN7JN/sRMhi0eZX0FrbI=;
 b=LFWj1KXcBcr+3Ifw+N1hiNyjDZezW82ZjKbeE/BKw0MhR6VqV69Ntv2BnNHPDfO7oL
 am1yCXKuuA/BggVFpiKMqyx98hUDjAEqbVz3xiUM7gDUm97NDxOFt1hUSlz3alb47CYd
 fkvKpWp9Lb/e9OxlWzm62NtG1ULWxgv/zr4KjvYHlLMW0mM6WcBSj/DmdpPrT9jw0uuK
 0GtyGx5KA+TVS4OZW/iz64/OIgGt5hwYUH1a54PAbeao2UoT7sw+whsk/+Wq9t2O48u0
 eS65RtbsYKBqX5ThhT0XiGTDYKbVqeAWwtgMrK2ZwxgXdp1L1onWGb5HHCwpdZ2PSfiD
 zK3g==
X-Gm-Message-State: AOAM532vKE1WCJdwyG0cWVPZqjC4S4EEYSC3zbVnoR4hp8Eu6XLKatl7
 SsvAidEUn+LJQIj2Hac/MJYOj8jqtObZWD68Yw8=
X-Google-Smtp-Source: ABdhPJzXHPxEJxK0PWH0m9uXczTSm8kC+jvGGArURjLpPnYUTA5kXORmwCaelzWBptillE2ZLBlEx/Joak2NF4b5KF4=
X-Received: by 2002:a9d:64a:: with SMTP id 68mr9531493otn.68.1627246047480;
 Sun, 25 Jul 2021 13:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210718204406.899038-1-james.hilliard1@gmail.com>
 <6cd7e12d-3bcf-f177-650e-441f5a322e7c@mind.be>
 <20210725193751.62d7666a@windsurf>
In-Reply-To: <20210725193751.62d7666a@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Jul 2021 14:47:16 -0600
Message-ID: <CADvTj4ra=gb9-hrVf32_RRpGT=h6ymEEG+tw-jsY4D8zp1KvUQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v4 1/2] package/libtirpc: Add optional
 GSSAPI support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, Jul 25, 2021 at 11:37 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 25 Jul 2021 18:21:08 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> >  Both applied to master, thanks.
>
> Gah, I should have replied earlier. I didn't apply this because there
> was a small issue, see below.
>
> > > +config BR2_PACKAGE_LIBTIRPC_GSS
> > > +   bool "gss"
> > > +   depends on BR2_USE_MMU # libkrb5
> > > +   depends on BR2_PACKAGE_LIBTIRPC
> > > +   select BR2_PACKAGE_LIBKRB5
>
> libkrb5 has a !BR2_STATIC_LIBS that is not taken into account here (and
> the libtirpc main option does not have such a dependency).

Fixed here:
https://patchwork.ozlabs.org/project/buildroot/patch/20210725204624.1620567-1-james.hilliard1@gmail.com/

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
