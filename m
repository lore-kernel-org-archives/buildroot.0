From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 22:00:07 +0100
Subject: [Buildroot] [PATCH 1/2] aufs-utils: initial release
In-Reply-To: <1406576065-20263-1-git-send-email-mail@steffenhoenig.com>
References: <1406576065-20263-1-git-send-email-mail@steffenhoenig.com>
Message-ID: <20141123220007.1e48b0ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steffen,

I believe this package depends on aufs, so this patch should be the
second patch in the patch series, not the first one.

Your package/aufs-utils/Config.in file should have a "select
BR2_PACKAGE_AUFS", and therefore also a "depends on BR2_LINUX_KERNEL".

On Mon, 28 Jul 2014 21:34:24 +0200, steffenhoenig wrote:

> diff --git a/package/aufs-utils/aufs-utils.mk b/package/aufs-utils/aufs-utils.mk
> new file mode 100644
> index 0000000..de14e81
> --- /dev/null
> +++ b/package/aufs-utils/aufs-utils.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# aufs-utils
> +#
> +################################################################################
> +
> +AUFS_UTILS_VERSION = aufs3.9

Why not using:

	$(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))

here, so that both aufs and aufs-utils have the same version.

> +AUFS_UTILS_LICENCSE = GPLv2
> +AUFS_UTILS_LICENSE_FILES = COPYING
> +AUFS_UTILS_SITE = http://git.code.sf.net/p/aufs/aufs-util
> +AUFS_UTILS_SITE_METHOD = git
> +AUFS_UTILS_DEPENDENCIES = aufs

Ah, you see, it's really aufs-utils that depends on aufs.

> +
> +AUFS_UTILS_SBIN = mount.aufs umount.aufs # auplink auibusy aumvdown
> +AUFS_UTILS_UBIN = aubusy auchk aubrsync # auctl
> +
> +define AUFS_UTILS_BUILD_CMDS
> +	$(MAKE) -C $(@D)/libau CPPFLAGS="-I$(STAGING_DIR)/usr/include" KDIR=$(LINUX_DIR) CC="$(TARGET_CC)" LD="$(TARGET_LD)" libau.so
> +	$(MAKE) -C $(@D) CPPFLAGS="-I$(STAGING_DIR)/usr/include" KDIR=$(LINUX_DIR) CC="$(TARGET_CC)" LD="$(TARGET_LD)" $(AUFS_UTILS_SBIN)

Any reason to have two $(MAKE) calls with specific targets here,
instead of just using the main Makefile of the project?

Also, instead of passing CPPFLAGS, CC and LD, you should use
$(TARGET_CONFIGURE_OPTS), i.e something like:

	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) KDIR=$(LINUX_DIR)

> +define AUFS_UTILS_INSTALL_TARGET_CMDS
> +	$(foreach p,$(AUFS_UTILS_SBIN),$(INSTALL) -D -m 0755 $(@D)/$(p) $(TARGET_DIR)/sbin/;)
> +	$(foreach p,$(AUFS_UTILS_UBIN),$(INSTALL) -D -m 0755 $(@D)/$(p) $(TARGET_DIR)/usr/bin/;)

Why not using "make install" here?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
