From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 17:48:09 +0200
Subject: [Buildroot] [PATCH v5 01/14] support/testing: add runtime
 testing for init systems
In-Reply-To: <20170801225224.16899-2-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
 <20170801225224.16899-2-arnout@mind.be>
Message-ID: <20170802174809.1a7bba4f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Aug 2017 00:52:11 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The "builtin" kernel does not boot a systemd-based system, so
> we resort to building the same one as currently used by our
> qemu_arm_vexpress_defconfig.

[...]

Thanks, I've applied. I like the test case definitions themselves, they
are small and very readable. However, there are a few other things that
I think could be better, see below.


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

The beginning of this function partly duplicates some of the logic in
the Emulator() class, like passing -M vexpress-a9, etc. The fact that
you needed this additional helper function on top indicates IMO that
the self.emulator.boot() method should be improved.

> +        if not init is None:

if init is not None ?

> +            kernel_cmdline.extend(["init={}".format(init)])
> +
> +        self.emulator.boot(arch="armv7",
> +                           kernel=kernel,
> +                           kernel_cmdline=kernel_cmdline,
> +                           options=options)
> +
> +        if init is None:
> +            self.emulator.login()

Reading this condition is really weird. Indeed when you have an init
such as systemd or busybox, the init variable is None, and that's why
you login. And when you have *no* init, then the init variable has a
value, and you can't login.

But the naming of the variable can cause confusion here: "if init is
None" can be understood as "if there's no init program". But it's
actually exactly the opposite.

It would be nice to find a way to clarify that.

> +class TestInitSystemNone(InitSystemBase):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_INIT_NONE=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_TARGET_ROOTFS_SQUASHFS=y
> +        """
> +
> +    def test_run(self):
> +        self.startEmulator(fs_type="squashfs", init="/bin/sh")
> +        index = self.emulator.qemu.expect(["/bin/sh: can't access tty; job control turned off", pexpect.TIMEOUT], timeout=60)
> +        if index != 0:
> +            self.emulator.logfile.write("==> System does not boot")
> +            raise SystemError("System does not boot")
> +        index = self.emulator.qemu.expect(["#", pexpect.TIMEOUT], timeout=60)
> +        if index != 0:
> +            self.emulator.logfile.write("==> System does not boot")
> +            raise SystemError("System does not boot")

The self.emulator class should provide a method to wait for a string so
that you don't have to use the internals of self.emulator.qemu.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
