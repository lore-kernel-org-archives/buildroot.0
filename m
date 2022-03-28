Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C42C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 13:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C478282404;
	Mon, 28 Mar 2022 13:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_10dydq0vhS; Mon, 28 Mar 2022 13:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA85E81D11;
	Mon, 28 Mar 2022 13:17:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A739E1BF297
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 13:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 958A981D11
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 13:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lH7PFdaxWedl for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 13:17:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D611817AF
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 13:17:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48A56240018;
 Mon, 28 Mar 2022 13:17:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nYpFm-00F1sa-DR; Mon, 28 Mar 2022 15:17:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <CAHmME9oUAXNpjWF266m3mH5HvEvVWCthy64RHFye+mOktMegzg@mail.gmail.com>
 <20220323200731.170409-1-Jason@zx2c4.com>
 <20220324082433.GA3649946@scaer>
Date: Mon, 28 Mar 2022 15:17:50 +0200
In-Reply-To: <20220324082433.GA3649946@scaer> (Yann E. MORIN's message of
 "Thu, 24 Mar 2022 09:24:33 +0100")
Message-ID: <87fsn2b4ht.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Jason, All,
 > +Peter: candidate for backporting as a security fix

 > On 2022-03-23 14:07 -0600, Jason A. Donenfeld spake thusly:
 >> Writing into /dev/urandom doesn't actually credit any entropy bits. And
 >> while it adds that data to the entropy pool, it won't actually be
 >> immediately used when reading from /dev/urandom subsequently. This is
 >> how the kernel's /dev/urandom has always worked, unfortunately.
 >> 
 >> As a result of this behavior, which may be understandably surprising,
 >> writing a good seed file into /dev/urandom and then saving a new seed
 >> file immediately after is dangerous, because the new seed file may wind
 >> up being entirely deterministic, even if the old seed file was quite
 >> good.
 >> 
 >> This has been fixed in systemd with
 >> <https://github.com/systemd/systemd/commit/da2862ef06f22fc8d31dafced6d2d6dc14f2ee0b>,
 >> and fortunately it's possible to do the same thing in shell script here.
 >> Specifically, instead of just saving new /dev/urandom output straight
 >> up, we hash the new /dev/urandom together with the old seed, in order to
 >> produce the new seed. This way the amount of entropy in the new seed
 >> will stay the same or get better, but not appreciably regress.
 >> 
 >> At the same time, the pool size check in this script is useless. Writing
 >> to /dev/urandom never credits bits anyway, so no matter what, writing
 >> into /dev/urandom is useful and not harmful. There's also not much of a
 >> point in seeding with more than 256 bits, which is what the hashing
 >> operation above produces. So this commit removes the file size check.
 >> 
 >> As a final note, while this commit improves upon the status quo by
 >> removing a vulnerability, this shell script still does not actually
 >> initialize the RNG like it says it does. For initialization via a seed
 >> file, the RNDADDENTROPY ioctl must be used.
 >> 
 >> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

 > Applied to master, thanks.

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
