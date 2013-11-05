From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Tue, 5 Nov 2013 08:58:10 -0600
Subject: [Buildroot] [PATCH] perf: libelf is required to compile perf
In-Reply-To: <1383660387-31193-1-git-send-email-andi@etezian.org>
References: <1383660387-31193-1-git-send-email-andi@etezian.org>
Message-ID: <OFB695B6D2.ECE9BEB8-ON86257C1A.004FD92A-86257C1A.005239BF@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andi,

Andi Shyti <andi@etezian.org> wrote on 11/05/2013 08:06:27 AM:

> Point this out in the related Config.in in the perf directory.
> 
> Mute the following error by selecting BR2_PACKAGE_LIBELF:
> 
> The perf tool in your kernel cannot be built without libelf.
> Either upgrade your kernel to >= 3.7, or enable the elfutils package.
> make: *** [/home/andi/repo/buildroot-snowball/output/build/perf-
> stable-linux-ux500-3.4/.stamp_built] Error 1
> 
> Signed-off-by: Andi Shyti <andi@etezian.org>
> ---
>  package/perf/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/perf/Config.in b/package/perf/Config.in
> index 88dce93..4b651b3 100644
> --- a/package/perf/Config.in
> +++ b/package/perf/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PERF
>     bool "perf"
>     depends on BR2_LINUX_KERNEL
>     depends on BR2_LARGEFILE
> +   depends on BR2_PACKAGE_LIBELF

Wouldn't you want this to be a select since LIBELF is required by this 
package? Also in the perf.mk you want to ensure that the libelf package is 
built before by adding a dependancy to the makefile.

ifeq ($(BR2_PACKAGE_LIBELF),y)
PERF_DEPENDENCIES += libelf
endif

Please see section 6.1.2 of the Buildroot manual:
http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-mk

>     help
>       perf (sometimes "Perf Events" or perf tools, originally
>       "Performance Counters for Linux") - is a performance
> -- 
> 1.8.4.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
