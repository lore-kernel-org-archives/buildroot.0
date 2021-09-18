Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CEBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 19:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87D260F9B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 19:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A87D260F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4575640018;
	Sat, 18 Sep 2021 19:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZd6aPyXqKW8; Sat, 18 Sep 2021 19:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 288D740168;
	Sat, 18 Sep 2021 19:37:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 764521BF40A
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63B588374F
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 19:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63iGmKgWbZ7A for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 19:37:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07E5284020
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 19:37:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E05CAB0051E;
 Sat, 18 Sep 2021 21:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631993860;
 bh=IeJwp6UCbNgQQ+HTV4C/4f9n4+K2jx2lOvqFSEBCkyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uu4MhWAE6PCcElkQkS4Pj0LZic+mXj8J7/fc1BWx9Pc17ceBb3P1hjsWZkV6UBIQC
 JBukayMADXwMRzyBlT0iLe6C6spc7Ktz4Jqoo41P4EHSAK//8WY3LhlAW2gzqbs6nl
 lae8jOQcR4AAHCJ1rkcRJ8E/1CtW0ZGHb+Jb+sBXRwvYCQT3ey6Uy9dpVqDe3tWxgR
 XYfjsJI4z4ZOM6OdDZKMKEntITTHYykBG7a5R3emKmfI/bH7WGgzyQXaYdpI8UFUVh
 IUOY3ufiwzI3KltKu7+VJGbcZiBgEqZMN/KwYy1OIKu8q0L2Vgickb5FBIHwPPy0Lt
 umawvqWkU/vfQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 21:37:33 +0200
Date: Sat, 18 Sep 2021 21:37:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210918193733.GI1053080@scaer>
References: <20210914211106.401780-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914211106.401780-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/apitrace: fix build with glibc
 >= 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-14 23:11 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with glibc >= 2.34:
> 
> /tmp/instance-0/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: CMakeFiles/egltrace.dir/dlsym.cpp.o: in function `dlsym':
> dlsym.cpp:(.text+0x34): undefined reference to `__libc_dlopen_mode'
> /tmp/instance-0/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: dlsym.cpp:(.text+0x46): undefined reference to `__libc_dlsym'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ac5e5b1e30249ae0fb8b9179338b47c60c026bcc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...and-__libc_dlopen_mode-on-GLIBC-2-34.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
> 
> diff --git a/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch b/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
> new file mode 100644
> index 0000000000..57e3ee248b
> --- /dev/null
> +++ b/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
> @@ -0,0 +1,34 @@
> +From d28a980802ad48568c87da02d630c8babfe163bb Mon Sep 17 00:00:00 2001
> +From: Jose Fonseca <jfonseca@vmware.com>
> +Date: Wed, 1 Sep 2021 16:34:54 +0100
> +Subject: [PATCH] gltrace: Avoid __libc_dlsym and __libc_dlopen_mode on GLIBC
> + 2.34.
> +
> +These GLIBC_PRIVATE symbols are gone from GLIBC 2.34 due to the merge of
> +libdl.so onto libc.so.
> +
> +This means apitrace can't defend against infinite recursion when
> +used with Steam Overlay, but at least it should work otherwise.
> +
> +Fixes https://github.com/apitrace/apitrace/issues/756
> +
> +[Retrieved from:
> +https://github.com/apitrace/apitrace/commit/d28a980802ad48568c87da02d630c8babfe163bb]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + wrappers/dlsym.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/wrappers/dlsym.cpp b/wrappers/dlsym.cpp
> +index 5ab8465b0..5369af35a 100644
> +--- a/wrappers/dlsym.cpp
> ++++ b/wrappers/dlsym.cpp
> +@@ -34,7 +34,7 @@
> + #include "os.hpp"
> + 
> + 
> +-#if defined(__GLIBC__) && !defined(__UCLIBC__)
> ++#if defined(__GLIBC__) && !defined(__UCLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ < 34
> + 
> + 
> + #include <dlfcn.h>
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
