From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 May 2019 19:05:53 +0200
Subject: [Buildroot] [PATCH 2/2] fs/iso9660: add specified files to image
In-Reply-To: <20190519113648.31566-1-skif@skif-web.ru>
References: <20190519113648.31566-1-skif@skif-web.ru>
Message-ID: <20190519170553.GB5097@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2019-05-19 14:36 +0300, Alexey Lukyanchuk spake thusly:
> Allows to add any specified files to iso-image

Same as for the grub2 patch: what are you trying to achieve with this
patch?

> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
> ---
>  fs/iso9660/Config.in  |  5 +++++
>  fs/iso9660/iso9660.mk | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index 6f001c0640..588fc307a5 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -81,6 +81,11 @@ config BR2_TARGET_ROOTFS_ISO9660_HYBRID
>  	  which BIOS considers a hard disk or ZIP disk, e.g. a USB key
>  	  or similar.
>  
> +config BR2_ROOTFS_ISO9660_ADDITIONAL_FILES
> +	string "Add additional files to iso"
> +	help
> +	  Use this option to add any additional files to iso
> +
>  endif
>  
>  comment "iso image needs a Linux kernel and either grub2 i386-pc or isolinux to be built"
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index a129655ce3..809f883be7 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -23,6 +23,7 @@
>  #     of BR2_TARGET_ROOTFS_ISO9660_INITRD).
>  
>  ROOTFS_ISO9660_BOOT_MENU = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
> +ROOTFS_ISO9660_ADDITIONAL_FILES=$(call qstrip,$(BR2_ROOTFS_ISO9660_ADDITIONAL_FILES))

Please keep the coding style consistent, and use spaces around the equal
sign, like the line just above.

>  ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit linux
>  
> @@ -143,4 +144,15 @@ endef
>  ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
>  endif
>  
> +define ROOTFS_ISO9660_ADD_ADDITIONAL_FILES
> +	for i in $(ROOTFS_ISO9660_ADDITIONAL_FILES); do
> +		$(INSTALL) -D -m 0755 $${i} \
> +			$(ROOTFS_ISO9660_TMP_TARGET_DIR)/
> +	done

Does this even works? The lines are missing continuation '\', so make
will try to run three commands:

    1. for i in $(ROOTFS_ISO9660_ADDITIONAL_FILES); do
    2. (INSTALL) -D -m 0755 $${i} $(ROOTFS_ISO9660_TMP_TARGET_DIR)/
    3. done

Of course, the first is incomplete, so make will barf on it.

> +endef
> +
> +ifneq ($(ROOTFS_ISO9660_ADDITIONAL_FILES),)
> +ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_ADD_ADDITIONAL_FILES

Kepp the hook definition and assignment in the conditional block, like
is done for ROOTFS_ISO9660_GEN_HYBRID, just above.

Regards,
Yann E. MORIN.

> +endif
> +
>  $(eval $(rootfs))
> -- 
> 2.20.1
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
