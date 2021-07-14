From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Jul 2021 19:02:52 +0200
Subject: [Buildroot] [PATCH] boot/uboot: fix uboot build failure with
 UBOOT_CUSTOM_DTS_PATH on uboot version >= 2020.x
In-Reply-To: <20210209201303.195093-1-giulio.benetti@benettiengineering.com>
References: <20210209201303.195093-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210714170252.GA12203@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2021-02-09 21:13 +0100, Giulio Benetti spake thusly:
> Starting from version 2020.x

Do we know exactly what upstream commit made that impossible?

Maybe looking at that commit can hint at an upstremable fix?

> uboot can't build .dts files not listed in
> dts/Makefile leading to a build failure when trying to pass a .dts file to
> UBOOT_CUSTOM_DTS_PATH. So let's prepend that file(s) to dts/Makefile if
> UBOOT_CUSTOM_DTS_PATH is used.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  boot/uboot/uboot.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2478a2a1e9..a5ad101d68 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -303,6 +303,11 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>  UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
>  
>  define UBOOT_BUILD_CMDS
> +	$(if $(UBOOT_CUSTOM_DTS_PATH),
> +		$(Q)$(SED) \
> +		'1s;^;dtb-y += $(subst .dts,.dtb,$(call notdir,$(UBOOT_CUSTOM_DTS_PATH)))\n;' \
> +		$(@D)/arch/$(UBOOT_ARCH)/dts/Makefile

How will this behave when one does 'make uboot-rebuild' ?

As far as I can see, this is going to endlessly inject the custom dtb,
leading to multiple instances of it...

Also, it means that the sources we provide as part of legal-info would
not contain this line, and thus could be considered non compliant.

So, I don't think this is a good solution.

If we were to do that, then I think we should;

 0. remove the possibility to use out-of-tree custom DTS, and instruct
    users to provide a patch against uboot, that adds the dts and the
    corresponding Makefile rule;

 1. patch the dts Makefiles to add the possibility to build an arbitrary
    (set of) dtb from the command line;

 2. work with upstream to re-isntate the possibility to specify an
    arbitrary (set of) dtb to build from the command line.

Of course, I think the first option (0) is the dsafest one, because it
means the legal-info *will* be complete, as the dts and its rules are
then part of the patches saved by legal-info, while options 1 and 2
makes it too easy to forget about providing those dts when gettign in
compliance.

Of corse, options 0 is also a bit inconvenient for one-off builds. But
between a bit of inconvenience, and being non-compliant, I know where my
vote goes.

Regards,
Yann E. MORIN.

> +	)
>  	$(if $(UBOOT_CUSTOM_DTS_PATH),
>  		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
>  	)
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
