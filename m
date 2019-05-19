From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Sun, 19 May 2019 10:32:27 +0200
Subject: [Buildroot] [PATCH v2 06/13] package/skeleton-init-openrc: add
 support to remount rootfs as rw
In-Reply-To: <20190518232240.4f92819f@windsurf>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
 <20190512195550.24457-6-michal.lyszczek@bofc.pl>
 <20190518232240.4f92819f@windsurf>
Message-ID: <20190519083227.5ixpwxbnv7hhmp4w@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas
On 2019-05-18 23:22:40, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 12 May 2019 21:55:43 +0200
> Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:
> 
> > diff --git a/package/skeleton-init-openrc/skeleton-init-sysv.mk b/package/skeleton-init-openrc/skeleton-init-sysv.mk
> > index 5ee2192093..bbe80071ae 100644
> > --- a/package/skeleton-init-openrc/skeleton-init-sysv.mk
> > +++ b/package/skeleton-init-openrc/skeleton-init-sysv.mk
> > @@ -15,8 +15,23 @@ SKELETON_INIT_OPENRC_DEPENDENCIES = skeleton-init-common
> >  
> >  SKELETON_INIT_OPENRC_PROVIDES = skeleton
> >  
> > +ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
> > +# Comment /dev/root entry in fstab. When openrc does not find fstab entry for
> > +# "/", it will try to remount "/" as "rw".
> > +define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
> > +	$(SED) '/^ *\/dev\/root.*$$/s~^~#~' $(TARGET_DIR)/etc/fstab
> > +endef
> > +else
> > +# Uncomment /dev/root entry in fstab which has "ro" option so openrc notices
> > +# it and doesn't remount root to rw.
> > +define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
> > +	$(SED) '/^# *\/dev\/root.*$$/s~^#\+~~' $(TARGET_DIR)/etc/fstab
> > +endef
> > +endif # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
> 
> Why are you handling the ro/rw rootfs topic from skeleton-init-sysv.mk,
> but the getty topic is handled from openrc.mk (in PATCH 04/13). It
> doesn't seem very consistent.

I just followed already established rules here (based on systemd package).
BR2_TARGET_GENERIC_GETTY is in systemd.mk, and
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is in skeleton-init-systemd.mk
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190519/c8b8a8b6/attachment.asc>
