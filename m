From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 15 Jul 2011 08:34:34 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
Message-ID: <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 15, 2011 at 8:20 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi,
>
> linux/Config.in contains the following configuration option:
>
> config BR2_LINUX_KERNEL_VMLINUX
> ? ? ? ?bool "vmlinux"
> ? ? ? ?depends on BR2_mips || BR2_mipsel
>
> The depend statement causes the vmlinux target only to be available
> for mips processors.
> For powerpc for example, only uImage and zImage are selectable.
>
> However, I'd like to have vmlinux in the output/images directory.
> First of all because I am directly loading this on target, rather than
> uImage or zImage.
> Secondly, right now my wrapper scripts go and fetch the vmlinux
> executable in output/build/linux-<version>/vmlinux, which has the
> disadvantage of needing to know what version of Linux was configured
> in buildroot. I'd like to have a way to get the vmlinux file from
> whichever version was configured in buildroot. Making sure it ends up
> in output/images seems the simplest way.

In fact I have more problems with this version encoding in the output
build/linux-X directory:
* I need to get to the vmlinux file (mentioned above)
* I need to get to the dtc (device tree compiler) which resides in
<linux>/scripts/dtc/dtc
* I need to be able to compile external kernel modules, so in that
Makefile I need to point to the right kernel directory.

If you stick with one kernel version, then you can hardcode it in the
relevant scripts and Makefiles. However, when switching to another
version, you have to update all of these files.
One approach to solve all of this would be to create a symbolic link
output/build/linux, pointing to the output/build/linux-X directory
corresponding to the actually configured version.

What do you think of that?

>
> I patched the Config.in file to read:
>
> config BR2_LINUX_KERNEL_VMLINUX
> ? ? ? ?bool "vmlinux"
> ? ? ? ?depends on BR2_mips || BR2_mipsel || BR2_powerpc
>
> which works fine.
> I would even assume that every target can benefit from this option.
>
> Moreover, why don't we allow multiple targets? For example, in some
> projects you have different ways of loading your target, e.g. u-boot
> (uImage) and directly copying to memory with a probe (in which case
> vmlinux would be better suited).
>
