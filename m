From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Jun 2021 22:36:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/libkcapi: fix build on riscv32
In-Reply-To: <20210527204904.480560-1-fontaine.fabrice@gmail.com>
References: <20210527204904.480560-1-fontaine.fabrice@gmail.com>
Message-ID: <3ff67454-de48-2029-c05f-73d02ce28d55@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/05/2021 22:49, Fabrice Fontaine wrote:
> Fix the following build failure on riscv32:
> 
> lib/internal.h:331:20: error: '__NR_io_getevents' undeclared (first use in this function); did you mean 'io_getevents'?
>   331 |     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
>       |                    ^~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c828d4330a8888fe8db4299dc2f20759947f329f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...f-__NR_io_getevents-when-not-defined.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
> 
> diff --git a/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch b/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
> new file mode 100644
> index 0000000000..20aa75b741
> --- /dev/null
> +++ b/package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
> @@ -0,0 +1,42 @@
> +From 455c4938f5822c017c7ff79dd2dca638b6410923 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 15 Nov 2020 18:05:48 -0800
> +Subject: [PATCH] Disable use of __NR_io_getevents when not defined
> +
> +Architectures like riscv32 do not define this syscall, therefore return
> +ENOSYS on such architectures
> +
> +Upstream-Status: Pending

 I don't really like those vague OpenEmbedded patches :-)

 Applied to master, thanks.

 Regards,
 Arnout

> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Stephan Mueller <smueller@chronox.de>
> +[Retrieved from:
> +https://github.com/smuellerDD/libkcapi/commit/455c4938f5822c017c7ff79dd2dca638b6410923]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + lib/internal.h | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/internal.h b/lib/internal.h
> +index 1237827..f765461 100644
> +--- a/lib/internal.h
> ++++ b/lib/internal.h
> +@@ -325,10 +325,17 @@ static inline int io_submit(aio_context_t ctx, long n,  struct iocb **iocb)
> +     return syscall(__NR_io_submit, ctx, n, iocb);
> + }
> + 
> +-static inline int io_getevents(aio_context_t ctx, long min, long max,
> +-            struct io_event *events, struct timespec *timeout)
> ++static inline int io_getevents(__attribute__((unused)) aio_context_t ctx,
> ++            __attribute__((unused)) long min,
> ++            __attribute__((unused)) long max,
> ++            __attribute__((unused)) struct io_event *events,
> ++            __attribute__((unused)) struct timespec *timeout)
> + {
> ++#ifdef __NR_io_getevents
> +     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
> ++#else
> ++    return -ENOSYS;
> ++#endif
> + }
> + 
> + /************************************************************
> 
