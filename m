From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Aug 2018 23:53:46 +0200
Subject: [Buildroot] [PATCH 2/2] fs/btrfs: Introducing btrfs rootfs
 support.
In-Reply-To: <20180823220156.4173-1-robert.heywood@codethink.co.uk>
References: <20180823220156.4173-1-robert.heywood@codethink.co.uk>
Message-ID: <20180824215346.GX9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2018-08-23 23:01 +0100, Robert J. Heywood spake thusly:
> This patch makes it possible to format the rootfs using btrfs.
> It introduces the option; BR2_TARGET_ROOTFS_BTRFS
> 
> When selected, the user is able to specify the filesystem size,
> label, options, and node and sector sizes.
> The new files are based on fs/ext2/{Config.in,ext2.mk}
> 
> Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, two very minor comments, which a maintainer can fix while
applying, and that escape my tired eye the previous iterations, see
below...

> diff --git a/fs/btrfs/Config.in b/fs/btrfs/Config.in
> new file mode 100644
> index 0000000000..52fbfd983a
> --- /dev/null
> +++ b/fs/btrfs/Config.in
> @@ -0,0 +1,51 @@
> +config BR2_TARGET_ROOTFS_BTRFS
> +	bool "btrfs root filesystem"
> +	select BR2_PACKAGE_HOST_BTRFS_PROGS
> +	help
> +	  Build a btrfs root filesystem. If you enable this option, you
> +	  probably want to enable the btrfs-progs package too.
> +
> +

Only one empty seprarting line is enough.

> +if BR2_TARGET_ROOTFS_BTRFS
> +
> +config BR2_TARGET_ROOTFS_BTRFS_LABEL
> +	string "filesystem label"
> +
> +config BR2_TARGET_ROOTFS_BTRFS_SIZE
> +	string "filesystem size"
> +	default "100m"
> +	help
> +	  The size of the filesystem image in bytes.
> +	  Suffix with k, m, g or t for power-of-two kilo-, mega-, giga-
> +	  or terabytes.
> +
> +config BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR
> +	string "sector size"
> +	default 4096

Defaults for string must be quoted.

It happens to work, because there is no symbol named `4096'.

> +	help
> +	  This value should be set to the page size in bytes. The default
> +	  value of 4096 is the the most common page size for most systems.
> +	  If the sectorsize differs from the page size, the created
> +	  filesystem may not be mountable by the kernel.
> +	  Therefore it is recommended to leave this value at 4096. Unless
> +	  you know that your kernel uses a different page size.
> +	  Suffix with k for power-of-two kilobytes.
> +
> +config BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE
> +	string "btree node size"
> +	default 16384

Ditto.

Regards,
Yann E. MORIN.

> +	help
> +	  The tree block size in which btrfs stores metadata in bytes.
> +	  This must be a multiple of the sectorsize, but not larger than
> +	  64KiB (65536).
> +	  Suffix with k for power-of-two kilobytes.
> +
> +config BR2_TARGET_ROOTFS_BTRFS_FEATURES
> +	string "Filesystem Features"
> +	help
> +	  A comma separated string of features that can be enabled
> +	  during creation time.
> +	  For a list of available options, use:
> +	    `.../host/bin/mkfs.btrfs -O list-all`
> +
> +endif # BR2_TARGET_ROOTFS_BTRFS
> diff --git a/fs/btrfs/btrfs.mk b/fs/btrfs/btrfs.mk
> new file mode 100644
> index 0000000000..37b2937825
> --- /dev/null
> +++ b/fs/btrfs/btrfs.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# Build the btrfs root filesystem image
> +#
> +################################################################################
> +
> +BTRFS_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE))
> +ifeq ($(BR2_TARGET_ROOTFS_BTRFS)-$(BTRFS_SIZE),y-)
> +$(error BR2_TARGET_ROOTFS_BTRFS_SIZE cannot be empty)
> +endif
> +
> +BTRFS_SIZE_NODE = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE))
> +BTRFS_SIZE_SECTOR = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR))
> +BTRFS_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_FEATURES))
> +# qstrip results in stripping consecutive spaces into a single one. So the
> +# variable is not qstrip-ed to preserve the integrity of the string value.
> +BTRFS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_BTRFS_LABEL))
> +# ")
> +
> +BTRFS_OPTS = \
> +	-r '$(TARGET_DIR)' \
> +	-L '$(BTRFS_LABEL)' \
> +	$(if $(BTRFS_SIZE_NODE),--nodesize '$(BTRFS_SIZE_NODE)') \
> +	$(if $(BTRFS_SIZE_SECTOR),--sectorsize '$(BTRFS_SIZE_SECTOR)') \
> +	$(if $(BTRFS_FEATURES),--features '$(BTRFS_FEATURES)')
> +
> +ROOTFS_BTRFS_DEPENDENCIES = host-btrfs-progs
> +
> +define ROOTFS_BTRFS_CMD
> +	rm -f $@
> +	truncate -s $(BTRFS_SIZE) $@
> +	$(HOST_DIR)/bin/mkfs.btrfs $(BTRFS_OPTS) $@ \
> +	|| { ret=$$?; \
> +	     echo "*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_BTRFS_SIZE)" 1>&2; \
> +	     exit $$ret; \
> +	}
> +endef
> +
> +$(eval $(rootfs))
> -- 
> 2.11.0
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
