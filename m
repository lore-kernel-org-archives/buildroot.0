From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 22 Nov 2018 00:45:48 -0200
Subject: [Buildroot] [PATCH 1/8] support/testing: add perl test
References: <20181121195822.15379-2-francois.perrad@gadz.org>
Message-ID: <5bf6185cb9c1d_17c33fb41a10213471364@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Nov 21, 2018 at 05:58 PM, Francois Perrad wrote:

[snip]
> +class TestPerl(infra.basetest.BRTest):

To avoid the problem I mention in patch 3 (TestPerl being collected many times
by nose2), here we could have:

class TestPerlBase(infra.basetest.BRTest):

without BR2_PACKAGE_PERL=y and containing login and module_test, and ...

> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_PERL=y
> +        """
> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +    def version_test(self):
> +        cmd = "perl -v"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)

To do the tester way you mentioned in reply to v1, here you could:

        output, exit_code = self.emulator.run(cmd)
        self.assertEqual(exit_code, 0)
        self.assertIn("This is perl 5", output[1])

Perhaps even name the class TestPerl below as TestPerl5 to be more specific.

> +
> +    def module_test(self, module, script="1"):
> +        cmd = "perl -M{} -e '{}'".format(module, script)
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)

... here the test for the interpreter containing BR2_PACKAGE_PERL=y,
version_test, core_modules_test and test_run:

class TestPerl(TestPerlBase):
    config = TestPerlBase.config + \
        """
        BR2_PACKAGE_PERL=y
        """


Regards,
Ricardo
