From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Aug 2017 00:29:44 +0200
Subject: [Buildroot] Kernel with *AND* without initrd
In-Reply-To: <CAGt4E5scWEvH+k3OOA5QG9koLLc=9T9nfDkEYoC-gwK5s_y86w@mail.gmail.com>
References: <CAGt4E5scWEvH+k3OOA5QG9koLLc=9T9nfDkEYoC-gwK5s_y86w@mail.gmail.com>
Message-ID: <33ec2a92-1f1f-ba47-1602-f6ecf0d9a511@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-08-17 17:29, Markus Mayer wrote:
> Hi all,
> 
> Our home-grown rootfs build system (which we are looking to replace
> with buildroot) has a feature that is quite helpful to developers: it
> generates a kernel with embedded initrd and one without during the
> same build process. (The rootfs is also generated in multiple
> formats.)

 I think this would indeed be a nice feature to have in Buildroot, and not too
difficult at that. LINUX_BUILD_CMDS (or LINUX_PRE_BUILD_HOOKS) would need to
remove and create an empty rootfs.cpio. LINUX_INSTALL_IMAGES_CMDS (or
LINUX_POST_INSTALL_IMAGES_HOOKS) would need to make copy of the kernel image
without rootfs to e.g. $(LINUX_IMAGE_NAME).norootfs. And the
linux-rebuild-with-initramfs would work as normal.

 It would be nicer if linux-rebuild-with-initramfs would instead install to
$(LINUX_IMAGE_NAME).rootfs, but for backward-compatibility reasons we can't
change that any more.

> 
> It does the initrd/non-initrd build by building the initrd kernel,
> then setting CONFIG_INITRAMFS_SOURCE="" and re-building the kernel.

 Oh yeah, that's even better! Then it can all be contained in the
linux-rebuild-with-initramfs target.

 Patches are welcome!

 Regards,
 Arnout

> This is very quick, since almost nothing has to actually be rebuilt.
> 
> There was a patch accepted into the Linux kernel a couple of months
> ago to fix this build method after an unrelated commit broke it. The
> commit message also explains a bit more about our build system.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57ddfdaa9a72fe726a44d26d99db31bc137dbeff
> 
> Is there a way to do something similar with buildroot? As far as I can
> tell, it's very easy to generate the rootfs in multiple different
> formats, but the kernel is built only once. If "initrd" is enabled, it
> will have the RAM disk embedded. Otherwise it won't. And you can't get
> the respective other one.
> 
> Did I miss anything? If not, is there a recommended way of adding this
> functionality? I am sure other developers would find this interesting,
> as well.
> 
> Thanks,
> -Markus
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
