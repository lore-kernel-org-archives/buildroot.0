From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 21:58:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcc: undefine NDEBUG directive
In-Reply-To: <20210617121943.800180-1-br015@umbiko.net>
References: <20210617121943.800180-1-br015@umbiko.net>
Message-ID: <20210704195817.GK2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2021-06-17 14:19 +0200, Andreas Ziegler spake thusly:
> GCC performs internal consistency checks that can be controlled with --enable-checking, but not completely removed for all stages of the build. One of these checks uses the assert macro from <assert.h>  Defining NDEBUG removes the assertion code, which is not anticipated in the gcc code. 
> 
> Undefine the NDEBUG flag for package/gcc to preserve assertions. 
> 
> This fixes the following error during build of GCC 10:
> 
> ../../../libgomp/target.c: In function ?gomp_unmap_vars_internal?:
> ../../../libgomp/target.c:1474:9: error: unused variable ?is_tgt_unmapped? [-Werror=unused-variable]
>  1474 |    bool is_tgt_unmapped = gomp_remove_var (devicep, k);
>       |         ^~~~~~~~~~~~~~~
> ../../../libgomp/target.c:1473:28: error: unused variable ?k_tgt? [-Werror=unused-variable]
>  1473 |    struct target_mem_desc *k_tgt = k->tgt;
>       |                            ^~~~~
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

We are now no longer setting NDEBUG in the infra; see a1c7cff1a081.

So this patch is no longer needed; I've marked it as rejected.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/gcc/gcc.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index ed9b93e50f..4ee32c03a7 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -90,7 +90,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
>  HOST_GCC_COMMON_CONF_ENV = \
>  	MAKEINFO=missing
>  
> -GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
> +# gcc should not be built with NDEBUG enabled
> +GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS) -UNDEBUG
>  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>  
>  # used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
