From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 May 2016 22:07:33 +0200
Subject: [Buildroot] [PATCH] dosfstools: security bump to version 4.0
In-Reply-To: <1463675290-22004-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463675290-22004-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160524200733.GD3621@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2016-05-19 13:28 -0300, Gustavo Zacarias spake thusly:
> Fixes:
> 
> CVE-2015-8872 - if the third to last entry was written on a FAT12
> filesystem with an odd number of clusters, the second to last entry
> would be corrupted. This corruption may also lead to invalid memory
> accesses when the corrupted entry becomes out of bounds and is used
> late.
> 
> CVE-2016-4804 - the variable used for storing the FAT size (in bytes)
> was an unsigned int. Since the size in sectors read from the BPB was not
> sufficiently checked, this could end up being zero after multiplying it
> with the sector size while some offsets still stayed excessive.
> Ultimately it would cause segfaults when accessing FAT entries for which
> no memory was allocated.
> 
> Converted package to autotools infra to match upstream.
> 
> The install options are now removals, enabled compatibilty symlinks and
> exec-prefix set to / to match previous install names/locations.
> 
> Accounted for optional udev usage.
> 
> Dropped musl compatibility patch since it's upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-mkfs.fat-fix-incorrect-int-type.patch     | 45 ----------------
>  package/dosfstools/dosfstools.hash                 |  2 +-
>  package/dosfstools/dosfstools.mk                   | 63 ++++++++--------------
>  3 files changed, 24 insertions(+), 86 deletions(-)
>  delete mode 100644 package/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
> 
> diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
> index b7f7d96..00fea6b 100644
> --- a/package/dosfstools/dosfstools.mk
> +++ b/package/dosfstools/dosfstools.mk
> @@ -4,65 +4,48 @@
>  #
>  ################################################################################
>  
> -DOSFSTOOLS_VERSION = 3.0.28
> +DOSFSTOOLS_VERSION = 4.0
>  DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
>  DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
>  DOSFSTOOLS_LICENSE = GPLv3+
>  DOSFSTOOLS_LICENSE_FILES = COPYING
> +DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
>  
>  # Avoid target dosfstools dependencies, no host-libiconv
>  HOST_DOSFSTOOLS_DEPENDENCIES =
>  
> -DOSFSTOOLS_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +DOSFSTOOLS_CONF_OPTS += --with-udev
> +DOSFSTOOLS_DEPENDENCIES += udev
> +else
> +DOSFSTOOLS_CONF_OPTS += --without-udev
> +endif
>  
>  ifneq ($(BR2_ENABLE_LOCALE),y)
> +DOSFSTOOLS_CONF_OPTS += LIBS="-liconv"
>  DOSFSTOOLS_DEPENDENCIES += libiconv
> -DOSFSTOOLS_LDLIBS += -liconv
>  endif
>  
> -define DOSFSTOOLS_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		CFLAGS="$(DOSFSTOOLS_CFLAGS)" LDLIBS="$(DOSFSTOOLS_LDLIBS)" -C $(@D)
> -endef
> -
> -ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),y)
> -define DOSFSTOOLS_INSTALL_FATLABEL
> -	$(INSTALL) -D -m 755 $(@D)/fatlabel $(TARGET_DIR)/sbin/fatlabel
> -	ln -sf fatlabel $(TARGET_DIR)/sbin/dosfslabel
> +ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),)
> +define DOSFSTOOLS_REMOVE_FATLABEL
> +	rm -f $(addprefix $(TARGET_DIR)/sbin/,dosfslabel fatlabel)
>  endef
> +DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FATLABEL
>  endif
>  
> -ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),y)
> -define DOSFSTOOLS_INSTALL_FSCK_FAT
> -	$(INSTALL) -D -m 755 $(@D)/fsck.fat $(TARGET_DIR)/sbin/fsck.fat
> -	ln -fs fsck.fat $(TARGET_DIR)/sbin/dosfsck
> -	ln -fs fsck.fat $(TARGET_DIR)/sbin/fsck.msdos
> -	ln -fs fsck.fat $(TARGET_DIR)/sbin/fsck.vfat
> +ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),)
> +define DOSFSTOOLS_REMOVE_FSCK_FAT
> +	rm -f $(addprefix $(TARGET_DIR)/sbin/,fsck.fat dosfsck fsck.msdos fsck.vfat)
>  endef
> +DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FSCK_FAT
>  endif
>  
> -ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),y)
> -define DOSFSTOOLS_INSTALL_MKFS_FAT
> -	$(INSTALL) -D -m 755 $(@D)/mkfs.fat $(TARGET_DIR)/sbin/mkfs.fat
> -	ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkdosfs
> -	ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkfs.msdos
> -	ln -fs mkfs.fat $(TARGET_DIR)/sbin/mkfs.vfat
> +ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),)
> +define DOSFSTOOLS_REMOVE_MKFS_FAT
> +	rm -f rm -f $(addprefix $(TARGET_DIR)/sbin/,mkfs.fat mkdosfs mkfs.msdos mkfs.vfat)

Double "rm -f rm -f".

Otherwise looks good...

Regards,
Yann E. MORIN.

>  endef
> +DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_MKFS_FAT
>  endif
>  
> -define DOSFSTOOLS_INSTALL_TARGET_CMDS
> -	$(DOSFSTOOLS_INSTALL_FATLABEL)
> -	$(DOSFSTOOLS_INSTALL_FSCK_FAT)
> -	$(DOSFSTOOLS_INSTALL_MKFS_FAT)
> -endef
> -
> -define HOST_DOSFSTOOLS_BUILD_CMDS
> -	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
> -endef
> -
> -define HOST_DOSFSTOOLS_INSTALL_CMDS
> -	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr install
> -endef
> -
> -$(eval $(generic-package))
> -$(eval $(host-generic-package))
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.7.3
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
