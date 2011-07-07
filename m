From: Daniel Mack <zonque@gmail.com>
Date: Thu, 7 Jul 2011 14:22:29 +0200
Subject: [Buildroot] asking for advice on improving our buildroot setup
In-Reply-To: <20110707135922.5b7ff449@skate>
References: <1310033360.2076.18.camel@sven>
	<20110707135922.5b7ff449@skate>
Message-ID: <CACTFLAM2D6P3NaFibgV2hBbx0cyGSaFF8DbABvGeuGGbGZ9unQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 7, 2011 at 1:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 07 Jul 2011 12:09:20 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
>
>> We are building factory images, USB rescue images and update images
>> for our Raumfeld evices. In order to do this we need to build, for
>> each target platform (2 platforms currently):
>>
>> ?(1) a kernel and initramfs with some basic tools
>> ?(2) an ext2 rootfs that contains factory tests as well
>> ? ? ?as tools to format the flash and unpack a tar.gz
>> ? ? ?rootfs on it
>> ?(3) the actual rootfs of the devices as tar.gz
>> ? ? ?this includes a kernel and modules and this kernel
>> ? ? ?may be different from the kernel built in step 1
>>
>> So what we are doing currently is that we are running full independent
>> buildroot builds for each of the steps listed above and then build our
>> images from the results of those runs. That is we pick up the kernel
>> with initramfs from step 1, combine it with the ext rootfs that is
>> created in step 2 and add the rootfs.tar.gz from step 3.
>
> I am not sure to understand why (2) and (3) are separate things here.
> Can't you just build a single rootfs with all normal production
> applications and factory tests, and after the build simply copy the
> rootfs and remove factory tests from that copy ?

Let me try to explain the setup a little more, as it's a bit complicated.

These devices are able to boot from a USB-Stick formatted with a FAT
filesystem, and users must be able to create this boot media
themselfes, with whatever OS. They just copy a single file they
downloaded from the website to the stick, press a button on power-up
and the device will recover to it's factory defaults. This is
important for emergency de-bricking and - as it's the easiest solution
- also for factory tests at the production line.

These files start with an uImage that includes a minimal initramfs,
and U-Boot leeches this first part of it to memory and jumps to the
entry point. Unfortunately, the maximum size of that initramfs is
limited, and so we can't squeeze everything in there that we need.

Once this uImage is fully booted from its embedded initramfs, it
mounts the USB-Stick and loop-mounts the same single-file image (with
an offset) and finds another (ext3) filesystem at this offset. This FS
contains a number of scripts for factory testing, UBI tools, other
test files for audio and display tests and, after all, a .tar.gz
archive which contains the rootfs that is extracted to the UBI flash.
Of course, the content of this rootfs.tar.gz is also created by BR2.

We could probably create the initramfs from the final rootfs by
manually deleting tons of files, but that didn't seem more
maintainable after all.


Hope this explains our approach a little better.

Daniel
