From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 11 Mar 2013 16:05:26 +0530
Subject: [Buildroot] uClibc trunk build error
In-Reply-To: <513AD64F.90607@synopsys.com>
References: <513AD64F.90607@synopsys.com>
Message-ID: <513DB36E.5040900@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 09 March 2013 11:57 AM, Vineet Gupta wrote:
> Hi,
> 
> I'm seeing a compile error with uClibc trunk (commit 60c1fe7,
> "nptl/allocatestack.c: Fix stack mprotect") - ported to ARC architecture (with old
> pthreads + no-legacy-syscall ABI)
> 
> The test case is extracted from a dated version of LTP open posix suite and it
> simply involves
> (1) #include signal.h
> (2) build options -D_POSIX_C_SOURCE=200112L
> 
> #include <signal.h>
> 
> int main(void)
> {
>     return 0;
> }
> 
> See the patch below to see the exact error:
> 
> The problem is happening because pthreadtypes.h doesn't ensure that all it's
> dependencies are actually met
> IMHO it's not an arch specific error, but a generic one, primarily triggered after
> the following upstream commit
> 52029220899bc6, "bits/types.h: remove thread types, users should include pthread.h"
> 
> Please consider applying.
> 
> Thx,
> -Vineet
> 
> ---------------------->
> From: Vineet Gupta <vgupta@synopsys.com>
> Date: Sat, 9 Mar 2013 11:41:08 +0530
> Subject: [PATCH] libpthreads{,old}: Fix Build error
> 
> A user application built with -D_POSIX_C_SOURCE=200112L and
>  #include signal.h, yields following compilation error:
> 
> ------------------->8-----------------------------
> arc-linux-uclibc-gcc -D_POSIX_C_SOURCE=200112L hello.c
> In file included from
> /opt/INSTALL/lib/gcc/arc-linux-uclibc/4.4.7/../../../../arc-linux-uclibc/sys-include/signal.h:429,
>                  from hello.c:1:
> /opt/INSTALL/lib/gcc/arc-linux-uclibc/4.4.7/../../../../arc-linux-uclibc/sys-include/bits/pthreadtypes.h:48:
> error: expected specifier-qualifier-list before 'size_t'
> ------------------->8-----------------------------
> 
> The fix is to make sure size_t is explicitly provided to pthreadtype.h
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  .../sysdeps/pthread/bits/pthreadtypes.h            |    3 +++
>  .../sysdeps/pthread/bits/pthreadtypes.h            |    3 +++
>  2 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/libpthread/linuxthreads.old/sysdeps/pthread/bits/pthreadtypes.h
> b/libpthread/linuxthreads.old/sysdeps/pthread/bits/pthreadtypes.h
> index faec63b..3eb5929 100644
> --- a/libpthread/linuxthreads.old/sysdeps/pthread/bits/pthreadtypes.h
> +++ b/libpthread/linuxthreads.old/sysdeps/pthread/bits/pthreadtypes.h
> @@ -19,6 +19,9 @@
>  #ifndef _BITS_PTHREADTYPES_H
>  #define _BITS_PTHREADTYPES_H    1
>  
> +#define __need_size_t
> +#include <stddef.h>
> +
>  #define __need_schedparam
>  #include <bits/sched.h>
>  
> diff --git a/libpthread/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h
> b/libpthread/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h
> index 4ea6d8a..8d01c89 100644
> --- a/libpthread/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h
> +++ b/libpthread/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h
> @@ -19,6 +19,9 @@
>  #ifndef _BITS_PTHREADTYPES_H
>  #define _BITS_PTHREADTYPES_H    1
>  
> +#define __need_size_t
> +#include <stddef.h>
> +
>  #define __need_schedparam
>  #include <bits/sched.h>
>  


I can confirm that an ARM buildroot based toolchain,  configured with uClibc daily
snapshot (BR2_UCLIBC_VERSION_SNAPSHOT) + old pthreads suffers from same problem.

----------------------->8---------------------------
./host/usr/bin/arm-linux-gcc test.c -D_POSIX_C_SOURCE=200112L
In file included from
/home/vineetg/arc/buildroot/VERSATILE/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/signal.h:429:0,
                 from test.c:1:
/home/vineetg/arc/buildroot/VERSATILE/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/pthreadtypes.h:48:3:
error: unknown type name 'size_t'
/home/vineetg/arc/buildroot/VERSATILE/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/pthreadtypes.h:51:3:
error: unknown type name 'size_t'
----------------------->8---------------------------

Thanks,
-Vineet
