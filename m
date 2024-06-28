Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A164FC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B67C60845;
	Fri, 28 Jun 2024 20:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srCMSb5_qO8w; Fri, 28 Jun 2024 20:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D664610E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D664610E0;
	Fri, 28 Jun 2024 20:25:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15D761BF3BA
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76F8C610E0
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uzVsXDlcKIK for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 20:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C95DE60845
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C95DE60845
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C95DE60845
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 20:25:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8CA0E13F81D;
 Fri, 28 Jun 2024 22:25:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 28 Jun 2024 22:25:22 +0200
Date: Fri, 28 Jun 2024 22:25:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Zn8cMhT34lGqSEfJ@landeda>
References: <20240627212547.2194843-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240627212547.2194843-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719606325;
 bh=Dnf85k8CsWz+NyYZgRNcIJp8mm8MEzAXv6ehYiJ8PLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ap7lFQgRPgAYrAfS/zMCv2AlKXPCBGkqVpOGY+sZw97EaFMfn2GDbI4f3UD8F49Df
 ovX7tvuQKclKXKXXSrDkvYP9GjmIctUwBEli2cxGvFBs3gg2x/NtHEREc87eGIEtOu
 oDPihwuSpnzjkKFkLEA7kKL7sMdc/wrjX/p0LlCbA05p1v+mcFL7awRg+8eH3aOfG0
 X3NcIcD2svGdudBMNChmoVrb1puh94soxwyPsPW1N37hBwj1+HzZDRNvElBPoHV03A
 YDfVFn4mvmtsWVXdlphzS+1ekFotw/adFstvkcJqZccQSy6VryM4WNF7Xsc6EqmzxD
 WrIYtQx3Lgb1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ap7lFQgR
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: update patches to be
 applied with fuzz 0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-06-27 23:25 +0200, Bernd Kuhls spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, exim fails to build with output:
