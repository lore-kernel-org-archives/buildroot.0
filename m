Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E633EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:15:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A07611C8
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1A07611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83CCD606C6;
	Sun, 19 Sep 2021 07:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bib8Lq2AYeN4; Sun, 19 Sep 2021 07:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCDFA60684;
	Sun, 19 Sep 2021 07:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFEE61BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFF1081D73
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OVHpOIm5_Qm for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:15:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 445FA81D0C
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:15:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 309C12003C8;
 Sun, 19 Sep 2021 09:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632035713;
 bh=CBW5QFIPbYsd2srNwPAv8hR4IHT83UuzC982XSRWYjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sZEYJOxUmQ2IKMH8qdDObDVXsuycLd5zxocfPbUmlh23GE8zYg5YIfMOY+czzi/FG
 4Mw9OJngNi/0uQbzqgovY4FhsdVnvzDRvo/mce52BsQvpe6GZqd1OyT4wDh/D8Zc/h
 LwYuW7RgJZY54s8kX2b2bcU3NTsdhwwKdg3jW1pYh2DKbSFnRHuPVXXjUVI4scCHW1
 Dg5+B3qgiDEuUrl7mlfYBtzZ5q84ChPUgIAosgSRC/8uwU6vfBOC2rvR2M7OcopzqY
 03VI7xW2W9XjwjzsDFxfaT4Sel2ebREA3wgewJir9T5Ho2NNmlwQqH2qbIlRbfSNXb
 /x4uypLtQG10Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 09:15:08 +0200
Date: Sun, 19 Sep 2021 09:15:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210919071508.GE1053080@scaer>
References: <20210912194057.2556882-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912194057.2556882-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libfuse: fix build with glibc
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-12 21:40 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with glibc >= 2.34:
> 
> ulockmgr_server.c:127:12: error: conflicting types for 'closefrom'; have 'int(int)'
>   127 | static int closefrom(int minfd)
>       |            ^~~~~~~~~
> In file included from ulockmgr_server.c:14:
> /home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/unistd.h:363:13: note: previous declaration of 'closefrom' with type 'void(int)'
>   363 | extern void closefrom (int __lowfd) __THROW;
>       |             ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3769b18ca804fba3b5974af799972a7d889b39a6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ally-define-closefrom-fix-glibc-2-34.patch | 64 +++++++++++++++++++
>  package/libfuse/libfuse.mk                    |  7 +-
>  2 files changed, 70 insertions(+), 1 deletion(-)
>  create mode 100644 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch
> 
> diff --git a/package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch b/package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch
> new file mode 100644
> index 0000000000..7c3346e47b
> --- /dev/null
> +++ b/package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch
> @@ -0,0 +1,64 @@
> +From 5a43d0f724c56f8836f3f92411e0de1b5f82db32 Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Sat, 24 Jul 2021 22:02:45 +0100
> +Subject: [PATCH] util/ulockmgr_server.c: conditionally define closefrom (fix
> + glibc-2.34+)
> +
> +closefrom(3) has joined us in glibc-land from *BSD and Solaris. Since
> +it's available in glibc 2.34+, we want to detect it and only define our
> +fallback if the libc doesn't provide it.
> +
> +Bug: https://bugs.gentoo.org/803923
> +Signed-off-by: Sam James <sam@gentoo.org>
> +
> +[Retrieved from:
> +https://github.com/libfuse/libfuse/commit/5a43d0f724c56f8836f3f92411e0de1b5f82db32]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac           | 1 +
> + util/ulockmgr_server.c | 6 ++++++
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9946a0efa..a2d481aa9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -55,6 +55,7 @@ fi
> + 
> + AC_CHECK_FUNCS([fork setxattr fdatasync splice vmsplice utimensat])
> + AC_CHECK_FUNCS([posix_fallocate])
> ++AC_CHECK_FUNCS([closefrom])
> + AC_CHECK_MEMBERS([struct stat.st_atim])
> + AC_CHECK_MEMBERS([struct stat.st_atimespec])
> + 
> +diff --git a/util/ulockmgr_server.c b/util/ulockmgr_server.c
> +index 273c7d923..a04dac5c6 100644
> +--- a/util/ulockmgr_server.c
> ++++ b/util/ulockmgr_server.c
> +@@ -22,6 +22,10 @@
> + #include <sys/socket.h>
> + #include <sys/wait.h>
> + 
> ++#ifdef HAVE_CONFIG_H
> ++	#include "config.h"
> ++#endif
> ++
> + struct message {
> + 	unsigned intr : 1;
> + 	unsigned nofd : 1;
> +@@ -124,6 +128,7 @@ static int receive_message(int sock, void *buf, size_t buflen, int *fdp,
> + 	return res;
> + }
> + 
> ++#if !defined(HAVE_CLOSEFROM)
> + static int closefrom(int minfd)
> + {
> + 	DIR *dir = opendir("/proc/self/fd");
> +@@ -141,6 +146,7 @@ static int closefrom(int minfd)
> + 	}
> + 	return 0;
> + }
> ++#endif
> + 
> + static void send_reply(int cfd, struct message *msg)
> + {
> diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
> index 2677e46853..6dce641f7f 100644
> --- a/package/libfuse/libfuse.mk
> +++ b/package/libfuse/libfuse.mk
> @@ -11,7 +11,12 @@ LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
>  LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
>  LIBFUSE_CPE_ID_VENDOR = libfuse_project
>  LIBFUSE_INSTALL_STAGING = YES
> -LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +# We're patching configure.ac
> +LIBFUSE_AUTORECONF = YES
> +# add host-gettext for AM_ICONV macro
> +LIBFUSE_DEPENDENCIES = \
> +	host-gettext \
> +	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  LIBFUSE_CONF_OPTS = \
>  	--disable-example \
>  	--enable-lib \
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
