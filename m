Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A70C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 21:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7419360E33;
	Tue,  5 Apr 2022 21:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPvurS9fAF1N; Tue,  5 Apr 2022 21:12:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BCAE60B75;
	Tue,  5 Apr 2022 21:12:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 521B51BF3A3
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A23D4051C
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4Nj-DQM_yRM for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 21:12:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65419402F3
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 21:12:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44e:a19f:2a4d:fe1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5391019F4F3;
 Tue,  5 Apr 2022 23:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649193174;
 bh=HOheJdXP25mGiRJuzAJDFik9vbrr8XE56Z8T3+aFJd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mv8Gs90+bpfQx6nPXK2n5CoGXNU/BLmJFH7tbxB3a+2FMg5HN7tE9p0Vye8doT0IS
 sYltmJR6NMnqaaej48PCceEuB6JYgE7u1G7OAOxtyx8xFIIVmStmnqxzO/KXloyCCZ
 oSQcyw5/HfxY4Ho6AOZMuGDCUsOAwc1JiCisELsa3pbasOmxN1XsxaggBd2fhBToqk
 i7CQm8bm9NbGzS0eHYx5cp/qkzlgWE8bynldRZQTbBj74k9sM3+bsrKJlpT+FC3P2l
 LRKuZEW4vFdGYVeVPAx/zfhmOOaS50zCJTJSSZZ30dvToKhYyPBoXpdDmnwui3bisl
 HON4Pl27tQrfQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 05 Apr 2022 23:12:50 +0200
Date: Tue, 5 Apr 2022 23:12:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220405211250.GJ2354230@scaer>
References: <20220405025054.966064-1-james.hilliard1@gmail.com>
 <0a44404b-c3f5-677f-cfbe-09a08f41adad@mind.be>
 <CADvTj4pJFiWHQszKZ=ULCtAiS1MbmDS6sdsoV81DTGbn9cBEnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4pJFiWHQszKZ=ULCtAiS1MbmDS6sdsoV81DTGbn9cBEnQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/aufs: don't set invalid
 AUFS_SITE if version is unset
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-04-05 14:09 -0600, James Hilliard spake thusly:
> On Tue, Apr 5, 2022 at 11:19 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 05/04/2022 04:50, James Hilliard wrote:
> > > Fixes:
> > > package/aufs/aufs.mk:24: *** AUFS_SITE (https://github.com/sfjro/aufs4-standalone/archive/) cannot have a trailing slash.  Stop.
> > > make: *** [Makefile:84: _all] Error 2
> >   How do you get this? I've tried a number of configurations, but I always get
> > package/aufs/aufs.mk:21: *** No aufs version specified.  Stop.
> > make: *** [Makefile:84: _all] Error 2
> >   I could only reproduce with `make source`, but that's a bit a special case.
> 
> Something like this seems to hit it:
> BR2_LINUX_KERNEL_EXT_AUFS=y
> # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3 is not set
> BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4=y
> # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5 is not set
> BR2_LINUX_KERNEL_EXT_AUFS_SERIES=4
> BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""
> BR2_PACKAGE_AUFS=y
> BR2_PACKAGE_AUFS_SERIES=4
> BR2_PACKAGE_AUFS_VERSION=""
> # BR2_PACKAGE_AUFS_UTIL is not set

This still produces the expected error that Arnout reported:

    $ make qemu_m68k_q800_defconfig  # just for a config with a kernel

    $ cat <<_EOF_ >>.config
    BR2_LINUX_KERNEL_EXT_AUFS=y
    # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3 is not set
    BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4=y
    # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5 is not set
    BR2_LINUX_KERNEL_EXT_AUFS_SERIES=4
    BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""
    BR2_PACKAGE_AUFS=y
    BR2_PACKAGE_AUFS_SERIES=4
    BR2_PACKAGE_AUFS_VERSION=""
    # BR2_PACKAGE_AUFS_UTIL is not set
    _EOF_

    $ make olddefconfig

    $ grep AUFS .config
    BR2_LINUX_KERNEL_EXT_AUFS=y
    # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3 is not set
    BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4=y
    # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5 is not set
    BR2_LINUX_KERNEL_EXT_AUFS_SERIES=4
    BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""
    BR2_PACKAGE_AUFS=y
    BR2_PACKAGE_AUFS_SERIES=4
    BR2_PACKAGE_AUFS_VERSION=""
    # BR2_PACKAGE_AUFS_UTIL is not set

    $ make
    package/aufs/aufs.mk:21: *** No aufs version specified.  Stop.
    make: *** [Makefile:23: _all] Error 2

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
