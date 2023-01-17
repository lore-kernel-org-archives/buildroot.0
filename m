Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B355C3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 07:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01A8381951;
	Tue, 17 Jan 2023 07:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01A8381951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05Nv5ab6GzXx; Tue, 17 Jan 2023 07:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B8C681E43;
	Tue, 17 Jan 2023 07:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B8C681E43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60A531BF321
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 07:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AAE5417AB
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 07:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AAE5417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrjtBNerccqP for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 07:57:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC01C417A5
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC01C417A5
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 07:57:28 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id p188so33026902yba.5
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 23:57:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DnkyNZbhJmnOa1CSU1w7m1Mprt+ppXwb9tRD7L1keu8=;
 b=u/LNmfzDttV4aMhKCsjdkpzh3lfOWGU6CHbFuUo70d3eStLeM1yZBmQ7yhwL73bS6C
 Y7f2mqVb09sS4ystglxQrRAq0TfYGRP6U5ytbM88NjiOmMYP+ByW+2r/kp1q1C7ZXs3a
 CK4QQOdLzk71EhuPWnEOLRE84Mp1LpZnaGNJZk56LDkEA2+XtCVXGdk0TjuUr4+oJs0U
 lGfPW2L3BTXWOZskGXhWW3KCOi02kceCrXvIUA1+ATHYaUd551nXnWDHg3FWcf8yx8uB
 VNnxAGvwLBYqK7pZBH4nSSQOjbsd/DKIyu5MtmDELofeu7ELzdFTFIBOQFSqCl45VcfQ
 dCPg==
X-Gm-Message-State: AFqh2ko34XSYDYvv7IUIiZr/WJUCjnHVogz5zF+HcIsbWHaqcvZH/REQ
 KPNXHaOWIlfUuEyW9/Z94s4AMKi+arLxlu2LS/3YBXyQpK0=
X-Google-Smtp-Source: AMrXdXvUyU2O9Lzq8EdHnYZ9Zk18nhOnBuhif0yUAu9ymQOj+GLgNKfm4Zih3RDkfKLfM3hGCCGww6yo+ou5hO54Pew=
X-Received: by 2002:a25:8287:0:b0:707:103:a56 with SMTP id
 r7-20020a258287000000b0070701030a56mr261421ybk.466.1673942247543; 
 Mon, 16 Jan 2023 23:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20230116080513.21407-1-yegorslists@googlemail.com>
 <20230116212444.GH2770@scaer>
In-Reply-To: <20230116212444.GH2770@scaer>
Date: Tue, 17 Jan 2023 08:57:16 +0100
Message-ID: <CAGm1_kuifU41S1+Yr4eEX90AwA7CXnFtDVr+GES2SewO1PmagA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DnkyNZbhJmnOa1CSU1w7m1Mprt+ppXwb9tRD7L1keu8=;
 b=jTkcsqakm+hsHnMuXAHifCu8etcNgzZ/454S+NsS7Foi7zgBizo2292JuuQu1Mcu38
 aj/4ICtp2TDKxXeU50ccaeZuKhN1KQjFAqAksE5rrb3GxvVXW/xWX7zJgMUZq9w/1rWI
 zcEWM1h/upxebjSQNa6pOyYG/X7YnIlzezMWgZAQHq4OaiWn2mbg3QJtTmXO5Q5Mygc0
 lz/HAHULOyXINzeJ3GIq8ZrkMJA4lQndWEFw+Gu1TABqY3/dooc3XuJX73FNWmqTePXs
 H8oFBYf65jumXfQSt9sLEu5/1c6TpYfvkcz1+mLb/38t37vSRSjN2A+ppRSmppi3JRam
 eUXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jTkcsqak
Subject: Re: [Buildroot] [PATCH] package/util-linux: add an option to enable
 irqtop
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

On Mon, Jan 16, 2023 at 10:24 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Yegor, All,
>
> On 2023-01-16 09:05 +0100, yegorslists--- via buildroot spake thusly:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > irqtop is an IRQ monitoring tool.
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/util-linux/Config.in     | 7 +++++++
> >  package/util-linux/util-linux.mk | 1 +
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> > index 917f1bc2b4..c7e4d2d8bc 100644
> > --- a/package/util-linux/Config.in
> > +++ b/package/util-linux/Config.in
> > @@ -161,6 +161,13 @@ config BR2_PACKAGE_UTIL_LINUX_IPCS
> >       help
> >         Show information on IPC facilities
> >
> > +config BR2_PACKAGE_UTIL_LINUX_IRQTOP
> > +     bool "irqtop"
> > +     depends on BR2_USE_MMU # libsmartcols
> > +     select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
>
> I was about to apply this, but I am a bit conflicted... Building irqtop
> defaults to 'yes' for linux systems, when --disable-irqtop is not
> specified (unless I misread util-linux' configure.ac).
>
> So, today we are providing neither --enable-irqtop nor --disable-irqtop,
> which means that it is in practice always built.
>
> But with your change, it means that now it is by default disabled.
>
> So I wanted to add 'default y' for legacy reasons, but we have no other
> option in util-linux that defaults to 'y', so it would have been a bit
> odd to do so...
>
> Or maybe I am just too tired to think straight...
>
> Thoughts?

irqtop is a rather new tool and it is not listed in the
BR2_PACKAGE_UTIL_LINUX_BINARIES help text. Perhaps, it is not that
problematic that it is not enabled by default.

I've sent v2 with the added ncurses dependency.

Regards,
Yegor

> Regards,
> Yann E. MORIN.
>
> > +     help
> > +       Show information on IRQs
> > +
> >  config BR2_PACKAGE_UTIL_LINUX_KILL
> >       bool "kill"
> >       help
> > diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> > index b53b94ec31..87ec3c19d7 100644
> > --- a/package/util-linux/util-linux.mk
> > +++ b/package/util-linux/util-linux.mk
> > @@ -136,6 +136,7 @@ UTIL_LINUX_CONF_OPTS += \
> >       $(if $(BR2_PACKAGE_UTIL_LINUX_IPCMK),--enable-ipcmk,--disable-ipcmk) \
> >       $(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
> >       $(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
> > +     $(if $(BR2_PACKAGE_UTIL_LINUX_IRQTOP),--enable-irqtop,--disable-irqtop) \
> >       $(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
> >       $(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
> >       $(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
> > --
> > 2.17.0
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
