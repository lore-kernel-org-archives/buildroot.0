From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Dec 2016 19:24:51 +0100
Subject: [Buildroot] [PATCH v4] usbip: new package
In-Reply-To: <1481736504-12256-1-git-send-email-tal.shorer@gmail.com>
References: <20161213175356.GB3546@free.fr>
 <1481736504-12256-1-git-send-email-tal.shorer@gmail.com>
Message-ID: <20161223182451.GB3592@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2016-12-14 19:28 +0200, Tal Shorer spake thusly:
> add the usbip package from the kernel source, allowing users to share
> usb devices over a network connection

So, I finally had time to test this. I'm sad to report that it does not
work... :-(

Here's my defconfig:

    BR2_x86_i686=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
    BR2_PACKAGE_USBIP=y

The first error is that the patch dependencies are only acted upon at
the time the package is actually patched, not extracted. So the linux
kernel sources are not extracted (and patched) at the time we try to
rsync the usbip source tree.

This is easily fixable by making linux a "classic" dependency, but that
is not really nice... :-/

Then, the source code for usbip only has configure.ac, not configure,
so it needs USBIP_AUTORECONF = YES.

But then the build fails because it is missing linux/usbip.h. The
toolchain I'm using is too old to have this header.

usbip.h has been installed starting with kernel 3.17, so you also have
to depend on the correct kernel headers version:

    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17

I've stopped here, I started another build with a more recent toolchain
with more recent kernel headers. I'll further report when the build is
finished...

Regards,
Yann E. MORIN.

> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
> ---
>  package/linux-tools/Config.in |  2 ++
>  package/usbip/Config.in       | 14 ++++++++++++++
>  package/usbip/usbip.mk        | 26 ++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+)
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
> +	help
> +	  usbip is a set of tools that allows machines to share their
> +	  usb devices over the network, to be driven by a remote client.
> +
> +comment "usbip needs udev /dev management and toolchain w/ threads"
> +	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
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
