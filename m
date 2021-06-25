From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jun 2021 14:36:57 +0200
Subject: [Buildroot] [PATCH v6 4/5]
 support/testing/tests/package/test_bmap_tools: new test
In-Reply-To: <20210621210111.363433-5-thomas.petazzoni@bootlin.com>
References: <20210621210111.363433-1-thomas.petazzoni@bootlin.com>
 <20210621210111.363433-5-thomas.petazzoni@bootlin.com>
Message-ID: <20210625123657.GE104638@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-21 23:01 +0200, Thomas Petazzoni spake thusly:
> From: Nicolas Carrier <nicolas.carrier@orolia.com>
> 
> This patch implements a simple test in which a dummy file system image
> is created, then `bmaptool create` and `bmaptool copy` are used to copy
> it to another file.
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> [Thomas: several reworks, add myself to DEVELOPERS]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> diff --git a/support/testing/tests/package/sample_bmap_tools.sh b/support/testing/tests/package/sample_bmap_tools.sh
> new file mode 100755
> index 0000000000..7c90368c17
> --- /dev/null
> +++ b/support/testing/tests/package/sample_bmap_tools.sh
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +# simple test which creates a dummy file system image, then use bmaptool create
> +# and bmaptool copy to copy it to another file
> +
> +set -xeu
> +
> +# create the necessary test files
> +dd if=/dev/zero of=disk.img bs=2M count=1
> +mkfs.ext4 disk.img
> +fallocate -d disk.img
> +dd if=/dev/zero of=copy.img bs=2M count=1
> +
> +# do a test copy of the file system image
> +bmaptool create -o disk.img.bmap disk.img
> +bmaptool copy disk.img copy.img

It is sad that the copy was not actually tested to be identical to the
original, so I added:

    cmp disk.img copy.img

and applied to master, thanks.

Regards,
Yann E. MORIN.

> diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
> new file mode 100644
> index 0000000000..e8802fc057
> --- /dev/null
> +++ b/support/testing/tests/package/test_bmap_tools.py
> @@ -0,0 +1,61 @@
> +import os
> +import infra
> +
> +from infra.basetest import BRTest
> +
> +
> +class TestBmapTools(BRTest):
> +    __test__ = False
> +    sample_script = "tests/package/sample_bmap_tools.sh"
> +    copy_script = 'tests/package/copy-sample-script-to-target.sh'
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a8=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PACKAGE_BMAP_TOOLS=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> +        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="65536"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_UTIL_LINUX=y
> +        BR2_PACKAGE_UTIL_LINUX_FALLOCATE=y
> +        BR2_PACKAGE_E2FSPROGS=y
> +        BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
> +        """.format(infra.filepath(copy_script),
> +                   infra.filepath(sample_script))
> +    timeout = 60
> +
> +    def login(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           kernel_cmdline=["root=/dev/mmcblk0",
> +                                           "rootfstype=ext4"],
> +                           options=["-drive", "file={},if=sd,format=raw".format(img)])
> +        self.emulator.login()
> +
> +    def test_run(self):
> +        self.login()
> +        cmd = "/root/{}".format(os.path.basename(self.sample_script))
> +        _, exit_code = self.emulator.run(cmd, timeout=20)
> +        self.assertEqual(exit_code, 0)
> +
> +
> +class TestPy2BmapTools(TestBmapTools):
> +    __test__ = True
> +    config = TestBmapTools.config + \
> +        """
> +        BR2_PACKAGE_PYTHON=y
> +        """
> +
> +
> +class TestPy3BmapTools(TestBmapTools):
> +    __test__ = True
> +    config = TestBmapTools.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        """
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
