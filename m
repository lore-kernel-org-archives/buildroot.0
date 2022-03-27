Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AA2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 20:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F341832EB;
	Sun, 27 Mar 2022 20:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UljwlGbm0o6t; Sun, 27 Mar 2022 20:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A67382C84;
	Sun, 27 Mar 2022 20:10:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3E071BF3EF
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEF354017E
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGyheCoNCpLh for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 20:10:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4A7140111
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:10:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF764B80DB8
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA52C340ED
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:10:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ndKKTqCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648411846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VJGOed45tk0SoIpLVl3zG5gwXvx43zuw3WKLSxTorTM=;
 b=ndKKTqCXYKx9M5n9Zu1vMIZG94dxgFuXZe2dVQ7GJkiJ6LRRqtmYwrIlWTqaPkmk9AH1pJ
 0O3BZnAIN9FjaUjLqj/BhQRRJ2lKFlvZjVhRGr5CfGk3nzEutuwDZq4DXuc5mYVFiPO/jj
 ibWO9laa+XbTU2uICsuyOQQ8GO/qzwY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1227f6a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:10:46 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-2e64a6b20eeso128946877b3.3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 13:10:46 -0700 (PDT)
X-Gm-Message-State: AOAM532ZsQYMcOqn9YpUT1lMDLaNax8WpCgMrwMxSpByv+FCMiXRCFMq
 7iFGshWsHfn7vRWlP8KubDxQYMB2mupbsdVA1sI=
X-Google-Smtp-Source: ABdhPJzdgF7SNSgXKdcN/mTagyDwucAjAbG0bKcy5CdeCiSNN4OO4cPuDpDGsTyKzheRDAwPdt8bOajg7jgffULJqmc=
X-Received: by 2002:a0d:d508:0:b0:2e5:d9ec:d668 with SMTP id
 x8-20020a0dd508000000b002e5d9ecd668mr22439099ywd.499.1648411845776; Sun, 27
 Mar 2022 13:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220327054814.942198-1-Jason@zx2c4.com>
 <CADvTj4rJcC8NQnG4A70VgF6uqzj-xGDxg2nOyRB=jxj4wSLpqg@mail.gmail.com>
 <8fa95711-9442-c1b9-5ddc-9e1c7859f802@mind.be>
 <CADvTj4rETStakpHukCJL4R=wu0fejgdiyjj=Kue9YN=5Bh-YBQ@mail.gmail.com>
 <CAHmME9rXhz48x1HE1+ocMeFm9eponoB=u0WsE6tE2a8Hg6DiwA@mail.gmail.com>
In-Reply-To: <CAHmME9rXhz48x1HE1+ocMeFm9eponoB=u0WsE6tE2a8Hg6DiwA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 27 Mar 2022 16:10:34 -0400
X-Gmail-Original-Message-ID: <CAHmME9qoX5K3_6PC11rZ2iZRtniEm7aVVspq0oYF5+L7vFr4kw@mail.gmail.com>
Message-ID: <CAHmME9qoX5K3_6PC11rZ2iZRtniEm7aVVspq0oYF5+L7vFr4kw@mail.gmail.com>
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

Hey again,

Oh, I didn't see the whole conversation because you failed to reply
all. Please keep me in the CC, as I have list mail turned off.

I see now you just want an option to do this via environment. This is
what I did on OpenRC. I'll send a v2 with that for here.

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
