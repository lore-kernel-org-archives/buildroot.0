From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jul 2016 10:03:43 +0200
Subject: [Buildroot] [PATCH 21/24 v2] system/systemd: needs timezone
In-Reply-To: <84e8315f-bf11-4cc8-6bf9-3c03ef1273f1@gmail.com>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <92c59faf9f5eeba1856b1897d30f4f8b2b57460d.1466622379.git.yann.morin.1998@free.fr>
 <84e8315f-bf11-4cc8-6bf9-3c03ef1273f1@gmail.com>
Message-ID: <20160705080343.GE6533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-03 13:41 +0200, Romain Naour spake thusly:
> Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> > systemd does not like being booted without any timezone info (especially
> > on a R/O filesystem), so we forcibly enable that. If there is no default
> > timezone set, we fallback to UTC (which is basically what no TZ means
> > anyway).
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/skeleton-systemd/skeleton-systemd.mk | 7 +++++++
> >  system/Config.in                             | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/package/skeleton-systemd/skeleton-systemd.mk b/package/skeleton-systemd/skeleton-systemd.mk
> > index e781ce9..b45bbde 100644
> > --- a/package/skeleton-systemd/skeleton-systemd.mk
> > +++ b/package/skeleton-systemd/skeleton-systemd.mk
> > @@ -31,12 +31,19 @@ SKELETON_SYSTEMD_TARGET_FINALIZE_HOOKS += SKELETON_SYSTEMD_SET_NETWORK
> >  
> >  endif # BR2_PACKAGE_SYSTEMD_NETWORKD not set
> >  
> > +SKELETON_SYSTEM_LOCALTIME = $(call qstrip,$(BR2_TARGET_LOCALTIME))
>                  ^
> > +ifeq ($(SKELETON_SYSTEM_LOCALTIME),)
>                          ^
> > +SKELETON_SYSTEM_LOCALTIME = Etc/UTC
>                  ^
> > +endif
> > +
> 
> s/SKELETON_SYSTEM_LOCALTIME/SKELETON_SYSTEMD_LOCALTIME/

Fixed.

Regards,
Yann E. MORIN.

> >  define SKELETON_SYSTEMD_INSTALL_TARGET_CMDS
> >  	mkdir -p $(TARGET_DIR)/etc
> >  	mkdir -p $(TARGET_DIR)/home
> >  	mkdir -p $(TARGET_DIR)/srv
> >  	mkdir -p $(TARGET_DIR)/var
> >  	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
> > +	ln -sf ../usr/share/zoneinfo/$(SKELETON_SYSTEMD_LOCALTIME) \
> 
> This one is ok :)
> 
> Best regards,
> Romain
> 
> 
> > +		$(TARGET_DIR)/etc/localtime
> >  	$(SKELETON_SYSTEMD_RSYNC_NETWORK)
> >  endef
> >  
> > diff --git a/system/Config.in b/system/Config.in
> > index 17ce832..07af2e0 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -130,6 +130,7 @@ config BR2_INIT_SYSTEMD
> >  	select BR2_ROOTFS_MERGED_USR
> >  	select BR2_PACKAGE_SYSTEMD
> >  	select BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
> > +	select BR2_TARGET_TZ_INFO
> >  
> >  comment "systemd needs (e)glibc toolchain, headers >= 3.10"
> >  	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
