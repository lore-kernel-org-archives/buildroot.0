From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 21 Nov 2018 17:26:11 +0100
Subject: [Buildroot] [RFC 1/4] support/testing: add perl test
In-Reply-To: <5bf20dd5ecdd5_3eca3f95580c57882082e@ultri5.mail>
References: <20181117175244.23594-2-francois.perrad@gadz.org>
 <5bf20dd5ecdd5_3eca3f95580c57882082e@ultri5.mail>
Message-ID: <CAB0FRsuJV2wv8QqtFdZQkgdbOWQqE0=6pjvAXHmca30zc9Xd4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 19 nov. 2018 ? 02:11, Ricardo Martincoski <
ricardo.martincoski@gmail.com> a ?crit :

> Hello,
>
> In overall, the series looks good.
> Except for the general discussion in the cover letter about which path we
> want
> to follow (add the infra to add a .pl to the image in build time or not),
> I have
> only nits.
>
> On Sat, Nov 17, 2018 at 03:52 PM, Francois Perrad wrote:
>
> [snip]
> > +class TestPerl(infra.basetest.BRTest):
> > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> > +        """
> > +        BR2_TARGET_ROOTFS_CPIO=y
> > +        # BR2_TARGET_ROOTFS_TAR is not set
> > +        BR2_PACKAGE_PERL=y
>
> nit: this is not the order after 'make savedefconfig'
>
> > +        """
> > +
> [snip]
> > +    def version_test(self, timeout=-1):
>
> This timeout is always used with its default value, you can remove from
> here and
> from the call to emulator.run 2 lines below.
>
> > +        cmd = "perl -v"
>
> What about using this instead?
>         cmd = "perl -v | grep 'This is perl 5'"
>

As tester, I don't like this kind of code, because I never know which exit
code is available, the one from perl or the one from grep.
Code written for test must be obvious.
See the following example:

#!/usr/bin/env python
import unittest
import subprocess

class DeveloperWay(unittest.TestCase):
    def testPerl(self):
        retcode = subprocess.call("perl -v | grep 'This is perl 5'",
shell=True)
        self.assertEqual(retcode, 0)

class TesterWay(unittest.TestCase):
    def testPerl(self):
        retcode = subprocess.call('perl -v', shell=True)
        self.assertEqual(retcode, 0)
        output = subprocess.check_output('perl -v', shell=True)
        self.assert_('This is perl 5' in output)

unittest.main()

Fran?ois

I guess Perl 6 will take a long time to be supported in Buildroot.
>
> > +        _, exit_code = self.emulator.run(cmd, timeout)
> > +        self.assertEqual(exit_code, 0)
> > +
> > +    def module_test(self, module, script="1", timeout=-1):
>
> If we end up using the extra logic (basically copied from
> TestPythonPackageBase)
> and having the .pl file added to the tree, this method would not be needed.
>
>
> Regards,
> Ricardo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181121/13a37a58/attachment.html>
