From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jul 2017 16:45:52 +0200
Subject: [Buildroot] [PATCH 20/20] support/testing: add runtime testing
 for init systems
In-Reply-To: <e1b95878-e58f-c884-4265-8a1dcae14583@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <95f6965c48dbf2f754818e2bec1f2d3891015475.1500398733.git.yann.morin.1998@free.fr>
 <e1b95878-e58f-c884-4265-8a1dcae14583@mind.be>
Message-ID: <20170722144552.GE9929@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-22 16:32 +0200, Arnout Vandecappelle spake thusly:
>  I think this patch should go in right away, even before the skeleton/systemd
> fixes. Yes, that may make some tests fail, but that's fine.

I am not so sure. We don;t know how long it will take this series to get
in in its entirety.

OTOH, ahving the tests in right now would be quite an incentive to get
the rest in. ;-]

> On 18-07-17 19:25, Yann E. MORIN wrote:
> > The "builtin" kernel does not boot a systemd-based system, so
> > we resort to building the same one as currently used by our
> > qemu_arm_vexpress_defconfig.
> > 
> > We test the 11 following combinations:
> > 
> >   - busybox, read-only, without network
> >   - busybox, read-only, with network
> >   - busybox, read-write, without network
> >   - busybox, read-write, with network
> > 
> >   - basic systemd, read-only, network w/ ifupdown
> >   - basic systemd, read-only, network w/ networkd
> >   - basic systemd, read-write, network w/ ifupdown
> >   - basic systemd, read-write, network w/ networkd
> > 
> >   - full systemd, read-only, network w/ networkd
> >   - full systemd, read-write, network w/ networkd
> > 
> >   - no init system, read-only, without network
> 
>  Given that we're testing init here, it would be nice to also add tests with the
> cpio filesystem, which runs a shell script before starting /sbin/init.

As I said, we can add more tests in the future. I already have a few
ideas of what we could/should add, but I'll refrain to do so for now,
to concentrate on doing the requested cleanups on this series. ;-)

>  It's probably sufficient to just do the maximal test with this scenario.
>  Oh, and a test with sysvinit would also be nice...
> 
> > The tests just verify what the /sbin/init binary is, and that we were
> > able to grab an IP address. More tests can be added later, for example
> > to check each systemd features (journal, tmpfiles...)
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
>  I have a bunch of comments, but nothing critical so
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> [snip]
> > +    def startEmulator(self, fs_type, kernel=None, dtb=None, init=None):
> 
>  PEP8 says snake-case for functions. I'm not sure if the rest of the testing
> infra satisfies this, but let's try to not make things worse.

We already have BRTest.setUp() and BRTest.tearDown(), so I mimicked
that. And I also applied Thomas suggestion to go camel-case with
functions (reviewed on IRC).

> > +        img = os.path.join(self.builddir, "images", "rootfs.{}".format(fs_type))
> > +        subprocess.call(["truncate", "-s", "%1M", img])
> 
>  It's a bit weird to do that here, but I see no better way either.
> 
> > +
> > +        options = ["-drive",
> > +                   "file={},if=sd,format=raw".format(img),
> > +                   "-M", "vexpress-a9"]
> > +
> > +        if kernel is None:
> > +            kernel = "builtin"
> > +        else:
> > +            kernel = os.path.join(self.builddir, "images", kernel)
> 
>  This condition should probably be refactored into emulator.boot itself -
> although admittedly that doesn't have a reference to builddir at the moment.

I was planning on reworking the test infra as you suggested, because I
also found it did make sense, but again, that is out-of-scope for this
series.

> > +            options.extend(["-dtb", os.path.join(self.builddir, "images",
> > +                                             "{}.dtb".format(dtb))])
> 
>  This should only be done if dtb is not None.

Right.

> > +
> > +        kernel_cmdline = ["root=/dev/mmcblk0",
> > +                          "rootfstype={}".format(fs_type),
> > +                          "rootwait",
> > +                          "ro",
> > +                          "console=ttyAMA0"]
> > +
> > +        if not init is None:
> > +            kernel_cmdline.extend(["init={}".format(init)])
> 
>  Just a single element, so append() instead of extend().

Right.

> > +
> > +        self.emulator.boot(arch="armv7",
> > +                           kernel=kernel,
> > +                           kernel_cmdline=kernel_cmdline,
> > +                           options=options)
> > +
> > +        if init is None:
> > +            self.emulator.login()
> 
>  This looks weird so warrants a comment:
> 
>  # The init argument is passed when there is no /sbin/init and we instead
>  # directly run an executable. So when init is None, we have to log in.

Ack.

> > +
> > +    def checkInit(self, path):
> > +        cmd = "cmp /proc/1/exe {}".format(path)
> > +        _, exit_code = self.emulator.run(cmd)
> > +        self.assertEqual(exit_code, 0)
> > +
> > +    def checkNetwork(self, interface, exitCode=0):
> > +        cmd = "ip addr show {} |grep inet".format(interface)
> > +        _, exit_code = self.emulator.run(cmd)
> > +        self.assertEqual(exit_code, exitCode)
> 
>  These you could also run automatically, and request the arguments from the
> instance:
> 
>     def test_run(self):
>         self.startEmulator(self.fs_type())
>         self.checkInit(self.init_path())
>         if self.have_network():
>             self.checkNetwork("eth0")
>         else:
>             self.checkNetwork("eth0", 1)
> 
>  Ideally you'd then make this an ABC class and declare those callbacks as
> @abstractmethod, but perhaps that's going too far for you :-)

Is it really necessary that we go this route? It is much more complex,
for a dubious gain, if at all.

I'd prefer we keep with simple, plain code, so that everyone can
contribute more easily...

> [snip]
> > +class TestInitSystemNone(InitSystemBase):
> > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> > +        """
> > +        BR2_INIT_NONE=y
> > +        # BR2_TARGET_ROOTFS_TAR is not set
> > +        BR2_TARGET_ROOTFS_SQUASHFS=y
> > +        """
> > +
> > +    def test_run(self):
> > +        self.startEmulator(fs_type="squashfs", init="/bin/sh")
> > +        index = self.emulator.qemu.expect(["/bin/sh: can't access tty; job control turned off", pexpect.TIMEOUT], timeout=60)
> > +        if index != 0:
> > +            self.emulator.logfile.write("==> System does not boot")
> > +            raise SystemError("System does not boot")
> 
>  Why do you need to raise an exception here? Why not
> 
>     if index != 0:
>         self.fail(==> System does not boot")
>         return

I did exactly as is currently done in Emulator.login():

    index = self.qemu.expect(["buildroot login:", pexpect.TIMEOUT],
                             timeout=60)
    if index != 0:
        self.logfile.write("==> System does not boot")
        raise SystemError("System does not boot")

Regards,
Yann E. MORIN.

> 
>  Regards,
>  Arnout
> 
> [snip]
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
