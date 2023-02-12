Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0946C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 10:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AB1840452;
	Sun, 12 Feb 2023 10:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AB1840452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhW0-QXXSlxd; Sun, 12 Feb 2023 10:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D842401F1;
	Sun, 12 Feb 2023 10:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D842401F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5370B1BF378
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D00881865
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 10:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D00881865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KnbIdB5Zc1Sm for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 10:22:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE1BB81842
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE1BB81842
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 10:22:29 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-16aa71c1600so12063933fac.11
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 02:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hf6osAFRGTOHzH50TJGFtbGWTiESqgkK2WNl9LpCafY=;
 b=HvzitevcfQHG4UU4YL2pQYsgKOBAcSwakJ7Jzlnm09sfgAXwwqkTLzKVTnztpgksRB
 IrgNdUv9ymxiDEmk7yDT7NTF0pJlnEcCWRbThOC6cNS190WahWYrJ+zRAXklr6oVNWwi
 isauOBkr9ag8H3E3l+UApX22TnSdriy720d4FNNRi5tKR0EfJdE6sJgmKvMhY5J3Jkai
 CRK+FUVSnmADOReCPMsju+7OLP987pEscqRfdSyueSs1+ZWJwP3Uq1azy2vGwkD2TISn
 VfDe/Aqfd39Q4KQHd8XIP1KXylptlMWb5V6uknpsYwgvzwt0DlxUc4p8kAfOY6ddv2C6
 pR+A==
X-Gm-Message-State: AO0yUKV9GtPG521M4KlWrap8G0gGsaeOp1fhWxAhORI8dCN65KVUaeC1
 RjiWQkcRdyIB15hs6XIjAPYAboZvsp8Utt47of8=
X-Google-Smtp-Source: AK7set/gWP22gET0sw4AmH8QrXMAJMPv0jSxukJMxDgO1WDCrieMmfN/+WbMGjeFfd7iBNvb/sSS6chfm7wFAyiXjg0=
X-Received: by 2002:a05:6870:829e:b0:16d:f057:bf55 with SMTP id
 q30-20020a056870829e00b0016df057bf55mr183294oae.93.1676197348643; Sun, 12 Feb
 2023 02:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20221018034605.800593-1-james.hilliard1@gmail.com>
 <20230212094205.GK2796@scaer>
 <CADvTj4oC6WXD=n3zMyBMZuCiZvra3PztQ9YhpDfZ72cJqeq0SQ@mail.gmail.com>
 <20230212101112.GL2796@scaer>
In-Reply-To: <20230212101112.GL2796@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 12 Feb 2023 03:22:17 -0700
Message-ID: <CADvTj4rnf9zZfsX54nqQONjUdoR-Ok13d=oi9oJRfw6tnP7adA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hf6osAFRGTOHzH50TJGFtbGWTiESqgkK2WNl9LpCafY=;
 b=ZU1oNfKQwdHADtSPQ+9Ac7P8gO74RREYwXCjlp1kzLvUD9U9KvGZvH20s1LdIkmjE9
 Y+MxdV1Faib+z14V1J5TMXkj19H4eRXkW5Ff8y55gxoB4rBQ4vwi2JKpZTHr/r7QAmRh
 +xtgn/3KwDNENzdBwkeNMzlUqxm/RiBLLHa6G4PP6ZCh6FvKvqhrWZoKu6UvS8CpNXzO
 DHC2B3kpJS23KxSKIiGpikxixsYdNnWk+2LddSpz7I7mL4BqVmCsL55u/7fw7JRWwWGs
 9ZKnqyXjp3cnLDM5wcQo2t6B8vTqggbb4koqFLX2/Vhm5M5OPVJz2NZyAhNvjGN+HjcP
 zmtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZU1oNfKQ
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order
 for re{install, build, configure}
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Feb 12, 2023 at 3:11 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2023-02-12 03:02 -0700, James Hilliard spake thusly:
> > On Sun, Feb 12, 2023 at 2:42 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2022-10-17 21:46 -0600, James Hilliard spake thusly:
> > > > To ensure the evaluation order is always correct use double colon
> > > > rules to make the evaluation order explicit as per make docs:
> > > >
> > > > The double-colon rules for a target are executed in the order they
> > > > appear in the makefile.
> [--SNIP--]
> > > So, I'd like that we get another way to fix that, if possible...
> > I have unfortunately not found any other method to fix the execution
> > ordering...
>
> What about something along the lines of (untestd!):
>
>     $(1)-rebuild: $(1): $(1)-clean-for-rebuild
>     $(1)-rebuild: $(1)

That would appear to be invalid syntax.

>
> We already use such a construct in package/pkg-kconfig.mk, but only
> once, so this is not as if it were widespread either...

I don't see anything like that there, just this which isn't doing anything
unusual with multiple prerequisites that require a specific execution
order like the re{install,build,configure} rules in pkg-generic.mk:

# Force olddefconfig again on -reconfigure
$(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure

$(1)-clean-kconfig-for-reconfigure:
    rm -f $$($(2)_DIR)/$$($(2)_KCONFIG_STAMP_DOTCONFIG)

>
> Still, I think it is more easy to read...
>
> Regards,
> Yann E. MORIN.
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
