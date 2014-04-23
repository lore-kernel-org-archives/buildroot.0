From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Apr 2014 23:02:50 +0200
Subject: [Buildroot] [PATCH 1/1] Adding extlinux to sysliux binaries
 copied into target/images.
In-Reply-To: <20140105122039.GA4201@zelow.no>
References: <20140105122039.GA4201@zelow.no>
Message-ID: <20140423210250.GB3183@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-05 13:20 +0100, Thomas Lundquist spake thusly:
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

This does not make sense at all:

  - extlinux is an executable, not a raw image. As such, it does not
    belong to $(O)/images/ but to $(TARGET_DIR)/sbin/

  - extlinux is anyway built as a host compiler, not the target
    compiler. As such, it is a host tool, not fitted for the target

The second point is a blocking point: if the host is a 64-bit machine,
then extlinux is built as a 64-bit executable. If the target is a 32-bit
machine, then extlinux will not run on it. Conversely, if the host is a
32-bit, and the target a pure 64-bit, the extlinux won't run either.

Without taking into account that some build machines might not even be
an x86 at all (eg. we have PowerPC-based autobuilders), so this is even
more wrong (but this is already the case without your patch anyway.)

So this patch does not make sense in the current state.

Note however that I'm about to submitted a (pretty large) series to bump
and enhance syslinux. Keep an eye open for it in the short future. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
