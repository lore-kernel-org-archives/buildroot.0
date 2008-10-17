From: John Schimandle <john_schimandle@hotmail.com>
Date: Fri, 17 Oct 2008 14:01:47 -0700
Subject: [Buildroot] packages and architecture specific include files
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909AEF664@mi8nycmail19.Mi8.com>
References: <014301c92ef4$75909f80$6901a8c0@iguana3>
	<BD79186B4FD85F4B8E60E381CAEE1909AEF664@mi8nycmail19.Mi8.com>
Message-ID: <COL0-DAV20CE667D9E48B877B8CF7B8D320@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually I found a better was to access GPIOs in user space using sysfs.

The file that registers the GPIOs for the at91sam9263ek board is a file in
the kernel named arch/arm/mach-at91/board-sam9263ek.c. This file registered
two LED GPIOs and they work fine. I'll just set up more GPIOs in the kernel
in the same way and use them from sysfs. I'll change this source file or
figure out how to create a new source file for my customer's board. The
later is probably a little harder.

The other board level functionality is also in the sysfs file system so I
can just use it directly from there.

Basically, sysfs appears to be a better way access the hardware components
of the board from a user space application.

There was one problem with the /sys directory not being in the root file
system and so the fstab mount of sysfs did not occur. I created the
directory manually in my embedded system and then sysfs mounted with no
problem and I was able to access the GPIOs. I have to go back and figure out
why /sys is not created in the root file system.

-----Original Message-----
From: hartleys [mailto:hartleys at visionengravers.com] 
Sent: Wednesday, October 15, 2008 11:44 AM
To: John Schimandle; buildroot at uclibc.org
Subject: RE: [Buildroot] packages and architecture specific include files

On Wednesday, October 15, 2008 11:33 AM, John Schimandle wrote:
> #include <asm/arch/gpio.h>

That file is a kernel header. It shouldn't be included in userspace code.

As an example, all the inline functions will and extern function prototypes
will not work and generate build errors if you try and use them. Also, the
other #include statements in the file are going to break if you try to
include the file.

Your probably better off just working out what you need from the file and
creating a local "API" header for your application.

Hartley
