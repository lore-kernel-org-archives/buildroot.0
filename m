From: vadim4j at gmail.com <vadim4j@gmail.com>
Date: Mon, 24 Feb 2020 23:14:27 +0200
Subject: [Buildroot] [PATCH 3/3] package/frr: new package
In-Reply-To: <20200224210601.4e3d9a3c@windsurf>
References: <20200224172652.30932-1-vadim4j@gmail.com>
 <20200224172652.30932-4-vadim4j@gmail.com>
 <20200224210601.4e3d9a3c@windsurf>
Message-ID: <20200224211427.GC34982@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 24, 2020 at 09:06:01PM +0100, Thomas Petazzoni wrote:
> Hello Vadim,
> 
> On Mon, 24 Feb 2020 19:26:52 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index e07236937b..ef6592afa0 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2480,6 +2480,7 @@ F:	package/brcm-patchram-plus/
> >  F:	package/gettext-tiny/
> >  F:	package/tinyssh/
> >  F:	package/rtrlib/
> > +F:	package/frr/
> 
> Alphabetic ordering is not good here.
OK

> 
> > diff --git a/package/frr/Config.in b/package/frr/Config.in
> > new file mode 100644
> > index 0000000000..01673eb837
> > --- /dev/null
> > +++ b/package/frr/Config.in
> > @@ -0,0 +1,23 @@
> > +config BR2_PACKAGE_FRR
> > +	bool "frr"
> > +	depends on BR2_USE_MMU # fork()
> > +	depends on BR2_PACKAGE_BASH # init
> > +	select BR2_PACKAGE_RTRLIB
> > +	select BR2_PACKAGE_READLINE
> > +	select BR2_PACKAGE_JSON_C
> > +	select BR2_PACKAGE_LIBYANG
> > +	select BR2_PACKAGE_LIBCAP
> > +	select BR2_PACKAGE_LIBNL
> > +	select BR2_PACKAGE_NCURSES
> > +	select BR2_PACKAGE_NETSNMP
> > +	select BR2_PACKAGE_C_ARES
> 
> That's a lot of packages that you select here, are you sure you
> properly propagated the "depends on" of all those packages in this
> Config.in ?
will try to check by disabling one by one.

> 
> For example, rtrlib depends on threads and SSP, so these need to be
> propagated here (of course, except if you get rid of the SSP dependency
> in rtrlib, as suggested in my review of PATCH 2/3).
> 
> > +	help
> > +	  The FRRouting Protocol Suite.
> > +
> > +	  FRR is free software that implements and manages various IPv4 and
> > +	  IPv6 routing protocols.
> > +
> > +	  https://frrouting.org
> > +
> > +comment "frr requires BASH for init service"
> > +	depends on !BR2_PACKAGE_BASH
> 
> So it's the frrinit.sh script that requires bash ?
Yes, this is runtime dependency.

> 
> This comment also need a BR2_USE_MMU dependency, so that it doesn't
> show up on noMMU systems.
> 
> > diff --git a/package/frr/S50frr b/package/frr/S50frr
> > new file mode 100644
> > index 0000000000..dec7d82a88
> > --- /dev/null
> > +++ b/package/frr/S50frr
> > @@ -0,0 +1,38 @@
> > +#!/bin/sh
> > +#
> > +# Starts frr.
> > +#
> > +
> > +start() {
> > +	printf "Starting frr: "
> > +	start-stop-daemon -S -q -b \
> > +		--exec /usr/sbin/frrinit.sh -- start
> > +	[ $? = 0 ] && echo "OK" || echo "FAIL"
> > +}
> > +stop() {
> > +	printf "Stopping frr: "
> > +	/usr/sbin/frrinit.sh stop
> > +	start-stop-daemon -K -q -p /run/frr.pid
> 
> This looks odd. Why do you need to call frrinit.sh stop and then use
> start-stop-daemon ?
Sorry, I thought to call 'frrinit.sh stop' to first stop all the daemons
executed by 'frrinit.sh start' and then stop the main daemon process.

> 
> Also, make sure to use package/busybox/S01sysklogd as a template for
> your init scripts.
OK

> 
> 
> > diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> > new file mode 100644
> > index 0000000000..c53e9bb4b0
> > --- /dev/null
> > +++ b/package/frr/frr.mk
> > @@ -0,0 +1,105 @@
> > +################################################################################
> > +#
> > +# frr
> > +#
> > +################################################################################
> > +
> > +FRR_VERSION = 7.3
> > +FRR_SOURCE = frr-$(FRR_VERSION).tar.gz
> > +FRR_SITE = https://github.com/FRRouting/frr/archive
> > +FRR_LICENSE = GPL-2.0
> > +FRR_LICENSE_FILES = COPYING
> > +
> > +FRR_DEPENDENCIES = rtrlib readline json-c libyang libcap libnl \
> > +		   ncurses host-frr c-ares
> 
> Only one tab to indent the second line.
> 
> > +
> > +HOST_FRR_DEPENDENCIES = host-flex host-bison host-python
> > +
> > +FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
> > +		--sysconfdir=/etc/frr \
> > +		--localstatedir=/var/run/frr \
> > +		--with-moduledir=/usr/lib/frr/modules \
> > +		--enable-configfile-mask=0640 \
> > +		--enable-logfile-mask=0640 \
> > +		--enable-multipath=256 \
> > +		--disable-ospfclient \
> > +		--enable-shell-access \
> > +		--enable-user=frr \
> > +		--enable-group=frr \
> > +		--enable-vty-group=frrvty \
> > +		--disable-exampledir \
> > +		--enable-rpki \
> > +		--enable-fpm
> 
> Ditto, only one tab to indent the continuation lines.
OK

> 
> > +
> > +HOST_FRR_CONF_OPTS = --enable-clippy-only
> > +
> > +define FRR_RUN_BOOTSTRAP
> > +	(cd $(@D) && PATH=$(BR_PATH) ./bootstrap.sh)
> > +endef
> > +FRR_PRE_CONFIGURE_HOOKS += FRR_RUN_BOOTSTRAP
> > +HOST_FRR_PRE_CONFIGURE_HOOKS += FRR_RUN_BOOTSTRAP
> 
> This won't work as you don't have any guarantee that host-autoconf and
> host-automake will be built before. Can you use FRR_AUTORECONF = YES,
> as this is really the best solution ? If not, you need to keep your
> hooks, but explicitly add host-autoconf and host-automake to the
> package dependencies.
Thanks, will check.

> 
> > +define HOST_FRR_INSTALL_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/lib/clippy $(HOST_DIR)/bin/clippy
> > +endef
> > +
> > +
> > +# for some reason the normal 'install' target fails
> 
> Why? Can it be fixed? At least reported to the upstream developers?
Ohhh, so, there is some miss-behave in case of cross-compilation that:
1) for some frr daemon installation uses -L/usr/lib

