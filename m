From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jan 2011 10:19:57 +0100
Subject: [Buildroot] Linux kernel boot stops after NFS mount
In-Reply-To: <AANLkTikt7LVDGtr9LD2-eQodYYJyvUPWN7ow=METPXW7@mail.gmail.com>
References: <AANLkTikz=zS_a315fwc=F+iUL=j2P43bTi8CeJPuoHG3@mail.gmail.com>
	<4D286E5A.1010209@sensortherm.de>
	<AANLkTingWO1X3b7dgBqh5FVM7q9oxAtyaOHP-J0WnpS-@mail.gmail.com>
	<20110108190821.59d08d47@surf>
	<AANLkTikt7LVDGtr9LD2-eQodYYJyvUPWN7ow=METPXW7@mail.gmail.com>
Message-ID: <20110109101957.4359476c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Jan 2011 03:29:41 +0530
Divick Kishore <divick.kishore@gmail.com> wrote:

> No the CONFIG_AEABI is not set in the config for my kernel.
> 
> Ahh..this is the catch. From what I am aware, I guess, both binaries
> and kernel need to be built with either ABI or EABI. Since my
> toolchain is arm-none-linux-gnueabi, which reflects the fact that all
> binaries in my filesystem are built with EABI.

Yep, your kernel needs to support EABI. Buildroot ensure that it is the
case when Buildroot is in charge of building the kernel, but when the
kernel is built separatly, there's nothing Buildroot can do, except
relying on the user knowledge.

> I tried building the kernel with CONFIG_AEABI enabled and now I do see
> boot messages past the previous point(see boot log below). But it
> looks like there are some problems with the default inittab settings.
> Should I make a separate post to discuss these issues?

You have enabled BR2_PACKAGE_SYSVINIT, so the init being used is the
traditional SysV init, and not Busybox init. And our default inittab
only works well with Busybox init (which is the standard setup for a
Buildroot system).

So, two solutions :

 1) Unless you have strong reasons not to use Busybox init, I would
    recommend using it by disabling BR2_PACKAGE_SYSVINIT. 

 2) If you really need to use SysV init, then you should use the Git
    version of Buildroot, or at least merge
    http://git.buildroot.net/buildroot/commit/?id=7e2bf63080cc0011c84ee46ee2aba161569154c5
    into your Buildroot version. This commit adds an inittab that works
    well with SysV init.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
