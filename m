Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3526C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:02:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C7EF60F38
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 19:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C7EF60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 195BD400C6;
	Tue, 10 Aug 2021 19:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voky-nr0R3Xn; Tue, 10 Aug 2021 19:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A205402E1;
	Tue, 10 Aug 2021 19:02:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5DF1BF479
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED0B58333E
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 19:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5M6uN9j7uZNF for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 19:01:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77FC283323
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 19:01:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc21:5bf8:172d:5380])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 16DB0780310;
 Tue, 10 Aug 2021 21:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628622112;
 bh=mNiTypi5BdXyp8Aq0y/rQ2C8qT7T7lPEGg4yOrgvubQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oK8biY5C5lzu5JahnX7W8o3LmFoQGYAl/KAFUdTr0BrmrJfOJImnDfSvKNkaYsiyZ
 Yz3Wt7whp5bF5DPaOHL1ChlQ/FFWW6ZocqthLZ8EY9XW/j8lY3JEPeLOp+Yru7Myj6
 PhV5RJokxO2eNaQuYktu6aBCgWUfCKF/Em+IEdjiFTabuX7fM1Ic0Q2Nu5IxMH9BXP
 7agaHUztsvMcw6UIpxWdywD1L5VPk9u609p6QN/0xcDKdjnPkBMQVUqR6vybypg++5
 3Sllys1fskEJ9HwozU7HvAa3mX7vKuTlo/o8m8H1KKRgHIMD2oL33XIU8lurTMMMJK
 JzByInfNqmWRQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 10 Aug 2021 21:01:45 +0200
Date: Tue, 10 Aug 2021 21:01:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Pascal de Bruijn <p.debruijn@unilogic.nl>
Message-ID: <20210810190145.GR27036@scaer>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805085353.3457-1-p.debruijn@unilogic.nl>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/php: remove ineffective opcache
 patch
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
Cc: aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Pascal, All,

Given the questions raised by this series, I think more testing and more
detailed commit messages that explain the changes will be needed.

As a consequence, I've marked this series as changes-requested.

Thanks!

Regards,
Yann E. MORIN.

On 2021-08-05 10:53 +0200, Pascal de Bruijn spake thusly:
> Current opcache builds compile, but fail at runtime due to shm_unlink not
> being resolvable.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  .../0005-allow-opcache-cross-compiling.patch  | 37 -------------------
>  1 file changed, 37 deletions(-)
>  delete mode 100644 package/php/0005-allow-opcache-cross-compiling.patch
> 
> diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
> deleted file mode 100644
> index d168f71892..0000000000
> --- a/package/php/0005-allow-opcache-cross-compiling.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 9bb316c41a69935ee2072626467241889594bed4 Mon Sep 17 00:00:00 2001
> -From: Adam Duskett <aduskett@gmail.com>
> -Date: Mon, 28 Jun 2021 11:12:36 -0700
> -Subject: [PATCH] allow opcache cross-compiling
> -
> -Remove the check at the end of ext/opcache/config.m4 that prevents opcache from
> -being enabled in a cross-compiled environment. We pass the following as a
> -CFLAGS when opcache is enabled:
> -  -DHAVE_SHM_IPC
> -  -DHAVE_SHM_MMAP_ANON
> -  -DHAVE_SHM_MMAP_ZERO
> -  -DHAVE_SHM_MMAP_POSIX
> -  -DHAVE_SHM_MMAP_FILE
> -
> -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ----
> - ext/opcache/config.m4 | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
> -index 5492fd92..10c150ff 100644
> ---- a/ext/opcache/config.m4
> -+++ b/ext/opcache/config.m4
> -@@ -339,10 +339,6 @@ int main() {
> -   PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)
> -   PHP_ADD_EXTENSION_DEP(opcache, pcre)
> - 
> --  if test "$have_shm_ipc" != "yes" && test "$have_shm_mmap_posix" != "yes" && test "$have_shm_mmap_anon" != "yes"; then
> --    AC_MSG_ERROR([No supported shared memory caching support was found when configuring opcache. Check config.log for any errors or missing dependencies.])
> --  fi
> --
> -   if test "$PHP_OPCACHE_JIT" = "yes"; then
> -     PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)
> -     PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/Makefile.frag)
> --- 
> -2.31.1
> -
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

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
