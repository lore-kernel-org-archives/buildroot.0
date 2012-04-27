From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Apr 2012 22:12:07 +0200
Subject: [Buildroot] [OT] How to get rootfs.cpio combined with a kernel?
In-Reply-To: <jn3vnk$go5$1@dough.gmane.org>
References: <jn3vnk$go5$1@dough.gmane.org>
Message-ID: <201204272212.07280.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 23 April 2012 18:24:20 Grant Edwards wrote:
> I've been browsing around Linux kernel Makefiles and docs, trying to
> figure out what the "pre-rootfs" file is and how to combine it with
> the rootfs to produce the uImage file.  There's plenty of info about
> how to specify or create an initramfs and the actual kernel startup
> works, but all I can find about how to actually link the kernel and
> initramfs together is "set CONFIG_INITRAMFS_SOURCE and do a kernel
> build".
> 
> Having to re-compile the kernel when nothing in the kernel or it's
> configuration has changed (only the rootfs changed) just doesn't feel
> like an acceptable engineering practice.
> 
> Any pointers to documentation on how one might combine a kernel object
> and a rootfs cpio image to get a uImage file?

 Short answer: the kernel build system doesn't support it.

 Long answer: the initramfs is compiled into one of the many builtin.o
files that are created all over the place.  This is linked into vmlinux.
See "Build vmlinux" in the top-level Makefile of the kernel.

 The good thing is that the command to build vmlinux is stored in
.vmlinux.cmd, so you can use that to re-run the link - but you'd have
to keep all the individual built-in.o files of course.  The bad
thing, however, is that this is not the end.  You probably want to
create a bzImage or similar, which is an additional, architecture-specific
linking step.


 Conclusion: unless you're willing to spend a lot of effort on this,
you're better off to either keep the compiled kernel tree for linking
with the rootfs, or using a separate kernel and rootfs image.  If you're
using U-Boot, you can even combine them in one uImage.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
