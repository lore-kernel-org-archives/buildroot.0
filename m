From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 07 Feb 2014 10:15:15 +0100
Subject: [Buildroot] Antw: Re: Why can't I see any effects by different
 rootfs compression methods ??
In-Reply-To: <52F495EA020000460004A4C6@gwia2.rz.hs-offenburg.de>
References: <52F361B10200004600049F5D@gwia2.rz.hs-offenburg.de>
 <52F3C228.2080002@mind.be>
 <52F495EA020000460004A4C6@gwia2.rz.hs-offenburg.de>
Message-ID: <52F4A423.1060102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Frank,

 [Please don't top-post, but reply in-line and prune the message to the
relevant parts.]

On 07/02/14 08:14, Frank Ihle wrote:
> Thanks for the response, that gave me a better view.
> 
> But now i got a question which may sound a bit confusing: what can I do
> with these compressed archives (like rootfs.cpio.lzo) ? I always thought
> I can only create bootable Images with an Initramfs/initrd ? Because when
> I put the (e.g) rootfs.cpio as /Initramfs source file(s)/ in /make
> linux-menuconfig/ then i got a working image in the end, but if i put
> rootfs.cpio.lzo then he skips the .lzo ending and uses the rootfs.cpio
> again (I guess that's nothing new to you).

 An initrd/initramfs is normally passed by the bootloader to the kernel
as part of the boot arguments. On your PC, for instance, you'll see in /boot:

initrd.img-3.12-1-amd64
vmlinuz-3.12-1-amd64

 As an extra option, the kernel has the feature that you can link the
initramfs directly into the kernel - which has the advantage that you
only need to manage a single image instead of two. But the initramfs
linked into the kernel is not really the normal use case (although I'll
admit buildroot users use it quite often, because it's a convenient way
to make sure kernel and rootfs are in sync).

> 
> so then I'm not sure why the rootfs can be compressed if it only can be
> used on host, or is it there so it can be mount e.g. in userspace ?

 You can't mount it, but you can unpack it: it's a simple cpio image. In
fact, what the kernel does at boot time is exactly that: it creates a
tmpfs as root (the equivalent of "mount -t tmpfs root /"), then unpacks
the image into it ("lzop -d <img> | cpio -i").


> 
> The other question is: about the "double" compression you mentioned.
> Someone told me these two compression modes are independent from each
> other, 

 They are independent in the sense that you can configure them
independently. However, they are also cumulative: the initramfs is linked
into the vmlinux ELF binary, which is subsequently compressed into a
self-extractor. If you look carefully at the output of the kernel build,
you can see it from the order in which things are done:

GEN     usr/initramfs_data.cpio.gz
LINK    vmlinux
LD      arch/x86/boot/compressed/vmlinux


> unfortunately i can't open those u/zImages to look what's right
> now. Anyway, if you want to have a fast booting linux, can't some
> combination of these 2 compression mode lead to a quicker startup?.

 I expect an uncompressed initramfs inside a lzo or lz4 kernel will be
the fastest. The most important thing, however, is to keep things as
small as possible - 10% size reduction has about the same boot time
impact as a two times faster decompression algorithm.

 If your rootfs is a bit larger, it's probably best to move it to a
squashfs or something similar, because the kernel can often access
storage media much faster than the boot loader.

 Regards,
 Arnout

> 
> Thanks a lot for your help!
> 
> Kind Regards,
> 
> Frank
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
