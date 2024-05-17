Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A799C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 18:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F204A82261;
	Fri, 17 May 2024 18:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fs5ZJKUtdmWf; Fri, 17 May 2024 18:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E29E3822B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E29E3822B2;
	Fri, 17 May 2024 18:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52C911BF312
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 18:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D2A0822B2
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 18:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bPtptwlFkiX for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 18:25:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 041EF82261
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 041EF82261
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 041EF82261
 for <buildroot@buildroot.org>; Fri, 17 May 2024 18:25:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7FE3913F8AD;
 Fri, 17 May 2024 20:25:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 20:25:41 +0200
Date: Fri, 17 May 2024 20:25:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <ZkehJQxCJHZRJ1lr@landeda>
References: <20240517120057.3736694-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517120057.3736694-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715970344;
 bh=JHpA7322+CjU179/qK2M/dAtfMkJQgc4F8rlDlzgBgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dB5vUSoNDdrvehgWsV7E987RQSrGQQl4JWnLOUSicV/LxoLnakxdCwgnMz+AaxJCt
 Ub85GgMnZo/+ZBMrkc/bZhRe1PjDd9rG/x+u8t/wjkQi1IroWiAd7z0KMO3jCV+kHm
 HDATjeGxXJTwaimo0BqPDI53OTGFixE9oFAMIqjKNeD1aSRytAz3TO4Mmk3WMe0oO8
 7hUo2bMKHS+WZSgEsHStnVVetm2iLu6eKCYn4wi1OxEhMBiUcoPCs1fhzidNCgvYbl
 3n7grF2vDESc1zs0we8Jjc705B0XMVr1cXQzHA7TZfbHToAvPBfEWiAVdhVHVW+Fgr
 hAJRIoj6lazpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dB5vUSoN
Subject: Re: [Buildroot] [PATCH] package/ntp: fix build with GCC 14.x
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2024-05-17 14:00 +0200, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Fix pthread_detach() detection that is broken when building
> with GCC 14.x.
> 
> The patch is taken from a Gentoo repository:
> 
> https://gitweb.gentoo.org/repo/gentoo.git/diff/net-misc/ntp/files/ntp-4.2.8_p15-configure-clang16.patch?id=56ef5ce33891feec34cd0c39a0a774a81a587dc7
> 
> Bonus: refresh the 0002-ntp-syscalls-fallback.patch file.

Sure, but it's relatively obvious, by looking and the changeset, that
the patch was modified; the interesting information to have in the
commit log is why it was refreshed:

    Addtionally, refresh patch 0002 to fix the offset of hunk 1.

> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/ntp/0002-ntp-syscalls-fallback.patch  |  9 ++++---
>  .../ntp/0003-fix-pthread-detach-check.patch   | 27 +++++++++++++++++++

    $ make check-package
    package/ntp/0003-fix-pthread-detach-check.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)

Yes, you do provide the location where you grabbed the patch from, and
this is very good. Still, we need to know what the upstream status for
that patch is: has it been submitted? If no, why? If yes, what is the
URL to the PR/MR, bug report, email?

It is a bit unfortunate that ntp uses bitkeeper as a VCS, which makes it
a bit more difficult to contribute to, but we still need that in
formation...

I see that the last commits dates from just a few days ago, so the
project is not dead.

Could you please check whether this patch was submitted? Maybe there is
some info about that in the gentoo history for that patch?

> diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0002-ntp-syscalls-fallback.patch
> index 535fc93dfd..46704b9d3f 100644
> --- a/package/ntp/0002-ntp-syscalls-fallback.patch
> +++ b/package/ntp/0002-ntp-syscalls-fallback.patch
> @@ -8,10 +8,11 @@ Signed-off-by: James Knight <james.knight@rockwellcollins.com>
>   configure.ac | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
> -diff --git a/configure.ac b/configure.ac
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1523,11 +1523,11 @@ AC_CACHE_CHECK(
> +Index: ntp-4.2.8p17/configure.ac
> +===================================================================
> +--- ntp-4.2.8p17.orig/configure.ac
> ++++ ntp-4.2.8p17/configure.ac
> +@@ -1472,11 +1472,11 @@ AC_CACHE_CHECK(

Just fixing the line would have made for a smaller delta, with less
useless changes in the diff metadata.

Also, the patch was (almost) git-formatted, which is the preferred form
for bundled patches. Unless it is submitted to, or backported from the
upstream VCS, in which case it should be in a format supported by that
VCS. ;-)

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
