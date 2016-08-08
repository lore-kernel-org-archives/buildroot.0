From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 8 Aug 2016 07:42:45 +0300
Subject: [Buildroot] [PATCH 1/2] package/rt-tests: remove
 sched_setattr/sched_getattr API for SuperH arch
In-Reply-To: <1470607398-8644-1-git-send-email-romain.naour@gmail.com>
References: <1470607398-8644-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160808044245.GM3873@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, Aug 08, 2016 at 12:03:17AM +0200, Romain Naour wrote:
> This commit remove rt-sched.o from librttest and pi_stress test program
> only for SuperH arch which doesn't have __NR_sched_setattr and
> __NR_sched_getattr syscalls defined.
> 
> Patch [1] adding these syscalls has not been merged in upstream kernel
> (4.7).

But these syscalls were added for 4.8-rc1 (commit 74bdaa611fa69). This 
solution prevents sched_{set,get}attr use even for future v4.8+ kernels.

baruch

> Fixes:
> http://autobuild.buildroot.net/results/67fc16366717f34df492683a14ecd23376e23110
> 
> [1] http://www.spinics.net/lists/linux-sh/msg41990.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/rt-tests/rt-tests.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
> index 19f1021..1433106 100644
> --- a/package/rt-tests/rt-tests.mk
> +++ b/package/rt-tests/rt-tests.mk
> @@ -14,6 +14,16 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
>  RT_TESTS_DEPENDENCIES = python
>  endif
>  
> +# Deadline scheduler syscalls are not defined on SuperH.
> +# Remove pi_stress which depends on deadline scheduler syscalls.
> +ifeq ($(BR2_sh),y)
> +define RT_TESTS_REMOVE_RT_SCHED_API
> +	$(SED) "s/rt-sched.o//" $(@D)/Makefile
> +	$(SED) "s/pi_stress.c//" $(@D)/Makefile
> +endef
> +endif
> +RT_TESTS_POST_PATCH_HOOKS += RT_TESTS_REMOVE_RT_SCHED_API
> +
>  define RT_TESTS_BUILD_CMDS
>  	$(MAKE) -C $(@D) 			\
>  		CC="$(TARGET_CC)" 		\

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
