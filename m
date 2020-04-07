From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 22:32:36 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gcc: pass -Wno-error to
 debug builds
In-Reply-To: <20200407192622.46151-1-james.hilliard1@gmail.com>
References: <20200407192622.46151-1-james.hilliard1@gmail.com>
Message-ID: <20200407203236.GA29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-04-07 13:26 -0600, James Hilliard spake thusly:
> Fixes:
> ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    return S_ISLNK (st.st_mode);
>                      ^
> Upstream has been unable to reproduce/fix properly, details:
> https://gcc.gnu.org/legacy-ml/gcc-patches/2019-03/threads.html#00827
> 
> Upstream recommends passing -Wno-error as a workaround, see:
> https://gcc.gnu.org/pipermail/gcc-patches/2019-April/519867.html
> 
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I added a reproducing defconfig, extended the commit log a little bit,
and pushed to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - add more details to message
> Changes v1 -> v2:
>   - add comment from Yocto recipes
> ---
>  package/gcc/gcc.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 524ca83db0..fe7167b2f3 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -100,6 +100,11 @@ HOST_GCC_COMMON_CONF_ENV = \
>  GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
>  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>  
> +# used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +GCC_COMMON_TARGET_CFLAGS += -Wno-error
> +endif
> +
>  # Propagate options used for target software building to GCC target libs
>  HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
>  HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
> -- 
> 2.20.1
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
