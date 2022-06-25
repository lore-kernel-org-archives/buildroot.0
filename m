Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3A3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 17:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C38B3416BE;
	Sat, 25 Jun 2022 17:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C38B3416BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id noVYPYNWpvPA; Sat, 25 Jun 2022 17:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E8A416C5;
	Sat, 25 Jun 2022 17:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E8A416C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D70EE1BF389
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 17:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3CC96079D
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 17:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3CC96079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLopBMol46b5 for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 17:54:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D91160777
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D91160777
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 17:54:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:61fc:46f7:8c1:31c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AC5A05FF88;
 Sat, 25 Jun 2022 19:53:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Jun 2022 19:53:55 +0200
Date: Sat, 25 Jun 2022 19:53:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220625175355.GF2608@scaer>
References: <82b5bbe664c06c5864debb660850e0cf@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82b5bbe664c06c5864debb660850e0cf@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656179638;
 bh=zHYIKP4oMTATMUapbLCtRmwDsrMQ9S6GkVFipqacC9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YCitR3pdT8U1OFktuT0YeoC6IEtVsMOUrj814+h9vzrEYrTJOrF7o4GObZD5O8pi7
 PYR5ggpzbMVqsqYUGdvgI9rETqVZ0/Wgc/Iw0Jbl/nZzZ0d81QTVhlUYSU3M+mpeYR
 vUhRNocNzkPhjGebC6BCfOauftArlj3ZF81842DpdBjg4PCE2GgEHMc90235RQA0yd
 7sTfnYd2drhRs1v7nDQMqrRTNZ7F3iwx8I4erPV9dvlQHHA5qYyfU1QTsyaCop/cML
 8zGUJy/Hypkpm/hOuDXvE9RnDKMdtf/1RJ2WK005DvqYq0pd/vryLK6G06LXDsfOyc
 octd9P13eLb1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YCitR3pd
Subject: Re: [Buildroot] Build error when building two GRUB2 configurations
 (race condition)
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
Cc: kory.maincent@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2022-06-25 09:44 -0700, Stefan Agner spake thusly:
> In Home Assistant OS we use the capability to build two GRUB2 binaries
> by enabling these two configurations:
> 
> BR2_TARGET_GRUB2_I386_EFI=y  
> BR2_TARGET_GRUB2_X86_64_EFI=y
> 
> Every now and then a from scratch build seems to fail with the following
> error:
> 
> config.status: creating config-util.h
> In file included from ../include/grub/disk.h:***,
>                  from ../include/grub/file.h:26,
>                  from ../grub-core/kern/emu/hostfs.c:23:
> ./config.h:38:10: fatal error: ./config-util.h: No such file or
> directory
>    38 | #include <config-util.h>
>       |          ^~~~~~~~~~~~~~~
> compilation terminated.

I had the same issue even with a single grub2 config enabled. This is a
grub2 issue, and it was supposedly fixed with upstream commit
42f4054faf3c (Makefile: Make libgrub.pp depend on config-util.h) and we
do have this patch backported as:
boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch

We currently have grub2 2.04, almost three years old now; we currently
carry 149 backported patches. This is getting insane. We should update.

grub 2.06 has been out for a year now, but there are already a lot of
commits applied in the tree.

I think we should just bite the bullet and bump to the current HEAD of
the repository.

We have (indirect) runtime testing for grub2, so we can at least check
if bumping is not breaing those (TestIso9660Grub2Hybrid is a two-grub2
build configuration):
    support/testing/tests/boot/test_edk2.py
    support/testing/tests/fs/test_iso9660.py

New runtime tests to explicitly test grub2, added before we bump, then a
bump, would be nice. Hint, hint. ;-)

> At least in this instance it seems to be the second configuration
> x86_64-efi which fails (as the previous >>> grub2 2.04 Building i386-efi
> succeeds).

This is a race condition. As all good race conditions, who wins and who
lose is totally arbitrary... :-/

> The full build log can be found here:
> https://pipelines.actions.githubusercontent.com/serviceHosts/dff1d65b-5367-4f4f-a0ee-c2bf0f874fbd/_apis/pipelines/1/runs/8778/signedlogcontent/14?urlExpires=2022-06-25T16%3A32%3A02.7601449Z&urlSigningMethod=HMACV1&urlSignature=c9ayjKpOOIoTexbMMXYB8A1G6UwmGfhBwTdtxTE3wmI%3D
> 
> I haven't dig into it really, maybe someone with some familiarity of the
> GRUB2 (multi-platform) build system has some idea?

Their Makefiles are, err... interesting. I did have a look a while back
to try and solve that exact issue, and was relieved to see that they
supposedly had a patch already. Once I found it was not enough, I did
not dare look back at the Makefiles again, sadly...

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
