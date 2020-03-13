From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Mar 2020 18:24:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-gobject: bump version to
 3.36.0
In-Reply-To: <20200312194717.3787182-1-aduskett@gmail.com>
References: <20200312194717.3787182-1-aduskett@gmail.com>
Message-ID: <20200313172437.GK705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adan, All,

On 2020-03-12 12:47 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Convert the package to a meson package.
>   - Remove 0001-add-PYTHON_INCLUDES-override.patch as it no longer applies.
>   - Add gobject-introspection as a dependency.
>   - Add the package under myself in the DEVELOPERS file.
> 
> Because gobject-introspection is now a dependency of python-gobject, the test
> must be updated at the same time.
> 
>  - Change TestPythonPy2Gobject to TestPythonPy3Gobject as
>    gobject-introspection requires python3.
> 
>  - Refactor test_python_gobject.py to no longer inherit the
>    TestPythonPackageBase class, as this class uses a base config that does not
>    support gobject-introspection.
> 
>  - Update sample_python_gobject to use Glib to find the path of sh.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master, thanks.

However, see below for a comment I'd like you address in a followup
patch...

[--SNIP--]
> diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
> index 0a59447adb..a673d554a4 100644
> --- a/support/testing/tests/package/test_python_gobject.py
> +++ b/support/testing/tests/package/test_python_gobject.py
> @@ -1,11 +1,33 @@
> +import os
>  from tests.package.test_python import TestPythonPackageBase
>  
> -
> -class TestPythonPy2Gobject(TestPythonPackageBase):
> +class TestPythonPy3Gobject(TestPythonPackageBase):
>      __test__ = True
> -    config = TestPythonPackageBase.config + \
> +    config = \
>          """
> -        BR2_PACKAGE_PYTHON=y
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y

Why do you need to build a custom kernel? Can't you use the prebuilt
builtin kernel? See support/testing/tests/init/test_busybox.py and
support/testing/tests/init/base.py for an example how the built-in
kernel is used.

I still decided to apply this patch, because it provides a runtime-test
to test gobject-introspection, which is a very welcome addition.

Regards,
Yann E. MORIN.

> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        BR2_PACKAGE_GOBJECT_INTROSPECTION=y
> +        BR2_PACKAGE_PYTHON3=y
>          BR2_PACKAGE_PYTHON_GOBJECT=y
>          """
> +
> +    def login(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
> +        self.emulator.login()
> +
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
