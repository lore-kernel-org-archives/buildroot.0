From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Apr 2019 22:48:32 +0200
Subject: [Buildroot] [PATCH] linux: simplify LINUX_BUILD_CMDS
In-Reply-To: <20190408202136.22944-1-thomas.petazzoni@bootlin.com>
References: <20190408202136.22944-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190408204832.GD23890@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-04-08 22:21 +0200, Thomas Petazzoni spake thusly:
> We currently do the Linux build as follows:
> 
>    make <imagename>
>    if modules enabled; make modules; fi
> 
> However, Clement L?ger recently reported that due to us not using the
> "all" target, the GDB scripts that the kernel can build when
> CONFIG_GDB_SCRIPTS is enabled are not built, since upstream kernel
> commit 67274c083438340ad16c1437caebc84e1253b224 (merged in v5.1) moved
> that logic to a separate scripts_gdb target, which is a dependency of
> the "all" target.
> 
> While we could add some more logic to explicit generate the
> "scripts_gdb" target, this logic would fail on Linux < 5.1 for which
> this make target doesn't exist.
> 
> So instead, let's simplify the build logic, and use:
> 
>   make all <imagename>

While we are at simplifying: do we still need to specify imagename?

Isn't the image name either:
  - implicit for the architecture, or
  - specified as a config option in the linux configuration?

> The "all" target automatically depends on "modules", so we no longer
> need to explicit generate the "modules" target separately.
> 
> As a result of this change, we may generate additional kernel images
> compared to what was done previously, but such images would anyway not
> be installed, and the additional built time is minimal.
> 
> We did some research as to why the kernel build was done like this in
> Buildroot, and it's been like that since linux/linux.mk was added back
> in 2010 by commit 487e21cff69b30b404146b2ffb46959a728a4002 ("New,
> simpler, infrastructure for building the Linux kernel").
> 
> Reported-by: Cl?ment Leger <cleger@kalray.eu>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c7081db88f..46645f4780 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -438,10 +438,7 @@ define LINUX_BUILD_CMDS
>  	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
>  		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
>  	)
> -	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
> -	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
> -		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ; \
> -	fi
> +	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all $(LINUX_TARGET_NAME)
>  	$(LINUX_BUILD_DTB)
>  	$(LINUX_APPEND_DTB)
>  endef
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
