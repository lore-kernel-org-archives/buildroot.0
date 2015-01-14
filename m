From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 11:08:06 +0100
Subject: [Buildroot] image size reduction
In-Reply-To: <79A788F82B01BC478629DC5CC23739B00275374B@IRVEXCHMB15.corp.ad.broadcom.com>
References: <79A788F82B01BC478629DC5CC23739B00275374B@IRVEXCHMB15.corp.ad.broadcom.com>
Message-ID: <20150114110806.36e883b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ravi Chhabra,

On Tue, 13 Jan 2015 17:54:11 +0000, Ravi Chhabra wrote:

> I am trying to boot linux on quad core Aarch64 system with only 8MB
> on chip RAM which I plan to use for storage and loading the image.

Great to see people using Buildroot to bring up AArch64 systems!

> I intend to shrink the size of image file by reducing all possible
> components and simplifying the build. I am using latest buildroot
> 14.11 release with ulibc option, no application and minimal busybox
> options which brought the root filesystem (unzipped cpio) size down
> to ~3MB which is still quite big.

Well, 3 MB is generally considered quite small for a Linux root
filesystem. Here is what I could propose to further reduce the size:

 * Tune the Busybox configuration, to reduce the size of the Busybox
   binary. Run 'make busybox-menuconfig', and disable all applets you
   don't use.

 * Enable BR2_STATIC_LIBS=y (was named BR2_PREFER_STATIC_LIB=y). This
   way, Busybox will be linked statically, and you won't have any C
   library on your target.

However, I'm a bit surprised: how do you have uClibc support for
AArch64 ? Or are you building an ARMv7 root filesystem ?

> I would be interested to reduce the size of kernel as well and
> further reduce the size of filesystem to reduce the size of image
> (axf file)

Well, for the kernel, just adjust your kernel configuration and remove
stuff, I believe it's quite obvious.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
