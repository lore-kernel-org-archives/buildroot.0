From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Aug 2020 09:28:33 +0200
Subject: [Buildroot] Unable to bake in an initramfs filesystem into
 kernel image
In-Reply-To: <CAG+zT3rM=eaW6oykBgiVdPd4fnZF=efbgBok6Q8WCy2QQ2EnDw@mail.gmail.com>
References: <CAG+zT3rM=eaW6oykBgiVdPd4fnZF=efbgBok6Q8WCy2QQ2EnDw@mail.gmail.com>
Message-ID: <313ae7e3-1817-e633-acc3-6d7097f99ffc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jeff,

On 23/08/2020 19:43, Jeff Tchang wrote:
> I'm using an older buildroot version (2016.02) and was wondering if there

 We don't typically "support" (which is anyway voluntary) such old versions...
Maybe try with 2020.02.x or master.

> was an issue building an embedded initramfs filesystem into the kernel
> image.
> 
> I am able to build an image and boot from it but I get
> 
> [    0.000000] Initrd not found or empty - disabling initrd
> 
> in the kernel log. This leads to me to believe that my image does not have
> any initramfs root filesystem in it. I run mkimage to verify and it looks
> like it doesn't:
> 
> # mkimage -l output/images/uImage.lzma
> 
> Image Name:   Linux-3.10.14
> 
> Created:      Sun Aug 23 16:22:20 2020
> 
> Image Type:   MIPS Linux Kernel Image (lzma compressed)

 The initramfs is not stored as a multipart image. It's an object file that has
a very large string value that is linked into the kernel ELF file itself. The
only reasonable way to check if it's there is looking at the size...

> Data Size:    2488545 Bytes = 2430.22 kB = 2.37 MB

 ... and that looks a bit small. It's possible, but not likely. How large is the
cpio image after compressing with lzma?

> 
> Load Address: 80010000
> 
> Entry Point:  80467a30
> 
> 
> My expectation here is that I would see multiple images.
> 
> I did a make linux-dirclean and make again after tweaking a few things and
> still got roughly the same output. My defconfig is here:
> https://gist.github.com/tachang/136da666e5cf650e14be7bbca0069465
> 
> I do see output that says
> 
>>>>   Rebuilding kernel with initramfs
> 
> 
> so not sure what is going on here. Do I need to pass in a kernel command
> line to make sure the kernel reads the initramfs from the one baked in?

 Nope, it should automatically do that. However, it is possible that the
embedded initramfs is ignored if your bootloader provides one, so make sure the
initramfs argument of uboot's boot command is not set.


 I've taken a quick look at the history since 2016.10 and I didn't find anything
that would fix such an issue.

 That said, we don't have a runtime test of this feature, so it might even be
broken...


 You could try with a separate cpio image instead of an embedded one and see if
that works better.


> I am using busybox as the /init file. I have tried specifying the directory
> where I have the initramfs root, manually cpio'ing it up and passing that
> file, and also just telling buildroot to embed the rootfs into the image.
> 
> Kernel boot log is also in the Github gist.


 Regards,
 Arnout
