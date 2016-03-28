From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Mar 2016 23:02:49 +0200
Subject: [Buildroot] [PATCH 3/9 v2] linux: meddle not in the affairs of
 filesystems, for you are tasty with bacon
In-Reply-To: <56F96E2C.9020606@gmail.com>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
 <9cef8c3fc419c6ef806d18184cf9e53c4c7323e6.1457721607.git.yann.morin.1998@free.fr>
 <56F96B80.6040706@gmail.com> <56F96E2C.9020606@gmail.com>
Message-ID: <20160328210249.GC3608@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-03-28 19:47 +0200, Romain Naour spake thusly:
> Le 28/03/2016 19:36, Romain Naour a ?crit :
> > Le 11/03/2016 19:41, Yann E. MORIN a ?crit :
> >> Currently, the rule to rebuild the Linux kernel with an initramfs
> >> directly depends on the filesystem image filename.
> >>
> >> This is inherently "bad" from a purity point of view. linux.mk should
> >> not have to delve into the fs internals.
> >>
> >> Rather, make it directly depend on the "frontal" rule that generates the
> >> cpio image.
> >>
> >> Drop the comment for linux-rebuild-with-initramfs, it was misleading
> >> (talking about generating "the initramfs list of files", which is not
> >> what was done, since we use a cpio as source of initramfs, not a list of
> >> files).
> >>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >> Cc: Arnout Vandecappelle <arnout@mind.be>
> >>
> >> ---
> >> Changes v1 -> v2:
> >>   - drop intermediate, unneeded stamp-file
> >>   - drop misleading comment
> >>
> >> ---
> >> This, too, will be useful for the initramfs patch coming next.
> >> ---
> >>  linux/linux.mk | 16 ++++++----------
> >>  1 file changed, 6 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/linux/linux.mk b/linux/linux.mk
> >> index ea90918..c0d760a 100644
> >> --- a/linux/linux.mk
> >> +++ b/linux/linux.mk
> >> @@ -438,11 +438,12 @@ endif # BR_BUILDING
> >>  $(eval $(kconfig-package))
> >>  
> >>  # Support for rebuilding the kernel after the cpio archive has
> >> -# been generated in $(BINARIES_DIR)/rootfs.cpio.
> >> -$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed
> >> -$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_images_installed
> >> -$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(BINARIES_DIR)/rootfs.cpio
> >> -$(LINUX_DIR)/.stamp_initramfs_rebuilt:
> >> +# been generated.
> >> +.PHONY: linux-rebuild-with-initramfs
> >> +linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_target_installed
> >> +linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_images_installed
> >> +linux-rebuild-with-initramfs: rootfs-cpio
> >> +linux-rebuild-with-initramfs:
> >>  	@$(call MESSAGE,"Rebuilding kernel with initramfs")
> >>  	# Build the kernel.
> >>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
> The issue can be fixed by using LINUX_DIR instead of @D.   ^^

Indeed. It is in my local branch, though. I wonder why it did not end up
in my tree, or why this patch does not have it... Weird...

Oh, I get it now... Damned. I should be more careful when I work on my
remote machine. So, because buildiong can take quite some time, I ssh
into a remote fast server for heavy builds. When there an issue, I
usually fix locally, then push the branch to the remote machine. Except,
I sometime forget that I'm remote, so I do the fixes remotely. And I can
forget to git-fetch those...

Damn...

Thanks! :-)

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> >> @@ -451,8 +452,3 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt:
> >>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> >>  	# If there is a .ub file copy it to the final destination
> >>  	test ! -f $(LINUX_IMAGE_PATH).ub || cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
> >> -	$(Q)touch $@
> > 
> > IIUC, the stamp file can be removed since the target is now PHONY, right ?
> > 
> > But latter in the patch 4/9 in the comment there is a reference to this file:
> > # Note: ordering of the dependencies is not guaranteed here, but in
> > # linux/linux.mk, via the .stamp_initramfs_rebuilt stamp file, which depends
> > # on the rootfs-cpio filesystem rule.
> > 
> >> -
> >> -# The initramfs building code must make sure this target gets called
> >> -# after it generated the initramfs list of files.
> >> -linux-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
> >>
> > 
> > Something is wrong...
> > With this patch applied, I have the following error when rebuilding the kernel
> > with initramfs:
> > 
> > make[2]: *** No rule to make target 'bzImage'. Arr?t.
> > linux/linux.mk:447: recipe for target 'linux-rebuild-with-initramfs' failed
> > 
> > Best regards,
> > Romain
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
