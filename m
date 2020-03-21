From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Mar 2020 21:36:36 +0100
Subject: [Buildroot] [PATCH v4] package/busybox: patch for glibc-2.31
 and musl-1.2.0 compatibility
In-Reply-To: <20200315115910.31365-1-unixmania@gmail.com>
References: <20200315115910.31365-1-unixmania@gmail.com>
Message-ID: <47d05f0e-8266-75ee-36a5-b06daeedd3cf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

Le 15/03/2020 ? 12:59, unixmania at gmail.com a ?crit?:
> From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> 
> Current release of busybox 1_31_1 is failing to build with glibc-2.31
> due to removal of stime() from glibc. It also fails to build with musl
> 1.2.0 due to the direct use of __NR_clock_gettime.

This patch is far too big IMHO ;-)
It would be great if you can split this patch an create a patch series.

> 
> This commit adds six patches: one is a prerequisite for the subsequent
> patches, three to fix 64-bit time_t issues, one to fix the direct use of
> __NR_clock_gettime, which is not safe, and one that removes
> stime() function calls.

Instead of backporting patch 0003, try to rebase patch 0008 over busybox 1.31.1.

But for the remaining patches, maybe you can squash then since the patch 0007
remove the syscall wrappers around clock_gettime that was modified by patch
0004, 0005, 0006.

It would be great to ask upstream for a new release 1.32 or backport those
patches to 1.31.x.

Another solution would be using the current busybox master as a last resort.

Best regards,
Romain

> 
> Fixes:
>   http://autobuild.buildroot.net/results/f45f91aea6deee6699eabdfa618ac44873b8da51/
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Supersedes: https://patchwork.ozlabs.org/patch/1249916/
> ---
> Changes v4:
> - Rabase on the master branch
> - Add SOB lines to patches
> ---
>  ...-overhead-of-single-parameter-bb_err.patch | 7637 +++++++++++++++++
>  ...-Use-64-prefix-syscall-if-we-have-to.patch |   59 +
>  ...-Use-64-prefix-syscall-if-we-have-to.patch |   48 +
>  ...-Use-64-prefix-syscall-if-we-have-to.patch |   48 +
>  ...rappers-around-clock_gettime-closes-.patch |  132 +
>  .../0008-Remove-stime-function-calls.patch    |   95 +
>  6 files changed, 8019 insertions(+)
>  create mode 100644 package/busybox/0003-libbb-reduce-the-overhead-of-single-parameter-bb_err.patch
>  create mode 100644 package/busybox/0004-date-Use-64-prefix-syscall-if-we-have-to.patch
>  create mode 100644 package/busybox/0005-time-Use-64-prefix-syscall-if-we-have-to.patch
>  create mode 100644 package/busybox/0006-runsv-Use-64-prefix-syscall-if-we-have-to.patch
>  create mode 100644 package/busybox/0007-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
>  create mode 100644 package/busybox/0008-Remove-stime-function-calls.patch
> 
