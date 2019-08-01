From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 1 Aug 2019 16:53:05 +0200
Subject: [Buildroot] [WIP: python3 bug] support/testing: add python3
 multiprocessing pool test
In-Reply-To: <20190720110810.20085-1-romain.naour@gmail.com>
References: <20190720110810.20085-1-romain.naour@gmail.com>
Message-ID: <dce15126-3ec0-62ed-6c7a-598aa9a8474f@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 20/07/2019 ? 13:08, Romain Naour a ?crit?:
> While running some python script on aarch64 board, it get stuck while
> imporing multiprocessing Pool:
> 
> from multiprocessing import Pool
> 
> This issue seems specific to aarch64.

So it seems the python multiprocessing import is stuck on os.urandom(32):
https://github.com/python/cpython/blob/3.7/Lib/multiprocessing/process.py#L347

See: https://bugs.python.org/issue29877

Indeed, there is no entropy
# cat /proc/sys/kernel/random/entropy_avail
0

This problem would be fixed by enabling the VirtIORNG to generate entropy on the
target system. See: http://patchwork.ozlabs.org/patch/1139408/

I tested on aarch64 with Qemu and the entropy is generated:

# cat /proc/sys/kernel/random/entropy_avail
1013

Best regards,
Romain

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../sample_python_multiprocessing_pool.py     |  3 ++
>  .../test_python_multiprocessing_pool.py       | 45 +++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_multiprocessing_pool.py
>  create mode 100644 support/testing/tests/package/test_python_multiprocessing_pool.py
> 
> diff --git a/support/testing/tests/package/sample_python_multiprocessing_pool.py b/support/testing/tests/package/sample_python_multiprocessing_pool.py
> new file mode 100644
> index 0000000000..df450e4b71
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_multiprocessing_pool.py
> @@ -0,0 +1,3 @@
> +# This import can be stuck on aarch64 with python3 (3.7.4)
> +# The test should fail when the timout occurred.
> +from multiprocessing import Pool
> diff --git a/support/testing/tests/package/test_python_multiprocessing_pool.py b/support/testing/tests/package/test_python_multiprocessing_pool.py
> new file mode 100644
> index 0000000000..349a91368c
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_multiprocessing_pool.py
> @@ -0,0 +1,45 @@
> +import os
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +class TestPythonMultiprocessingPool(TestPythonPackageBase):
> +    sample_scripts = ["tests/package/sample_python_multiprocessing_pool.py"]
> +    timeout = 60
> +
> +    # Remove "-serial", "stdio", from testing/infra/emulator.py before running the test.
> +    # Otherwise you will get the following error:
> +    # qemu-system-aarch64: -serial stdio: cannot use stdio by multiple character devices
> +    # qemu-system-aarch64: -serial stdio: could not connect serial device to character backend 'stdio'
> +
> +    def login(self):
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        ext4_file = os.path.join(self.builddir, "images", "rootfs.ext4")
> +
> +        self.emulator.boot(arch="aarch64",
> +                        kernel=kern,
> +                        options=["-append","root=/dev/vda console=ttyAMA0", "-M", "virt", "-cpu", "cortex-a53", "-nographic", "-smp", "1", "-netdev", "user,id=eth0", "-device", "virtio-net-device,netdev=eth0", "-drive", "file=" + ext4_file + ",if=none,format=raw,id=hd0", "-device", "virtio-blk-device,drive=hd0"])
> +        self.emulator.login()
> +
> +# Test with Glibc and MultiprocessingPool
> +class TestPythonPy3GlibcMultiprocessingPool(TestPythonMultiprocessingPool):
> +    __test__ = True
> +    config = \
> +        """
> +	BR2_aarch64=y
> +	BR2_cortex_a53=y
> +	BR2_TOOLCHAIN_EXTERNAL=y
> +	BR2_SYSTEM_DHCP="eth0"
> +	BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +	BR2_TARGET_ROOTFS_EXT2=y
> +	BR2_TARGET_ROOTFS_EXT2_4=y
> +	# BR2_TARGET_ROOTFS_TAR is not set
> +	BR2_LINUX_KERNEL=y
> +	BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +	BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
> +	BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +	BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +	BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> 
