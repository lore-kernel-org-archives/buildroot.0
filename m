From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 2 Jul 2021 22:36:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcc: fix libsanitizer in gcc
 11.1, 10.3 for linux 5.13
In-Reply-To: <20210701084718.1788688-1-fido_max@inbox.ru>
References: <20210701084718.1788688-1-fido_max@inbox.ru>
Message-ID: <8c5393e4-4686-3186-8de9-85c35166e9ef@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxim,

Le 01/07/2021 ? 10:47, Maxim Kochetkov via buildroot a ?crit?:
> Starting from 5.13 Cyclades async mux support is dropped from linux kernel:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f76edd8f7ce06cdff2fe5b6b39a49644c684a161
> 
> But gcc's libsanitizer uses <linux/cyclades.h> header.
> This issue is fixed by:
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=745dae5923aba02982563481d75a21595df22ff8
> 
> Right now just gcc 9.4.0 has this commit and 8.4.0 is proposed to be deleted.
> So we need to add this patch for 10.3 and 11.1 to fix build with linux kernel 5.13.

Indeed, but can you use the patch that has been backported to releases/gcc-10
stable branch after gcc 10.3 release:

https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=a7e72b282177fbaa6a852324641c871313d326da

Same for gcc-11:

https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=2b40941d23b1570cdd90083b58fa0f66aa58c86e

The patch from master branch doesn't apply cleanly, they are some "Hunk".

> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  ...04-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
>  ...01-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
>  create mode 100644 package/gcc/11.1.0/0001-Remove-cyclades-from-libsanitizer.patch
> 
> diff --git a/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch b/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
> new file mode 100644
> index 0000000000..d686fd7cc5
> --- /dev/null
> +++ b/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
> @@ -0,0 +1,123 @@
> +From 745dae5923aba02982563481d75a21595df22ff8 Mon Sep 17 00:00:00 2001
> +From: Tamar Christina <tamar.christina@arm.com>
> +Date: Fri, 21 May 2021 10:30:59 +0100
> +Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
> +
> +The Linux kernel has removed the interface to cyclades from
> +the latest kernel headers[1] due to them being orphaned for the
> +past 13 years.
> +
> +libsanitizer uses this header when compiling against glibc, but
> +glibcs itself doesn't seem to have any references to cyclades.
> +
> +Further more it seems that the driver is broken in the kernel and
> +the firmware doesn't seem to be available anymore.
> +
> +As such since this is breaking the build of libsanitizer (and so the
> +GCC bootstrap[2]) I propose to remove this.
> +
> +[1] https://lkml.org/lkml/2021/3/2/153
> +[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
> +
> +(cherry picked from commit f7c5351552387bd43f6ca3631016d7f0dfe0f135)

The upstream commit refer to a hash that come from llvm project, there is no
such commit in gcc repository:

https://github.com/llvm/llvm-project/commit/f7c5351552387bd43f6ca3631016d7f0dfe0f135

Best regards,
Romain
