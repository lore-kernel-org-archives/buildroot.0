From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Aug 2018 23:27:39 +0200
Subject: [Buildroot] [PATCH 2/2] fs/btrfs: Introducing btrfs rootfs
 support.
In-Reply-To: <20180823202651.3108-1-robert.heywood@codethink.co.uk>
References: <20180823202651.3108-1-robert.heywood@codethink.co.uk>
Message-ID: <20180823212739.GJ9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2018-08-23 21:26 +0100, Robert J. Heywood spake thusly:
> This patch makes it possible to format the rootfs using btrfs.
> It introduces the option; BR2_TARGET_ROOTFS_BTRFS
> 
> When selected, the user is able to specify the filesystem size,
> label, options, and node and sector sizes.
> The new files are based on fs/ext2/{Config.in,ext2.mk}
> 
> Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
[--SNIP--]
> diff --git a/fs/btrfs/Config.in b/fs/btrfs/Config.in
> new file mode 100644
> index 0000000000..6537c85fdb
> --- /dev/null
> +++ b/fs/btrfs/Config.in
> @@ -0,0 +1,54 @@
> +config BR2_TARGET_ROOTFS_BTRFS
> +	bool "btrfs root filesystem"
> +	select BR2_PACKAGE_HOST_BTRFS_PROGS
> +	help
> +	  Build a btrfs root filesystem. If you enable this option, you
> +	  probably want to enable the btrfs-progs package too.
> +
> +
> +if BR2_TARGET_ROOTFS_BTRFS
> +
> +config BR2_TARGET_ROOTFS_BTRFS_LABEL
> +	string "filesystem label"
> +
> +config BR2_TARGET_ROOTFS_BTRFS_SIZE
> +	string "filesystem size"
> +	default "100M"
> +	help
> +	  The size of the filesystem image. If it does not have a
> +	  suffix, it is interpreted as power-of-two kilobytes. If it is

This is now wrong, as 'truncate' uses bytes if there is no prefix.

> +	  suffixed by 'k', 'm', 'g', 't' (either upper-case or
> +	  lower-case), then it is interpreted in power-of-two kilobytes,
> +	  megabytes, gigabytes, terabytes, etc.

So, maybe just:

    The size of the filesystem image, in bytes. Suffix with k, m, g,
    or t for power-of-two kilo-, mega-, giga-, or terrabytes.

> +config BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE
> +	string "btree node size"
> +	default 16384
> +	help
> +	  The tree block size in which btrfs stores metadata. This must
> +	  be a multiple of the sectorsize, but not larger than 64KiB.
> +	  (65536).
> +	  If it is suffixed by 'k' (either upper-case or lower-case),
> +	  then it is interpreted in power-of-two kilobytes.
> +
> +config BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR
> +	string "sector size"
> +	default 4096
> +	help
> +	  This value should be set to the page size. The default value of
> +	  4096 is the the most common page size for most systems.
> +	  If the sectorsize differs from the page size, the created
> +	  filesystem may not be mountable by the kernel.
> +	  Therefore it is recommended to leave this value at 4096.

    ... unless you know that your kernel uses a different page size.

> +	  If it is suffixed by 'k' (either upper-case or lower-case),
> +	  then it is interpreted in power-of-two kilobytes.

I failed to note that in the previous iteration, but: the 'sector size'
option is referenced from the 'btree node size' option. So the order
should be inversed.

> +config BR2_TARGET_ROOTFS_BTRFS_FEATURES
> +	string "Filesystem Features"
> +	help
> +	  A comma separated string of features that can be enabled
> +	  during creation time.
> +	  For a list of available options, use;

Change the trailing semi-colon ';' by a colon ':'.

Otherwise, that's nice. :-)

Regards,
Yann E. MORIN.

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
