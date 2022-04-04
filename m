Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39029C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 14:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1A9D40983;
	Mon,  4 Apr 2022 14:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZluXnK948pk; Mon,  4 Apr 2022 14:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD0EF40912;
	Mon,  4 Apr 2022 14:38:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD3A1BF228
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 14:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF9F560701
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 14:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmJAzc1w4vRy for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 14:38:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73565606A0
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 14:38:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6550614E2;
 Mon,  4 Apr 2022 14:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB01C2BBE4;
 Mon,  4 Apr 2022 14:38:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AzvZgAMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649083119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tpAfHKUXxxPuMaqzK3lY3yYumutTHeE9/Do7LWRxRWg=;
 b=AzvZgAMD7vXn6S4IEwPmKfXKJsQPxkf2KwU4ZsSF8sYOFNA3oCmYeI+4/4AJD2dpxbkH11
 vn+QLDWwUHASinFXrMRANYXJHviZD4maC1k8yx1HUmAmpILlXd2hfmMlfWXoLCOhZzn+gv
 RUjPkU8ZfRJIK0lXYV9F6jtGsZCY8nk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b88b4ca8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 4 Apr 2022 14:38:38 +0000 (UTC)
Date: Mon, 4 Apr 2022 16:38:34 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <YksC6gFwwxlDn06C@zx2c4.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
 <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
 <f16f09468ba64eb0bb9d985304daecb4@AcuMS.aculab.com>
 <7bcc0cf7-5759-1ef4-9667-fd8ae0c4741f@mind.be>
 <20220403094236.GF1811301@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403094236.GF1811301@scaer>
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Sun, Apr 03, 2022 at 11:42:36AM +0200, Yann E. MORIN wrote:
> I still fail to understand why this can't be a standalone project.

Please stop whining about this. I'm offering to maintain and support
this as part of projects where the code is relevant to have adhering to
the various customs and conventions of each project. Unless you want to
open your checkbook, I am not offering to start and maintain an external
project. Stop badgering me about this; at this point, I find it quite
obnoxious. I'm not going to spend my time doing that work. I will,
however, as stated numerous times, maintain it diligently inside
projects where it makes sense. Peter made the case that Buildroot isn't
one such project where it makes sense, a decision which I'll respect,
and so I'll look into it elsewhere, and maybe that'll circle back around
to a Buildroot package again. Either way, for the time being and at
least until that happens, your involvement here is done, and I'd
appreciate it if you would cease your pressure campaign on me to take on
volunteer work that I do not agree to do.

Thank you,
Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
