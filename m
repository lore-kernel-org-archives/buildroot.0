From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 10:09:59 +0200
Subject: [Buildroot] [PATCH v3 1/1] linux: allow firmware to be included
 in kernel
In-Reply-To: <20210423185842.50143-1-sam.voss@rockwellcollins.com>
References: <20210423185842.50143-1-sam.voss@rockwellcollins.com>
Message-ID: <20210424080959.GP298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

+Peter

On 2021-04-23 13:58 -0500, Sam Voss spake thusly:
> Add functionality to use the kernel's built-in options to allow binary
> blobs to be included with the kernel. This is equivalent to the blobs
> existing in /lib/firmware, however are available earlier in the boot
> process. This may be useful in situations where a device probes before
> the rootfs is fully available (such as a squashfs not being loaded
> before a usb device probing).

I'm a bit late to the party, but still...

Peter already provided a patch to ease including FW blobs in the kernel,
see commits:
  - af49734349c package/linux-firmware: also install into images for
    early loading support
  - dacf9d78f22 linux: build after linux-firmware if enabled for early
    loading support

See below for further comments...

> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> 
> ---
> 
> v2->v3:
>   Rebase onto master, take master's dependency of linux-firmware in all
>   cases where enabled.
> 
> v1->v2:
>   Add warning for GPL implications of building a blog into kernel.
> 
>  linux/Config.in | 20 ++++++++++++++++++++
>  linux/linux.mk  |  4 ++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index cf790963dd..d6ad91db1a 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -470,6 +470,26 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
>  	  CONFIG_UNWINDER_ORC=y, please install libelf-dev,
>  	  libelf-devel or elfutils-libelf-devel".
>  
> +config BR2_LINUX_KERNEL_EXTRA_FIRMWARE
> +	bool "Build firmware binaries into the kernel"
> +	help
> +	  Include the firmware from linux-firmware into the kernel
> +	  using the CONFIG_EXTRA_FIRMWARE option.
> +
> +	  WARNING: If you include additional firmware files into your
> +	  binary kernel image that are not available under the terms
> +	  of the GPL, then it may be a violation of the GPL to
> +	  distribute the resulting image since it combines both GPL
> +	  and non-GPL work. You should consult a lawyer of your own
> +	  before distributing such an image.
> +
> +config BR2_LINUX_KERNEL_EXTRA_FIRMWARE_BINARIES
> +	string "External firmware blobs to build into the kernel binary"
> +	depends on BR2_LINUX_KERNEL_EXTRA_FIRMWARE
> +	help
> +	  Space delimited list of firmware to be built into the kernel.
> +	  These files must exist in the target's /lib/firmware.

These two are just copies of the kernel config options. We can't
reasonably have a Buildroot option for each of the kernel option.
See further below, too...

>  # Linux extensions
>  source "linux/Config.ext.in"
>  
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 1457228eb9..59f876c41e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -372,6 +372,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_FB)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
> +	$(if $(BR2_LINUX_KERNEL_EXTRA_FIRMWARE),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_FIRMWARE_IN_KERNEL)
> +		$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE,$(BR2_LINUX_KERNEL_EXTRA_FIRMWARE_BINARIES))
> +		$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,"$(TARGET_DIR)/lib/firmware"))

So this is going against the spirit of af49734349c, which suggests that
FW blobs be used out f BIANRIES_DIR, because they may be missing from
TARGET_DIR eventually (e.g. on a second call to make during development)

And then, what prevents you from carrying that list in your kernel
configuration (or configuration fragment)?

    CONFIG_FIRMWARE_IN_KERNEL=y
    CONFIG_EXTRA_FIRMWARE="your list of stuff"
    CONFIG_EXTRA_FIRMWARE_DIR="$(BR_BINARIES_DIR)"

(BR_BINARIES_DIR is documented. Not. Patch welcome. ;-] )

(Aside: I'm always of the position that a configuration for a project is
not limited to the Buildroot configuration, by far, but includes the
config files for other components, post scripts, etc... and what can go
in those does not belong to the Buildroot configuration.)

Leaving this pending in case other maintainers see differently, but if
this is applied, this should at the very least change to look for FW
blobs in BINARIES_DIR.

Regards,
Yann E. MORIN.

>  	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
>  	$(PACKAGES_LINUX_CONFIG_FIXUPS)
>  endef
> -- 
> 2.17.1
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
