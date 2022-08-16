Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A73C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 21:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBC8F826EA;
	Tue, 16 Aug 2022 21:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBC8F826EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9s-ZTn2IAdf; Tue, 16 Aug 2022 21:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0244581992;
	Tue, 16 Aug 2022 21:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0244581992
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 757BA1BF84C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FCD24167D
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 21:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FCD24167D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPg9Mh5F2jhP for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 21:37:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E71234156E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E71234156E
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 21:37:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 806371BF203;
 Tue, 16 Aug 2022 21:37:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oO4G1-009nP2-I5; Tue, 16 Aug 2022 23:37:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
 <20220816210334.GP2854108@scaer>
Date: Tue, 16 Aug 2022 23:37:53 +0200
In-Reply-To: <20220816210334.GP2854108@scaer> (Yann E. MORIN's message of
 "Tue, 16 Aug 2022 23:03:34 +0200")
Message-ID: <87bksjc1ji.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH next] toolchain/toolchain-buildroot: default
 to glibc as the C library
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2022-08-15 22:29 +0200, Thomas Petazzoni via buildroot spake thusly:
 >> This is perhaps the most controversial change for Buildroot that can
 >> be written in a two-liner.
 >> 
 >> Historically, we have used uClibc as our default C library, as
 >> Buildroot was created initially as a test-bed for uClibc, and also
 >> because uClibc made a lot of sense for embedded Linux systems, due to
 >> its smaller size and fine-grained configurability.
 >> 
 >> Since then, the landscape of embedded Linux systems has changed. Even
 >> though Buildroot happily supports really low-end devices, the vast
 >> majority of Buildroot users are quite certainly running the resulting
 >> system on a reasonably powerful platform, with significant amount of
 >> RAM and storage. In this context, the benefits of uClibc are no longer
 >> that much relevant, and glibc causes less "troubles". Therefore, this
 >> patch proposes to use glibc as our default C library when using the
 >> internal toolchain backend instead of uClibc.
 >> 
 >> Of course, we will keep the support for uClibc, which remains an
 >> important C library choice, for space-constrained systems, or simply
 >> for architectures that are not supported by glibc.
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > Yes, I will be a bit sad that we demote uClibc-ng, but let's face it:
 > the word moves on, let's move along.

Agreed.

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
