From: Jorge S. <jorgesolla@gmail.com>
Date: Wed, 24 Oct 2007 18:54:51 +0200
Subject: [Buildroot] Dataflash rootfs problems (still)
In-Reply-To: <1193243618.4415.6.camel@aeglos.sweden.atmel.com>
References: <6090c5eb0710240920o4e56f66et2c9f1761c97aea4e@mail.gmail.com>
	<1193243618.4415.6.camel@aeglos.sweden.atmel.com>
Message-ID: <6090c5eb0710240954q368b3409k282c02a5e2fcbef4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2007/10/24, Ulf Samuelsson <ulf@atmel.com>:
>
> ons 2007-10-24 klockan 18:20 +0200 skrev Jorge S.:
> > Hello all:
> >
> > I've sucessfully built  several root filesystems  for my custom board
> > (AT91RM9200 + 8MiB DataFlash),  but  now  i'm facing a  strange
> > problem.
> >
> > I'm using a JFFS2 filesystem on an MTD partition into the DataFlash,
> > my rootfs boots OK, but ONLY for the first time. See steps:
> >
> > 1) Create a rootfs JFFS2 image using buildroot -> OK
> > 2) Erase entire flash partition: I boot from an initrd containing
> > mtd-tools for this purpouse. -> OK
> > 3) Dump the rootfs image "rootfs.jffs2" into the Dataflash (i use
> > loadb from u-boot here...) -> OK
> > 4) Boot the system... -> OK
> > 5) Login and issue a simple reboot, no other commands...nothing
> > else.... -> OK
> >
>
> If you run the SPI faster than 5 Mbps, you are basically screwed.
> See Errata #13 in the datasheet.
>
> You will need to add an external AND gate if you want to run faster.
>
> * AND output to the dataflash chip select,
> * one input to the NPCS0
> * one input to a GPIO
>
> The driver needs to be adapted for this.


So, there's a flash corruption on the 1st boot?,

I'm a little confused now...why u-boot looks like writing OK then? I've
sucessfully uploaded hundreds of kernels and initrds images to the
dataflash.

During the 1st boot, Dropbear creates and "writes" the generated keys, maybe
is this *write* operation the one screwing up the dataflash?

And last question, which one is the best way to solve this by software? I
suppose i can "slow down" the SPI speed somewhere in the kernel or board
config at u-boot isn't it?

Thanks for helping Ulf.


> After the reboot at step "5" the system comes again, but now when is
> > press BACKSPACE it writes a space, and if i try to add a user or
> > change the root password
> > i always get a "/etc/passwd" not found.
> >
> > So i have (at least) 2 weird issues here:
> >
> > 1) Why my backspace key sends a space, but really deletes a
> > character?!?! It worked fine for the 1st boot
> > 2) Why "adduser" and "passwd" utilities are unable to access /etc
> > files? I'have TRIPLE checked read/write permissions...everything is
> > ok. Of course it works fine if i do this on the 1st boot!
> >
> > Any idea?!
> >
> > Thanks in advance.
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> --
> Best Regards,
> Ulf Samuelsson
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071024/92ddd7ce/attachment.htm 
