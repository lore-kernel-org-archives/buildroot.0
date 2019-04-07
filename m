From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 07 Apr 2019 19:49:21 -0300
Subject: [Buildroot] [PATCH v2] support/testing: add xserver + Mesa
 OpenGL (GLX) + glxinfo
References: <20190320124508.5344-1-romain.naour@smile.fr>
Message-ID: <5caa7e71e1bda_4f363faf901420b04172e@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Looks good, but I have a proposal at the end to make the test stronger.
Also few nits.

On Wed, Mar 20, 2019 at 09:45 AM, Romain Naour wrote:

[snip]
> ---
>  support/testing/tests/package/test_glxinfo.py | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 support/testing/tests/package/test_glxinfo.py

Please run flake8 and fix the warning it generates.
test_glxinfo.py:7:1: E302 expected 2 blank lines, found 1

Please run 'make .gitlab-ci.yml' and commit the changes.

[snip]
> +class TestGlxinfo(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_x86_core2=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2018.11-1.tar.bz2"
> +        BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
> +        # BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
> +        BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
> +        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
> +        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
> +        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
> +        BR2_PACKAGE_MESA3D_DEMOS=y
> +        BR2_PACKAGE_MESA3D=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> +        BR2_PACKAGE_XORG7=y
> +        BR2_PACKAGE_XSERVER_XORG_SERVER=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """

nit, I am really unsure whether we should care about or not:
This is not the exact the order if we generate a defconfig.
I started the test with -k, then I pressed ctrl+C, then I chdir to it and ran
'make defconfig', and finally I copied the result without BR2_DL_DIR to the
test case code and generated a diff:
+++ support/testing/tests/package/test_glxinfo.py
@@ -11,3 +11,2 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
@@ -16,9 +15,5 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-        # BR2_TOOLCHAIN_EXTERNAL_LOCALE is not set
-        BR2_TOOLCHAIN_EXTERNAL_CXX=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
-        BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
         BR2_LINUX_KERNEL=y
@@ -34,3 +29,2 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_PACKAGE_XSERVER_XORG_SERVER=y
-        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
         BR2_TARGET_ROOTFS_EXT2=y

> +
> +    def wait_for_xserver(self):
> +        # xserver takes some time to start up
> +        _, _ = self.emulator.run('while [ ! -e /var/run/xorg.pid ]; do sleep 1; done', 120)

The test passes without this, as you replied to v1.
But I think it is good to keep this here because if for some reason xserver is
not properly installed, the test case fails here. Checking the assumptions
needed by the real test (calling glxinfo assumes the xserver is running) is
always good because in the case of a test failure it eases the debug.

[snip]
> +    def test_run(self):
> +        self.login()
> +        self.wait_for_xserver()
> +
> +        # The test case verifies that the xserver with GLX is working
> +        cmd = "glxinfo -display :0 2>&1 >/dev/null | grep Error"
> +        # Error case: "Error: couldn't find RGB GLX visual or fbconfig"
> +        _, exit_code = self.emulator.run(cmd, GLXINFO_TIMEOUT)
> +        # Test the return code of grep command:
> +        # 0: glxinfo test is KO, there is an error returned by glxinfo.
> +        # 1: glxinfo test is OK, there is no error returned by glxinfo.
> +        self.assertEqual(exit_code, 1)

I removed glxinfo from the target and the test case passes (a false PASS), so
the test case could become stronger.
I first thought we could do something like this:
        cmd = "glxinfo -B -display :0"
        _, exit_code = self.emulator.run(cmd, GLXINFO_TIMEOUT)
        self.assertEqual(exit_code, 0)

But then I reverted bd0bb8b8f6c975de3c926359990da9308d08a9e0 and glxinfo
returns 0 in that case.
So, what about this?
         cmd = "glxinfo -B -display :0"
         output, exit_code = self.emulator.run(cmd, GLXINFO_TIMEOUT)
         self.assertEqual(exit_code, 0)
         # Error case: "Error: couldn't find RGB GLX visual or fbconfig"
         for line in output:
             self.assertNotIn("Error", line)                                                                                                                       
It requires Python 2.7 but this is already the requirement to run buildroot.


Regards,
Ricardo
