From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 21:44:15 +0200
Subject: [Buildroot] [PATCH 12/12] reproducible/syslinux: make syslinux
 build reproducible
In-Reply-To: <1465918337-30732-3-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918337-30732-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918337-30732-3-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160717194415.GS3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:32 +0200, Gilles Chanteperdrix spake thusly:
> Build with the target toolchain so that the binaries are identical with
> different host toolchains.
> Sort files lists in order to get deterministic link order.
> Build with HEXDATE set to the source date epoch.

It looks like those are three different changes, so should have been
three different patches.

Especially the change to use the cross-toolchain should really be
separate (and come first).

Further comments below...

> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
[--SNIP--]
> diff --git a/boot/syslinux/0001-fixed-build-order.patch b/boot/syslinux/0001-fixed-build-order.patch
> new file mode 100644
> index 0000000..3697b74
> --- /dev/null
> +++ b/boot/syslinux/0001-fixed-build-order.patch
> @@ -0,0 +1,42 @@
> +Sort source file names in order for the link order not to depend on the order in
> +which find return file names.
> +
> +Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>

Have you tried submitting this patch upstream?

We do not much like having feature patches in Buildroot, because they
are a pain to maintain when we want to update the package.

Otherwise, this looks pretty simple, I guess upstream will probably like
it. ;-)

[--SNIP--]
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index 82890c5..cdd5b3c 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -13,7 +13,7 @@ SYSLINUX_LICENSE_FILES = COPYING
>  
>  SYSLINUX_INSTALL_IMAGES = YES
>  
> -SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
> +SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx host-perl host-python host-xz

Why are those new host packages needed?

>  ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
>  SYSLINUX_TARGET += bios
> @@ -47,12 +47,35 @@ define SYSLINUX_CLEANUP
>  endef
>  SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
>  
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +define SYSLINUX_REPRODUCIBLE
> +	HEXDATE="`printf "0x%x" $(SOURCE_DATE_EPOCH)`"
> +endef
> +endif
> +
> +define SYSLINUX_MAKE
> +	$(TARGET_MAKE_ENV) $(MAKE1) \
> +		$(SYSLINUX_REPRODUCIBLE) \
> +		NASM=$(HOST_DIR)/usr/bin/nasm \
> +		PERL=$(HOST_DIR)/usr/bin/perl \
> +		PYTHON=$(HOST_DIR)/usr/bin/python \

Why do we need to specify nasm, perl and python? The PATH as set by
Buildroot already has the host dirs early in the PATH, so they should
be found before the system ones.

> +		UPX=$(HOST_DIR)/usr/bin/upx \
> +		CC="$(TARGET_CC)" \
> +		LD="$(TARGET_LD) -m elf_i386" \
> +		OBJDUMP="$(TARGET_OBJDUMP)" \
> +		OBJCOPY="$(TARGET_OBJCOPY)" \
> +		STRIP="$(TARGET_STRIP)" \
> +		AR="$(TARGET_AR)" \
> +		NM="$(TARGET_NM)" \
> +		RANLIB="$(TARGET_RANLIB)" \
> +		XZ=$(HOST_DIR)/usr/bin/xz $(SYSLINUX_EFI_ARGS)

Ditto xz.

You're also adding more variables than were present in the existing
commands; that's why using the cross-toolchain should be a separate
patch: so that we can more easily understand the changes.

> +endef
> +
>  # syslinux build system has no convenient way to pass CFLAGS,
>  # and the internal zlib should take precedence so -I shouldn't
>  # be used.
>  define SYSLINUX_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
> -		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
> +	$(SYSLINUX_MAKE) -C $(@D) $(SYSLINUX_TARGET)
>  endef
>  
>  # While the actual bootloader is compiled for the target, several
> @@ -61,8 +84,7 @@ endef
>  # Repeat CC and AR, since syslinux really wants to check them at
>  # install time
>  define SYSLINUX_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
> -		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
> +	$(SYSLINUX_MAKE) INSTALLROOT=$(@D)/inst \
>  		-C $(@D) $(SYSLINUX_TARGET) install
>  endef
>  
> @@ -80,10 +102,21 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
>  	for i in $(SYSLINUX_IMAGES-y); do \
>  		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/syslinux/$${i##*/}; \
>  	done
> -	for i in $(SYSLINUX_C32); do \
> -		$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/share/syslinux/$${i} \
> +	for i in $(SYSLINUX_C32) ldlinux.c32; do \
> +		$(INSTALL) -D -m 0755 $(@D)/inst/usr/share/syslinux/$${i} \
>  			$(BINARIES_DIR)/syslinux/$${i}; \
>  	done
>  endef
>  
> +define HOST_SYSLINUX_BUILD_CMDS
> +       $(HOST_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
> +-               AR="$(HOSTAR)" -C $(@D) bios
   ^
Leading dash here?...

Also, use TABs for indentation of the *_CMDS defines.

But then, you are building the 'bios' stuff with the host compiler.
Doesn't that defeats the very purpose of that patch, and contradicts the
commit log itself (which states that we are now using the target
toolchain) ?

> +endef
> +
> +define HOST_SYSLINUX_INSTALL_CMDS
> +       $(HOST_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
> +-               AR="$(HOSTAR)" -C $(@D) INSTALLROOT=$(HOST_DIR) bios install
> +endef
> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))

Since you submitted this patch, we've changed the way how dependencies
of host packages are handled: they are no longer automatically inherited
from the dependencies of the target variant; you now have to explicitly
define the dependencies of the host variant.

Regards,
Yann E. MORIN.

> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index f97a9d7..db22ca4 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -70,8 +70,6 @@ ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
>  define ROOTFS_ISO9660_INSTALL_BOOTLOADER
>  	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/* \
>  		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/
> -	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/syslinux/ldlinux.c32 \
> -		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
>  endef
>  endif
>  
> @@ -166,6 +164,8 @@ define ROOTFS_ISO9660_CMD
>  endef
>  
>  ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
> +ROOTFS_ISO9660_DEPENDENCIES += host-syslinux
> +
>  define ROOTFS_ISO9660_GEN_HYBRID
>  	$(ROOTFS_ISO9660_ISOHYBRID) -t 0x96 $@
>  endef
> -- 
> 2.8.2
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
