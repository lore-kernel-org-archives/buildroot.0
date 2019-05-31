From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 31 May 2019 13:35:49 -0700
Subject: [Buildroot] [PATCH v4] package/dosfstools: introduce custom
 install routine
In-Reply-To: <20190531200625.GB3407@scaer>
References: <20190531194159.2566-1-mmayer@broadcom.com>
 <20190531200625.GB3407@scaer>
Message-ID: <CAGt4E5v_jOJrTdPTRbkyuQEEDGA6AyFfZN4jH+g=a_=eK8PSfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 May 2019 at 13:06, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Markus, All,
>
> On 2019-05-31 12:41 -0700, Markus Mayer spake thusly:
> > We can't use dosfstools' install target, because it'll install *all*
> > binaries, even the disabled ones. Also, we can't just delete dosfstools
> > binaries from the target directory after installing them, because other
> > packages (specifically Busybox) may provide tools of the same name, and
>
> If busybox installs applets also installed by dosfstools, then we also
> want to expand the exsiting list to also cover dosfstools:
>     https://git.buildroot.org/buildroot/tree/package/busybox/busybox.mk#n24
>
> Can you send a (separate) patch doing so?

Will do.

> As for "other packages", which one do you refer to? We want to ensure
> that those other packages and dosfstools do not compete to install their
> files, so we want to guarantee the ordering between those, so we need an
> explicit dependency too.

I think busybox is the only other package. Maybe my wording was a bit
too general.

> However, I checked in Ubtuntu 19.04, and all the files referenced in
> this patch ({mkfs,fsck).{fat,vfat,msdos} or mkdosfs or dosfsck) are only
> provided by dosfstools. I also could not readily identify a package in
> Buildroot that could provide them either...

We have:

$ grep DOS build/busybox-1.30.1/.config
CONFIG_DOS2UNIX=y
CONFIG_UNIX2DOS=y
CONFIG_MKDOSFS=y

That results in:

[...]
-rwxr-xr-x 1 mmayer mmayer  58088 May 31 12:37 fsck.fat
lrwxrwxrwx 1 mmayer mmayer      8 May 31 12:37 fsck.vfat -> fsck.fat
lrwxrwxrwx 1 mmayer mmayer      8 May 31 12:37 fsck.msdos -> fsck.fat
lrwxrwxrwx 1 mmayer mmayer      8 May 31 12:37 dosfsck -> fsck.fat
lrwxrwxrwx 1 mmayer mmayer     14 May 31 13:32 mkdosfs -> ../bin/busybox
lrwxrwxrwx 1 mmayer mmayer     14 May 31 13:32 mkfs.vfat -> ../bin/busybox

fsck.fat comes from dosfstools, but mkdosfs is provided by busybox.

Regards,
-Markus

> Regards,
> Yann E. MORIN.
>
> > we may end up deleting those instead.
> >
> > To avoid any issues, we create our own install routines, which only
> > copy the enabled binaries into the target location.
> >
> > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> > ---
> > Changes since v3:
> > - use $(INSTALL) -D -m 0755 $(@D)/src ...
> > - don't use post-install hooks
> > - instead call install macros from custom install target
> >
> > Changes since v2:
> > - use custom install routine that only copies the binaries we want
> >
> > Changes since v1:
> > - don't bother removing man page files
> > - use rsync instead of tar to copy files to the destination
> >
> >  package/dosfstools/dosfstools.mk | 34 +++++++++++++++++++++-----------
> >  1 file changed, 22 insertions(+), 12 deletions(-)
> >
> > diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
> > index 6eb0851d0e23..cf2233e5819b 100644
> > --- a/package/dosfstools/dosfstools.mk
> > +++ b/package/dosfstools/dosfstools.mk
> > @@ -24,26 +24,36 @@ DOSFSTOOLS_CONF_OPTS += LIBS="-liconv"
> >  DOSFSTOOLS_DEPENDENCIES += libiconv
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),)
> > -define DOSFSTOOLS_REMOVE_FATLABEL
> > -     rm -f $(addprefix $(TARGET_DIR)/sbin/,dosfslabel fatlabel)
> > +ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FATLABEL),y)
> > +define DOSFSTOOLS_INSTALL_FATLABEL
> > +     $(INSTALL) -D -m 0755 $(@D)/src/fatlabel $(TARGET_DIR)/sbin
> > +     ln -sf fatlabel $(TARGET_DIR)/sbin/dosfslabel
> >  endef
> > -DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FATLABEL
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),)
> > -define DOSFSTOOLS_REMOVE_FSCK_FAT
> > -     rm -f $(addprefix $(TARGET_DIR)/sbin/,fsck.fat dosfsck fsck.msdos fsck.vfat)
> > +ifeq ($(BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT),y)
> > +define DOSFSTOOLS_INSTALL_FSCK_FAT
> > +     $(INSTALL) -D -m 0755 $(@D)/src/fsck.fat $(TARGET_DIR)/sbin
> > +     ln -sf fsck.fat $(TARGET_DIR)/sbin/fsck.vfat
> > +     ln -sf fsck.fat $(TARGET_DIR)/sbin/fsck.msdos
> > +     ln -sf fsck.fat $(TARGET_DIR)/sbin/dosfsck
> >  endef
> > -DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_FSCK_FAT
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),)
> > -define DOSFSTOOLS_REMOVE_MKFS_FAT
> > -     rm -f $(addprefix $(TARGET_DIR)/sbin/,mkfs.fat mkdosfs mkfs.msdos mkfs.vfat)
> > +ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT),y)
> > +define DOSFSTOOLS_INSTALL_MKFS_FAT
> > +     $(INSTALL) -D -m 0755 $(@D)/src/mkfs.fat $(TARGET_DIR)/sbin
> > +     ln -sf mkfs.fat $(TARGET_DIR)/sbin/mkdosfs
> > +     ln -sf mkfs.fat $(TARGET_DIR)/sbin/mkfs.msdos
> > +     ln -sf mkfs.fat $(TARGET_DIR)/sbin/mkfs.vfat
> >  endef
> > -DOSFSTOOLS_POST_INSTALL_TARGET_HOOKS += DOSFSTOOLS_REMOVE_MKFS_FAT
> >  endif
> >
> > +define DOSFSTOOLS_INSTALL_TARGET_CMDS
> > +     $(call DOSFSTOOLS_INSTALL_FATLABEL)
> > +     $(call DOSFSTOOLS_INSTALL_FSCK_FAT)
> > +     $(call DOSFSTOOLS_INSTALL_MKFS_FAT)
> > +endef
> > +
> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
