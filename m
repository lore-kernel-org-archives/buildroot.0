From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 8 Apr 2011 10:00:51 +0200
Subject: [Buildroot] Booting with ramdisk
In-Reply-To: <8739m8mfn0.fsf@macbook.be.48ers.dk>
References: <201103211546.22271.dargaud@lpsc.in2p3.fr>
	<8739m8mfn0.fsf@macbook.be.48ers.dk>
Message-ID: <201104081000.52071.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 27 March 2011 23:12:51 Peter Korsgaard wrote:
> >>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:
> Hi,
> 
>  Guillaume> Now I want to embed that OS in the kernel (no need for a
>  Guillaume> network anymore as the kernel is on a flash mem). So I did
>  Guillaume> the following: - add ROOTFS CPIO to the buildroot options
>  Guillaume> and make a new version - point CONFIG_INITRAMFS_SOURCE to
>  Guillaume> the resulting rootfs.cpio file
> 
> That sounds correct. If you build your kernel in buildroot we even have
> initramfs option that handles it all, but the above should afaik work
> as well.
> 
>  Guillaume> - change the kernel parameters to "console=ttyUL0,115200
> root=/dev/ram" (that's in a dts file)
> 
> That shouldn't be needed.

OK, I've tried with the same kernel params, only adding
CONFIG_INITRAMFS_SOURCE="/home/dargaud/Devel/buildroot-2010.11/output/images/rootfs.cpio"
And it won't run just the same.

>  Guillaume> The kernel stops instantly without even a blip on the
>  Guillaume> console. A debugger reveals that it stops at 0x401718... I
>  Guillaume> have no idea what's going on at this stage.
> 
> Strange. What architecture/system is this? How much did the (compressed)
> kernel grow? Perhaps it's too big / you'll need to load it higher. For
> most archs, the kernel want to decompress into address 0, so if you load
> it too low, you might end up overwriting the compressed kernel as you're
> decompressing it.
> 
> Perhaps you could add some debugging prints to the bootloader handover /
> kernel decompression?

The original kernel elf file is 1.4 Mb and it grows to 2.5 Mb with the ramdisk, which seems about right considering the 
compression.
It's a PowerPC architecture and the kernel gets loaded at 0x400000
I don't know how to change the loading address or how to look at the uncompressed size in memory, how can I see if this 
is the right track ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
