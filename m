From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Sep 2015 21:52:50 +0200
Subject: [Buildroot] [bug] bootwrapper runs before linking initrd
In-Reply-To: <20150904105409.53804439@free-electrons.com>
References: <55E8C311.6000404@mentor.com>
 <20150904105409.53804439@free-electrons.com>
Message-ID: <55E9F692.8040501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Adding Jeremy Kerr in CC - he's the author of
http://patchwork.ozlabs.org/patch/366549/ ]

On 04-09-15 10:54, Thomas Petazzoni wrote:
> Hollis,
> 
> On Thu, 3 Sep 2015 15:00:49 -0700, Hollis Blanchard wrote:
>> I have a BR config that includes the following:
>> BR2_LINUX_KERNEL=y
>> BR2_TARGET_ROOTFS_INITRAMFS=y
>> BR2_TARGET_BOOT_WRAPPER_AARCH64=y
> 
> Yes, this is not working right now.
[snip]
>> What's the real solution? Thanks!
> 
> See http://lists.busybox.net/pipermail/buildroot/2014-July/101052.html
> for a possible solution. I remember we discussed this patch during the
> Buildroot Summer camp, but I thought we had sent some comments for
> Jeremy to improve the patch. But it seems it wasn't done. Arnout, do
> you remember the conclusion of our discussion?

 I did send it:

http://lists.busybox.net/pipermail/buildroot/2015-July/132686.html

(mailmain/pipermail threading sucks)

 TL;DR:

 It was a long discussion, mainly because it doesn't really solve the problem
(which BTW is mainly in the approach we take for linux-with-initramfs - that's
just a huge hack).

 That said, we basically agree with the approach. So if you're stilling willing
to do it, please post a full series including the change to
boot-wrapper-aarch64, taking into account the comments below. We've marked this
patch as Changes Requested in patchwork.


 _However_, I may have an idea for an alternative approach that confines the
hack to boot-wrapper-aarch64 itself. The following may work:

boot-wrapper-aarch64-rebuild-with-initramfs: linux-rebuild-with-initramfs
	$(TARGET_MAKE_ENV) $(MAKE) -C $(BOOT_WRAPPER_AARCH64_SRCDIR)
	cp $(BOOT_WRAPPER_AARCH64_SRCDIR)/linux-system.axf $(BINARIES_DIR)

ROOTFS_INITRAMFS_POST_TARGETS += boot-wrapper-aarch64-rebuild-with-initramfs


I.e., rerun the build and install commands as part of the rootfs-initramfs build
step. Note that no conditions are needed, since this target will anyway only
come into play when rootfs-initramfs is built.

 Can someone give that a try and post a patch?

 Regards,
 Arnout

> 
> I must say I'm not thrilled by making such major changes to Buildroot
> just for the sake of this very specific use-case. But we probably don't
> have much choice.
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
