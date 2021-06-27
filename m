From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Jun 2021 10:06:42 +0200
Subject: [Buildroot] [PATCH] support/tests: fix squashfs test
In-Reply-To: <20210627065350.23826-1-yann.morin.1998@free.fr>
References: <20210627065350.23826-1-yann.morin.1998@free.fr>
Message-ID: <20210627100642.02796d00@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Jun 2021 08:53:50 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 3cf2782906d5 (support/testing/infra/emulator.py: update pre-built
> kernels) bumped the default kernels used by the testing infra.
> 
> However, the newer armv7 kernel (at least) no longer has support for
> lz4-compressed squashfs filesystems.
> 
> This nreaks the squashfs test:
> 
>     Filesystem uses "lz4" compression. This is not supported
>     List of all partitions:
>     1f00          131072 mtdblock0
>      (driver?)
>     1f01           32768 mtdblock1
>      (driver?)
>     b300            2048 mmcblk0
>      driver: mmcblk
>     No filesystem could mount root, tried:
>      squashfs
> 
>     Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(179,0)
> 
> Updating the kernel again is a little cumbersome, while fixing the
> actual test is relatively trivial, so this is what we do: we switch
> over to lzo, which is supported by the new kernel:
> 
>     # zcat /proc/config.gz |grep SQUA
>     CONFIG_SQUASHFS=y
>     CONFIG_SQUASHFS_ZLIB=y
>     # CONFIG_SQUASHFS_LZ4 is not set
>     CONFIG_SQUASHFS_LZO=y
>     # CONFIG_SQUASHFS_XZ is not set
> 
> Fixes: 3cf2782906d5cc05a3966c25518d2ce01f11afc8
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks a lot for fixing this!

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
