From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Nov 2018 23:11:49 -0200
Subject: [Buildroot] [RFC 1/4] support/testing: add perl test
References: <20181117175244.23594-2-francois.perrad@gadz.org>
Message-ID: <5bf20dd5ecdd5_3eca3f95580c57882082e@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In overall, the series looks good.
Except for the general discussion in the cover letter about which path we want
to follow (add the infra to add a .pl to the image in build time or not), I have
only nits.

On Sat, Nov 17, 2018 at 03:52 PM, Francois Perrad wrote:

[snip]
> +class TestPerl(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_PERL=y

nit: this is not the order after 'make savedefconfig'

> +        """
> +
[snip]
> +    def version_test(self, timeout=-1):

This timeout is always used with its default value, you can remove from here and
from the call to emulator.run 2 lines below.

> +        cmd = "perl -v"

What about using this instead?
        cmd = "perl -v | grep 'This is perl 5'"
I guess Perl 6 will take a long time to be supported in Buildroot.

> +        _, exit_code = self.emulator.run(cmd, timeout)
> +        self.assertEqual(exit_code, 0)
> +
> +    def module_test(self, module, script="1", timeout=-1):

If we end up using the extra logic (basically copied from TestPythonPackageBase)
and having the .pl file added to the tree, this method would not be needed.


Regards,
Ricardo
