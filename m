Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F72C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 14:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 825CA84207;
	Thu, 24 Mar 2022 14:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOjadHJArTeF; Thu, 24 Mar 2022 14:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A04A5841E4;
	Thu, 24 Mar 2022 14:40:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5411BF3E1
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 14:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5619C60D5C
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 14:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4IhG7TQc-Nya for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 14:39:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA94A60D51
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:39:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 215C3616F3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6757BC340ED
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:39:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="g0TDWYzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648132796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bDKPqgFxQtGKVx/kXXgYyZO2eXJGUOkQIueI+hF7Jj4=;
 b=g0TDWYzuTxXDpFgb8yxdhCkJq0cGddpuG68RRWd7RH8SY+QJjIB9BphbkNQcM+hh0WwApZ
 zONGeEgsjP8aZVmKCXEzdPxxEcyntk9X3iWEIpWjV2oLTTSyzsmrL7qexAmM/7Bs1knurm
 oWnbVkDey7Pi2+sMOWOdK34vWhwXNaI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0388d3a3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:39:56 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2e6650cde1bso52707017b3.12
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 07:39:56 -0700 (PDT)
X-Gm-Message-State: AOAM533WiBpOJcZHBUGIBgwpbc5O/tM+c4T378XGTp0ZbWBDAMX0mnwA
 WF/h7lWNwq7zopVp5MOEbmEHi+qMhgEpcYhezNY=
X-Google-Smtp-Source: ABdhPJzu3fpTI7hsGVZegAkmPJ5ex7DdZiIU0jDObnAwIJkAiekeiPDGCd64T/YJ6SI5tXTer7jbmhvTId3BZ8zwlYY=
X-Received: by 2002:a81:8984:0:b0:2db:6b04:be0c with SMTP id
 z126-20020a818984000000b002db6b04be0cmr4880501ywf.2.1648132795714; Thu, 24
 Mar 2022 07:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com> <20220324082433.GA3649946@scaer>
 <be8ccaa597e343698f32663cfb937c2a@AcuMS.aculab.com>
 <CAHmME9p4sXHZB_jUfCwJ3bDZH71pCu2oaS0arSNCCogB6F+q=w@mail.gmail.com>
 <859deab97eb947eb9114cf491c871a00@AcuMS.aculab.com>
In-Reply-To: <859deab97eb947eb9114cf491c871a00@AcuMS.aculab.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 Mar 2022 08:39:44 -0600
X-Gmail-Original-Message-ID: <CAHmME9qQJcXxt7HpM84erdoQmAacLbKrJRDyC=V=hnkTeu=+Ew@mail.gmail.com>
Message-ID: <CAHmME9qQJcXxt7HpM84erdoQmAacLbKrJRDyC=V=hnkTeu=+Ew@mail.gmail.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [Buildroot] [PATCH v2] package/urandom-scripts: hash old seed
 with new seed when saving
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi David,

On Thu, Mar 24, 2022 at 8:31 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Jason A. Donenfeld
> > Sent: 24 March 2022 13:54
> >
> > On Thu, Mar 24, 2022 at 3:15 AM David Laight <David.Laight@aculab.com> wrote:
> > >
> > > From: Yann E. MORIN
> > > > Sent: 24 March 2022 08:25
> > > >
> > > > +Peter: candidate for backporting as a security fix
> > >
> > > Probably not - the security fix is the code that actually
> > > initialises the RNG.
> >
> > No. The security fix here is that the old and new seeds are hashed
> > together so that the new one doesn't regress in entropy. Yann is
> > correct.
>
> But there is no entropy, you've never let the system collect any.
>
> It is still completely broken.

You misunderstand the problem. An initial seed might be derived from
some external source and be high quality. The goal is for the next
seed, generated on-device, to be not lower quality. Prior to this
patch, it might become lower quality. With this patch, it now doesn't
regress in quality.

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
