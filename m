From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Dec 2016 21:45:39 +0100
Subject: [Buildroot] [PATCH v4] usbip: new package
In-Reply-To: <1481736504-12256-1-git-send-email-tal.shorer@gmail.com>
References: <20161213175356.GB3546@free.fr>
 <1481736504-12256-1-git-send-email-tal.shorer@gmail.com>
Message-ID: <20161222204539.GB3474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2016-12-14 19:28 +0200, Tal Shorer spake thusly:
> add the usbip package from the kernel source, allowing users to share
> usb devices over a network connection
> 
> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
[--SNIP--]
> diff --git a/package/usbip/Config.in b/package/usbip/Config.in
> new file mode 100644
> index 0000000..bb92a05
> --- /dev/null
> +++ b/package/usbip/Config.in
> @@ -0,0 +1,14 @@
> +# sourced from package/linux-tools/Config.in rather than from package/Config.in
> +
> +config BR2_PACKAGE_USBIP
> +	bool "usbip"
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # usbutils <- libusb
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_USBUTILS

It is weird to see usbutils being selected here, but not appear in the
dependnecy list in the .mk. But that's because it is only a runtime
dependency. You need to state so, with a comment like:

    select BR2_PACKAGE_USBUTILS # runtime

> +	help
> +	  usbip is a set of tools that allows machines to share their
> +	  usb devices over the network, to be driven by a remote client.
> +
> +comment "usbip needs udev /dev management and toolchain w/ threads"
> +	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS

This comment should also mention the !static case. However, in a
previous iteration, you did remove this restriction. Can you confirm
that usbip does not build in a static-only build?

If not, then the comment should also account for that:

    comment "usbip needs udev /dev management and a toolchain w/ threads, shared library"
            depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS \
                    || BR2_STATIC_LIBS

See the manual:
    https://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options

I'll try to give it a spin here in a moment...

Regards,
Yann E. MORIN.

> diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
> new file mode 100644
> index 0000000..7c8e244
> --- /dev/null
> +++ b/package/usbip/usbip.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# usbip
> +#
> +################################################################################
> +
> +# No USBIP_SITE, no USB_VERSION, we vampirise the code from the
> +# linux kernel
> +USBIP_PATCH_DEPENDENCIES = linux
> +USBIP_DEPENDENCIES = udev
> +
> +USBIP_CONF_OPTS = --without-tcp-wrappers
> +
> +USBIP_SRC_DIR = $(wildcard \
> +  $(LINUX_DIR)/tools/usb/usbip \
> +  $(LINUX_DIR)/drivers/staging/usbip/userspace)
> +
> +define USBIP_EXTRACT_CMDS
> +	if [ -z "$(USBIP_SRC_DIR)" ]; then \
> +	    echo "No usbip source in your kernel tree" 2>&1; \
> +	    exit 1; \
> +	fi
> +	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $(USBIP_SRC_DIR)/ $(@D)
> +endef
> +
> +$(eval $(autotools-package))
> -- 
> 2.7.4
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
