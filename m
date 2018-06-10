From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Jun 2018 23:45:11 +0200
Subject: [Buildroot] Initramfs
In-Reply-To: <20180610071552.ym7c6xb4j3aa6vlh@sapphire.tkos.co.il>
References: <2C6957468785C14D8F47AB016E1D8F4B158FA7C2@hasmsx107.ger.corp.intel.com>
 <20180610071552.ym7c6xb4j3aa6vlh@sapphire.tkos.co.il>
Message-ID: <a03f82fc-c9c8-f6c5-12a9-288290e415fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-06-18 09:15, Baruch Siach wrote:
> Hi Gil,
> 
> On Sun, Jun 10, 2018 at 07:00:06AM +0000, Montag, Gil wrote:
>> I have few questions regarding the use of initramfs in my system:
>>
>> 1.       Please correct me if I'm wrong:
>>
>> -          When I enable the initramfs option, buildroot creates for me the 
>> same rootfs that was created before (e.g. ext2),  just instead of making it 
>> a file to be later unpacked into a storage device (e.g. rootfs.ext2) it will 
>> pack it  in a cpio archieve, and have the kernel build use it to build a 
>> kernel image that already contains it inside.

 To be precise, Buildroot creates a tarball out of output/target, and that
tarball is used to generate the different filesystems. So the initramfs is not
derived from the ext2, and it is created exactly the same independent of which
other filesystems you select.

>>
>> -          I don't need to enable ext2 file system anymore
> 
> Correct. Though usually initramfs is only used as a first stage filesystem. 
> Scripts running from initramfs locate the persistent storage and mount it. But 
> there are plenty of use cases of initramfs only setup.

 Well, actually, the initramfs created by Buildroot is not really suitable as a
first stage filesystem, it is really intended for an initramfs-only setup.

> 
>> 2.       If I want to add anything to the rootfs created this way, should I 
>> do it in the same way as I did before - e.g. with rootfs overlay?
> 
> Correct.
> 
>> 3.       Kernel image (bzImage in my case) is expected to grow bigger than 
>> it was before by the amount of the size of the rootfs.cpio.gz  file created 
>> in output/images
> 
> That depends on how you configured initramfs compression in your kernel. 
> Different compression algorithms give different compressed image sizes.

 To be precise: what gets linked into the kernel is the uncompressed
rootfs.cpio. So choosing a compression algorithm for the cpio rootfs has no
impact on the bzImage size. The initramfs is then compressed together with the
rest of the kernel (vmlinux) to create the bzImage. So it uses the same
compression mode as the kernel (CONFIG_KERNEL_GZIP, CONFIG_KERNEL_BZIP2, ...).

 The compression levels you select for the initrd (CONFIG_RD_GZIP,
CONFIG_RD_BZIP2, ...) are only relevant for an external initrd, not linked into
the kernel.

 Regards,
 Arnout

> 
> baruch
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
