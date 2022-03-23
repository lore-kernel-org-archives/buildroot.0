Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E6AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5CF084A89;
	Wed, 23 Mar 2022 20:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ECbLdgntZ7F; Wed, 23 Mar 2022 20:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5F8884A86;
	Wed, 23 Mar 2022 20:06:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE72B1BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C94BA4016C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xh90NS1HXrWD for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:06:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9579D400C4
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:06:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AA77BB82065
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE8CC340EE
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:06:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="f3qNLc5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648066002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aNXB5aH5vMxwtHNjxFq0+izSHTOSh21UN39tPhuIh7U=;
 b=f3qNLc5gGrgpng2YTiSlUDNgxLK4agLKPPlXhQgkDQlGWuEj75FG077cZLbxwEOl3JR2Fj
 YjzhUiqdKU/KrF6dUUjT2QOWZfEqOq3/QKKfL7xOyhK6psiWVHyuFd6g3uCtTpkp9e0+yj
 9knHBN/xVgUknVcZ2RD3nAGd3a3lfUw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cd5c767b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:06:42 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id t33so4712304ybt.12
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:06:42 -0700 (PDT)
X-Gm-Message-State: AOAM532jfCsqt+Hmozid0F6qoCe6NA9ZqPJ3bEPhqAbFq96CAf3HU2Gv
 YNXJFjzUxxyYznTwZpc5BurcCTOD7XlTjHHypSo=
X-Google-Smtp-Source: ABdhPJxP65uW62pdzf+Q7YZnUfVf8nx8cml4oEwNcJ+wQhTg/7DLRTAhdqkRW+VvaZOg0wlyl5XYwshVPTWtaL2o/6w=
X-Received: by 2002:a25:b905:0:b0:61e:23e4:949f with SMTP id
 x5-20020a25b905000000b0061e23e4949fmr1767501ybj.373.1648066001863; Wed, 23
 Mar 2022 13:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220323035233.140997-1-Jason@zx2c4.com>
 <20220323091336.GL1566358@scaer>
In-Reply-To: <20220323091336.GL1566358@scaer>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Mar 2022 14:06:31 -0600
X-Gmail-Original-Message-ID: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
Message-ID: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: hash old seed with
 new seed when saving
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
Cc: buildroot@buildroot.org, =?UTF-8?Q?Christoph_M=C3=BCllner?=
 <christoph.muellner@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Wed, Mar 23, 2022 at 3:13 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > As a result of this behavior, which may be understandably surprising to
> > you, writing a good seed file into /dev/urandom and then saving a new
>
> s/to you//
>
> (no "personal" address in a commit message)

Ack.

>
> > seed file immediately after is dangerous, because the new seed file may
> > wind up being entirely deterministic, even if the old seed file was
> > quite good.
> >
> > I fixed this in systemd with
>
> s/I fixed this/This has been fixed/

Ack.

> > As a final note, while this commit improves upon the status quo by
> > removing a vulnerability, this shell script still does not actually
> > initialize the RNG like it says it does. For initialization via a seed
> > file, the RNDADDENTROPY ioctl must be used.
>
> Is there a way to do that within a shell script? If so, would you be
> kind enough to send a followup patch, please?

No, there isn't, at all. But I'm writing some code now that I hope to
release as a standalone utility, and upstream into busybox/util-linux
that should make it accessible. When that happens, I'll keep this
mailing list informed, and we can move forward then.

> Here's what I suggest instead:

Your suggestion looks good, with a few small tweaks that I'll put in v2.

> I do note that urandom should always return something, but this script
> will also need to work on older kernels, sometimes way back to oldish
> 3.x series, and my recollection of how urandom worked back then is a bit
> fuzzy. Are we sure it will always have returned enough? If so, then we
> can ditch the sanity check altogether.
>
> But then, if we failed to read anything from urandom, we'd just hash the
> old seed, which should not decrease the entropy it had, as the hash has
> the same size as the seed.

Since this isn't crediting anything anyway, I don't think the sanity
check matters. The randomness might be total junk. It might not. We
might get enough. There might be a bug. We don't care, because there's
nothing we can do if it fails from shell, and we're not crediting, so
it's not a security risk so long as we don't regress.

v2 coming up.

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
