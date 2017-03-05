From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 18:55:52 +0100
Subject: [Buildroot] [PATCH v2 4/5] support/testing: add package tests
In-Reply-To: <20170305162704.GJ3671@free.fr>
References: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1488726201-6507-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305162704.GJ3671@free.fr>
Message-ID: <20170305185552.1729ee33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 17:27:04 +0100, Yann E. MORIN wrote:
> > +    def test_run(self):
> > +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> > +        self.emulator.boot(arch="armv5",
> > +                           kernel="builtin",
> > +                           options=["-initrd", cpio_file])
> > +        self.emulator.login()  
> 
> I was wondering if the login phase could not be implicit. But then you
> may need to pass a pasword (like for the dropbear case).
> 
> Yet, I still think that it should be implicit by default, unless you
> have to log in with a specific user/passwd...

Yes, we will definitely need some shortcuts for the common cases. But
that's clearly the kind of improvements that we can make gradually I
believe.

> > +        cmd = "python --version 2>&1 | grep '^Python 2'"
> > +        _, exit_code = self.emulator.run(cmd)
> > +        self.assertEqual(exit_code, 0)
> > +
> > +        cmd = "python -c 'import math; math.floor(12.3)'"
> > +        _, exit_code = self.emulator.run(cmd)
> > +        self.assertEqual(exit_code, 0)
> > +
> > +        cmd = "python -c 'import ctypes;"
> > +        cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
> > +        cmd += "print libc.time(None)'"
> > +        _, exit_code = self.emulator.run(cmd)
> > +        self.assertEqual(exit_code, 0)
> > +
> > +        cmd = "python -c 'import zlib'"
> > +        _, exit_code = self.emulator.run(cmd)
> > +        self.assertEqual(exit_code, 1)  
> 
> As I see it, there are a lot of similar constructs:
> 
>     cmd = "do-something"
>     _, exit_code = self.emulator.run(cmd)
>     self.assertEqual(exit_code, 0)
> 
> Could we not aggregate the last two in a single command, like:
> 
>     cmd = "do-something"
>     self.emulator.run.assert_exit(cmd, 0)
> 
> Or something like that (use your imagination to come up with a
> meaningful function name...)
> 
> We could then expand it with something like:
> 
>     self.emulator.run.assert_stdout(cmd, regexp)
> 
> So that you could write:
> 
>     cmd = "python --version 2>&1"
>     self.emulator.run.assert_stdout(cmd, "^Python 2")

Same comment here: yes, we will need some shortcuts.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
