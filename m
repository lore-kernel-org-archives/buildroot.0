From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 14:39:39 +0200
Subject: [Buildroot] [PATCH 2/2] fs/btrfs: Introducing btrfs rootfs
 support.
In-Reply-To: <20180823220156.4173-1-robert.heywood@codethink.co.uk>
References: <20180823220156.4173-1-robert.heywood@codethink.co.uk>
Message-ID: <20180825143939.60ec9d77@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Robert,

On Thu, 23 Aug 2018 23:01:56 +0100, Robert J. Heywood wrote:
> This patch makes it possible to format the rootfs using btrfs.
> It introduces the option; BR2_TARGET_ROOTFS_BTRFS
> 
> When selected, the user is able to specify the filesystem size,
> label, options, and node and sector sizes.
> The new files are based on fs/ext2/{Config.in,ext2.mk}
> 
> Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>

Thanks, I've applied, but I did a few changes. First, I fixed the
issues pointed by Yann E. Morin in the Config.in file. But more
importantly, see below.

> +define ROOTFS_BTRFS_CMD
> +	rm -f $@

This is not needed, once you add the -f option to mkfs.btrfs, so I've
done that.

> +	truncate -s $(BTRFS_SIZE) $@

mkfs.btrfs has the --byte-count option that allows to set the size of
the filesystem image to be generated, so I've used that instead and
dropped the truncate -s.

> +	$(HOST_DIR)/bin/mkfs.btrfs $(BTRFS_OPTS) $@ \
> +	|| { ret=$$?; \
> +	     echo "*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_BTRFS_SIZE)" 1>&2; \
> +	     exit $$ret; \

This warning was not really useful: mkfs.btrfs automatically extends
the image size as needed. So if you specify 100m, but you need 150m,
mkfs.btrfs will anyway produce a 150m filesystem image, without bailing
out. So an error of mkfs.brtfs cannot be explained by the
BR2_TARGET_ROOTFS_BTRFS_SIZE value being too small. Therefore, I've
dropped this error handling entirely.

Applied to next with those changes:

  https://git.buildroot.org/buildroot/commit/?h=next&id=0aade4df1f80d7bff58da2b5d3dfd9d8d6ec4b7d

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
