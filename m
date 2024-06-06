Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01F3C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81B116144C;
	Thu,  6 Jun 2024 08:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6X8E5kQhMXL8; Thu,  6 Jun 2024 08:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5073610E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5073610E4;
	Thu,  6 Jun 2024 08:32:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B55B1BF599
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC14582196
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfRy9e8RmrGc for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:32:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B337680CDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B337680CDA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B337680CDA
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 08:32:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 067E813FA41;
 Thu,  6 Jun 2024 10:32:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 10:32:44 +0200
Date: Thu, 6 Jun 2024 10:32:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <ZmF0LIflaTxrzQBd@landeda>
References: <20240606072146.281831-2-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606072146.281831-2-bagasdotme@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717662768;
 bh=m9KYyNGLf/LgvkweqdRVZbe+bZHDX2+obDzliWnQQ6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lg7Qghe+O6kKtEwZqdEVsp4a3v0OV//J6C63dmexDFbT+hJ6LpPn7r3CHDJWUyFO+
 EwCB6Frgz0+CwhVYQ6J8urY8/p4W+W6rD5j2USOt8TGuDmylhFiWLJrvEckWXkiw3X
 ka+7U/fkajrCRzaNlnaHqhHaN1D7jDelatxsJU2u75AHWRi3Iw+XGqM78j1Xzh9nUE
 WHFkb0ac66sstqSMxdnSq350SlQhbaK+ut3izv/TrMyIAasHS7ylo+Sup05fkqzCDD
 xEGtLZs/m3iE4ubU+dkFmhYWWsR2IklxlERghhfYiaoSHwR/jzwGXPqm8qaAF2CacO
 C1gDgZZ/R9Ckw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Lg7Qghe+
Subject: Re: [Buildroot] [PATCH] package/git: minor bump to 2.45.2
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bagas, All,

On 2024-06-06 14:21 +0700, Bagas Sanjaya spake thusly:
> Minor release bump to address "git lfs" and "git annex" breakage (for
> release notes see [1]).
> 
> Link: https://lore.kernel.org/git/xmqqr0dheuw5.fsf@gitster.g/ [1]
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

As a bug-fix release: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/git/git.hash b/package/git/git.hash
> index 7dbeec714b..f72fd60ec2 100644
> --- a/package/git/git.hash
> +++ b/package/git/git.hash
> @@ -1,5 +1,5 @@
>  # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
> -sha256  e64d340a8e627ae22cfb8bcc651cca0b497cf1e9fdf523735544ff4a732f12bf  git-2.45.1.tar.xz
> +sha256  51bfe87eb1c02fed1484051875365eeab229831d30d0cec5d89a14f9e40e9adb  git-2.45.2.tar.xz
>  # Locally calculated
>  sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
>  sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
> diff --git a/package/git/git.mk b/package/git/git.mk
> index 04f489e038..d84b2e487c 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GIT_VERSION = 2.45.1
> +GIT_VERSION = 2.45.2
>  GIT_SOURCE = git-$(GIT_VERSION).tar.xz
>  GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
>  GIT_LICENSE = GPL-2.0, LGPL-2.1+
> 
> base-commit: e19ae5ecad7a12673d61781f9090c2610f2dcf18
> -- 
> An old man doll... just what I always wanted! - Clara
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
