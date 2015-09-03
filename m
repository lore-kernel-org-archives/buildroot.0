From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 3 Sep 2015 15:00:49 -0700
Subject: [Buildroot] [bug] bootwrapper runs before linking initrd
Message-ID: <55E8C311.6000404@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a BR config that includes the following:
BR2_LINUX_KERNEL=y
BR2_TARGET_ROOTFS_INITRAMFS=y
BR2_TARGET_BOOT_WRAPPER_AARCH64=y

I expect that Buildroot will:

 1. build the kernel
 2. build rootfs.cpio
 3. link rootfs.cpio into the kernel as an initrd
 4. run boot-wrapper-aarch64 on the kernel+initrd

When I do a build, however, I can clearly see that step 4 happens before 
step 3. In fact, "Rebuilding kernel with initramfs" is the very last 
step of the build. "boot-wrapper-aarch64 Installing to images directory" 
happened much earlier.

(Side note: the error is far more catastrophic than a simple "couldn't 
find root filesystem" panic; it looks like big chunks of the kernel's 
data section are zeroed, so that kernel messages aren't even logged, to 
say nothing of no serial output. I don't know why this is.)

A workaround is to remember to manually "make 
boot-wrapper-aarch64-rebuild" after a regular build has completed.

What's the real solution? Thanks!

-- 
Hollis Blanchard
Mentor Graphics Emulation Division
