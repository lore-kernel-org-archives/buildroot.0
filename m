From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Mar 2013 23:51:54 +0100
Subject: [Buildroot] [PATCH 4/6] fs/ext2: use the ext2 variant to name
	the generated rootfs image
In-Reply-To: <20130310145501.7e5dec1f@skate>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <1d86b1b76a2c56aaf0098ec389e570862e7aa3fb.1362693453.git.yann.morin.1998@free.fr>
 <20130310145501.7e5dec1f@skate>
Message-ID: <201303122351.55358.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 10 March 2013 Thomas Petazzoni wrote:
> On Thu,  7 Mar 2013 23:04:41 +0100, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  fs/ext2/ext2.mk |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> > index 1660d9c..57acad7 100644
> > --- a/fs/ext2/ext2.mk
> > +++ b/fs/ext2/ext2.mk
> > @@ -29,4 +29,4 @@ define ROOTFS_EXT2_CMD
> >  	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
> >  endef
> >  
> > -$(eval $(call ROOTFS_TARGET,ext2))
> > +$(eval $(call ROOTFS_TARGET,ext2,ext$(BR2_TARGET_ROOTFS_EXT2_GEN)))
> 
> It is not a very strong opinion here, but I'm not sure I like this idea
> of the file extension being dependent on BR2_TARGET_ROOTFS_EXT2_GEN.
> 
> I think I would have preferred something that renames the filesystem
> to:
> 
> $(eval $(call ROOTFS_TARGET,ext))
> 
> which generates a rootfs.ext image, with a compatibility symbolic link
> ext2 -> ext. This can for example be done in a
> ROOTFS_EXT_POST_GEN_HOOKS.

The problem I see with renaming the file system is that the FS infra uses
the name of the filesystem to see if it is enabled by way of:

    fs/common.mk:
    79  ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
    80  TARGETS += rootfs-$(1)
    81  endif

where:
  - $(1) is the name of the FS as supplied to ROOTFS_TARGET
  - $(2) is the uppercase of $(1)

So, if we rename ext2 -> ext, we'd have to also rename BR2_TARGET_ROOTFS_EXT2
to BR2_TARGET_ROOTFS_EXT which was duly refused by Peter and Arnout:
    http://lists.busybox.net/pipermail/buildroot/2013-February/067587.html

    <Peter>
    Arnout's first comment was about the defconfigs /
    BR2_TARGET_ROOTFS_EXT{2,} change, which we both dislike
    </Peter>

However, Peter and Arnout expressed there interest in renaming the FS:
    <Peter>
    the 2nd was about the fs/ renames which should be transparent to
    the user.
    </Peter>

Unfortunately, it is not transparent, as it implies a rename of the kconfig
symbol, which in turn would imply fixing the defconfigs, and the boards
documentation.

True, I've reverted the whole rename without explanations. I forgot to
mention that in the series' introductory email.

So, what next? I see four options:

 0- don't rename anything, continue calling it .ext2 (although it may be
    ext2, ext3 or ext4): status-quo;
 1- only rename the fs directory, which *is* transparent
      - fs/ext2                 ->  fs/ext
 2- completely rename the filesystem:
      - fs/ext2                 ->  fs/ext
      - BR2_TARGET_ROOTFS_EXT2  ->  BR2_TARGET_ROOTFS_EXT
    but do not fix the defconfigs and boards doc. Anyway, add a deprecated
    symbol for BR2_TARGET_ROOTFS_EXT2.
 3- same as 3, but also fix defconfigs and boards doc.

For all those four options, we can add a post-fs-hook that symlinks the
image file with the correct extension.

Finally, the curent proposal (allow to specify the FS extension) is not
incompatible with any of the above four options.

So, up to you guys. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
