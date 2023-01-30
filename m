Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DB5C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 07:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB12881831;
	Mon, 30 Jan 2023 07:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB12881831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSlASyJZF6Fu; Mon, 30 Jan 2023 07:45:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F638175E;
	Mon, 30 Jan 2023 07:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F638175E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CA811BF3DA
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 07:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25F2A8175E
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 07:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F2A8175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a1EfwZYIq_7d for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 07:45:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF0B38175A
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF0B38175A
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 07:45:28 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x26-20020a056830115a00b0068bbc0ee3eeso1585250otq.0
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 23:45:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L6rt4KiYRguoL5s5IQxi6dbvqucVfNlgMAO8swMlrWI=;
 b=aW3N/O2bJg/aom1SCHPIR09Z2Ko5/jBzPK78ahIdRH5qpevID3FbciRHjuaMWL2GkD
 YTcGmstp8QB46DWOxgTJvWqn/jnQlGNNce4gbTzrA8XBYOaHiUYnShn2WpChz75432Zc
 bMbSNRJcbA8kAtTm3mbiosn7hZBPwDIWsvZeP6ugBfvNLfZnrXlySU7YDyB9bViE017O
 uMUeZ9rJU9UsEj++1gVJe9kp8xOoWGt0QbdTzDgdn0W2d1Uo2O/RpG/ROsg6RZnoyXvo
 lPXesVbtBGQwqVmbF4VYxL0N9YSzxhNNcROGtDuomOwJPPHwmMkRiRrC8QHEOR3Gthnt
 iJ5A==
X-Gm-Message-State: AO0yUKXea/zpqH7ELQcDkiLqXc1cAaVtTL1XUs3GDlbakoYDU4vF/d4r
 eAXGLiKfB8VwG2Yw5MmowLyNaYiE8Mm9zfrfIX4=
X-Google-Smtp-Source: AK7set8kHywJV9ZCOTptjoClVdEFJ/7m8bAxzQoQ5G+CQXWjbBfdaWaCv3Yh6mOjO+/O9Aya+DrPnu7cB3e35b3VjCM=
X-Received: by 2002:a9d:344:0:b0:68b:cd1d:5e1a with SMTP id
 62-20020a9d0344000000b0068bcd1d5e1amr215760otv.47.1675064727770; Sun, 29 Jan
 2023 23:45:27 -0800 (PST)
MIME-Version: 1.0
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
 <20230127141058.2180747-4-james.hilliard1@gmail.com>
 <20230129214507.GY2632@scaer>
 <CADvTj4rYJHfDyhEmtogs0WQ30=FZQH8zWAcuwZMxmebq_iL7xA@mail.gmail.com>
 <20230130071336.GF2632@scaer>
In-Reply-To: <20230130071336.GF2632@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 30 Jan 2023 00:45:16 -0700
Message-ID: <CADvTj4o60wo4WSDdW_+64-kSuyiQXwWHJkpSzoow85=byRXodw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L6rt4KiYRguoL5s5IQxi6dbvqucVfNlgMAO8swMlrWI=;
 b=dfG9bQh4DZzfhcno2zieM9WF7klEIdvJHyj9bX53LxJ2LGK8g3y1mMPr4nqpz9D3n0
 WSoUhPwy43EU+PXKonDgUVsgzEnUxUg5VmTIVOb6SJBTPgDwRr9GP3Qje80TuqIZUeo+
 /tteglcMwb7R3wHcdyPH+877fXgkyDT36VuIEjv9Y5wtAdmFEoW9Hm5fLhFgoA2WSb+S
 zsWSeu+bH960Enk2JznGr3o4lHtEuVinFkX0PgsdrOBshE6rkyhJYd6XJ+iYdwPORkUa
 QMLYgRvN8NqZogaGuqNz4v/EEI3cIbQvw1yaSUm6FeN/UbhumD5U5l+2CxWt/qJ5y5jC
 kNxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dfG9bQh4
Subject: Re: [Buildroot] [PATCH v4 04/13] package/gemmlowp: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jan 30, 2023 at 12:13 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2023-01-29 20:17 -0700, James Hilliard spake thusly:
> > On Sun, Jan 29, 2023 at 2:45 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
> > > For x86, we should probably have code like (what we have as
> > > BR2_X86_CPU_HAS_SSE4 seems to be SSE4.1, but it is not clear whether
> > > there is an actual delta between SSE4 and SSE4.1 [0], so let's be safe
> > > and assume that BR2_X86_CPU_HAS_SSE4 is not enough):
> > >
> > >     ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
> > >     GEMMLOWP_OPTIM += -msse4.1
> > >     endif
> > >
> > > However, that same header seems to also have some detection based on
> > > macros... This needs to be cleared, maybe?
> >
> > Well gemmlowp is effectively a header only library so optimization flags would
> > not be set for the gemmlowp package itself but rather in something like the
> > tensorflow-lite package which consumes the headers AFAIU.
>
> Yeah, I noticed that it was a header-only library only later...
>
> Still, for those packages, gemmlowp, neon-2-sse, maybe fxdiv, they do
> have a requirement that SSE be needed, so they should depend on that.
> For example:
>
>     config BR2_PACKAGES_GEMMLOWP_ARCH_SUPPORTS
>         bool
>         default y if BR2_X86_CPU_HAS_SSE42
>         default y if BR2_ARM_CPU_HAS_NEON
>
> Or:
>
>     config BR2_PACKAGES_NEON_2_SEE_ARCH_SUPPORTS
>         bool
>         default y if BR2_X86_CPU_HAS_SSE3
>
> Otherwise, those packages (notable neon-2-sse) don't make much sense, or
> will be horribly slow...

The tensorflow-lite build system enforces that these header libraries are
present even in cases where they are not used, for example neon-2-sse
isn't always used but tensorflow-lite always enforces that it is present even
on architectures where it is not required/used.

Changing tensorflow-lite to not enforce the presence of these libraries
would be rather complex as they tend to be used via conditional imports
with the presence checks being done in cmake.

Because of this we can't restrict the selection of these header-only libraries
to their compatible architectures without breaking tensorflow-lite.

>
> Can you send a set of patches, please?
>
> Regards,
> Yann E. MORIN.
>
> > Note there's technically an unused deprecated library that gets installed
> > to staging, we don't install it to target since we don't have anything consuming
> > that deprecated interface at all:
> > https://github.com/google/gemmlowp#old-eightbitintgemm-legacy-deprecated-interface
> >
> > >
> > > [0] https://en.wikipedia.org/wiki/SSE4
> > >
> > > Regards,
> > > Yann E. MORIN.
> > >
> > > > +$(eval $(cmake-package))
> > > > --
> > > > 2.34.1
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot@buildroot.org
> > > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > >
> > > --
> > > .-----------------.--------------------.------------------.--------------------.
> > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > '------------------------------^-------^------------------^--------------------'
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
