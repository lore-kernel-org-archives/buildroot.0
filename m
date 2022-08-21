Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98191C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 19:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31798405A6;
	Sun, 21 Aug 2022 19:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31798405A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w64tLgmh41FT; Sun, 21 Aug 2022 19:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35D8740586;
	Sun, 21 Aug 2022 19:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D8740586
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCFF1BF5DF
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 19:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 161C240586
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 19:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 161C240586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edbFjX-AS9M4 for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 19:31:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 231894056D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 231894056D
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 19:31:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2FF7613F8A2;
 Sun, 21 Aug 2022 21:31:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 21:31:41 +0200
Date: Sun, 21 Aug 2022 21:31:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220821193141.GS2167049@scaer>
References: <20220821190153.233016-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220821190153.233016-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661110304;
 bh=j5uS7nwh4f9Ne90q1N4+MUHg551Fy2RN6luE8yLtiTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TNVwY0//nZTKdTtjOD1uSWLdU1BaqU+E01BHuriWP69Ycyreg103Ne/O4UFb5tz7+
 NbibX6jCH1+IgtgrL1LB3Z6xOQ/lEYO6UgG05wiw5+UYbOEL+TS0fvSC772uuQzFvu
 wYIYzDFNSn2qHIekFdWLJC3wkYGZmmw8SAYWvY9M4zZqBuTxN8ojCIdxv611iXGgMj
 iXgqVONET3CLl6Qf8BG9KHiqFw95bVrTp0VpbHwLXpdx56YzgFxdNYwt0IY/q1jkzE
 8EUytGKVvX5IJWpAKJilaO/CRFMvdx5wQNxbafs/P3iIJ0C+dB7hzV0lNJZ8nOlIz1
 uH//D/HBxtZSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TNVwY0//
Subject: Re: [Buildroot] [PATCH] package/Makefile.in: only error out when no
 C library is configured when building
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-21 21:01 +0200, Thomas Petazzoni via buildroot spake thusly:
> Commit fda53f0791f5657d41735a40a29df3c8d0e8ae79 ("package/Makefile.in:
> add detection for the lack of C library") added an $(error ...)
> message when no C library is available for the currently selected
> architecture.
> 
> However, this error message pops up not just when building, so for
> example, the command:
> 
>   make BR2_HAVE_DOT_CONFIG=y VARS=%_LICENSE printvars
> 
> no longer works (this command is used by the pkg-stats script).
> 
> We restore a functional behavior by doing the check only when
> BR_BUILDING=y.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index ff60f85092..43d214bcbe 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -53,7 +53,7 @@ else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>  LIBC = musl
>  else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>  LIBC = gnu
> -else
> +else ifeq ($(BR_BUILDING),y)
>  # This happens if there is a bug in Buildroot that allows an
>  # architecture configuration that isn't supported by any library.
>  $(error No C library enabled, this is not possible.)
> -- 
> 2.37.2
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
