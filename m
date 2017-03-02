From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 01 Mar 2017 22:47:33 -0300
Subject: [Buildroot] [PATCH 2/5] support/testing: add core tests
References: <1486467363-19881-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <58b779b582a46_1c373ff16a8e2ec09216c@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 07, 2017 at 09:36 AM, Thomas Petazzoni wrote:

[snip]
> +++ b/support/testing/tests/core/test_post_scripts.py
[snip]
> +    # TODO

This comment can be removed. The method is already implemented.

> +    def check_post_log_file(self, path, what):
> +        with open(path, "r") as f:
> +            lines = f.read().splitlines()
> +        self.assertEqual(lines[0], os.path.join(self.builddir, what))
> +        self.assertEqual(lines[1], "foobar")
> +        self.assertEqual(lines[2], "baz")
> +        self.assertEqual(lines[3], os.path.join(self.builddir, "target"))
> +        self.assertEqual(lines[4], os.path.join(self.builddir, "build"))
> +        self.assertEqual(lines[5], os.path.join(self.builddir, "host"))
> +        staging = os.readlink(os.path.join(self.builddir, "staging"))
> +        self.assertEqual(lines[6], staging)
> +        self.assertEqual(lines[7], os.path.join(self.builddir, "images"))
> +        self.assertEqual(lines[8], os.path.join(self.builddir, ".config"))
> +
[snip]
> +++ b/support/testing/tests/core/test_timezone.py
> @@ -0,0 +1,66 @@
> +import os
> +
> +import infra.basetest
> +
> +def boot_armv5_cpio(emulator, builddir):
> +        img = os.path.join(builddir, "images", "rootfs.cpio")
> +        emulator.boot(arch="armv5", kernel="builtin",
> +                      options=["-initrd", img])
> +        emulator.login("root")

Shouldn't it be like this?
        emulator.login()

> +
> +class TestNoTimezone(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +             """
> +# BR2_TARGET_TZ_INFO is not set
> +BR2_TARGET_ROOTFS_CPIO=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +"""

Regards,
Ricardo
