From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jan 2014 16:16:02 +0100
Subject: [Buildroot] [PATCH 1/1] Adding extlinux to sysliux binaries
 copied into target/images.
In-Reply-To: <20140105122039.GA4201@zelow.no>
References: <20140105122039.GA4201@zelow.no>
Message-ID: <20140105151602.GA3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-05 13:20 +0100, Thomas Lundquist spake thusly:

Subject should be something like:
    syslinux: add option to install extlinux

> Using the mail address I have on Github, which is the reason for the difference
> in addresses.

This should not be part of the commit log. If you want to add somthing
like that, do it after the three-dash line, below...

> Signed-off-by: Thomas Lundquist <thomasez@redpill-linpro.com>
> ---

...here. That '---' line above tells git to ignore it and all that
follows, as not being part of the commit message itself.

>  boot/syslinux/Config.in   | 4 ++++
>  boot/syslinux/syslinux.mk | 7 +++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
> index 2c39e65..5773abb 100644
> --- a/boot/syslinux/Config.in
> +++ b/boot/syslinux/Config.in
> @@ -17,4 +17,8 @@ config BR2_TARGET_SYSLINUX_PXELINUX
>  	bool "Install pxelinux"
>  	default y
>  
> +config BR2_TARGET_SYSLINUX_EXTLINUX
> +	bool "Install extlinux"
> +	default y
> +
>  endif
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index eedc364..bfc2694 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -26,10 +26,17 @@ endef
>  SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += isolinux.bin
>  SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += pxelinux.bin
>  
> +ifeq ($(BR2_TARGET_SYSLINUX_EXTLINUX),y)
> +define SYSLINUX_INSTALL_EXTLINUX
> +	$(INSTALL) -D -m 0755 $(@D)/extlinux/extlinux $(BINARIES_DIR)/extlinux;
> +endef
> +endif
> +
>  define SYSLINUX_INSTALL_IMAGES_CMDS
>  	for i in $(SYSLINUX_IMAGES-y); do \
>  		$(INSTALL) -D -m 0755 $(@D)/core/$$i $(BINARIES_DIR)/$$i; \
>  	done
> +    $(SYSLINUX_INSTALL_EXTLINUX)

Use leading tabs, not spaces.

However, I'd rather we use a generic command, such as:

SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += core/isolinux.bin
SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += core/pxelinux.bin
SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EXTLINUX) += extlinux/extlinux

define SYSLINUX_INSTALL_IMAGES_CMDS
    for i in $(SYSLINUX_IMAGES-y); do \
        $(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/$${i##*/}; \
    done
endef

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
