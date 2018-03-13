From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Mar 2018 18:21:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux: fix custom dts files
 handling
In-Reply-To: <20180313142635.27423-1-rafal.susz@gmail.com>
References: <20180313113217.27657-1-rafal.susz@gmail.com>
 <20180313142635.27423-1-rafal.susz@gmail.com>
Message-ID: <20180313172102.GA4317@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rafal, All,

On 2018-03-13 15:26 +0100, Rafal Susz spake thusly:
> Custom dts files are still conditionally copied based on non existing
> boolean. So it is currently not possible to use custom dts file(s) at all.
> 
> List of dts files is now iterated and files are copied into dedicated kernel arch dir.
> 
> Signed-off-by: Rafal Susz <rafal.susz@gmail.com>
> ---
>  configs/s6lx9_microboard_defconfig | 1 -
>  linux/linux.mk                     | 9 +++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
> index f77c80ba87..97b2d3fe79 100644
> --- a/configs/s6lx9_microboard_defconfig
> +++ b/configs/s6lx9_microboard_defconfig
> @@ -10,5 +10,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.7"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/avnet/s6lx9_microboard/lx9_mmu_defconfig"
> -BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
>  BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/avnet/s6lx9_microboard/lx9_mmu.dts"

I would prefer if it were two patches:
  - one to fix linux.mk
  - another to fix the defconfig

> diff --git a/linux/linux.mk b/linux/linux.mk
> index e98b25cb72..94bfb9661a 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -370,8 +370,9 @@ endif
>  # Compilation. We make sure the kernel gets rebuilt when the
>  # configuration has changed.
>  define LINUX_BUILD_CMDS
> -	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
> -		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
> +	@for dts in $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)); do \
> +		cp -f $${dts} $(KERNEL_ARCH_PATH)/boot/dts/ ;   \
> +	done
>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
>  	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then	\
>  		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
> @@ -482,9 +483,9 @@ $(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUST
>  endif
>  endif
>  
> -ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
> +ifeq ($(strip $(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME)),y)

Only $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) should be stripped, while the
boolean $(BR2_LINUX_KERNEL_DTS_SUPPORT) needs not. Also, I'd prefer if
there was a separator between the boolean and the free-form string:

    ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT):$(strip $(KERNEL_DTS_NAME)),y:)

Regards,
Yann E. MORIN.

>  endif
>  
>  endif # BR_BUILDING
> -- 
> 2.16.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
