From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Oct 2015 13:35:18 +0100
Subject: [Buildroot] [PATCH] fs/ext2: add options for extra space and
 extra inodes
In-Reply-To: <56334E0A.6010407@mind.be>
References: <1446073576-20337-1-git-send-email-yann.morin.1998@free.fr>
 <56334E0A.6010407@mind.be>
Message-ID: <20151030123518.GA3713@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-10-30 12:01 +0100, Arnout Vandecappelle spake thusly:
> On 29-10-15 00:06, Yann E. MORIN wrote:
> > Add two options to the ext2 filesystem, one to add extra free space, one
> > to add extra free inodes.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> >  fs/ext2/Config.in       | 20 ++++++++++++++++++--
> >  fs/ext2/ext2.mk         |  2 ++
> >  package/mke2img/mke2img |  8 +++++++-
> >  3 files changed, 27 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> > index 5b1cd0c..fb06cdd 100644
> > --- a/fs/ext2/Config.in
> > +++ b/fs/ext2/Config.in
> > @@ -45,13 +45,29 @@ config BR2_TARGET_ROOTFS_EXT2_LABEL
> >  	string "filesystem label"
> >  
> >  config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> > -	int "size in blocks (leave at 0 for auto calculation)"
> > +	int "exact size in blocks (leave at 0 for auto calculation)"
> >  	default 0
> >  
> >  config BR2_TARGET_ROOTFS_EXT2_INODES
> > -	int "inodes (leave at 0 for auto calculation)"
> > +	int "exact number of inodes (leave at 0 for auto calculation)"
> >  	default 0
> >  
> > +config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
> > +	int "extra size in blocks" if BR2_TARGET_ROOTFS_EXT2_BLOCKS = 0
> > +	default 0
> > +	help
> > +	  Enter here the nmuber of extra blocks of free space you
> > +	  want on your filesystem. By default, Buildroot will not
> > +	  leave much space free.
> 
>  To be precise, buildroot will add 500 extra blocks for ext2 and 1800 extra
> blocks for ext3+. So perhaps we could encode that here, and remove it from the
> mke2img script?

I don't want to do that, because the extra blocks and inodes that
Buildroot adds are just to account for the extra space required to
store the filesystem metadata.

If we were to encode those here in the kconfig option, nothing would
prevent the user from setting this to a value lower than strictly
required.

In Kconfig, we can provide a range, but no a lower (or upper) bound to a
value. And we do not want to limit the user in the values he may want to
set here (even to an insanely large value for the upper bound.

I would really prefer we hide this internal complex computation from the
user, and let him specify the extra space he actually wants.

> > +config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
> > +	int "extra inodes" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
> > +	default 0
> > +	help
> > +	  Enter here the nmuber of extra free inodes you want on
> > +	  your filesystem. By default, Buildroot will not leave
> > +	  many free inodes.
> 
>  Same here, 400 inodes are added.

Ditto.

> >  config BR2_TARGET_ROOTFS_EXT2_RESBLKS
> >  	int "reserved blocks percentage"
> >  	default 0
> > diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> > index cab66a5..7417f81 100644
> > --- a/fs/ext2/ext2.mk
> > +++ b/fs/ext2/ext2.mk
> > @@ -9,10 +9,12 @@ EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
> >  ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
> >  EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
> >  endif
> > +EXT2_OPTS += -B $(BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS)
> 
>  Perhaps this could be put into the else of the ifneq? Or better yet, make it an
> ifeq.

Well, the fact that the prompt has a condition before it is displayed
will ensure that BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS/INODES is always
set to a non-empty value, so we can safely use it. If the user specified
the exact size/inodes, then the extra size/indoes will be set to 0.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
