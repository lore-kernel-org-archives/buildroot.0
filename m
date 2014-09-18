From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 18 Sep 2014 14:38:41 +0300
Subject: [Buildroot] [PATCH] libpfm4: needs NPTL support
In-Reply-To: <1411039335-20178-1-git-send-email-abrodkin@synopsys.com>
References: <1411039335-20178-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140918113841.GH2452@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Thu, Sep 18, 2014 at 03:22:15PM +0400, Alexey Brodkin wrote:
> Fixes following build failure when tools use Linux threads instead of NPTL:
> --->---
> self_smpl_multi.c: In function 'my_thread':
> self_smpl_multi.c:354:2: error: implicit declaration of function 'pthread_barrier_wait' [-Werror=implicit-function-declaration]
>   pthread_barrier_wait(&barrier);
>   ^
> self_smpl_multi.c: In function 'main':
> self_smpl_multi.c:450:2: error: implicit declaration of function 'pthread_barrier_init' [-Werror=implicit-function-declaration]
>   pthread_barrier_init(&barrier, 0, max_thr+1);
>   ^
> cc1: all warnings being treated as errors
> --->---
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libpfm4/Config.in | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libpfm4/Config.in b/package/libpfm4/Config.in
> index 86ca8f6..91b56a3 100644
> --- a/package/libpfm4/Config.in
> +++ b/package/libpfm4/Config.in
> @@ -2,13 +2,12 @@ config BR2_PACKAGE_LIBPFM4
>  	bool "libpfm4"
>  	depends on !BR2_avr32 # no perf_event_open
>  	depends on !BR2_xtensa && !BR2_bfin # no nptl or linuxthreads (new)

You can remove this line as well.

> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	help
>  	  A helper library to help encode Performance Events to use with
>  	  Operating system kernels performance monitoring interfaces.
>  
>  	  http://perfmon2.sourceforge.net/
>  
> -comment "libpfm4 needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -	depends on !BR2_avr32 && !BR2_xtensa && !BR2_bfin
> +comment "libpfm4 needs a toolchain w/ NPTL"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL

Strictly speaking the !BR2_avr32 dependency is not related to NPTL, so it 
should stay. avr32 support is deprecated and should be removed soon anyway, so 
I'm not sure it's worth the hassle.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
