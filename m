From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Sep 2015 10:54:09 +0200
Subject: [Buildroot] [bug] bootwrapper runs before linking initrd
In-Reply-To: <55E8C311.6000404@mentor.com>
References: <55E8C311.6000404@mentor.com>
Message-ID: <20150904105409.53804439@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis,

On Thu, 3 Sep 2015 15:00:49 -0700, Hollis Blanchard wrote:
> I have a BR config that includes the following:
> BR2_LINUX_KERNEL=y
> BR2_TARGET_ROOTFS_INITRAMFS=y
> BR2_TARGET_BOOT_WRAPPER_AARCH64=y

Yes, this is not working right now.

> I expect that Buildroot will:
> 
>  1. build the kernel
>  2. build rootfs.cpio
>  3. link rootfs.cpio into the kernel as an initrd
>  4. run boot-wrapper-aarch64 on the kernel+initrd
> 
> When I do a build, however, I can clearly see that step 4 happens before 
> step 3. In fact, "Rebuilding kernel with initramfs" is the very last 
> step of the build. "boot-wrapper-aarch64 Installing to images directory" 
> happened much earlier.
> 
> (Side note: the error is far more catastrophic than a simple "couldn't 
> find root filesystem" panic; it looks like big chunks of the kernel's 
> data section are zeroed, so that kernel messages aren't even logged, to 
> say nothing of no serial output. I don't know why this is.)
> 
> A workaround is to remember to manually "make 
> boot-wrapper-aarch64-rebuild" after a regular build has completed.
> 
> What's the real solution? Thanks!

See http://lists.busybox.net/pipermail/buildroot/2014-July/101052.html
for a possible solution. I remember we discussed this patch during the
Buildroot Summer camp, but I thought we had sent some comments for
Jeremy to improve the patch. But it seems it wasn't done. Arnout, do
you remember the conclusion of our discussion?

I must say I'm not thrilled by making such major changes to Buildroot
just for the sake of this very specific use-case. But we probably don't
have much choice.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
