Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76781C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 14:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB7C2829AF;
	Mon,  4 Apr 2022 14:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I33YOOQWdcji; Mon,  4 Apr 2022 14:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 015A182531;
	Mon,  4 Apr 2022 14:32:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 576291BF228
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 14:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44DD860FE1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 14:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6uxeliqGGU4 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 14:32:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 890AF60FDF
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 14:32:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44C8B614B6;
 Mon,  4 Apr 2022 14:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1DDC2BBE4;
 Mon,  4 Apr 2022 14:32:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZBivxllA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649082763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TnTPSKoBlASTlHgsYZSBhwA6WXcHfxpxpRkeL0v0FVk=;
 b=ZBivxllA1l8M0YAyPo7W18Nfu147H0OeyCsnuvT7up2w3mZWNlqW2KMdOpszIoJT1b4HCO
 0UzFwE0KeYSgRutSpbuS42XUmExWyC5+r4CK5pV31Y4KQudhO695GD5GnnBWEztDGVRK3t
 VYLp7h1kmDsOP82M8hv1yZ4akoNhH8A=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d6a06b96
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 4 Apr 2022 14:32:42 +0000 (UTC)
Date: Mon, 4 Apr 2022 16:32:31 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <YksBf2yIIBasfDiW@zx2c4.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
 <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
 <f16f09468ba64eb0bb9d985304daecb4@AcuMS.aculab.com>
 <7bcc0cf7-5759-1ef4-9667-fd8ae0c4741f@mind.be>
 <2d5e8287df984f16b4b90e8a2921d399@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d5e8287df984f16b4b90e8a2921d399@AcuMS.aculab.com>
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi David,

On Sun, Apr 03, 2022 at 07:30:23AM +0000, David Laight wrote:
> >   AFAIU (but neither the commit message nor the seedrng about page explain it)
> > the Blake2 algorithm was simply chosen because it's small. Any hash function
> > should be fine. There's sha1, sha2 and sha3 in libbb, so I guess one of them
> > should have all the desired properties.
> 
> The unrolled blakes2 is typically 5kb of object code.
> The unrolled code is better for large buffers,
> but just fetching the code to the I-cache will
> significantly affect performance for small buffers.
> I really ought to sit and measure the cutoff.
> 
> The code is:
> [...]

Yes, yes, I know: you've been peppering my inbox about BLAKE2s for a few
months now. :-) By the way, for the kernel, you still haven't sent
me any real patches yet. Happy to look at whatever code with benchmarks
you have available.

Anyway, for busybox, I'll likely be using something already in libbb, so
no worries here.

Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
