From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Dec 2012 23:33:18 +0100
Subject: [Buildroot] Creating/installing images
In-Reply-To: <CAKvQZ_37DWZxZZi5yUS3im0cdHCsDfAXKg=GChc-V8NHj6mCJQ@mail.gmail.com>
References: <CAKvQZ_37DWZxZZi5yUS3im0cdHCsDfAXKg=GChc-V8NHj6mCJQ@mail.gmail.com>
Message-ID: <20121212233318.33c7ba9d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Willy Lambert,

On Wed, 12 Dec 2012 22:28:10 +0100, Willy Lambert wrote:

> I was using for my embedded system a standard debian + a set of
> apt-get to get a customized OS on a 2GB on board persistent memory (so
> I have a working system, as kernel config for instance). But now I
> decided to dive into the wonderfull world of "linux from scratch" with
> the great help of busybox in order to :
> _ know exactly what's on my board
> _ reduce persistent size
> _ stop doing overkill with a 2GB system that can fit in 32Mb
> 
> So I have setup busybox and spent some days into documentation and
> sandbox, but I'm stuck with the target image installation. The
> documentation stops at this point and I'm alone in the dark. I spent 2
> days in searching docs on the internet without great success.
> 
> I have a successful qemu working to test the buildroot output, cause I
> don't need bootloader or proper image, just giving bzImage and
> rootfs.ext2 is enougth.
> 
> But as to create something that my embedded system can boot on .... I
> really don't know what and how to do. So I would be glad if anyone
> could help me, at least in giving links or keyword for documentation.
> 
> My target has an onboard flash memory. World would have been simplier
> if I could have a removable "root" memory but it's not the case. So If
> I'm correct I need to boot my target (either with an external boot
> device like usb key, or with the existing linux installed on it) and
> then replace the rootfs. What would you do in this case (knowing that
> it will happen often in the dev cycle) ?
> _ use a ram pivot_root from the current linux?
> _ use a dd from an external usb key boot ?
> _ re-partition all this to have a little 10Mb part for a "Tool OS"
> that can be used for rootfs installation ?
> _ do somethig else ?
> _ take a beer and think more ?

I would use the capacity of your board to boot over the network. Since
it is a x86 platform with a BIOS, I guess it is capable of doing PXE.
So during development, I would load the kernel using PXE, and then
mount the root filesystem over NFS.

Then, to flash the devices before they go in production in the field, I
would create a minimal Linux system, that you boot over the network
using PXE, and this Linux system downloads and flash the real Linux
system in the internal Flash of your system (which apparently is
accessed as a normal ATA hard drive). You make sure this minimal Linux
system makes all this process automatically when it is booted, so
whenever you boot one of your system on a network that has your
PXE/TFTP server on it, it will be erased and reflashed (of course, be
careful not to boot a real laptop or desktop system in the same network
segment, or it might boot over the network and get erased).

Does this helps?

For a simple PXE/TFTP server solution, I would strongly suggest using
ptftpd/pxed: <https://ssl.bulix.org/svn/ptftpd/trunk/>. It is very
simple to setup (just *one* command to have a complete PXE solution
running).

> For completness here is my board datasheet, but I don't expect anyone
> to read :-). It's an Advantech PCM-3362
> http://support.elmark.com.pl/advantech/pdf/pcm-3362man.pdf

I actually read it, and verified that your board is capable of booting
over the network, and it apparently is.

> Is it possible to use other filesystems, like ext3 or 4 ?

Yes, you just need to do some tuning of your ext2 image using tune2fs.
I really should submit a patch to add support for ext3 and ext4 image
generation in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
