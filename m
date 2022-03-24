Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F3BC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 13:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CDEF4002B;
	Thu, 24 Mar 2022 13:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id todNRuCAi4O7; Thu, 24 Mar 2022 13:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11816400D6;
	Thu, 24 Mar 2022 13:54:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 215911BF40A
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 13:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D15960BD1
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 13:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vn0l8OUYtp7S for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 13:54:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4E11606F5
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:54:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70DD760F34
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7658C340EC
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:54:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LMoweYu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648130081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bC4UEJa4msuJ/qh1OWrCztt8UTQ8zrnreqwNgd/pirM=;
 b=LMoweYu2N7EpwwMwSkUJQYXGDMbwfDFOh/vMr5zuT3u3ck2861mrk8mXkBeOWIf/YBC7qs
 Jk1WvXJw6qKe3hZyiH8F5AjhkZbj8Jz6VyQz7OFDcpznEVb5hpRFPwfe28HnVJCe+GUWEK
 ZC2N9Bfo0scKHymY9Dg8aMRF9sTTpWQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d04e5b8c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:54:41 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id g24so8527157ybj.13
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 06:54:41 -0700 (PDT)
X-Gm-Message-State: AOAM531o5neQ0BUtVpkONweak5P+Oy5lDYxAI+/qz4/jCnI5TREFLB8F
 JlPFvsjfRrsvrMrraR72WDqtcr+94FZuaFT6bc4=
X-Google-Smtp-Source: ABdhPJxWj/8tKZzH5iQiQXIKl1EbhGIGuSh9DEF3w1HClvd6jDRwsnWO+y3BKwxHGp4HJ44M6JQi1ZpG+CqW2k5la0E=
X-Received: by 2002:a25:b854:0:b0:633:8a00:707a with SMTP id
 b20-20020a25b854000000b006338a00707amr4635301ybm.637.1648130079895; Thu, 24
 Mar 2022 06:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com> <20220324082433.GA3649946@scaer>
 <be8ccaa597e343698f32663cfb937c2a@AcuMS.aculab.com>
In-Reply-To: <be8ccaa597e343698f32663cfb937c2a@AcuMS.aculab.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 Mar 2022 07:54:28 -0600
X-Gmail-Original-Message-ID: <CAHmME9p4sXHZB_jUfCwJ3bDZH71pCu2oaS0arSNCCogB6F+q=w@mail.gmail.com>
Message-ID: <CAHmME9p4sXHZB_jUfCwJ3bDZH71pCu2oaS0arSNCCogB6F+q=w@mail.gmail.com>
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

On Thu, Mar 24, 2022 at 3:15 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Yann E. MORIN
> > Sent: 24 March 2022 08:25
> >
> > +Peter: candidate for backporting as a security fix
>
> Probably not - the security fix is the code that actually
> initialises the RNG.

No. The security fix here is that the old and new seeds are hashed
together so that the new one doesn't regress in entropy. Yann is
correct.

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
