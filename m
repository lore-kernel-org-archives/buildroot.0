Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A205FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 08:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4224F8449D;
	Sat,  9 Apr 2022 08:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0X3Jl7LX5YIW; Sat,  9 Apr 2022 08:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D8B843A4;
	Sat,  9 Apr 2022 08:40:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B81ED1BF5B4
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 08:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4FB241E09
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 08:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dZjPxXCmOEk for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 08:40:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E368441E07
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 08:40:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:10c3:7744:3dd:93e7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8C99519F58A;
 Sat,  9 Apr 2022 10:40:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649493619;
 bh=ThGqBOMzZUdX/GjLyBlDAlA1k40IV/NMneO4ZAw4/Ls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DclcDiykVzhstee0Wk5z8zC/RNCcY2UDFN/A/jex4vTQkUV4jh+pxR56Qh5FzQO0f
 em7T9dnSO6Z7UgONUldvkgXQW3vd6Ouyb/LrIXOu00iHZ1A7Rh/bmWECUUchfhO5XR
 mvegoNqZZyWjh17en9LSDsun2qchwt3v+9ii61/BpCseR/63sRQLMS+m3u9VUE/6h7
 NRnBQWQn1QrpWeMCv2Jjk2TPuDZn+6U/9+QYjBExhisekkyPFE969eHfr3eieaVmPx
 b/ed5rcFzNWBYq0QlAYrm/4+LzYa+vuewMSOiapGVZpibFvJJUZYYHnSon3CMEULXf
 swz5nMAczudJw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 09 Apr 2022 10:40:15 +0200
Date: Sat, 9 Apr 2022 10:40:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220409084015.GA3378418@scaer>
References: <20220405025054.966064-1-james.hilliard1@gmail.com>
 <0a44404b-c3f5-677f-cfbe-09a08f41adad@mind.be>
 <CADvTj4pJFiWHQszKZ=ULCtAiS1MbmDS6sdsoV81DTGbn9cBEnQ@mail.gmail.com>
 <20220405211250.GJ2354230@scaer>
 <CADvTj4pirGqnroqBBR3jvAqWcWbiTPmiA_VcSBh2nPLP8PVSdg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4pirGqnroqBBR3jvAqWcWbiTPmiA_VcSBh2nPLP8PVSdg@mail.gmail.com>
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

On 2022-04-08 17:56 -0600, James Hilliard spake thusly:
> On Tue, Apr 5, 2022 at 3:12 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-04-05 14:09 -0600, James Hilliard spake thusly:
> > > On Tue, Apr 5, 2022 at 11:19 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> > > > On 05/04/2022 04:50, James Hilliard wrote:
> > > > > Fixes:
> > > > > package/aufs/aufs.mk:24: *** AUFS_SITE (https://github.com/sfjro/aufs4-standalone/archive/) cannot have a trailing slash.  Stop.
> > > > > make: *** [Makefile:84: _all] Error 2
> > > >   How do you get this? I've tried a number of configurations, but I always get
> > > > package/aufs/aufs.mk:21: *** No aufs version specified.  Stop.
> > > > make: *** [Makefile:84: _all] Error 2
> > > >   I could only reproduce with `make source`, but that's a bit a special case.
> > > Something like this seems to hit it:
> > > BR2_LINUX_KERNEL_EXT_AUFS=y
> > > # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3 is not set
> > > BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4=y
> > > # BR2_LINUX_KERNEL_EXT_AUFS_SERIES_5 is not set
> > > BR2_LINUX_KERNEL_EXT_AUFS_SERIES=4
> > > BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""
> > > BR2_PACKAGE_AUFS=y
> > > BR2_PACKAGE_AUFS_SERIES=4
> > > BR2_PACKAGE_AUFS_VERSION=""
> > > # BR2_PACKAGE_AUFS_UTIL is not set
> > This still produces the expected error that Arnout reported:
[--SNIP--]
> You need to do make savedefconfig here for it to reproduce:
[--SNIP--]

Indeed, I could reproduce.

However, I think the fix is still incorrect.

Indeed, if we were to do what you suggest, them it would be possible to
call savedefconfig on a broken configuration; this does not make sense.

Instead, I believe that savedefconfig and update-defconfig (an alias for
the former) should not be declared as nobuild_targets:

    diff --git a/Makefile b/Makefile
    index 05b790d770..69994a58da 100644
    --- a/Makefile
    +++ b/Makefile
    @@ -141,7 +141,7 @@ nobuild_targets := source %-source \
     	clean distclean help show-targets graph-depends \
     	%-graph-depends %-show-depends %-show-version \
     	graph-build graph-size list-defconfigs \
    -	savedefconfig update-defconfig printvars show-vars
    +	printvars show-vars
     ifeq ($(MAKECMDGOALS),)
     BR_BUILDING = y
     else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)

There are a bout ~35 places where we use $(BR_BUILDING). I've look at
all the instances in boot/ and linux/,i in toolchain/ and package/aufs/
of course, and a few others, and they all seem to be fine if we remove
savedefconfig and update-defconfig from nobuild_targets.

Care to have a further look, please, and send a patch?

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
