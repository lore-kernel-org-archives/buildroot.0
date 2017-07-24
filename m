From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 24 Jul 2017 08:20:40 -0700
Subject: [Buildroot] [PATCH 20/20] support/testing: add runtime testing
 for init systems
In-Reply-To: <95f6965c48dbf2f754818e2bec1f2d3891015475.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <95f6965c48dbf2f754818e2bec1f2d3891015475.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <CAHQ1cqGROL2-MBCWGVTvgiQWQ_zaL5SxTK-CpsQK_PEpbRerAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 18, 2017 at 10:25 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> The "builtin" kernel does not boot a systemd-based system, so
> we resort to building the same one as currently used by our
> qemu_arm_vexpress_defconfig.
>
> We test the 11 following combinations:
>
>   - busybox, read-only, without network
>   - busybox, read-only, with network
>   - busybox, read-write, without network
>   - busybox, read-write, with network
>
>   - basic systemd, read-only, network w/ ifupdown
>   - basic systemd, read-only, network w/ networkd
>   - basic systemd, read-write, network w/ ifupdown
>   - basic systemd, read-write, network w/ networkd
>
>   - full systemd, read-only, network w/ networkd
>   - full systemd, read-write, network w/ networkd
>
>   - no init system, read-only, without network
>
> The tests just verify what the /sbin/init binary is, and that we were
> able to grab an IP address. More tests can be added later, for example
> to check each systemd features (journal, tmpfiles...)
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/testing/tests/init/__init__.py     |   0
>  support/testing/tests/init/base.py         |  47 ++++++++++
>  support/testing/tests/init/test_busybox.py |  67 +++++++++++++
>  support/testing/tests/init/test_none.py    |  32 +++++++
>  support/testing/tests/init/test_systemd.py | 145 +++++++++++++++++++++++++++++
>  5 files changed, 291 insertions(+)
>  create mode 100644 support/testing/tests/init/__init__.py
>  create mode 100644 support/testing/tests/init/base.py
>  create mode 100644 support/testing/tests/init/test_busybox.py
>  create mode 100644 support/testing/tests/init/test_none.py
>  create mode 100644 support/testing/tests/init/test_systemd.py
>
> diff --git a/support/testing/tests/init/__init__.py b/support/testing/tests/init/__init__.py
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
> new file mode 100644
> index 0000000000..a261d7dd46
> --- /dev/null
> +++ b/support/testing/tests/init/base.py
> @@ -0,0 +1,47 @@
> +import os
> +import subprocess
> +import infra.basetest
> +
> +class InitSystemBase(infra.basetest.BRTest):
> +
> +    def startEmulator(self, fs_type, kernel=None, dtb=None, init=None):
> +        img = os.path.join(self.builddir, "images", "rootfs.{}".format(fs_type))
> +        subprocess.call(["truncate", "-s", "%1M", img])
> +
> +        options = ["-drive",
> +                   "file={},if=sd,format=raw".format(img),
> +                   "-M", "vexpress-a9"]
> +
> +        if kernel is None:
> +            kernel = "builtin"
> +        else:
> +            kernel = os.path.join(self.builddir, "images", kernel)
> +            options.extend(["-dtb", os.path.join(self.builddir, "images",
> +                                             "{}.dtb".format(dtb))])
> +
> +        kernel_cmdline = ["root=/dev/mmcblk0",
> +                          "rootfstype={}".format(fs_type),
> +                          "rootwait",
> +                          "ro",
> +                          "console=ttyAMA0"]
> +
> +        if not init is None:
> +            kernel_cmdline.extend(["init={}".format(init)])
> +
> +        self.emulator.boot(arch="armv7",
> +                           kernel=kernel,
> +                           kernel_cmdline=kernel_cmdline,
> +                           options=options)
> +
> +        if init is None:
> +            self.emulator.login()
> +
> +    def checkInit(self, path):
> +        cmd = "cmp /proc/1/exe {}".format(path)
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +    def checkNetwork(self, interface, exitCode=0):
> +        cmd = "ip addr show {} |grep inet".format(interface)
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, exitCode)
> diff --git a/support/testing/tests/init/test_busybox.py b/support/testing/tests/init/test_busybox.py
> new file mode 100644
> index 0000000000..c3e425bf5d
> --- /dev/null
> +++ b/support/testing/tests/init/test_busybox.py
> @@ -0,0 +1,67 @@
> +import infra.basetest
> +from tests.init.base import InitSystemBase as InitSystemBase
> +
> +class InitSystemBusyboxBase(InitSystemBase):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def checkInit(self):
> +        super(InitSystemBusyboxBase, self).checkInit("/bin/busybox")
> +

Just as a suggestion, you can probably get away without needing to
override that function by defining a class variable "init_path" that
SystemBusyboxBase and SystemSystemdBase will override to some
appropriate value. See, for example, the code I wrote for Python and
IPython related tests.

https://git.buildroot.net/buildroot/tree/support/testing/tests/package/test_python.py#n11
https://git.buildroot.net/buildroot/tree/support/testing/tests/package/test_ipython.py#n18

Thanks,
Andrey Smirnov
