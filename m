From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 18:17:15 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <CAAXf6LUaOXizUnxjZVhbpoeiAxAiLeYyXajQKgOjKzY-vo0g2w@mail.gmail.com>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <20110715143053.558a756a@skate>
 <CAAXf6LUaOXizUnxjZVhbpoeiAxAiLeYyXajQKgOjKzY-vo0g2w@mail.gmail.com>
Message-ID: <20110720181715.0267567a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 20 Jul 2011 15:38:14 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> > Just need to add "|| BR2_powerpc" as you suggested.
> 
> I'm not sure why you want to restrict this to specific architectures
> instead of allowing it for all.
> What is wrong with the following?

At least on x86 and ARM, "vmlinux" does not exist in arch/<ARCH>/boot/,
so allowing "vmlinux" would simply trigger a failure at build time.

> It will be up to the user/developer to decide what kind of output he
> wants. The linux kernel Makefile will always generate vmlinux.

No. The "vmlinux" that the Linux kernel generates in its top directory
is not a valid bootable image on architectures such as x86 and ARM. And
for those architectures, there is no "vmlinux" file in
arch/<ARCH>/boot/.

> Whether it is of direct use for a certain architecture is another question.
> Most developers will select e.g. uImage for use with U-boot, but some
> (like us) may want to do our own transformations on vmlinux to package
> it in another way (e.g. with a proprietary bootloader).

Which vmlinux are you using ? The one at the top directory of the
kernel source tree, or the one in arch/<ARCH>/boot ?

> >> * I need to get to the dtc (device tree compiler) which resides in
> >> <linux>/scripts/dtc/dtc
> >
> > This tool looks like a useful host tool built by the kernel. Maybe we
> > should install it in $(HOST_DIR)/usr/bin ?
> 
> Yes, I agree. How do you do that?

You can hijack any of the installation steps of the kernel to install
this tool to $(HOST_DIR)/usr/bin. But technically speaking, this
wouldn't respect the convention of the package infrastructure: the
"linux" package is a target package, and it is therefore not supposed
to install anything in $(HOST_DIR).

> >> * I need to be able to compile external kernel modules, so in that
> >> Makefile I need to point to the right kernel directory.
> >
> > Ok. Those could be integrated as Buildroot packages, in which case
> > getting access to the Linux source directory is easy.
> 
> Good point. I'll have to add Mercurial support in buildroot to get there though.

At some point, I had patches to add Mercurial support, but I guess they
got lost together with my previous laptop :-(

> > I think I'd prefer something like :
> >
> > $ make <pkg>-show-srcdir
> >
> > which would be implemented at the package infrastructure, and which
> > would return the source directory of a particular package. This way,
> > you can easily ask where a given package source code has been extracted
> > by Buildroot.
> 
> I like this as well. It's simple and generic.
> I'm not sure whether it still is needed after I include the .config though.

Well, if you don't need it anymore, then let's keep the idea for
another time, when someone will actually need it for something. It
should be just 3 lines of code to add to the package infrastructure.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
