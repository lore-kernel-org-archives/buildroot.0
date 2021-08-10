Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6F4C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:39:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFC2060ED8
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFC2060ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B9C081CDC;
	Tue, 10 Aug 2021 19:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIMIq_u9GZrC; Tue, 10 Aug 2021 19:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9187823A0;
	Tue, 10 Aug 2021 19:39:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A83C1BF951
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A0AD40162
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yH0Xmu_rGtiw for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 19:39:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D650A4014A
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 19:39:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc21:5bf8:172d:5380])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 172D578034E;
 Tue, 10 Aug 2021 21:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628624377;
 bh=CqWVimpohaJZUoc+9KtYGzBr33R3OK0asu4yy5bo/Zw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fe+MKl0jehiwXVlGT2C9xB8EPA8Z/w7YIkjV3955S6CtoC0SzxgbofckcaceVSGT8
 huWzFBgyNKe4WoPaMin9LpY8YWILXGhQ/BXIHDbLHOPsVk4jphhG7QGMR5luslAETR
 CbcoCfQhg5xCOpU2UwJnZWIgHrGFgoPCVoMTg4Y8LqLg5b9xofTvHo7W4/vWQF8ayI
 aBQXqZN8vCzEhQ4alRHzpgO8Ag8Cq31Goa9zgUd3UvU7a6RwFuAas3uu5uV36lv7D1
 dHGARee3I6OsRNVOo8zuI9WESklop682kgPUJGMSec++5+DNNBA06dLcOI5lRbi9Iw
 lYFABLCfLA0og==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 10 Aug 2021 21:39:30 +0200
Date: Tue, 10 Aug 2021 21:39:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <20210810193930.GT27036@scaer>
References: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
 <20210806125047.1832422-2-tomi.valkeinen@ideasonboard.com>
 <20210808092935.GK27036@scaer>
 <ee9c4a7c-82c2-3b5e-7e41-0bad306e80fe@ideasonboard.com>
 <20210808203351.GN27036@scaer>
 <b94a85b6-1483-2f18-9cf2-55e97764dd40@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b94a85b6-1483-2f18-9cf2-55e97764dd40@ideasonboard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/kmsxx: update to latest
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Tomi, All,

On 2021-08-09 09:23 +0300, Tomi Valkeinen spake thusly:
> And I'd love to enable the python bindings for kms++ in buildroot, but I
> didn't manage to get meson find buildroot's pybind11. I'll look at that more
> at some point. I think the problem is that meson should find pybind11 using
> cmake (apparently that can be used to find dependencies...), but when
> building kms++, meson just says:
> 
> CMake binary for MachineChoice.HOST is not cached
> CMake binary missing from cross or native file, or env var undefined.
> Default target is not allowed for cross use
> Found CMake: NO

Could you try to add:

    KMSXX_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)

To see if that would solve the issue?

> On 08/08/2021 23:33, Yann E. MORIN wrote:
> >I am by far not a meson expert, so when you say "the fallback-to-subproject
> >can be managed with meson commandline options", I'd be much interested
> >in hos to do that, so that in Buildrot we know how to forcibly forbid
> >bundled sub-projects (or wraps?) to be used...
> https://mesonbuild.com/Subprojects.html#commandline-options
> So, buildroot could globally define "--wrap-mode=nodownload" for meson to
> prevent download of the subprojects.

Shouldn't we instead use:   --wrap-mode=nofallback

This entirely prevent use of wraps, even those that are already present
(e.g. because an upstream packager would have added them when generating
the release tarball for example).

> Developers who need the functionality
> of 'use-system-pybind11' option can use
> "--force-fallback-for=list,of,dependencies".

This should only be done in conjunction with --wrap-mode=nodownload

> And at least for me, the download doesn't even work inside buildroot:
> 
> Downloading pybind11 source from
> https://github.com/pybind/pybind11/archive/v2.6.0.zip
> <urlopen error unknown url type: https>
                            ,------^^^^^
I think the error lies there: meson is written in python3, and is
executed with our host-python3, which we only conditionally build it
with support for TLS:

   package/python3/python3.mk:
   46 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
   47 HOST_PYTHON3_DEPENDENCIES += host-openssl
   48 else
   49 HOST_PYTHON3_CONF_OPTS += --disable-openssl
   50 endif

So, this is a good thing that this is not available by default: wraps
can only be downloaded from insecure sites, which if the meson wrapDB is
properly curated, should not happen. And thus, it should not be possible
to ever download any wrap at all! Aha. Aha! AHA! MUAHAHA! ;-]

But jokes aside, try setting BR2_PACKAGE_HOST_PYTHON3_SSL=y, and I would
guess downloading wraps would be come possible (although this would be a
very bad idea).

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
