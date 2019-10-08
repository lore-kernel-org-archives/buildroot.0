From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 8 Oct 2019 21:12:23 +0200
Subject: [Buildroot] [PATCH 4/4] support/testing: add luvi test
In-Reply-To: <5d9bcc881c3ba_301a3fe77612d304497c@ultri5.mail>
References: <20190929125520.16957-4-francois.perrad@gadz.org>
 <5d9bcc881c3ba_301a3fe77612d304497c@ultri5.mail>
Message-ID: <CAB0FRsurxM=7AfPzR13Owe64YVCjy4B_L2SerGhDbY9Pmpeh2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 8 oct. 2019 ? 01:38, Ricardo Martincoski <
ricardo.martincoski@gmail.com> a ?crit :

> Hello,
>
> I did not find anything really wrong with this patch, but I think we can
> reuse
> more code.
>
>
I disagree.
luvi is related to lua, but it is not a Lua module (like NodeJS which is an
JavaScript interpreter, is not a JavaScript library/module).
so, it is a choice to not use TestLuaBase.

In my todo list, I want remove luvi from the Lua modules section in
package/Config.in, and find its real location.

Fran?ois


> Did you find any issue using the armv5 kernel?
> For me it seems to work fine:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/313198399
>
> In the case we can use the armv5 kernel, we can also use TestLuaBase, by
> doing
> 3 changes I propose below.
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/314234461
>
> On Sun, Sep 29, 2019 at 09:55 AM, Francois Perrad wrote:
>
> [snip]
> > diff --git a/support/testing/tests/package/test_luvi.py
> b/support/testing/tests/package/test_luvi.py
> > new file mode 100644
> > index 000000000..a85a6f4d2
> > --- /dev/null
> > +++ b/support/testing/tests/package/test_luvi.py
> > @@ -0,0 +1,36 @@
>
> > +import os
> > +
> > +import infra.basetest
>
> These would become:
> from tests.package.test_lua import TestLuaBase
>
> > +
> > +
>
> > +class TestLuvi(infra.basetest.BRTest):
> > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> > +        """
> > +        BR2_TARGET_ROOTFS_CPIO=y
> > +        # BR2_TARGET_ROOTFS_TAR is not set
>
> These would become:
> class TestLuvi(TestLuaBase):
>     config = TestLuaBase.config + \
>         """
>
> > +        BR2_PACKAGE_LUAJIT=y
> > +        BR2_PACKAGE_LUVI=y
> > +        BR2_PACKAGE_OPENSSL=y
> > +        BR2_PACKAGE_PCRE=y
> > +        BR2_PACKAGE_ZLIB=y
> > +        """
> > +
>
> > +    def login(self):
> > +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> > +        self.emulator.boot(arch="armv7",
> > +                           kernel="builtin",
> > +                           options=["-initrd", cpio_file])
> > +        self.emulator.login()
> > +
>
> And login() would not be defined, reusing the implementation from the
> parent
> class.
>
> > +    def version_test(self):
> > +        cmd = "luvi -v"
> > +        output, exit_code = self.emulator.run(cmd)
> > +        self.assertIn('luvi', output[0])
> > +        self.assertIn('zlib', output[1])
> > +        self.assertIn('rex', output[2])
> > +        self.assertIn('libuv', output[3])
> > +        self.assertIn('ssl', output[4])
> > +
> > +    def test_run(self):
> > +        self.login()
> > +        self.version_test()
> > --
>
> Regards,
> Ricardo_______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191008/1bd9498d/attachment.html>
