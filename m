Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61774C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 09:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05E3C60C04;
	Sun,  3 Apr 2022 09:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etkuVz_sUapV; Sun,  3 Apr 2022 09:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC7560BF0;
	Sun,  3 Apr 2022 09:42:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51C321BF599
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FCAC8349A
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-D7y7UY5DtP for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 09:42:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D87C8344C
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 09:42:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bcfa:8d59:a850:4621])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B7DD1780377;
 Sun,  3 Apr 2022 11:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648978962;
 bh=Yf1YAbM1iP0ZYyJmkVluiJAI9WF7HGmaVEzLpASe7ak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JKBmLfvm+4tXNpyKlCvHIAl3YuUfSu4KwhC+Ca5FNauqNtcSC8S1YhJDpk2FJy2p5
 gNPafAqlQFgmNtTp5GgG/Ru379qsMhuwoemFJTBIoeQCDh9bAvnjksVosXgVMnaLZV
 9eGQNd4T+8rrYaU0q3NMqgXbCTds+InX3bvo8HUhNwgvRNE1oSqSE7bem6hJuivPXA
 uWq5PhDF+MKrdkCqKIgEAEW30logs8aWR4XvdXHEzuBdpvs94tYdyaNDT0RyCuWgLN
 07sjfzcXsff6z4DM3/qZUWmvQRxq/QTkZawUxDq3iLq3KN+Fk9oqZeRfXtUlBjytzV
 Kqv9NuR8ZAc9A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 11:42:36 +0200
Date: Sun, 3 Apr 2022 11:42:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220403094236.GF1811301@scaer>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
 <871qyj8kpk.fsf@dell.be.48ers.dk>
 <CAHmME9oRxF66kB9U93zTXC9EQq4xYTABPrZ9y2dPfhReAZdTpQ@mail.gmail.com>
 <CADvTj4obQf+p-bES_5NLK85D=TbjqFhVyxNgNTmWtHzY+nAkcQ@mail.gmail.com>
 <CAHmME9rNbxonoOXNV5FQh+AsUbYA4psgZYLUFJm4aZh1ERe9hQ@mail.gmail.com>
 <f16f09468ba64eb0bb9d985304daecb4@AcuMS.aculab.com>
 <7bcc0cf7-5759-1ef4-9667-fd8ae0c4741f@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7bcc0cf7-5759-1ef4-9667-fd8ae0c4741f@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: "'Jason A. Donenfeld'" <Jason@zx2c4.com>,
 David Laight <David.Laight@ACULAB.COM>,
 James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-04-02 19:08 +0200, Arnout Vandecappelle spake thusly:
> On 01/04/2022 13:34, David Laight wrote:
> >From: Jason A. Donenfeld
> >>Sent: 01 April 2022 12:05
> >>On 4/1/22, James Hilliard <james.hilliard1@gmail.com> wrote:
> >>>I should add that I do also think this should be upstreamed to busybox,
> >>>which
> >>>will also reduce the amount of duplicate work as busybox is commonly used
> >>>across many distros.
> >>I'll work on that.
>  +1 to have it in busybox.

I still fail to understand why this can't be a standalone project.

The reasoning offered by Jason is that the code should be included
and duplicated into all and each init systems out there.

However, this increases the maintenance burden, as each implementation
has to be actively tracked (FTR: Jason said he would actively maintain
the implementation in Buildroot, which is very nice of him, so I
understand that he would also do so for all other projects where he'd
have seedrng included).

Instead of having one implementation suitable for every init systems
that use shell scripts, we'd end up with many different and diverging
implementations that each have their own warts and fixes (or worse,
counter-productive fixes that actually decrease the robustness of that
implementation).

On the other hand, having a common project would alow to centralise the
fixes. It would also allow to ensure that changes do not actually break
security. Finally, any evolution, be it fixes or features, would be
easily available to every init systems using the common project.

Furthermore, the level of customisation is very low. All that we can
expect to be customisable is the location where the seeds are stored.
This is already accounted for in the existing seedrng git tree. Using
another hash implementation could be another thing, but there's not
much point here, Blake2 being already pretty strong and known. So there
is probably not much more customisation left to do.

Moving it into busybox might seem a good idea at first, but this would
still make for an n-th implementation to track, and since busybox has a
focus on code size, the implementation there would probably diverge
substantially from the canonical code we saw so far, further increasing
the maintenance burden.

That would also not address distributions that do not use busybox (and
do not use systemd either). Buildroot can even be configured in such a
way, using a sys-v init system with coreutils et al,. and no busybox, in
which case having seedrng only in busybox would still not solve the
problem in such a case. And init systems are not limited to what we can
see publicly; there are maybe hundreds or thousands of such custom init
systems behind private doors. Buildroot even has an option to configure
for such an init system (BR2_INIT_NONE, which really means 'custom').

On a final note: systemd has native support for this feature, and thus
one may argue that the feature is indeed already duplicated there.
However, this is different in two ways: first, systemd needs random
numbers for itself already, very early in the boot, possibly in an
initramfs, so it can't easily rely on an external tool to do that;
second, systemd is already C, so it does not make sense for the feature
to be implemented as an external tool either.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
