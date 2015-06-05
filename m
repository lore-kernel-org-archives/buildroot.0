From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2015 00:51:05 +0200
Subject: [Buildroot] [PATCH 10/12] fs/iso9660: add hybrid image support
In-Reply-To: <1433430330-2166-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150605225105.GK3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-04 17:05 +0200, Thomas Petazzoni spake thusly:
> This commit adds a new option, which allows, when isolinux is used as
> the bootloader, to generate an "hybrid" ISO image. Such images can
> either be booted from CD-ROM or from USB keys. It simply uses the
> isohybrid tool provided by syslinux.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, a comment, below...

> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index c95485c..792a770 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -142,4 +142,12 @@ endef
>  ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_REMOVE_TEMPDIR
>  endif
>  
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
> +define ROOTFS_ISO9660_GEN_HYBRID
> +	$(HOST_DIR)/usr/bin/isohybrid $@

The default partition type is 0x17, which is nothing very interesting.
What about setting it to 0x96 instead, which is 'ISO-9660 file system':

    https://en.wikipedia.org/wiki/Partition_type

Regards,
Yann E. MORIN.

> +endef
> +
> +ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
> +endif
> +
>  $(eval $(call ROOTFS_TARGET,iso9660))
> -- 
> 2.1.0
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
