From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Dec 2016 18:53:56 +0100
Subject: [Buildroot] [PATCH v3] usbip: new package
In-Reply-To: <1481581303-28490-1-git-send-email-tal.shorer@gmail.com>
References: <CAFDyS3P=SMKSnoBi5QFR=PrTTsNiOK05yeAEdw7OHVW-D5Z1qA@mail.gmail.com>
 <1481581303-28490-1-git-send-email-tal.shorer@gmail.com>
Message-ID: <20161213175356.GB3546@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2016-12-13 00:21 +0200, Tal Shorer spake thusly:
> add the usbip package from the kernel source, allowing users to share
> usb devices over a network connection
> 
> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
> ---
>  package/linux-tools/Config.in |  2 ++
>  package/usbip/Config.in       |  5 +++++
>  package/usbip/usbip.mk        | 21 +++++++++++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/usbip/Config.in
>  create mode 100644 package/usbip/usbip.mk
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index db9ed9f..7fceca7 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -83,4 +83,6 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  
> +source package/usbip/Config.in
> +
>  endmenu
> diff --git a/package/usbip/Config.in b/package/usbip/Config.in
> new file mode 100644
> index 0000000..becc437
> --- /dev/null
> +++ b/package/usbip/Config.in
> @@ -0,0 +1,5 @@

Maybe add a small comment above the config option to state that this is
included from the linux-tools infra, rather than from the usual
package/Config.in, to avoid confusing developpers later on...

> +config BR2_PACKAGE_USBIP
> +	bool"usbip"

So you dropped the dependency on !static. Does that mean you were able
to test it with a static build?

It also required libudev, so you have to depend on BR2_PACKAGE_HAS_UDEV.

It needs usb.ids from usbutils, so you also need to select it:

    # This file is included from linux-tools, not from the usual
    # package/Config.in location, because it is a linux tools, but uses
    # the autotool infra
    config BR2_PACKAGE_USBIP
        bool "usbip"
        depends on BR2_PACKAGE_HAS_UDEV
        depends on BR2_TOOLCHAIN_HAS_THREADS # usbutils <- libusb
        select BR2_PACKAGE_USBUTILS

    comment "usbip needs udev /dev management and toolchain w/ threads"
        depends on !BR2_PACKAGE_HAS_UDEV \
                || !BR2_TOOLCHAIN_HAS_THREADS


It also has optional support for libwrap, which we do not have in
Buildroot. See below...

> +	help
> +	  usbip is a set of tools that allows machines to share their
> +	  usb devices over the network, to be driven by a remote client.
> diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
> new file mode 100644
> index 0000000..72c5c58
> --- /dev/null
> +++ b/package/usbip/usbip.mk
> @@ -0,0 +1,21 @@
> +###############
> +# usbip
> +###############

Incorrect header. ;-)

> +# No USBIP_SITE, no USB_VERSION, we vampirise the code from the
> +# linux kernel
> +USBIP_PATCH_DEPENDENCIES = linux

Since it uses udev, you also have to depend on it:

    USBIP_PATCH_DEPENDENCIES = linux
    USBIP_DEPENDENCIES = udev

(Just to show that you have both types of dependencies.)

Also, it can use libwrap, which we do not have in Buildroot, so you
may want to forcibly disable it:

    USBIP_CONF_OPTS = --without-tcp-wrappers

> +USBIP_SRC_DIR = $(wildcard \
> +  $(LINUX_DIR)/tools/usb/usbip \
> +  $(LINUX_DIR)/drivers/staging/usbip/userspace)
> +
> +define USBIP_EXTRACT_CMDS
> +	if [[ -z "$(USBIP_SRC_DIR)" ]]; then \

No need to use [[...]], you can simply use [...] here.

> +	    echo "No usbip source in your kernel tree" 2>&1; \
> +	    exit 1; \
> +	fi
> +	rsync -a $(USBIP_SRC_DIR)/ $(@D)

I think you will want to really mimick the rsync rule we use elsewhere:

    rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $(USBIP_SRC_DIR)/ $(@D)

Cordialement,
Yann E. MORIN.

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
