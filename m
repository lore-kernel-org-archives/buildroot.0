From: hartleys <hartleys@visionengravers.com>
Date: Fri, 17 Oct 2008 18:00:10 -0400
Subject: [Buildroot] packages and architecture specific include files
In-Reply-To: <00db01c9309b$91456c80$6901a8c0@iguana3>
References: <014301c92ef4$75909f80$6901a8c0@iguana3><BD79186B4FD85F4B8E60E381CAEE1909AEF664@mi8nycmail19.Mi8.com>
	<00db01c9309b$91456c80$6901a8c0@iguana3>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909B55F47@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, October 17, 2008 2:02 PM, John Schimandle wrote:
> Actually I found a better was to access GPIOs in user space
> using sysfs.

Yes. With the newer kernel the sysfs interface to the gpio's is much
cleaner.

> The file that registers the GPIOs for the at91sam9263ek
> board is a file in the kernel named
> arch/arm/mach-at91/board-sam9263ek.c. This file registered
> two LED GPIOs and they work fine. I'll just set up more
> GPIOs in the kernel in the same way and use them from
> sysfs. I'll change this source file or figure out how
> to create a new source file for my customer's board.
> The later is probably a little harder.

If you are using the 2.6.27 kernel you might want to look at the export
functionality in the Sysfs interface for gpio's. I think the only gpio's
that need to be registered in the kernel are the ones it actually uses.
Just export the one you need in user space on the fly. Look at
Documentation/gpio.txt for more information.

> The other board level functionality is also in the sysfs
> file system so I can just use it directly from there.
>
> Basically, sysfs appears to be a better way access the
> hardware components of the board from a user space application.

Agree.

> There was one problem with the /sys directory not being in
> the root file system and so the fstab mount of sysfs did not
> occur. I created the directory manually in my embedded system
> and then sysfs mounted with no problem and I was able to
> access the GPIOs. I have to go back and figure out why /sys
> is not created in the root file system.

In buildroot I'm currently using a custom target/device since my setup
is a bit goofy.

You probably have the target/generic/target_busybox_skeleton selected in
your busybox config. The /sys directory is missing in that skeleton.

>> #include <asm/arch/gpio.h>
>
> That file is a kernel header. It shouldn't be included in
> userspace code.

My only point with the above comment is you shouldn't reference kernel
headers in application code.

Best of luck,
Hartley
