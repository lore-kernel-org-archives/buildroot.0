From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 15:28:47 +0100
Subject: [Buildroot] [PATCH 1/1] support/testing/: change python-gobject
 to use prebuilt kernel
In-Reply-To: <20200316153459.2291931-1-aduskett@gmail.com>
References: <20200316153459.2291931-1-aduskett@gmail.com>
Message-ID: <20200322142847.GE2364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-16 08:34 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> This change significantly reduces the ammount of time needed to run the
> test.
> 
> Select a cortext_a9 and a external linaro toolchain due to the need for a
> glibc based toolchain, as the default TestPythonPackageBase.config toolchain
> is a uClibc toolchain.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master, thanks.

Thomas and I arrived at the same conclusion each on our side, to change
the config to be entirely defined in the test case, so I just did that I
pushed.

Regards,
Yann E. MORIN.

> ---
>  .../tests/package/test_python_gobject.py      | 25 +++++++------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
> index a673d554a4..cf10e9ff67 100644
> --- a/support/testing/tests/package/test_python_gobject.py
> +++ b/support/testing/tests/package/test_python_gobject.py
> @@ -3,31 +3,24 @@ from tests.package.test_python import TestPythonPackageBase
>  
>  class TestPythonPy3Gobject(TestPythonPackageBase):
>      __test__ = True
> -    config = \
> +    config = TestPythonPackageBase.config + \
>          """
> -        BR2_aarch64=y
>          BR2_TOOLCHAIN_EXTERNAL=y
> -        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> -        BR2_LINUX_KERNEL=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> -        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> -        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>          BR2_TARGET_ROOTFS_CPIO=y
> -        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_ARM_EABIHF=y
> +        BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
>          BR2_PACKAGE_GOBJECT_INTROSPECTION=y
>          BR2_PACKAGE_PYTHON3=y
>          BR2_PACKAGE_PYTHON_GOBJECT=y
>          """
>  
>      def login(self):
> -        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> -        kern = os.path.join(self.builddir, "images", "Image")
> -        self.emulator.boot(arch="aarch64",
> -                           kernel=kern,
> -                           kernel_cmdline=["console=ttyAMA0"],
> -                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", img])
>          self.emulator.login()
>  
>      sample_scripts = ["tests/package/sample_python_gobject.py"]
> -- 
> 2.24.1
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
