From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Feb 2013 18:33:22 +0100
Subject: [Buildroot] [PATCH 2/4] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <512323E4.7000901@mind.be>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <1a995bdbc65141cf4e8a540c41cb56f4a43fba5f.1361142401.git.yann.morin.1998@free.fr>
 <512323E4.7000901@mind.be>
Message-ID: <201302191833.23535.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Tuesday 19 February 2013 Arnout Vandecappelle wrote:
>   Great feature addition!

:-)

> On 18/02/13 00:10, Yann E. MORIN wrote:
[--SNIP--]
> >   config BR2_TARGET_ROOTFS_EXT2
> > -	bool "ext2 root filesystem"
> > +	bool "ext2/3/4 root filesystem"
> >   	help
> > -	  Build an ext2 root filesystem
> > +	  Build an ext2/3/4 root filesystem
> >
> >   if BR2_TARGET_ROOTFS_EXT2
> >
> > +choice
> > +	bool "ext generation"
> 
>   Given the way it appears in menuconfig, I think this will be hard to 
> understand for many users. Perhaps "ext generation (ext2, ext3 or ext4)".

OK, will look at it.

> > +	default BR2_TARGET_ROOTFS_EXT2_2
> 
>   Although this matches the current default, doesn't it make more sense 
> to "bump" to ext4?

No. There are stuff that does have to be ext2 (mostly because of dumb
bootloaders that can't read ext3/4).

> > +
> > +config BR2_TARGET_ROOTFS_EXT2_2
> > +	bool "ext2"
> > +
> > +config BR2_TARGET_ROOTFS_EXT2_3
> > +	bool "ext3"
> > +	select BR2_PACKAGE_HOST_E2FSPROGS
> 
>   We don't usually select the host package. On the other hand, the 
> support for user-selectable host packages is pretty recent, so we don't 
> have a real tradition for this.

OK, so only depend on e2fsprogs from the .mk, then.

[--SNIP--]
> > -ROOTFS_EXT2_DEPENDENCIES = host-genext2fs
> > +ROOTFS_EXT2_DEPENDENCIES = host-genext2fs $(if $(BR2_PACKAGE_HOST_E2FSPROGS),host-e2fsprogs)
> 
>   Although this is correct, I think it looks confusing. I prefer a more 
> explicit
> 
> ifeq ($(BR2_TARGET_ROOTFS_EXT2_3)$(BR2_TARGET_ROOTFS_EXT2_4),y)
> ROOTFS_EXT2_DEPENDENCIES += host-e2fsprogs
> endif

OK.

> >   define ROOTFS_EXT2_CMD
> > -	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
> > +	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) -$(BR2_TARGET_ROOTFS_EXT2_GEN) $@
> 
>   Minor nit: I would prefer
> EXT2_OPTS += -$(BR2_TARGET_ROOTFS_EXT2_GEN)

Right.

> > diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
> > index 7a518ae..fcbd43c 100755
> > --- a/fs/ext2/genext2fs.sh
> > +++ b/fs/ext2/genext2fs.sh
[--SNIP--]
> > @@ -30,7 +33,48 @@ then
> >       # we scale inodes / blocks with 10% to compensate for bitmaps size + slack
> >       BLOCKS=$(du -s -c -k $TARGET_DIR | grep total | sed -e "s/total//")
> >       BLOCKS=$(expr 500 + \( $BLOCKS + $INODES / 8 \) \* 11 / 10)
> > +    # we add 1081 blocks (a bit more than 1 MiB, assuming 1KiB blocks) for
> > +    # the journal if ext3/4
> 
>   Is this based on anything? Could you add something like "This allows 
> filesystems up to 4GiB"?

I've "bisected" the number of blocks required to add a journal, and
1081 was the strict minimum. 1080 blocks, and tune2fs would yell.

This is a purely test-and-check process with two different ext2
filesystems, one ~10 MiBs, another 128MiB.

YMMV, as they use to say! ;-)

> > +    if [ ${GEN} -ge 3 ]; then
> > +        BLOCKS=$(expr 1081 + $BLOCKS )
> > +    fi
> >       set -- $@ -b $BLOCKS
> >   fi
> >
> > -exec genext2fs $@
> > +# Remove -{2,3,4} from the arguments, they are not recognised
> > +# by genext2fs and we handle them manually later
> 
>   Wouldn't it be a lot simpler to pass the generation through the 
> environment instead?

I'd like to avoid 'scanning' .config if possible.
But I'll see what to do about it.

> > +first=1
> > +for o; do
> > +    case "${o}" in
> > +	-2|-3|-4)  ;;
> > +	*)  if [ ${first} -eq 1 ]; then
> > +		set --
> > +		first=0
> > +	    fi
> > +	    set -- "$@" "${o}"
> > +            ;;
> > +    esac
> > +done
> > +
> > +# Generate the base ext2 file system
> > +genext2fs "$@"
> > +
> > +# Upgrade to ext3 if needed
> > +if [ ${GEN} -ge 3 ]; then
> > +    tune2fs -j -J size=1 "${IMG}" >/dev/null
> 
>   Ah, this is where the 1081 blocks come from.  There should be a comment 
> pointing to that 1081 so it's easier to find this back if it is ever 
> changed to a different value.

OK.

>   Why does it have to be >/dev/null? We don't usually do that...

I usually >/dev/null to only see errors, as I don't give a dime about
the output when all goes well. I'll strip it off before I resend.

>   In the script I used, I also added -c 0 (max mount count) and -i 0 
> (interval between checks).  That's not for this patch of course, but I 
> think it's something useful to have in general.

Well, I'd rather leave that for a post-image script. I think it is highly
context-specific whether you want time- or count-based checks, or not.

But that's trivial enough to add, so I'll give it a whirl.

> > +fi
> > +
> > +# Upgrade to ext4 if needed
> > +if [ ${GEN} -ge 4 ]; then
> > +    tune2fs -O extents,uninit_bg,dir_index "${IMG}" >/dev/null
> > +    ret=0
> > +    fsck.ext4 -pDf "${IMG}" >/dev/null || ret=$?
> 
>   This fsck is needed for ext3 as well, just to set rev0 -> rev1. Of 
> course, patch 4/4 does that already.

No, because *this* patch does not set rev1, and fsck is not needed
after adding a journal. It's needed only when setting rev1, or upgrading
to ext4.

>   You should add a comment why fsck is needed.

I'll do.

>   I would use e2fsck rather than fsck.ext4, but that's a minor thing.

Well, does e2fsck behave properly when called e2fsck, and not through
its symlinks mkfs.extX ?

I'll check that.

> > +    # Exit codes 1 & 2 are OK, it means fs errors
> > +    # were successfully corrected
> > +    case ${ret} in
> > +	0|1|2) ;;
> > +	*)   exit 1;;
> > +    esac
> > +    # fsck.ext4 will force a UUID, which we do not want
> > +    tune2fs -U clear "${IMG}" >/dev/null
> 
>   Why don't we want a UUID? We have it for other filesystems, e.g. ubifs...

Reproducible builds. The UUID added by e2fsck is random, so one can not
reproduce the same images.

Explicitly adding a UUID can then be done in a post-image hook, but is
context-specific.

Thanks for the review. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
