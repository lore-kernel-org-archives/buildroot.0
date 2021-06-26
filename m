From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 22:07:17 +0200
Subject: [Buildroot] [PATCH v6 3/5] support/testing/infra/emulator.py:
 update pre-built kernels
In-Reply-To: <20210621210111.363433-4-thomas.petazzoni@bootlin.com>
References: <20210621210111.363433-1-thomas.petazzoni@bootlin.com>
 <20210621210111.363433-4-thomas.petazzoni@bootlin.com>
Message-ID: <20210626200717.GO104638@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-21 23:01 +0200, Thomas Petazzoni spake thusly:
> The pre-built vexpress kernel used by the testing infrastructure is a
> 4.0.0 kernel, which is getting old to be used with reasonably recent
> toolchains.
> 
> This commit updates the pre-built kernels for both the versatile and
> vexpress machines to 5.10.7 (they have already been put online).

This breaks the squashfs tests:

    Filesystem uses "lz4" compression. This is not supported
    List of all partitions:
    1f00          131072 mtdblock0
     (driver?)
    1f01           32768 mtdblock1
     (driver?)
    b300            2048 mmcblk0
     driver: mmcblk
    No filesystem could mount root, tried:
     squashfs

    Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(179,0)

And indeed, if we boot this kernel with a gzip-compressed squashfs, ad
we look at the configuration (irrelevant options omitted for brevity):

    # zcat /proc/config.gz |grep SQUA
    CONFIG_SQUASHFS=y
    CONFIG_SQUASHFS_ZLIB=y
    # CONFIG_SQUASHFS_LZ4 is not set
    CONFIG_SQUASHFS_LZO=y
    # CONFIG_SQUASHFS_XZ is not set

Could you rebuild the kernel (but not nice for those like who already
have it cached locally), or build a newer-yet kernel?

Or should we just change our test(s) to use lzo instead of lz4?

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/infra/emulator.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> index 5611ec96e8..0a77eb80fc 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -54,16 +54,16 @@ class Emulator(object):
>  
>                  if arch == "armv7":
>                      kernel = infra.download(self.downloaddir,
> -                                            "kernel-vexpress")
> +                                            "kernel-vexpress-5.10.7")
>                      dtb = infra.download(self.downloaddir,
> -                                         "vexpress-v2p-ca9.dtb")
> +                                         "vexpress-v2p-ca9-5.10.7.dtb")
>                      qemu_cmd += ["-dtb", dtb]
>                      qemu_cmd += ["-M", "vexpress-a9"]
>                  elif arch == "armv5":
>                      kernel = infra.download(self.downloaddir,
> -                                            "kernel-versatile-4.19")
> +                                            "kernel-versatile-5.10.7")
>                      dtb = infra.download(self.downloaddir,
> -                                         "versatile-pb-4.19.dtb")
> +                                         "versatile-pb-5.10.7.dtb")
>                      qemu_cmd += ["-dtb", dtb]
>                      qemu_cmd += ["-M", "versatilepb"]
>                      qemu_cmd += ["-device", "virtio-rng-pci"]
> -- 
> 2.31.1
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
