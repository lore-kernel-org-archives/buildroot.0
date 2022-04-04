Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1537AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 14:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8B9582512;
	Mon,  4 Apr 2022 14:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GhhblzRJur4F; Mon,  4 Apr 2022 14:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C1E829AF;
	Mon,  4 Apr 2022 14:40:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E47631BF228
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 14:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFEBE40949
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 14:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tOx2hTOPRPXS for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 14:40:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D6AC409E1
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 14:40:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F8C56155D;
 Mon,  4 Apr 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86848C340F2;
 Mon,  4 Apr 2022 14:40:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="d1LTQPTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649083211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3XPy1ryU7VZ3mgkr+vzYPQiFXayej42GdnMTCXhCukM=;
 b=d1LTQPTYyQbe20KoelyDfYEE1I3sdDAE/dmRGk1LUaJjk0XCfpWEWE9DZCkwJ2jD1tKTSO
 qysqcuzOSyRWZ3xSfwSVHB6ozfxPLTvtYR67CeF/m61XANWK24ZuzIrwmOTM7zvekVFTBU
 obldOzVuwmHbda8YrcLy0qQQxfeJvDE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba88300a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 4 Apr 2022 14:40:10 +0000 (UTC)
Date: Mon, 4 Apr 2022 16:40:07 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <YksDR4W8OvcHB3pv@zx2c4.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
 <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
 <f16f09468ba64eb0bb9d985304daecb4@AcuMS.aculab.com>
 <7bcc0cf7-5759-1ef4-9667-fd8ae0c4741f@mind.be>
 <20220403094236.GF1811301@scaer>
 <CADvTj4pxMsrUmzx3VRMXHnJ1sFV-d7=q7sLVvTxvRoRosKEsCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4pxMsrUmzx3VRMXHnJ1sFV-d7=q7sLVvTxvRoRosKEsCg@mail.gmail.com>
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
Cc: David Laight <David.Laight@aculab.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On Sun, Apr 03, 2022 at 05:13:06PM -0600, James Hilliard wrote:
> Maybe it should also be upstreamed to util-linux?

Yea it might make sense there indeed; it's something I'm looking into.
I'll let this list know the results of all this in ${TIME_INTERVAL} when
things land various places, and I'll CC you on submissions I make.

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