2) install tries to install binaries (apps & libs) to $(TARGET)/$(O)
path which is invalid.

So, I just gave up and tried to do a bit manual way. Would be great if
can suggest some generic hint with $(TARGET)$(O) issue.

> 
> > +FRR_INSTALL_TARGET_OPTS = DESTDIR="$(TARGET_DIR)" libdir="/usr/lib" \
> > +			  install-binPROGRAMS \
> > +			  install-sbinPROGRAMS \
> > +			  install-sbinSCRIPTS \
> > +			  installdirs
> 
> Only one tab to indent the continuation lines.
OK

> 
> > +
> > +define FRR_INSTALL_CONFIG_FILES
> > +	(cd $(@D) && PATH=$(BR_PATH) ./bootstrap.sh)
> 
> Calling bootstrap.sh during the installation? Why?
OK, might be some copy&paste issue.
> 
> > +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/log/frr
> > +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/run/frr
> 
> I'm not sure this is going to work well, as /var/log and /var/run are
> symlinks to /tmp by default, and a tmpfs is mounted to /tmp.
> 
> These directories need to be created at runtime.
So in case of systemd it can be handled by tmpfs file, but in
case of sysv is it OK to do it in init script ?

> 
> > +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/frr
> 
> Not needed, as the -D option to the $(INSTALL) commands above will
> create this folder.
> 
> > +	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/daemons $(TARGET_DIR)/etc/frr/daemons
> > +	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/daemons.conf $(TARGET_DIR)/etc/frr/daemons.conf
> > +	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/frr.conf $(TARGET_DIR)/etc/frr/frr.conf
> > +	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/vtysh.conf $(TARGET_DIR)/etc/frr/vtysh.conf
> > +	$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/support_bundle_commands.conf $(TARGET_DIR)/etc/frr/support_bundle_commands.conf
> 
> This probably calls for a for loop:
> 
> 	$(foreach f,daemons daemons.conf frr.conf vtysh.conf support_bundle_commands.conf,\
> 		$(INSTALL) -D -m 0644 $(@D)/tools/etc/frr/$(f) \
> 			$(TARGET_DIR)/etc/frr/$(f)
> 	)
Thanks, will use it.

> 
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/zebra.conf
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/bgpd.conf
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ospfd.conf
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ospf6d.conf
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/isisd.conf
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ripd.conf
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ripngd.conf
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/pimd.conf
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/ldpd.conf
> > +	$(INSTALL) -m 0644 /dev/null $(TARGET_DIR)/etc/frr/nhrpd.conf
> 
> Installing /dev/null ? Here is just creates an empty regular file. Does
> it really makes sense? What are you trying to do here ?
> 
Will check if these files are needed, I followed of build instructions
for several distros on frr docs site.

> > +endef
> > +FRR_POST_INSTALL_TARGET_HOOKS += FRR_INSTALL_CONFIG_FILES
> > +
> > +define FRR_PERMISSIONS
> > +	/var/log/frr d 755 frr frr - - - - -
> > +	/var/run/frr d 755 frr frr - - - - -
> 
> This is not going to work, as explained above.
> 
> > +	/etc/frr/zebra.conf f 644 frr frr - - - - -
> > +	/etc/frr/bgpd.conf f 644 frr frr - - - - -
> > +	/etc/frr/ospfd.conf f 644 frr frr - - - - -
> > +	/etc/frr/ospf6d.conf f 644 frr frr - - - - -
> > +	/etc/frr/isisd.conf f 644 frr frr - - - - -
> > +	/etc/frr/ripd.conf f 644 frr frr - - - - -
> > +	/etc/frr/ripngd.conf f 644 frr frr - - - - -
> > +	/etc/frr/pimd.conf f 644 frr frr - - - - -
> > +	/etc/frr/ldpd.conf f 644 frr frr - - - - -
> > +	/etc/frr/nhrpd.conf f 644 frr frr - - - - -
> 
> So all these empty files need to be writable ?
> 
> > +	/etc/frr/vtysh.conf f 644 frr frrvty - - - - -
> > +endef
> > +
> > +define FRR_USERS
> > +	frr -1 frr -1 * /var/run/frr - frrvty FRR user priv
> > +endef
> > +
> > +define FRR_INSTALL_INIT_SYSV
> > +	$(INSTALL) -D -m 755 $(FRR_PKGDIR)/S50frr \
> > +		$(TARGET_DIR)/etc/init.d/S50frr
> > +endef
> > +
> > +$(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
