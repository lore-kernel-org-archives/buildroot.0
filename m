From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Aug 2014 14:47:30 +0300
Subject: [Buildroot] [PATCH] uclibc: synchronize bits/time.h with latest
 glibc
In-Reply-To: <1408097013-6159-1-git-send-email-jcmvbkbc@gmail.com>
References: <1408097013-6159-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140815114730.GB20528@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Fri, Aug 15, 2014 at 02:03:33PM +0400, Max Filippov wrote:
> This fixes NetworkManager build on uClibc.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d33/d33ed1c3bf1be7c8f8ea02590a770b0d29c7d9fa/

This was fixed for network-manager locally by Peter in commit 7e33639ecf3 
(network-manager: fix build on toolchains not exporting CLOCK_BOOTTIME (E.G. 
uClibc)). Patching Buildroot internal uClibc doesn't fix the problem for 
external uClibc toolchain, so we'll have to patch each package using these 
macros locally anyway.

Also, this patch applies only to the xtensa specific version of uClibc, which 
is a snapshot of uClibc master. Since this patch is already in uClibc master, 
why not simply advance the snapshot version to current master instead?

baruch

> Backported from: e2cf30bb7543a99defd457226a39de8d8860fa9e
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...c-0003-bits-time.h-sync-with-latest-glibc.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0003-bits-time.h-sync-with-latest-glibc.patch
> 
> diff --git a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0003-bits-time.h-sync-with-latest-glibc.patch b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0003-bits-time.h-sync-with-latest-glibc.patch
> new file mode 100644
> index 0000000..de3fe13
> --- /dev/null
> +++ b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0003-bits-time.h-sync-with-latest-glibc.patch
> @@ -0,0 +1,38 @@
> +From e2cf30bb7543a99defd457226a39de8d8860fa9e Mon Sep 17 00:00:00 2001
> +From: Mike Frysinger <vapier@gentoo.org>
> +Date: Fri, 1 Aug 2014 04:16:12 -0400
> +Subject: [PATCH] bits/time.h: sync with latest glibc
> +
> +Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> +---
> + libc/sysdeps/linux/common/bits/time.h | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/libc/sysdeps/linux/common/bits/time.h b/libc/sysdeps/linux/common/bits/time.h
> +index b397b60..c4269ae 100644
> +--- a/libc/sysdeps/linux/common/bits/time.h
> ++++ b/libc/sysdeps/linux/common/bits/time.h
> +@@ -1,5 +1,5 @@
> +-/* System-dependent timing definitions.  Generic version.
> +-   Copyright (C) 1996,1997,1999-2002,2003 Free Software Foundation, Inc.
> ++/* System-dependent timing definitions.  Linux version.
> ++   Copyright (C) 1996-2014 Free Software Foundation, Inc.
> +    This file is part of the GNU C Library.
> + 
> +    The GNU C Library is free software; you can redistribute it and/or
> +@@ -59,6 +59,12 @@
> + #   define CLOCK_REALTIME_COARSE	5
> + /* Monotonic system-wide clock, updated only on ticks.  */
> + #   define CLOCK_MONOTONIC_COARSE	6
> ++/* Monotonic system-wide clock that includes time spent in suspension.  */
> ++#   define CLOCK_BOOTTIME		7
> ++/* Like CLOCK_REALTIME but also wakes suspended system.  */
> ++#   define CLOCK_REALTIME_ALARM		8
> ++/* Like CLOCK_BOOTTIME but also wakes suspended system.  */
> ++#   define CLOCK_BOOTTIME_ALARM		9
> + 
> + /* Flag to indicate time is absolute.  */
> + #   define TIMER_ABSTIME		1
> +-- 
> +1.8.1.4
> +

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
