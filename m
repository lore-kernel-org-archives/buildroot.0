Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1B8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:05:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 224F361268
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 224F361268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0CE40390;
	Wed, 22 Sep 2021 08:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Y_uZ7fvpoLX; Wed, 22 Sep 2021 08:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 364454033A;
	Wed, 22 Sep 2021 08:05:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6627E1BF3FC
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5525E4049D
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Isnc6yxhjfgS for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 08:05:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 187D140474
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 08:05:05 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 67-20020a9d0449000000b00546e5a8062aso2331604otc.9
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gkHATYg3RrDJH7AeiV38Z2YTyLTgJdnHaOw6L3KD18Y=;
 b=NrrTUmGkei/YWYddhVSdsx2Dq5bxfEwm6WFPu70JP0FHrkc+Plr/UEoPB/6D0BEk/d
 VtWSeve5fV3MlvHGM9756uQhPPCHma/lNTtZ23TCuwh/ny4Wx0y00JAkYINbe6nMP69g
 WLX36XA0O1EGMrDkJqamwYAxKbJdxDbJbhGHk3n5r98PmkWZ0SfH7JvgwuXw4I2GIveL
 wqq7YZ10+VJzmm39SU5s+p0ZQ5/OJFNxBMDnm+ZkELWzPpE2iXwENbli3MLQO0DNivJc
 wl0EquaV0IWp9PTeSeWRQM6x6WJdQCHvY+1X0nKTRIM0/Bo/nyFQvtwz8qjsbRWN1FpA
 8KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gkHATYg3RrDJH7AeiV38Z2YTyLTgJdnHaOw6L3KD18Y=;
 b=GwwbcZX8vz3V7qE4OST5cih6KQFHrxej3KgGqNL8D7AEc5VwWFQ7Gyaetv8BKwz6um
 x5UM/MV9FepVjUhCVIJbypaYHH6fCtDuhBjVjdtuBmb8eSX05jRm4xgKaUbPXrHS3rWI
 jXYntzrd5fjEgIEVMqC2w1BY0HDBKnFQkkqkmrAyQKjc3ua5ysUiCBly3zyceNrP6KI7
 a7l9arWq5qNPofRXvQ9o5/dsKWAxiO6H/5ZUDWek5x1+aslu4xRwPuIcSTUJ+OQ3Vcva
 puS3KQTvb/Zw1CNZ0EbAuB0QWe3HhcST0fNOjq1tR4wtk4VFnjGW1vLq+d8z8a/UYP71
 5BZw==
X-Gm-Message-State: AOAM532o/WUYVzkER4JHlxp1pb6vGHr/AttvQMYZIWspgeWg2iEzR1NA
 0wWz3S+7VZJnEjnzczWeyEaEU5ffVWgEp6zqkJk=
X-Google-Smtp-Source: ABdhPJwfo70z+k2NMUgBiPX8x6RxZyH3QhO3edL7Of/K+dXW7MGxsmjO+uvzGylFDqt35lY9IlzRysfyDhSOXDEPxhU=
X-Received: by 2002:a9d:1408:: with SMTP id h8mr30084775oth.151.1632297904501; 
 Wed, 22 Sep 2021 01:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210922065707.440894-1-james.hilliard1@gmail.com>
 <24f90dee-41b4-5f42-99f6-4a9a35324143@heine.tech>
In-Reply-To: <24f90dee-41b4-5f42-99f6-4a9a35324143@heine.tech>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 22 Sep 2021 02:04:53 -0600
Message-ID: <CADvTj4r-qeq80rxX6OQY9+5JwoA1+nG5Cukym4E+1FHOvjuDfw@mail.gmail.com>
To: Michael Nosthoff <buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
 version 3.18.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Wed, Sep 22, 2021 at 1:56 AM Michael Nosthoff <buildroot@heine.tech> wrote:
>
> Hi,
>
> On 22.09.21 08:57, James Hilliard wrote:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/protobuf/protobuf.hash               | 2 +-
> >   package/protobuf/protobuf.mk                 | 2 +-
> >   package/python-protobuf/python-protobuf.hash | 2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> > index 2a65156cb3..777f19d6b9 100644
> > --- a/package/protobuf/protobuf.hash
> > +++ b/package/protobuf/protobuf.hash
> > @@ -1,3 +1,3 @@
> >   # Locally calculated
> >   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> > -sha256  51cec99f108b83422b7af1170afd7aeb2dd77d2bcbb7b6bad1f92509e9ccf8cb  protobuf-cpp-3.17.3.tar.gz
> > +sha256  7308590dbb95e77066b99c5674eed855c8257e70658d2af586f4a81ff0eea2b1  protobuf-cpp-3.18.0.tar.gz
> > diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> > index fa8ea890e2..bb9c6bf37c 100644
> > --- a/package/protobuf/protobuf.mk
> > +++ b/package/protobuf/protobuf.mk
> > @@ -7,7 +7,7 @@
> >   # When bumping this package, make sure to also verify if the
> >   # python-protobuf package still works and to update its hash,
> >   # as they share the same version/site variables.
> > -PROTOBUF_VERSION = 3.17.3
> > +PROTOBUF_VERSION = 3.18.0
> >   PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
> >   PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
> >   PROTOBUF_LICENSE = BSD-3-Clause
> > diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> > index 8eca476884..e9a5ac4904 100644
> > --- a/package/python-protobuf/python-protobuf.hash
> > +++ b/package/python-protobuf/python-protobuf.hash
> > @@ -1,3 +1,3 @@
> >   # Locally calculated
> > -sha256  3253c6d17ec0bb6f6382e555cf5ca0a9ffab8d81b691f100f96ce9f5e753018e  protobuf-python-3.17.3.tar.gz
> > +sha256  4f792034070915819065c162a310142d66835333824e2e0a2ca26ed54b013408  protobuf-python-3.18.0.tar.gz
> >   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
>
>  From the Release Notes:
>
> Python
> * Drops support for 2.7 and 3.5.
>
> So I guess we should add a
> depends on BR2_PACKAGE_PYTHON3
> to package/python-protobuf/Config.in

Fixed in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20210922080347.150943-1-james.hilliard1@gmail.com/

>
>
> Regards,
> Michael
>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
