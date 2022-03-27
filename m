Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B477C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 20:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5FDE416AC;
	Sun, 27 Mar 2022 20:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jT_G523L0Q5e; Sun, 27 Mar 2022 20:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6B941696;
	Sun, 27 Mar 2022 20:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBE971BF3EF
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA6BA41696
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYAP40aFRLfq for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 20:26:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B2874167C
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:26:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A4F760B60
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71660C340F3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:26:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UvoYDtX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648412813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lJVwmfQN2k38LiF4R0Ir+5lI3KIkisz4XedK5MegqSk=;
 b=UvoYDtX5yDfWx9dgcaveK7ghmY1gFmAhAl+RhumBnEbgnl8Z0bNCONw1qjIYEYOgOsZhyv
 xapxjKemoJZ4WHr70hjhMDomyfUWVLH0XwKsA1B3Ugwj3qw5OCarnLwjeaa60aB4ZyGZvx
 zzGdmDHvB7LovGE4DqeRLpq8qjdUu10=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a0471cf4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:26:52 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2e5e176e1b6so128930087b3.13
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 13:26:52 -0700 (PDT)
X-Gm-Message-State: AOAM532ESSJRRKbC9xZUDXLhVd8DAB51rXJHj0gI4CEnYG1fExgsLbED
 ZlLW3Kd5JpEw672p15+XxwjO0sH14SVfPogunho=
X-Google-Smtp-Source: ABdhPJyBVALpf5t/Y7HYY1NGfJgr8y0P3m7CuG/P+oAY8G/yF9DlnXS/2otrXvdLyr5M6P477A9VZvHKrFL/U9SLXF8=
X-Received: by 2002:a0d:c681:0:b0:2db:9ffe:1f00 with SMTP id
 i123-20020a0dc681000000b002db9ffe1f00mr22536766ywd.100.1648412811779; Sun, 27
 Mar 2022 13:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220327054814.942198-1-Jason@zx2c4.com>
 <CADvTj4rJcC8NQnG4A70VgF6uqzj-xGDxg2nOyRB=jxj4wSLpqg@mail.gmail.com>
 <8fa95711-9442-c1b9-5ddc-9e1c7859f802@mind.be>
 <CADvTj4rETStakpHukCJL4R=wu0fejgdiyjj=Kue9YN=5Bh-YBQ@mail.gmail.com>
 <CAHmME9rXhz48x1HE1+ocMeFm9eponoB=u0WsE6tE2a8Hg6DiwA@mail.gmail.com>
 <CAHmME9qoX5K3_6PC11rZ2iZRtniEm7aVVspq0oYF5+L7vFr4kw@mail.gmail.com>
 <CADvTj4pSUZSb3o2+-OfEROZTa_Ze-pdn0hoDhKFRnzsxUeViog@mail.gmail.com>
In-Reply-To: <CADvTj4pSUZSb3o2+-OfEROZTa_Ze-pdn0hoDhKFRnzsxUeViog@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 27 Mar 2022 16:26:40 -0400
X-Gmail-Original-Message-ID: <CAHmME9p6V4_MLmvxnY1=KAqKdZSKVaQt5cxMSZrens1GJZ6Zng@mail.gmail.com>
Message-ID: <CAHmME9p6V4_MLmvxnY1=KAqKdZSKVaQt5cxMSZrens1GJZ6Zng@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hey James,

On Sun, Mar 27, 2022 at 4:25 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
> Strange, I did use reply all, maybe it ended up in spam?
>
> It appears to have been sent correctly from what I can tell:
> https://lore.kernel.org/buildroot/CADvTj4rJcC8NQnG4A70VgF6uqzj-xGDxg2nOyRB=jxj4wSLpqg@mail.gmail.com/

Indeed I think you're right. MTA issues? I'll investigate.

>
> >
> > I see now you just want an option to do this via environment. This is
> > what I did on OpenRC. I'll send a v2 with that for here.
>
> Yeah, I'm just suggesting a path override since that's trivial to tweak with the
> existing script via a rootfs overlay override but slightly more complex to do if
> one has to modify a binary.

Yep! Already done for the v2:
https://lore.kernel.org/buildroot/20220327202415.1248312-1-Jason@zx2c4.com/

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
