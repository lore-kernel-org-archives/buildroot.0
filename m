From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Mar 2018 13:49:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux: fix custom dts files
 handling
In-Reply-To: <20180313113217.27657-1-rafal.susz@gmail.com>
References: <20180312213523.32213-1-rafal.susz@gmail.com>
 <20180313113217.27657-1-rafal.susz@gmail.com>
Message-ID: <20180313114901.unmgzziwzgim6dkz@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rafal,

On Tue, Mar 13, 2018 at 12:32:17PM +0100, Rafal Susz wrote:
> Custom dts files are still conditionally copied based on non existing
> boolean. So it is currently not possible to use custom dts file(s) at all.
> 
> List of dts files is now iterated and files are copied into dedicated kernel arch dir.
> 
> Signed-off-by: Rafal Susz <rafal.susz@gmail.com>
> ---
>  linux/linux.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index e98b25cb72..12f0b03dbc 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -370,8 +370,9 @@ endif
>  # Compilation. We make sure the kernel gets rebuilt when the
>  # configuration has changed.
>  define LINUX_BUILD_CMDS
> -	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
> -		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)

Commit f142f23ecf9ee (package/linux: drop useless intermediate DTS booleans) 
should have removed BR2_LINUX_KERNEL_USE_CUSTOM_DTS. There is another 
reference to this symbol below.

> +	@for dts in $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)); do \
> +		cp -f $${dts} $(KERNEL_ARCH_PATH)/boot/dts/ ;   \
> +	done
>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
>  	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then	\
>  		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
