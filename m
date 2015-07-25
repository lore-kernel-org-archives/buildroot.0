From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 18:23:43 +0200
Subject: [Buildroot] [PATCH v2] rtl8188eu: new package
In-Reply-To: <1437839304-26204-1-git-send-email-luca@lucaceresoli.net>
References: <1437839304-26204-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150725162343.GJ3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2015-07-25 17:48 +0200, Luca Ceresoli spake thusly:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
[--SNIP--]
>  package/Config.in                                  |  1 +
>  .../0001-Makefile-quote-CROSS_COMPILE.patch        | 33 ++++++++++++++++++
>  ...002-Makefile-add-a-modules_install-target.patch | 34 +++++++++++++++++++
>  ...03-Makefile-add-a-firmware_install-target.patch | 32 ++++++++++++++++++
>  ...stall-use-firmware_install-to-copy-the-fi.patch | 39 ++++++++++++++++++++++
>  ...stall-remove-double-firmware-installation.patch | 28 ++++++++++++++++

I don't think those last two patches are needed in the Buildroot
context, since all you did is use the modules_install target (by
way of the kernel-module infra) and firmware_install target (by
way of the post-install hook).

Sure, they are probably good for upstream, but do we really need
them in Buildroot?

[--SNIP--]
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> new file mode 100644
> index 000000000000..dec0900434d1
> --- /dev/null
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# rtl8188eu
> +#
> +################################################################################
> +
> +RTL8188EU_VERSION = 3091828c8f4b4a01cbec6025128bf77e6e7b9f97
> +RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
> +RTL8188EU_DEPENDENCIES = linux
> +RTL8188EU_LICENSE = GPLv2, proprietary (rtl8188eufw.bin firmware blob)
> +RTL8188EU_LICENSE_FILES = COPYING
> +RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
> +
> +$(eval $(kernel-module))
> +
> +define RTL8188EU_INSTALL_FIRMWARE
> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) firmware_install
> +endef
> +RTL8188EU_POST_INSTALL_TARGET_HOOKS += RTL8188EU_INSTALL_FIRMWARE

Aha! It's funny how people will use the infras. Christian for his
rtl8821au driver defined a _INSTALL_TARGET_CMDS while you defined a
post-install hook.

Both are purely valid, of course, but I would prefer we stick to a
single solution for consistemcy.

I would tend to prefer your solution, Luca, since the firmware is
tightly coupled to the kernel module, while the _INSTALL_TARGET_CMDS
would be related to the non-module part of the package.

Except for the two unneeded patches, when/if you respin, you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +$(eval $(generic-package))
> -- 
> 1.9.1
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
