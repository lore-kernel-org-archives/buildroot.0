From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sat, 26 Oct 2019 17:59:15 +0000
Subject: [Buildroot] [PATCH v2 2/2] support/testing/tests/package/:
 runtime test
In-Reply-To: <20191026175237.20737-2-nicolas.carrier@orolia.com>
References: <20191026175237.20737-1-nicolas.carrier@orolia.com>
 <20191026175237.20737-2-nicolas.carrier@orolia.com>
Message-ID: <8aea1a0bf51531094067b27710f184e15f621810.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch implements a test with a simple pattern for factoring python
2 and python 3 lines of codes.
Other tests I saw in this directory could benefit of this pattern and
I'm volunteer to this work.
Is it a good idea? Something I should work on?


Running tests for this package give:
$ support/testing/run-tests --keep --output out --download
~/workspace/buildroot-dl/
tests.package.test_bmap_tools.TestPy2BmapTools
19:07:28 TestPy2BmapTools                         Starting
19:07:29 TestPy2BmapTools                         Building
19:13:01 TestPy2BmapTools                         Building done
19:13:16 TestPy2BmapTools                         Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 348.512s

OK
$ support/testing/run-tests --keep --output out --download
~/workspace/buildroot-dl/
tests.package.test_bmap_tools.TestPy3BmapTools
19:17:03 TestPy3BmapTools                         Starting
19:17:04 TestPy3BmapTools                         Building
19:22:06 TestPy3BmapTools                         Building done
19:22:21 TestPy3BmapTools                         Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 318.076s

OK

The test-pkg result:
$ ./utils/test-pkg -p bmap-tools -c bmap-
tools.config                               br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

And check-package:
$ ./utils/check-package package/bmap-tools/*
30 lines processed
0 warnings generated

On Sat, 2019-10-26 at 19:52 +0200, Nicolas Carrier wrote:
> This patch implements a simple test in which a dummy file system
> image
> is created, then `bmaptool create` and `bmaptool copy` are used to
> copy
> it to another file.
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> 
> ---
> 
> Changes v1 -> v2:
>   - removed spurious trace
> 
> ---
> 
>  .../tests/package/sample_bmap_tools.sh        | 15 ++++++
>  .../testing/tests/package/test_bmap_tools.py  | 53
> +++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100755
> support/testing/tests/package/sample_bmap_tools.sh
>  create mode 100644 support/testing/tests/package/test_bmap_tools.py
> 
> diff --git a/support/testing/tests/package/sample_bmap_tools.sh
> b/support/testing/tests/package/sample_bmap_tools.sh
> new file mode 100755
> index 0000000000..7c90368c17
> --- /dev/null
> +++ b/support/testing/tests/package/sample_bmap_tools.sh
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +# simple test which creates a dummy file system image, then use
> bmaptool create
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
> diff --git a/support/testing/tests/package/test_bmap_tools.py
> b/support/testing/tests/package/test_bmap_tools.py
> new file mode 100644
> index 0000000000..192b84387e
> --- /dev/null
> +++ b/support/testing/tests/package/test_bmap_tools.py
> @@ -0,0 +1,53 @@
> +import os
> +import sys
> +import infra
> +
> +from infra.basetest import BRTest
> +from abc import ABC, abstractproperty
> +
> +class AbstractBmapToolsTest(BRTest, ABC):
> +    __test__ = False
> +    sample_script = "tests/package/sample_bmap_tools.sh"
> +
> +    copy_script = 'tests/package/copy-sample-script-to-target.sh'
> +    config = f'''
> +        {infra.basetest.BASIC_TOOLCHAIN_CONFIG}
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_PACKAGE_BMAP_TOOLS=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{infra.filepath(copy_script)}"
> +        BR2_ROOTFS_POST_SCRIPT_ARGS="{infra.filepath(sample_script)}
> "
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_UTIL_LINUX=y
> +        BR2_PACKAGE_UTIL_LINUX_FALLOCATE=y
> +        BR2_PACKAGE_E2FSPROGS=y
> +        BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
> +        '''
> +
> +    def __init__(self, names):
> +        super(AbstractBmapToolsTest, self).__init__(names)
> +        self.config += f"BR2_PACKAGE_PYTHON{self.python_version}=y"
> +
> +    @abstractproperty
> +    def python_version(self):
> +        pass
> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images",
> "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +    def test_run(self):
> +        self.login()
> +        cmd = f"/root/{os.path.basename(self.sample_script)}"
> +        _, exit_code = self.emulator.run(cmd, timeout=10)
> +        self.assertEqual(exit_code, 0)
> +
> +class TestPy2BmapTools(AbstractBmapToolsTest):
> +    __test__ = True
> +    python_version = ""
> +
> +class TestPy3BmapTools(AbstractBmapToolsTest):
> +    __test__ = True
> +    python_version = "3"
