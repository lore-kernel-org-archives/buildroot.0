From: daggs <daggs@gmx.com>
Date: Mon, 25 Jul 2016 19:55:33 +0200
Subject: [Buildroot] [PATCH 1/3 v4] odroid-scripts: New Package.
In-Reply-To: <20160724221455.144fc50d@free-electrons.com>
References: <20160724163506.20024-1-daggs@gmx.com>,
 <20160724221455.144fc50d@free-electrons.com>
Message-ID: <trinity-e4c6f188-35cc-4f82-8463-4dd747d2ddbc-1469469333153@3capp-mailcom-bs03>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hello,
> 
> On Sun, 24 Jul 2016 19:35:04 +0300, Dagg Stompler wrote:
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> 
> Thanks, I've applied with a few minor changes, see below.
> 
> > diff --git a/package/Config.in b/package/Config.in
> > index 72c0be3..4529371 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1690,6 +1690,7 @@ menu "System tools"
> >  	source "package/ncdu/Config.in"
> >  	source "package/numactl/Config.in"
> >  	source "package/nut/Config.in"
> > +	source "package/odroid-scripts/Config.in"
> 
> I've moved to "Hardware handling" instead of "System tools".

it was placed originally in Hardware handling, not sure how it ended up at System tools.

> 
> > diff --git a/package/odroid-scripts/odroid-scripts.mk b/package/odroid-scripts/odroid-scripts.mk
> > new file mode 100644
> > index 0000000..34a4501
> > --- /dev/null
> > +++ b/package/odroid-scripts/odroid-scripts.mk
> > @@ -0,0 +1,32 @@
> > +################################################################################
> > +#
> > +# odroid-scripts
> > +#
> > +################################################################################
> > +
> > +ODROID_SCRIPTS_VERSION = a252de04562dcf8d8a4918a544b45a9e3d46d2fb
> > +ODROID_SCRIPTS_SITE = $(call github,mdrjr,c2_bootini,$(ODROID_SCRIPTS_VERSION))
> > +ODROID_SCRIPTS_LICENSE = unclear
> > +
> > +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> > +	define ODROID_SCRIPTS_INSTALL_UDEV_RULES
> 
> We typically do not indent such lines.
> 
> > +		$(INSTALL) -D -m 0644 $(@D)/10-odroid.rules $(TARGET_DIR)/etc/udev/rules.d/10-odroid.rules
> 
> I've split this line.
> 
> > +	endef
> > +endif
> > +
> > +define ODROID_SCRIPTS_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/c2_init.sh $(TARGET_DIR)/usr/sbin/odroidc2_init_fb.sh
> > +	$(ODROID_SCRIPTS_INSTALL_UDEV_RULES)
> > +endef
> > +
> > +define ODROID_SCRIPTS_INSTALL_INIT_SYSTEMD
> > +	$(INSTALL) -D -m 0644 $(@D)/amlogic.service $(TARGET_DIR)/usr/lib/systemd/system/odroidc2_fb.service
> > +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > +	ln -fs ../../../../usr/lib/systemd/system/odroidc2_fb.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/odroidc2_fb.service
> 
> Those long lines as well.
> 
> > +endef
> > +
> > +define ODROID_SCRIPTS_INSTALL_INIT_SYSV
> > +	$(INSTALL) -D -m 0755 package/odroid-scripts/S50odroidc2_fb $(TARGET_DIR)/etc/init.d/S50odroidc2_fb
> 
> And this one as well.
> 
> Thanks!
> 
> Thomas

ok, thanks for the help.

Dagg.
