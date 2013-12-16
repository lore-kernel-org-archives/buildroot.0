From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Mon, 16 Dec 2013 09:44:11 -0600
Subject: [Buildroot] [ PATCH v4 16/20] busybox: add option to install
 individual binaries
In-Reply-To: <52AA4069.3000707@mind.be>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
 <1386872840-22051-17-git-send-email-clshotwe@rockwellcollins.com>
 <52AA4069.3000707@mind.be>
Message-ID: <OFD1F6F732.D4FFDADA-ON86257C43.004FD9D8-86257C43.00566C17@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Arnout Vandecappelle <arnout@mind.be> wrote on 12/12/2013 05:02:01 PM:

>   That last sentence makes me think that we're missing a depends on 
> !BR2_PREFER_STATIC here.

Agreed. I'll add that in.

> > +
> >   config BR2_PACKAGE_BUSYBOX_WATCHDOG
> >      bool "Install the watchdog daemon startup script"
> >      help
> > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> > index f6f542e..13de7ed 100644
> > --- a/package/busybox/busybox.mk
> > +++ b/package/busybox/busybox.mk
> > @@ -50,10 +50,16 @@ ifndef BUSYBOX_CONFIG_FILE
> >      BUSYBOX_CONFIG_FILE = $(call 
qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
> >   endif
> >
> > +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> > +define BUSYBOX_PERMISSIONS
> > +/usr/share/udhcpc/default.script f 755  0 0 - - - - -
> 
>   Isn't setuid root needed anymore for /bin/login? Same for passwd, su, 
> probably others...

Good point. I'll look into adding support for that.

> > +endef
> > +else
> >   define BUSYBOX_PERMISSIONS
> >   /bin/busybox          f 4755   0 0 - - - - -
> >   /usr/share/udhcpc/default.script f 755  0 0 - - - - -
> >   endef
> > +endif
> >
> >   # If mdev will be used for device creation enable it and copy 
> S10mdev to /etc/init.d
> >   ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
> > @@ -152,6 +158,22 @@ define BUSYBOX_SET_INIT
> >   endef
> >   endif
> >
> > +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> > +define BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES
> > +   $(call KCONFIG_ENABLE_OPT,CONFIG_BUILD_LIBBUSYBOX,$
> (BUSYBOX_BUILD_CONFIG))
> > +   $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_INDIVIDUAL,$
> (BUSYBOX_BUILD_CONFIG))
> > +endef
> > +
> > +define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
> > +   for i in `find -L $(TARGET_DIR) -xtype l -samefile $
> (TARGET_DIR)/bin/busybox` ; do \
> > +      $(INSTALL) -D -m 0755 $(@D)/0_lib/`basename $$i` $$i ; \
> > +   done
> 
>   Icky, perhaps it's better to make an upstreamable patch that fixes the 

> Makefile so it properly installs the binaries if INDIVIDUAL_BINARIES is 

I'll see what I can do.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
