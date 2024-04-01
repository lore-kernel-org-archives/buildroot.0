Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F90CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C8081E68;
	Mon,  1 Apr 2024 20:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nr3lXSvUIirx; Mon,  1 Apr 2024 20:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A03C81E7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A03C81E7F;
	Mon,  1 Apr 2024 20:12:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 193991BF3BF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C47F40710
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyEcm6f6jjQk for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:12:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 650C140382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 650C140382
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 650C140382
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:12:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 71A5213F838;
 Mon,  1 Apr 2024 22:12:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 22:12:15 +0200
Date: Mon, 1 Apr 2024 22:12:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZgsVH70FdY61yj2m@landeda>
References: <20240401171622.66777-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401171622.66777-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712002337;
 bh=7JqbjkPZZdlBpygzIHuyCCQ66pJ01jNcHdv2iJOgEq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UoLC6git/BB5zHjXnWS3b2sGsRrpCS1F+/TtMaU+nc00yZbQ1QaUBvLNHMVZ5U0W4
 uG9qOGYTRFHu0iQ4SZFCiplhVOZOIpCgK26A4ziN8o29K3M6lxOSqoaxQzV8SGF0ve
 aSxlHDginXBZMvAjnd/rSihUFXjnXbr7RoE82WDyfPdtzJs7GHWsLIqcIR0N0QgjI8
 GrnLD43XJEvNiUj1QRMcgnOb8eP1NVM8KvE+Jh95E1AoC1PcRby/IVcjKXJS4aGnMT
 l2NAp//tRd2Vbe6w7xCHckGEcxehcnkVRsq1B4/DtEh9+DYoBaMKuNa+oFUIAmubcS
 T3PqOteDleWVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UoLC6git
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: fix build with libatomic
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

Julien, all,

On 2024-04-01 19:16 +0200, Julien Olivain spake thusly:
> Commit 9f94b3b354 "package/iperf3: bump to version 3.16" updated
> the package but forgot to reflect a breaking change mentioned in
> the release note [1], "iperf3 now requires pthreads and C atomic
> variables to compile and run".
> 
> When the toolchain has no atomic support, or the libatomic is not
> added in the linker flags, the compilation now fail with output:
> 
>     arm-buildroot-linux-gnueabi/bin/ld: ./.libs/libiperf.so: undefined reference to '__atomic_load_8'
> 
> This issue can be seen when running the iperf3 runtime test, with
> command:
> 
>     support/testing/run-tests \
>         -d dl -o output_test \
>         tests.package.test_iperf3
> 
> This commit fixes the issue by adding a dependency on
> BR2_TOOLCHAIN_HAS_ATOMIC and by adding an upstream patch to detect
> if linking to libatomic is needed.
> 
> Fixes: [2]
> 
> [1] https://github.com/esnet/iperf/releases/tag/3.16
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/6466933622
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...1-Check-and-link-libatomic-if-needed.patch | 42 +++++++++++++++++++
>  package/iperf3/Config.in                      |  2 +
>  package/iperf3/iperf3.mk                      |  3 ++
>  3 files changed, 47 insertions(+)
>  create mode 100644 package/iperf3/0001-Check-and-link-libatomic-if-needed.patch
> 
> diff --git a/package/iperf3/0001-Check-and-link-libatomic-if-needed.patch b/package/iperf3/0001-Check-and-link-libatomic-if-needed.patch
> new file mode 100644
> index 00000000000..ddb50c46949
> --- /dev/null
> +++ b/package/iperf3/0001-Check-and-link-libatomic-if-needed.patch
> @@ -0,0 +1,42 @@
> +From bbf710e77e4a0438a2d995fd69b472e5ff054c69 Mon Sep 17 00:00:00 2001
> +From: Jan Palus <jpalus@fastmail.com>
> +Date: Sun, 3 Dec 2023 12:14:05 +0100
> +Subject: [PATCH] Check and link libatomic if needed
> +
> +Some architectures without native support for 64-bit atomics need
> +linking with libatomic.
> +
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +Upstream: https://github.com/esnet/iperf/commit/1511e9f85b548891ea53d4e378903344df1fd31e
> +---
> + configure.ac | 14 +++++++++++++-
> + 1 file changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2594b39..ad7eaf1 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -92,7 +92,19 @@ CXX="$PTHREAD_CXX"
> + ])
> + 
> + # Atomics
> +-AC_CHECK_HEADERS([stdatomic.h])
> ++AC_CHECK_HEADERS([stdatomic.h],
> ++    [AC_MSG_CHECKING([whether libatomic is required])
> ++    AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdatomic.h>]], [[atomic_uint_fast64_t i; i++;]])],
> ++        [AC_MSG_RESULT([no])],
> ++        [save_LIBS="$LIBS"
> ++        LIBS="$LIBS -latomic"
> ++        AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdatomic.h>]], [[atomic_uint_fast64_t i; i++;]])],
> ++            [AC_MSG_RESULT([yes])],
> ++            [AC_MSG_ERROR([failed to find working configuration with atomics])]
> ++        )]
> ++    )],
> ++    []
> ++)
> + 
> + # Check for poll.h (it's in POSIX so everyone should have it?)
> + AC_CHECK_HEADERS([poll.h])
> +-- 
> +2.44.0
> +
> diff --git a/package/iperf3/Config.in b/package/iperf3/Config.in
> index 5b2204c5e01..0c6946f55d9 100644
> --- a/package/iperf3/Config.in
> +++ b/package/iperf3/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_IPERF3
>  	bool "iperf3"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  iperf is a tool for active measurements of the maximum
> @@ -13,4 +14,5 @@ config BR2_PACKAGE_IPERF3
>  	  http://software.es.net/iperf/index.html
>  
>  comment "iperf3 needs a toolchain w/ threads"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
> index 6d902c3b13b..3ab68bd13b5 100644
> --- a/package/iperf3/iperf3.mk
> +++ b/package/iperf3/iperf3.mk
> @@ -11,6 +11,9 @@ IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
>  IPERF3_LICENSE_FILES = LICENSE
>  IPERF3_CPE_ID_VENDOR = es
>  
> +# 0001-Check-and-link-libatomic-if-needed.patch
> +IPERF3_AUTORECONF = YES
> +
>  IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -- 
> 2.44.0
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
