From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:41:35 +0200
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <570EBAE6.1080000@mind.be>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570EBAE6.1080000@mind.be>
Message-ID: <20160413234135.6bf26795@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 23:32:22 +0200, Arnout Vandecappelle wrote:

>   I think that, like for initramfs, the infra has little to offer here. And it 
> is in fact in the way, because (as observed by Thomas) you'll want to add
> 
> rootfs-genimage: $(TARGETS_ROOTFS)
> 
> which leads to a circular dependency.
> 
>   So to make sure that it happens in the right order, I think you need something 
> like:
> 
> rootfs-genimage: $(TARGETS_ROOTFS) $(ROOTFS_GENIMAGE_DEPENDENCIES)
> 	$(RM) -r $(ROOTFS_GENIMAGE_TMP)
> 	$(HOST_DIR)/usr/bin/genimage \
> 		...
> 
> ifeq ($(BR2_TARGET_ROOTFS_GENIMAGE),y)
> 
> target-post-image: rootfs-genimage
> 
> # Make sure the genimage dependencies appear in graph-depends
> show-targets:
> 	@echo $(ROOTFS_GENIMAGE_DEPENDENCIES)

But then is it really something that belongs to fs/ ? It really isn't a
filesystem.

>   However, I'm afraid that we're moving a bit too fast after all. There are 
> several open issues still:
> 
> - Do post-image scripts come before or after genimage?
> - What with the dosfstools/mtools dependency?
> - Should we support genimage.cfg files that are generated from a post-image script?
> - Should we support several genimage.cfg files, producing several images (e.g. a 
> NAND and a SD image)?
> 
>   So, the current approach works well for the bundled defconfigs, but for real 
> use cases I think it's a bit too limited to be practical after all.

Do we need to support all real use cases? I think we should support the
common use cases, and the more complicated use cases can be handled via
a special post-image script. That's really the general philosophy of
Buildroot IMO: handle the most common cases nicely, and leave enough
extension scripts/hooks to allow people to plug their scripts to handle
the more complicated/specific cases.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
