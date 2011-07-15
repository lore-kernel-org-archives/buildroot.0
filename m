From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2011 14:30:53 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
Message-ID: <20110715143053.558a756a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 15 Jul 2011 08:34:34 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> > The depend statement causes the vmlinux target only to be available
> > for mips processors.
> > For powerpc for example, only uImage and zImage are selectable.
> >
> > However, I'd like to have vmlinux in the output/images directory.
> > First of all because I am directly loading this on target, rather than
> > uImage or zImage.

If vmlinux is useful on powerpc platforms, then it should be added to
the list of architectures for which vmlinux is proposed.

> In fact I have more problems with this version encoding in the output
> build/linux-X directory:
> * I need to get to the vmlinux file (mentioned above)

Just need to add "|| BR2_powerpc" as you suggested.

> * I need to get to the dtc (device tree compiler) which resides in
> <linux>/scripts/dtc/dtc

This tool looks like a useful host tool built by the kernel. Maybe we
should install it in $(HOST_DIR)/usr/bin ?

> * I need to be able to compile external kernel modules, so in that
> Makefile I need to point to the right kernel directory.

Ok. Those could be integrated as Buildroot packages, in which case
getting access to the Linux source directory is easy.

> If you stick with one kernel version, then you can hardcode it in the
> relevant scripts and Makefiles. However, when switching to another
> version, you have to update all of these files.
> One approach to solve all of this would be to create a symbolic link
> output/build/linux, pointing to the output/build/linux-X directory
> corresponding to the actually configured version.

I think I'd prefer something like :

$ make <pkg>-show-srcdir

which would be implemented at the package infrastructure, and which
would return the source directory of a particular package. This way,
you can easily ask where a given package source code has been extracted
by Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
