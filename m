From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Oct 2018 22:42:09 +0100
Subject: [Buildroot] [PATCH 2/2] fs/f2fs: add support for creating a
 f2fs image
In-Reply-To: <20181026200016.30856-3-grzegorz@blach.pl>
References: <20181026200016.30856-1-grzegorz@blach.pl>
 <20181026200016.30856-3-grzegorz@blach.pl>
Message-ID: <20181031214209.GN28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grzegorz, All,

On 2018-10-26 22:00 +0200, Grzegorz Blach spake thusly:
> This patch makes possible to create rootfs image using f2fs filesystem.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
[--SNIP--]
> diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
> new file mode 100644
> index 0000000000..d096057890
> --- /dev/null
> +++ b/fs/f2fs/Config.in
> @@ -0,0 +1,49 @@
> +config BR2_TARGET_ROOTFS_F2FS
> +	bool "f2fs root filesystem"
> +	select BR2_PACKAGE_HOST_F2FS_TOOLS
> +	help
> +	  Build a f2fs root filesystem. If you enable this option, you
> +	  probably want to enable the f2fs-tools package too.
> +
> +if BR2_TARGET_ROOTFS_F2FS
> +
> +config BR2_TARGET_ROOTFS_F2FS_LABEL
> +	string "filesystem label"
> +
> +config BR2_TARGET_ROOTFS_F2FS_SIZE
> +	string "filesystem size"
> +	default "100M"
> +	help
> +	  The size of the filesystem image in bytes.
> +	  Suffix with K, M, G or T for power-of-two kilo-, mega-, giga-
> +	  or terabytes.
> +
> +config BR2_TARGET_ROOTFS_F2FS_COLD_FILES
> +	string "extension list for cold files"
> +	help
> +	  Specify a file extension list in order f2fs to treat them
> +	  as cold files. The default list includes most of multimedia
> +	  file extensions such as jpg, gif, mpeg, mkv, and so on.

I would prefer that we get a first patch that adds the bare minimal
needed to assemble an f2fs image, with further patches adding more
features one by one, as it is easier to review.

This "cold files" feature should be added in its own patch.

> +config BR2_TARGET_ROOTFS_F2FS_OVERPROVISION
> +	int "size for overprovision area (0 for auto calculation)"
> +	default 0
> +	help
> +	  Specify the percentage over the volume size for overprovision
> +	  area. This area is hidden to users, and utilized by F2FS
> +	  cleaner. If not specified, the best number will be assigned
> +	  automatically accoring to the partition size.

May I suggest an alternative wording?

    int "size for overprovision area"
    default 0
    help
      The percentage over the volume size for overprovision area. This
      area is hidden to users, and utilized by F2FS cleaner.

      Leave at 0 for autocalculation.

But this feature should be added in its own patch.

> +config BR2_TARGET_ROOTFS_F2FS_FEATURES
> +	string "filesystem features"
> +	help
> +	  A feature list in order f2fs filesystem will supports.
> +	  e.g "encrypt" and so on.

Ditto, a separate patch. Also, this option being a plain string, I'd
prefer it goes last in the list of options, below the discard one.

> +config BR2_TARGET_ROOTFS_F2FS_DISCARD
> +	bool "discard policy"
> +	default y
> +	help
> +	  Enable or disable discard policy.

Ditto, a separate patch for that one, please.

> +endif # BR2_TARGET_ROOTFS_F2FS
> diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
> new file mode 100644
> index 0000000000..19c0082d67
> --- /dev/null
> +++ b/fs/f2fs/f2fs.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# Build the f2fs root filesystem image
> +#
> +################################################################################
> +
> +F2FS_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_SIZE))
> +ifeq ($(BR2_TARGET_ROOTFS_F2FS)-$(F2FS_SIZE),y-)
> +$(error BR2_TARGET_ROOTFS_F2FS_SIZE cannot be empty)
> +endif
> +
> +F2FS_COLD_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_COLD_FILES))
> +F2FS_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_FEATURES))
> +# qstrip results in stripping consecutive spaces into a single one. So the
> +# variable is not qstrip-ed to preserve the integrity of the string value.
> +F2FS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_F2FS_LABEL))
> +# ")
> +
> +ifneq ($(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION),0)
> +F2FS_OVERPROVISION=$(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION)
> +endif
> +
> +ifeq ($(BR2_TARGET_ROOTFS_F2FS_DISCARD),y)
> +F2FS_DISCARD=1
> +else
> +F2FS_DISCARD=0
> +endif
> +
> +F2FS_OPTS = \
> +	-f \
> +	-l "$(F2FS_LABEL)" \
> +	$(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)") \
> +	$(if $(F2FS_OVERPROVISION),-o $(F2FS_OVERPROVISION)) \
> +	$(if $(F2FS_FEATURES),-O "$(F2FS_FEATURES)") \
> +	-t $(F2FS_DISCARD)

Conditional values should go last:

    F2FS_OPTS = \
        -f \
        -l "$(F2FS_LABEL)" \
        -t $(F2FS_DISCARD) \
        $(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)") \
        [...]

> +ROOTFS_F2FS_DEPENDENCIES = host-f2fs-tools
> +
> +define ROOTFS_F2FS_CMD
> +	$(RM) -f $@
> +	dd if=/dev/zero of=$@ bs=1 count=0 seek=$(F2FS_SIZE)

You mentionned in your cover letter that you were not sure using dd was
the best solution. It is acceptable, but usng truncate might be a better
option, and you can alsoirectly pass it the size value:

    truncate -s '$(F2FS_SIZE)' $@

Otherwise, when using dd to achieve the same, I invert bs and seek:
(i.e. it is 1 bloc of N, not N blocs of 1).

    dd if=/dev/zero of=$@ bs=$(F2FS_SIZE) count=0 seek=1

So, dd is acceptable, but I'd favour truncate.

Regards,
Yann E. MORIN.

> +	$(HOST_DIR)/sbin/mkfs.f2fs $(F2FS_OPTS) $@
> +	$(HOST_DIR)/sbin/sload.f2fs -f $(TARGET_DIR) $@
> +endef
> +
> +$(eval $(rootfs))
> -- 
> 2.17.2
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
