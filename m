Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886F5C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 20:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16E2820A5;
	Wed,  8 Feb 2023 20:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16E2820A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MH8nzbiAkjbM; Wed,  8 Feb 2023 20:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315FC82066;
	Wed,  8 Feb 2023 20:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 315FC82066
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E974A1BF47E
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 20:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3C6740338
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 20:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3C6740338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBdtUxs8TLbO for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 20:05:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1C25400C4
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1C25400C4
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 20:05:42 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id bj22so16500309oib.11
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 12:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s/0Tnk09Q96cg1hvsXhm8KMBjN+K92TYwc35h+Un47A=;
 b=svDkJHCm9BLUooabu7CX/FJHm7R8+Q8PX5Rt6Z/fbMzS0nSyjA7wQoteepBRm+n1h0
 sprDKntBVyhD3udl2fy3pNrM01mqXKju7axP0SJY4NL3MGpO4f74AZxmmvdCntMVRoBZ
 7jwWuRshALg6Xx+vDtRL1HRzIaX9ZKeo8w3cs4kG6Gj8OIzA27mfXfgHLS/nbycupVKt
 57zyYr1wFeb+z+zXnoVEHcSm5pBONWkEqA++9btbhC5Lci2IPRUf334UCyxuB+qQ70hj
 tr1XXHHJoTYSXPnWU1R3KfT9MytSv/LO2FOFsfKTXXuAKHH67TeM5GqZJzWuDswo9ZWc
 NAAw==
X-Gm-Message-State: AO0yUKXqke2OXX5LQtrzMZHqTFYXK7bAjUkksgkuamGjom1M1vVhG5Qu
 n0gYePCzZkB/2BQFhaiPxC/7+TN/bqoNFetv7GA=
X-Google-Smtp-Source: AK7set/kALUOFmmv3Zle14SIzc9j+SKuXbvCtmWGFEW+mhEVrUyuZcqouNeBwSY3Hu2NuyuxgNioxdxI0MgG/lcV1OQ=
X-Received: by 2002:aca:5d89:0:b0:37a:fb74:dc1a with SMTP id
 r131-20020aca5d89000000b0037afb74dc1amr226733oib.18.1675886741820; Wed, 08
 Feb 2023 12:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20221214151958.3419333-1-james.hilliard1@gmail.com>
 <20230208203324.4ccd9dba@windsurf>
In-Reply-To: <20230208203324.4ccd9dba@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 8 Feb 2023 13:05:30 -0700
Message-ID: <CADvTj4pis8QbWjk=cQvWQ2jY9CDQJPQYKGVwvjBO-2Te00y42Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s/0Tnk09Q96cg1hvsXhm8KMBjN+K92TYwc35h+Un47A=;
 b=ApmbRQZmpfMBtUz9KhxLLffk5NSTQN1zO6dZ1+tRJNOAm3QYxSACOaU1jsJQaxWRST
 e1kj7QUDxVa0PENeVJiCWZr2qnM6VndsahcFNqAiZr3cZyn1NyGJwd0DBelNX4F3zygU
 Cb1Ts+Eoqv9EQ3yT5Oh3yOF4ZiNwMhp/+4uC1hlsXh/bjmGTbLnVUMUXa26TprvuneXd
 tT4Im2dmbHPGYj59tlQavNaHbrrICkJM/aL7FlPjkthbYlHwriVoIHxynDQRwEjrAi2h
 Sg05P8O0mKgRd8a9GkUOpH99N+G2dDUS6x4RhP9//rYltX5dM/DAxznpgaED8OChmoCY
 Hoog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ApmbRQZm
Subject: Re: [Buildroot] [PATCH v2 1/1] package/weston: bump to version
 11.0.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 8, 2023 at 12:33 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Thanks for the patch. It overall looks good, but I have one
> question/comment.
>
> On Wed, 14 Dec 2022 08:19:58 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > @@ -73,7 +84,9 @@ config BR2_PACKAGE_WESTON_RDP
> >       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> >       depends on BR2_USE_WCHAR # freerdp
> >       depends on BR2_INSTALL_LIBSTDCPP # freerdp
> > +     depends on BR2_PACKAGE_XORG7 # freerdp-server
>
> It feels really odd that we need to build half of the X.org planet to
> have RDP support in Weston. Is this dependency really needed? Isn't
> that something "wrong" in the freerdp package that should be fixed?

Well there's a long comment in freerdp regarding this issue:
https://github.com/buildroot/buildroot/blob/d0603d853b78c3029cad4150389f8786b5f3e7c2/package/freerdp/freerdp.mk#L100-L121

Anyways for weston I'm just propagating the dependency for now, if
something changes with freerdp regarding the dependency we can drop
the xorg requirement from weston later on.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
