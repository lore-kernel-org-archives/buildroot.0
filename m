From: Jacob Sullivan <mail@jakesullivan.com>
Date: Sun, 20 Nov 2011 14:34:42 -0800
Subject: [Buildroot] need help making bootable image
In-Reply-To: <20111120092655.5a603142@skate>
References: <FE2CFD94-31A4-4D5D-B6B0-634C6358BE93@jakesullivan.com>
 <20111120092655.5a603142@skate>
Message-ID: <90A7D971-7584-4B45-8DCB-61BEE8AE3EC0@jakesullivan.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Nov 20, 2011, at 12:26 AM, Thomas Petazzoni wrote:

> Hello,
> 
> Le Sat, 19 Nov 2011 12:51:06 -0800,
> Jacob Sullivan <mail@jakesullivan.com> a ?crit :
> 
>> Current status.  I have a buildroot ISO image that I can boot in qemu
>> and a buildroot ext2 image that I can mount either in ubuntu or in
>> qemu when I boot with the ISO image.  The changes that I made to the
>> default build are minimal.  I added ext2 to buildroot and the kernel,
>> added nano to buildroot and fdsk to busybox.  I also changed the tty
>> in buildroot to tty1 so that I could get a console prompt when I
>> booted in qemu.  I made an empty disk image, mounted it and made a
>> primary partition formatted ext2, mounted that and copied in the root
>> file structure.  I then unmounted it and tried to install grub on the
>> image.  ubuntu has grub 2, and I couldn't figure out how to use the
>> grub that buildroot created.  next, I booted qemu using the ISO as
>> boot and the disk image as the hard drive.  I installed grub onto the
>> hdd image (from inside qemu) and tried to boot from the drive.  No
>> luck, I get an error stating that the drive is read only and all the
>> attempts to open /dev/* fail.  I googled the error code and all the
>> answers pointed to a corrupt drive.  I started all over and got the
>> same error.
> 
> I don't understand why you're trying to mix an ISO image and an ext2
> partition here. Why don't you simply make your ext2 image bootable ?
> 
> I have some script stuff that does that here (create partitions,
> loopback mount them, install grub, etc.), I could extract it and make it
> available if you're interested.

I tried to make the ext2 image bootable (that is the only thing I can't seem to make work).  I went down the iso path because that image would boot and had a version of grub that was the same as in the ext2 image.  I would love to have a copy of the scripts.

> 
>> 1) is this the right approach, or am I missing an obvious step?
> 
> The steps to install Grub, create partitions and so on require to be
> root, this is the reason why Buildroot does not do this work. But
> certainly, we could better document how to proceed to do these things.

how should I install grub?  Since my dev machine has grub2, I thought booting from the ISO image would be a good workaround... I also thought that the whole idea of fakeroot was so that tools like buildroot could do these types of tasks...

> 
>> 2) is there a reason that the inittab file only has getty on a serial
>> port by default? 
> 
> As answered by Bjorn, typical embedded systems use a serial port for
> debugging purposes.
> 
>> 3) what is the recommended way of making changes to
>> buildroot so that when a new version comes out I don't lose all my
>> changes.  I thought that I would just need to put my .configs into
>> source control, but it looks like I need to change the inittab file
>> in the skeleton.  How do other people handle configuration changes
>> that aren't covered by any of the .configs (or the various make
>> menuconfigs)?
> 
> You should not change the inittab of the skeleton, because that will
> prevent you from making upgrades to newer Buildroot versions.
> 
> Instead, use a custom post-build script (BR2_POST_BUILD_SCRIPT) that
> tweaks the inittab.

Ah.  That is what I was looking for.  I would love sample post-build scripts if you have any.

> 
> See http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf,
> page 22, 23, 24 and 25.

This was really useful, there should be a link to this from the buildroot doc or faq page.  In all my google searches for other buildroot problems, this didn't come up, but should have.

> 
>> 
>> Note:  I didn't search the buildroot archives.  I tried, but I keep
>> getting an error from google stating that I have been blocked from
>> that service.
> 
> The archives are available at
> http://lists.busybox.net/pipermail/buildroot/. Do you have a problem
> access this URL ?

No, I'll download those and search them.  My problem is from the search bar on this page: http://buildroot.uclibc.org/lists.html
I get this strange error from google... "
We're sorry...

... but your computer or network may be sending automated queries. To protect our users, we can't process your request right now.

See Google Help for more information."

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111120/f5d9e72d/attachment.html>
