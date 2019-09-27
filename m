From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Sep 2019 20:05:11 +0200
Subject: [Buildroot] [PATCH v5] br2-ext linux-kernel-extensions support
In-Reply-To: <20190927152631.228-1-robert.mccabe@rockwellcollins.com>
References: <20190927152631.228-1-robert.mccabe@rockwellcollins.com>
Message-ID: <20190927180511.GI7274@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2019-09-27 10:26 -0500, robert.mccabe at rockwellcollins.com spake thusly:
> From: "McCabe, Robert J" <robert.mccabe@rockwellcollins.com>
> 
> Allows br2-externals to inject custom code into the kernel tree.
> 
> Signed-off-by: McCabe, Robert J <robert.mccabe@rockwellcollins.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

However, see a small nitpick below...

> ---
>  docs/manual/customize-outside-br.txt | 14 ++++++++++++++
>  linux/linux.mk                       | 13 +++++++++----
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
> index 6ab01bcb1f..0588c478e7 100644
> --- a/docs/manual/customize-outside-br.txt
> +++ b/docs/manual/customize-outside-br.txt
> @@ -219,6 +219,12 @@ BR2_ROOTFS_OVERLAY=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/overlay/
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/kernel.config
>  ----
> 
> +===== Custom linux-kernel-extensions
> +
> +Custom code may be added to the Linux kernel tree as discussed in

I think the wording is inadequate. We don't really want to discuss
"custom code". The documentation currently does not delves into the
details of what a linux extension does, except it somehow "prepares" the
linux tree; the macro itself is suffixed with _PREPARE_KERNEL:

    09: define FOO_PREPARE_KERNEL
    10:     $(FOO_DIR)/prepare-kernel-tree.sh --linux-dir=$(@D)
    11: endef

I would just rephrase that as:

    Custom linux extensions (see xref:linux-kernel-ext[]) can be added
    by storing them in the `linux/` director at the root of your
    br2-external tree.

But apart from that, I'm OK with the patch.

Regards,
Yann E. MORIN.

> +xref:linux-kernel-ext[] by adding +linux/linux-ext-*.mk+ to the
> +br2-external tree.
> +
>  ===== Example layout
> 
>  Here is an example layout using all features of br2-external (the sample
> @@ -314,6 +320,14 @@ illustration, of course):
>    |     |$(eval $(toolchain-external-package))
>    |     `----
>    |
> +  |- linux/Config.ext.in
> +  |     |config BR2_LINUX_KERNEL_EXT_EXAMPLE_DRIVER
> +  |     |    bool "example-external-driver"
> +  |     |    help
> +  |     |      Example external driver
> +  |     |---
> +  |- linux/linux-ext-example-driver.mk
> +  |
>    |- configs/my-board_defconfig
>    |     |BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_BAR_42_PATH)/patches/"
>    |     |BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/overlay/"
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 29d2f0ee69..921558eeb2 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -513,14 +513,19 @@ endef
>  #
>  # Note: our package infrastructure uses the full-path of the last-scanned
>  # Makefile to determine what package we're currently defining, using the
> -# last directory component in the path. As such, including other Makefile,
> -# like below, before we call one of the *-package macro is usally not
> -# working.
> +# last directory component in the path. As such, including other Makefiles,
> +# like below, before we call one of the *-package macros usually doesn't
> +# work.
>  # However, since the files we include here are in the same directory as
>  # the current Makefile, we are OK. But this is a hard requirement: files
> -# included here *must* be in the same directory!
> +# included here *must* either be in this same directory OR within a
> +# another directory with the name "linux" (in the BR2_EXTERNAL case).
>  include $(sort $(wildcard linux/linux-ext-*.mk))
> 
> +#Import linux-kernel-extensions from externals
> +include $(sort $(wildcard $(foreach ext,$(BR2_EXTERNAL_DIRS), \
> +       $(ext)/linux/linux-ext-*.mk)))
> +
>  LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
>  	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
> 
> --
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
