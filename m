From: universeII at gmx.de <universeII@gmx.de>
Date: Fri, 5 Apr 2013 16:19:57 +0200 (CEST)
Subject: [Buildroot] SOLVED:  Cross-Compiling out-of-tree driver
In-Reply-To: <trinity-0e36b99f-cbd5-4343-a50b-185b78fed3ba-1365170632191@3capp-gmx-bs29>
References: <trinity-59b60d3c-656f-45cc-86d2-b8be6566e03e-1365162059588@3capp-gmx-bs42>, 
 <20130405140752.195f40c9@skate>,
 <trinity-0e36b99f-cbd5-4343-a50b-185b78fed3ba-1365170632191@3capp-gmx-bs29>
Message-ID: <trinity-ad705b0c-00fe-4a23-9aaf-1c944f4b8ab7-1365171597857@3capp-gmx-bs29>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

O.k.,
reason for compilation problems was that the module loader support was disabled. Just enable this in kernel config,
recompile the kernel and the driver compilation works.
?
Thanks to you guys for the support.
?
Regards,
Andreas
?

Gesendet:?Freitag, 05. April 2013 um 16:03 Uhr
Von:?universeII at gmx.de
An:?buildroot at busybox.net
Betreff:?Re: [Buildroot] Cross-Compiling out-of-tree driver

In the meanwhile I figured out how to start the driver corss-compilation by hand:
Adding the cross tool directory to PATH and calling
make ARCH=powerpc CROSS_COMPILE=powerpc-linux-
?
But when doing this the gcc does not know kernel functions like printk(), alloc_chrdev_region(),
cdev_add(), ...
?
The driver code itself is correct, Just typing "make" without ARCH=... the driver compiles on my x86_64 PC.

?
Has somone an idea?
?
Regards,
Andreas
?

Gesendet:?Freitag, 05. April 2013 um 14:07 Uhr
Von:?"Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
An:?universeII at gmx.de
Cc:?buildroot at busybox.net
Betreff:?Re: [Buildroot] Cross-Compiling out-of-tree driver
Hello Andreas,

(Would be nice if your e-mail had been wrapped to ~80 characters).

On Fri, 5 Apr 2013 13:40:59 +0200 (CEST), universeII at gmx.de wrote:

> I'm trying to use buildroot to create a Linux system for our custom
> VME PowerPC board.
>
> I succeeded in modifying the kernel to run on our special hardware
> but I'm stuck in compiling a driver out-of-tree.
>
> In-kernel compilation is no problem but for development and
> debugging of drivers it is much simpler to be able to compile drivers
> quickly out-of-tree and insert/remove them manually.
>
> I started to compile a dummy driver out-of-tree on my linux PC
> which works fine. Now I'm trying to use the linux kernel inside
> buildroot tree (setting KDIR appropriately) and use the cross-compile
> tool from buildroot. I searched the buildroot documentation but only
> found instructions how to compile own applications/libraries. Also
> TODOs from the internet on cross-compiling drivers did not help.
>
> Maybe I just oversee some simple things
>
> Can anybody give me a hint, how to cross-compile a linux driver
> out-of-tree using buildroot?

Yes. See the mail I posted a long time ago, which provided an example
of a kernel module and the associated .mk file:

http://lists.busybox.net/pipermail/buildroot/2011-August/044807.html

Note however that the .mk file will need a few modifications,
especially the last line should just be:

$(eval $(generic-package))

I hope this helps. If not, don't hesitate to come back with
any question you may have.

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com[http://free-electrons.com]
?
?
