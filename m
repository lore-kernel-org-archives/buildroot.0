From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 22:30:05 +0100
Subject: [Buildroot] [PATCH 1/1] gnu-efi: fix stdint include location
In-Reply-To: <1548460985-22568-1-git-send-email-james.hilliard1@gmail.com>
References: <1548460985-22568-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20190204223005.10f8689e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Sat, 26 Jan 2019 08:03:05 +0800
james.hilliard1 at gmail.com wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> Some applications such as systemd-boot include efilink.h without a libc.
> Move the stdint.h include to lib.h so that efilink.h can be used directly
> without requiring a libc.

This is a bit weird: gcc does provide <stdint.h>. It contains something
like this:

#ifndef _GCC_WRAP_STDINT_H
#if __STDC_HOSTED__
# if defined __cplusplus && __cplusplus >= 201103L
#  undef __STDC_LIMIT_MACROS
#  define __STDC_LIMIT_MACROS
#  undef __STDC_CONSTANT_MACROS
#  define __STDC_CONSTANT_MACROS
# endif
# include_next <stdint.h>
#else
# include "stdint-gcc.h"
#endif
#define _GCC_WRAP_STDINT_H
#endif

So, when there's a C library, it does a "include_next <stdint.h>" to
use the stdint.h from the C library, but otherwise it falls back to
stdint-gcc.h, which does provide a type definition for intptr_t.

Since elflink.h itself uses intptr_t, it seems to make sense for it to
include <stdint.h>. What exact error are you getting ?

It doesn't really help that this fix is sent standalone, without the
rest of the systemd-boot series, as it doesn't allow us to try to
reproduce the build issue.

>  .../0001-efilink-fix-build-with-gcc-4.8.patch      | 35 ++++++++++------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
> index 57c78c9..7dc8d8d 100644
> --- a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
> +++ b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
> @@ -1,5 +1,5 @@
> -From 6335e5c697c57d8b5854b8202de3733bcb151ca6 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +From 92d0653f09aa44b24b9306fa9384f13d2c9f1a24 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
>  Date: Fri, 18 Jan 2019 22:05:37 +0100

It's not really nice to "hijack" the authorship of the patch here, even
if admittedly it's just a one-liner.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
