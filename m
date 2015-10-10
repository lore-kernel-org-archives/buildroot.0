From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Oct 2015 17:04:57 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
In-Reply-To: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
References: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151010150457.GD3640@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-09 15:26 +0200, Romain Naour spake thusly:
> The PCI support needs to be checked since this driver is based
> on it. Otherwise the build fail with:
>  #error "This driver requires PCI support to be available"
> 
> But this message is concealed by several occurrence of this
> one:
>  error: implicit declaration of function 'pci_find_bus' [-Werror=implicit-function-declaration]
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
[--SNIP--]
> diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
> new file mode 100644
> index 0000000..275c67e
> --- /dev/null
> +++ b/package/iqvlinux/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_IQVLINUX
> +	bool "iqvlinux"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  Intel Ethernet Adapter Debug Driver for Linux (iqvlinux),
> +	  which supports kernel versions 2.6.x up through 4.0.x.

What about 4.1+ ?

Should we do a version-check at configure time, or is there such a check
already done by the package itself?

[--SNIP--]
> diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
> new file mode 100644
> index 0000000..ed98f1f
> --- /dev/null
> +++ b/package/iqvlinux/iqvlinux.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# iqvlinux
> +#
> +################################################################################
> +
> +IQVLINUX_VERSION = 1.1.5.3
> +
> +IQVLINUX_SITE = \
> +	http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
> +IQVLINUX_SOURCE = iqvlinux.tar.gz
> +
> +IQVLINUX_LICENSE = GPLv2 or BSD-3c
> +IQVLINUX_LICENSE_FILES = COPYING src/linux/driver/files.txt \
> +	inc/linux/files.txt inc/files.txt
> +
> +IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) KSRC=$(LINUX_DIR) CC=$(TARGET_CC)

Are you sure CC is needed? The kernel buildsystem should already set it, no?

> +IQVLINUX_MODULE_SUBDIRS = src/linux/driver
> +
> +ifeq ($(BR2_PACKAGE_IQVLINUX),y)
> +define IQVLINUX_PCI_CHECK
> +	@if ! grep -Fqx 'CONFIG_PCI=y' $(LINUX_DIR)/.config; then \
> +		echo "ERROR: Enable CONFIG_PCI in the linux kernel config." 1>&2 ; \
> +		exit 1; \
> +	fi
> +endef
> +
> +# Check if PCI is enabled in the Linux kernel build by Buildroot.
> +LINUX_POST_CONFIGURE_HOOKS += IQVLINUX_PCI_CHECK
> +endif

I really do not like that a package meddles in the affairs of another
package, like setting hooks for it.

I'd rather we add a variable that packages could set to require specific
kernel config options, something like:

    IQVLINUX_LINUX_NEEDS_CONFIG_OPTS = CONFIG_PCI

Then in package/pkg-generic, in the inner-generic-package macro:

    LINUX_NEEDS_CONFIG_OPTS += $$($(2)_NEEDS_LINUX_CONFIG)

And finally in linux/linux.mk:

    define LINUX_CHECK_CONFIG_OPTS
        $(foreach cfg,$(strip $(LINUX_NEEDS_CONFIG_OPTS)),\
            if ! grep -E '^$(cfg)=y$$' $(@D)/.config >/dev/null; then \
                printf "ERROR: Enable %s in your linux kernel config." "$(cfg)"; \
                exit 1; \
            fi;)
    endef
    LINUX_POST_CONFIGURE_HOOKS += LINUX_CHECK_CONFIG_OPTS

Regards,
Yann E. MORIN.

> +$(eval $(kernel-module))
> +$(eval $(generic-package))
> -- 
> 2.4.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
