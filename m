From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Sep 2016 23:27:26 +0200
Subject: [Buildroot] [PATCH] linux-tools: add gpio
In-Reply-To: <20160914120928.27087-1-m.niestroj@grinn-global.com>
References: <20160914120928.27087-1-m.niestroj@grinn-global.com>
Message-ID: <20160923212726.GA4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin, All,

On 2016-09-14 14:09 +0200, Marcin Niestroj spake thusly:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Since you siubmitted this patch, the linux-tools infra has seen some
overhaul. linux-tools is now a package on its own:

    http://nightly.buildroot.org/#linux-kernel-specific-infra

It basically follows the same logic as the previous infra, so porting it
over should be minimal work. Could you please adapt and respin, please?

In the meantime, here's my review below...

> ---
>  linux/Config.tools.in    |  9 +++++++++
>  linux/linux-tool-gpio.mk | 28 ++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 linux/linux-tool-gpio.mk
> 
> diff --git a/linux/Config.tools.in b/linux/Config.tools.in
> index 5ada98d..303c967 100644
> --- a/linux/Config.tools.in
> +++ b/linux/Config.tools.in
> @@ -14,6 +14,15 @@ comment "cpupower needs a toolchain w/ wchar"
>  	depends on !BR2_bfin
>  	depends on !BR2_USE_WCHAR && BR2_NEEDS_GETTEXT
>  
> +config BR2_LINUX_KERNEL_TOOL_GPIO

This would now have to be BR2_PACKAGE_LINUX_TOOLS_GPIO.

> +	bool "gpio"
> +	help
> +	  gpio is a collection of tools to get information about,
> +	  control and monitor gpios present on system.
> +
> +	  These tools use new gpio ABI which will deprecate sysfs gpio
> +	  interface in the future.
> +
>  config BR2_LINUX_KERNEL_TOOL_PERF
>  	bool "perf"
>  	help
> diff --git a/linux/linux-tool-gpio.mk b/linux/linux-tool-gpio.mk
> new file mode 100644
> index 0000000..bd38e67
> --- /dev/null
> +++ b/linux/linux-tool-gpio.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# gpio
> +#
> +################################################################################
> +
> +LINUX_TOOLS += gpio
> +
> +GPIO_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS)
> +
> +define GPIO_BUILD_CMDS
> +	$(Q)if ! grep install $(@D)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
> +		echo "Your kernel version is too old and does not have the gpio tools." ; \
> +		echo "At least kernel 4.8 must be used." ; \
> +		exit 1 ; \
> +	fi
> +
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \

And now you'd have to use $(LINUX_DIR) instead of $(@D).

> +		$(GPIO_MAKE_OPTS) \
> +		gpio
> +endef
> +
> +define GPIO_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \

Ditto, $(LINUX_DIR).

Otherwise, after conversion to the new linux-tools pckage, it would look
good.

Care to adapt and respin, please? In the meantime, I've marked your
patch as "changes requested" in our patchwork.

Thanks! :-)

Regards,
Yann E. MORIN.

> +		$(GPIO_MAKE_OPTS) \
> +		DESTDIR=$(TARGET_DIR) \
> +		gpio_install
> +endef
> -- 
> 2.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