> 
>     Applying 0004-exim_lock-fix-lstat-related-build-errors.patch using patch:
>     patching file src/exim_lock.c
>     Hunk #1 FAILED at 13.
>     Hunk #2 succeeded at 27 (offset 1 line).
>     1 out of 2 hunks FAILED -- saving rejects to file src/exim_lock.c.rej
> 
> This commit rebases the package patches on the current package version
> when needed.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ff27d5ebd7f24ac8cb236b83c67c2c75255e51c6/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/exim/0001-Build-buildconfig-for-the-host.patch    | 4 +++-
>  ...0002-Don-t-make-backup-copies-of-installed-files.patch | 4 +++-
>  ...0003-Skip-version-check-and-symlink-installation.patch | 8 ++++----
>  .../0004-exim_lock-fix-lstat-related-build-errors.patch   | 8 +++++---
>  package/exim/0005-sieve-fix-build-errors.patch            | 4 +++-
>  5 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/package/exim/0001-Build-buildconfig-for-the-host.patch b/package/exim/0001-Build-buildconfig-for-the-host.patch
> index 87eb527974..e9da80765a 100644
> --- a/package/exim/0001-Build-buildconfig-for-the-host.patch
> +++ b/package/exim/0001-Build-buildconfig-for-the-host.patch
> @@ -2,6 +2,8 @@ buildconfig is meant to be executed on the host, so it has to be compiled
>  using $(HOSTCC), not $(CC).
>  
>  Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> +[Bernd: rebased for version 4.97.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   OS/Makefile-Base |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
> @@ -10,7 +12,7 @@ diff --git a/OS/Makefile-Base b/OS/Makefile-Base
>  index 29a6ad3..420ba60 100644
>  --- a/OS/Makefile-Base
>  +++ b/OS/Makefile-Base
> -@@ -114,8 +114,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
> +@@ -258,8 +258,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
>   
>   # Targets for special-purpose configuration header builders
>   buildconfig: buildconfig.c
> diff --git a/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch b/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
> index 0cdaa744bc..3c115f8d02 100644
> --- a/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
> +++ b/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
> @@ -5,6 +5,8 @@ This leads to useless duplicated files on the target, so disable this
>  piece of code.
>  
>  Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> +[Bernd: rebased for version 4.97.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   scripts/exim_install |   18 +++++++++---------
>   1 files changed, 9 insertions(+), 9 deletions(-)
> @@ -13,7 +15,7 @@ diff --git a/scripts/exim_install b/scripts/exim_install
>  index 616ab3c..e68e7d5 100755
>  --- a/scripts/exim_install
>  +++ b/scripts/exim_install
> -@@ -344,15 +344,15 @@ while [ $# -gt 0 ]; do
> +@@ -348,15 +348,15 @@ while [ $# -gt 0 ]; do
>   
>     else
>       if ../scripts/newer ${name} ${BIN_DIRECTORY}/${name}; then
> diff --git a/package/exim/0003-Skip-version-check-and-symlink-installation.patch b/package/exim/0003-Skip-version-check-and-symlink-installation.patch
> index a342d6ed34..55166f108b 100644
> --- a/package/exim/0003-Skip-version-check-and-symlink-installation.patch
> +++ b/package/exim/0003-Skip-version-check-and-symlink-installation.patch
> @@ -9,8 +9,8 @@ Inspired by:
>  http://patch-tracker.debian.org/patch/series/view/exim4/4.76-2/35_install.dpatch
>  
>  Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -(rebased against exim 4.89)
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[Bernd: rebased for version 4.89 & 4.97.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   scripts/exim_install |    7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
> @@ -19,7 +19,7 @@ diff --git a/scripts/exim_install b/scripts/exim_install
>  index e68e7d5..487a4e1 100755
>  --- a/scripts/exim_install
>  +++ b/scripts/exim_install
> -@@ -58,6 +58,8 @@
> +@@ -61,6 +61,8 @@
>     shift
>   done
>   
> @@ -28,7 +28,7 @@ index e68e7d5..487a4e1 100755
>   # Get the values of BIN_DIRECTORY, CONFIGURE_FILE, INFO_DIRECTORY, NO_SYMLINK,
>   # SYSTEM_ALIASES_FILE, and EXE from the global Makefile (in the build
>   # directory). EXE is empty except in the Cygwin environment. In each case, keep
> -@@ -217,9 +219,7 @@
> +@@ -220,9 +223,7 @@
>     # The exim binary is handled specially
>   
>     if [ $name = exim${EXE} ]; then
> diff --git a/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch b/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
> index a0a279fc43..616ada5026 100644
> --- a/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
> +++ b/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
> @@ -22,6 +22,8 @@ Fixes:
>  
>  Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>  Upstream-status: https://bugs.exim.org/show_bug.cgi?id=2523
> +[Bernd: rebased for version 4.97.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   src/exim_lock.c | 3 +++
>   1 file changed, 3 insertions(+)
> @@ -30,8 +32,8 @@ diff --git a/src/exim_lock.c b/src/exim_lock.c
>  index 068216816054..cb140aff6436 100644
>  --- a/src/exim_lock.c
>  +++ b/src/exim_lock.c
> -@@ -13,6 +13,8 @@ Argument: the name of the lock file
> - Copyright (c) The Exim Maintainers 2016
> +@@ -14,6 +14,8 @@ Copyright (c) The Exim Maintainers 2016 - 2021
> + SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  
>  +#define _XOPEN_SOURCE
> @@ -39,7 +41,7 @@ index 068216816054..cb140aff6436 100644
>   #include "os.h"
>  
>   #include <stdio.h>
> -@@ -26,6 +28,7 @@ Copyright (c) The Exim Maintainers 2016
> +@@ -27,6 +29,7 @@ Copyright (c) The Exim Maintainers 2016
>   #include <unistd.h>
>   #include <utime.h>
>   #include <sys/utsname.h>
> diff --git a/package/exim/0005-sieve-fix-build-errors.patch b/package/exim/0005-sieve-fix-build-errors.patch
> index f4b95d50bc..20323c17cd 100644
> --- a/package/exim/0005-sieve-fix-build-errors.patch
> +++ b/package/exim/0005-sieve-fix-build-errors.patch
> @@ -21,6 +21,8 @@ buildsystem.
>  
>  Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>  Upstream-status: https://bugs.exim.org/show_bug.cgi?id=2523
> +[Bernd: rebased for version 4.97.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   src/sieve.c | 2 ++
>   1 file changed, 2 insertions(+)
> @@ -29,7 +31,7 @@ diff --git a/src/sieve.c b/src/sieve.c
>  index 5e8d1e6f4776..9632f2d43810 100644
>  --- a/src/sieve.c
>  +++ b/src/sieve.c
> -@@ -12,6 +12,8 @@
> +@@ -14,6 +14,8 @@
>  
>   /* Sieve mail filter. */
>  
> -- 
> 2.39.2
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
