From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2020 22:32:46 +0100
Subject: [Buildroot] [PATCH 3/3] package/frr: new package
In-Reply-To: <20200224211427.GC34982@archlinux>
References: <20200224172652.30932-1-vadim4j@gmail.com>
 <20200224172652.30932-4-vadim4j@gmail.com>
 <20200224210601.4e3d9a3c@windsurf>
 <20200224211427.GC34982@archlinux>
Message-ID: <20200224223246.32aacd46@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Feb 2020 23:14:27 +0200
vadim4j at gmail.com wrote:

> > > diff --git a/package/frr/Config.in b/package/frr/Config.in
> > > new file mode 100644
> > > index 0000000000..01673eb837
> > > --- /dev/null
> > > +++ b/package/frr/Config.in
> > > @@ -0,0 +1,23 @@
> > > +config BR2_PACKAGE_FRR
> > > +	bool "frr"
> > > +	depends on BR2_USE_MMU # fork()
> > > +	depends on BR2_PACKAGE_BASH # init
> > > +	select BR2_PACKAGE_RTRLIB
> > > +	select BR2_PACKAGE_READLINE
> > > +	select BR2_PACKAGE_JSON_C
> > > +	select BR2_PACKAGE_LIBYANG
> > > +	select BR2_PACKAGE_LIBCAP
> > > +	select BR2_PACKAGE_LIBNL
> > > +	select BR2_PACKAGE_NCURSES
> > > +	select BR2_PACKAGE_NETSNMP
> > > +	select BR2_PACKAGE_C_ARES  
> > 
> > That's a lot of packages that you select here, are you sure you
> > properly propagated the "depends on" of all those packages in this
> > Config.in ?  
> will try to check by disabling one by one.

Huh? That's not what I'm asking here. I'm just asking that you look at
the definition of each of those options, and if any of them has some
"depends on" dependency, you need to replicate them into the frr
package Config.in file.

Of course, you have to ensure that all these packages are really useful
for you.

BTW: the list should be sorted alphabetically.

> > > +	help
> > > +	  The FRRouting Protocol Suite.
> > > +
> > > +	  FRR is free software that implements and manages various IPv4 and
> > > +	  IPv6 routing protocols.
> > > +
> > > +	  https://frrouting.org
> > > +
> > > +comment "frr requires BASH for init service"
> > > +	depends on !BR2_PACKAGE_BASH  
> > 
> > So it's the frrinit.sh script that requires bash ?  
> Yes, this is runtime dependency.

And using this script is important?


> > > +# for some reason the normal 'install' target fails  
> > 
> > Why? Can it be fixed? At least reported to the upstream developers?  
> Ohhh, so, there is some miss-behave in case of cross-compilation that:
> 1) for some frr daemon installation uses -L/usr/lib
> 
> 2) install tries to install binaries (apps & libs) to $(TARGET)/$(O)
> path which is invalid.
> 
> So, I just gave up and tried to do a bit manual way. Would be great if
> can suggest some generic hint with $(TARGET)$(O) issue.

Would need to reproduce the issue and investigate to provide some
hints, I'm not sure I'll have the time soon. Maybe someone else can
help here, and provide some suggestions ?


> > > +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/log/frr
> > > +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/run/frr  
> > 
> > I'm not sure this is going to work well, as /var/log and /var/run are
> > symlinks to /tmp by default, and a tmpfs is mounted to /tmp.
> > 
> > These directories need to be created at runtime.  
> So in case of systemd it can be handled by tmpfs file, but in
> case of sysv is it OK to do it in init script ?

Yes, it is OK.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
