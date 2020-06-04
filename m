From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Jun 2020 23:41:45 +0200
Subject: [Buildroot] [PATCH for-next v4 2/3] linux: introduce
 BR2_KERNEL_DTB_KEEP_DIRNAME
In-Reply-To: <20200601151701.21569-2-michael@walle.cc>
References: <20200601151701.21569-1-michael@walle.cc>
 <20200601151701.21569-2-michael@walle.cc>
Message-ID: <20200604214145.GK13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-06-01 17:17 +0200, Michael Walle spake thusly:
> In linux, newer architectures like ARM64 and RISC-V keep their device
> tree sources organized by subdirectories. When these device trees are
> installed by the kernel they will keep the directory names. But
> buildroot strips the prefixes when installing them into /boot or the
> images directory.
> Sometimes the bootloader references the device tree by name (e.g.
> u-boot has the environment variable 'fdtfile') which also includes
> the prefix directory.
> Make it possible to keep this prefix during installation, so we can
> be compatible with other distributions and make it easier for the
> user, because he doesn't have to change that environment variable.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Hi,
> 
> formerly, this was a seperate patch. But because the sl28 board also needs
> another patch now, I combined all of them into one patch series. So
> actually, there is no v2, nor a v3 of this patch.
> 
> Changes since v3:
>  none
> 
> Changes since v2:
>  none
> 
>  linux/Config.in |  7 +++++++
>  linux/linux.mk  | 10 ++++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index e335931575..814e6ceded 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -407,6 +407,13 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>  	  You can provide a list of dts paths to copy and
>  	  build, separated by spaces.
>  
> +config BR2_KERNEL_DTB_KEEP_DIRNAME
> +	bool "Keep the directory name of the Device Tree"
> +	help
> +	  If enabled, the device tree blobs keep their
> +	  directory prefixes when they get copied to the
> +	  output image directory or the target directory.
> +
>  config BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT
>  	bool "Build Device Tree with overlay support"
>  	help
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 60dc343efa..c6ad9e432e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -377,10 +377,12 @@ endef
>  ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),)
>  define LINUX_INSTALL_DTB
>  	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
> -	cp $(addprefix \
> -		$(LINUX_ARCH_PATH)/boot/$(if $(wildcard \
> -		$(addprefix $(LINUX_ARCH_PATH)/boot/dts/,$(LINUX_DTBS))),dts/),$(LINUX_DTBS)) \
> -		$(1)
> +	$(foreach dtb,$(LINUX_DTBS), \
> +		install -D $(addprefix \
> +			$(LINUX_ARCH_PATH)/boot/$(if $(wildcard \
> +			$(addprefix $(LINUX_ARCH_PATH)/boot/dts/,$(dtb))),dts/),$(dtb)) \
> +			$(1)/$(if $(BR2_KERNEL_DTB_KEEP_DIRNAME),$(dtb),$(notdir $(dtb)))

This code is rather difficult to read... :-(

However, I think there is a simplification: now that you iterate over
the DTBs, you don't need this anymore:

    $(addprefix $(LINUX_ARCH_PATH)/boot/dts/,$(dtb))

is just equivalent to:

    $(LINUX_ARCH_PATH)/boot/dts/$(dtb)

Also, the block is not nicely indented to show the imbrication of calls
and such.

Finally, the superfluous wildcard and test on it can be simplified by
using an $(or....) construct:

    install -D \
            $(or $(wildcard $(LINUX_ARCH_PATH)/boot/dts/$(dtb)),$(LINUX_ARCH_PATH)/boot/$(dtb)) \
            $(1)/$(if $(BR2_KERNEL_DTB_KEEP_DIRNAME),$(dtb),$(notdir $(dtb)))

CAre to test this, please?

Regards,
Yann E. MORIN.

>  endef
>  endif # BR2_LINUX_KERNEL_APPENDED_DTB
>  endif # BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
