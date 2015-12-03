From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 3 Dec 2015 22:06:27 +0100
Subject: [Buildroot] [PATCH v2] wiringpi: new package
In-Reply-To: <20151130221030.3f74feb7@free-electrons.com>
References: <1448400991-5011-1-git-send-email-ps.report@gmx.net>
 <20151130221030.3f74feb7@free-electrons.com>
Message-ID: <20151203220627.2e2468a9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 30 Nov 2015 22:10:30 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Peter Seiderer,
> 
> On Tue, 24 Nov 2015 22:36:31 +0100, Peter Seiderer wrote:
> 
> > diff --git a/package/Config.in b/package/Config.in
> > index bdc3063..9d273e7 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -438,6 +438,7 @@ endif
> >  	source "package/w_scan/Config.in"
> >  	source "package/wf111/Config.in"
> >  	source "package/wipe/Config.in"
> > +	source "package/wiringpi/Config.in"
> 
> Isn't wiringpi mainly a library ? Maybe it should go under Libraries ->
> Hardware handling.

O.k., will fix it...

> 
> > +diff --git a/devLib/Makefile b/devLib/Makefile
> > +index 0fb0033..f956abe 100644
> > +--- a/devLib/Makefile
> > ++++ b/devLib/Makefile
> > +@@ -37,7 +37,7 @@ DYNAMIC=libwiringPiDev.so.$(VERSION)
> > + #DEBUG	= -g -O0
> > + DEBUG	= -O2
> > + CC	= gcc
> > +-INCLUDE	= -I.
> > ++INCLUDE	= -I$(DESTDIR)$(PREFIX)/wiringPi  -I$(DESTDIR)$(PREFIX)/devLib
> > + DEFS	= -D_GNU_SOURCE
> > + CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
> > + 
> > +diff --git a/gpio/Makefile b/gpio/Makefile
> > +index 7dcd090..f5b588a 100644
> > +--- a/gpio/Makefile
> > ++++ b/gpio/Makefile
> > +@@ -33,7 +33,7 @@ endif
> > + #DEBUG	= -g -O0
> > + DEBUG	= -O2
> > + CC	= gcc
> > +-INCLUDE	= -I$(DESTDIR)$(PREFIX)/include
> > ++INCLUDE	= -I$(DESTDIR)$(PREFIX)/wiringPi  -I$(DESTDIR)$(PREFIX)/devLib
> 
> This patch is not correct I believe. It makes the assumption that
> wiringPi is already installed in $(DESTDIR)$(PREFIX), which it is not
> when you are building it.

Intention was to set DESTDIR/PREFIX values to the build directory to avoid
the install step before linking gpio (as the original build script does)...

> 
> > diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
> > new file mode 100644
> > index 0000000..258bb25
> > --- /dev/null
> > +++ b/package/wiringpi/wiringpi.mk
> > @@ -0,0 +1,29 @@
> 
> Missing comment header.

O.k., will fix (should have marked this patch as early draft ;-) )
> 
> > +WIRINGPI_VERSION = 2.29
> > +WIRINGPI_SITE = git://git.drogon.net/wiringPi
> > +WIRINGPI_INSTALL_STAGING = YES
> 
> Missing license + license file information.

O.k., will fix...

> 
> > +
> > +define WIRINGPI_BUILD_CMDS
> > +	$(MAKE) -C $(@D)/wiringPi CC=$(TARGET_CC)
> 
> It would be a lot better to use $(TARGET_CONFIGURE_OPTS), and
> $(TARGET_MAKE_ENV), i.e:
> 
> 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/wiringPi
> 
> the CC=$(TARGET_CC) is already part of TARGET_CONFIGURE_OPTS. Also you

Did not work, because the original Makefile used 'CC=gcc' which is only
overridden by command line options, not by environment variables...

> will probably have to adjust the Makefile to turn CFLAGS = into CFLAGS
> +=.
> 
> > +	$(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.so.2.29 $(STAGING_DIR)/usr/lib/libwiringPi.so.2.29
> > +	ln -sf $(STAGING_DIR)/usr/lib/libwiringPi.so.2.29 $(STAGING_DIR)/usr/lib/libwiringPi.so
> 
> Why are you doing installation within the <pkg>_BUILDS_CMDS ? This is not good ?

Because I tried to not patch the original build system which assumes:

 - build wiringPi, install wiringPi
 - build devLib, install devLib
 - build gpio, install gpio

But will complete rework my patch...

> 
> > +	$(MAKE) -C $(@D)/devLib CC=$(TARGET_CC) PREFIX=$(@D) DESTDIR=
> 
> Why is DESTDIR= needed here ?
> 
> > +	$(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.so.2.29 $(STAGING_DIR)/usr/lib/libwiringPiDev.so.2.29
> > +	ln -sf $(STAGING_DIR)/usr/lib/libwiringPiDev.so.2.29 $(STAGING_DIR)/usr/lib/libwiringPiDev.so
> 
> Ditto installation.

Will be changed in next version...

> 
> > +	$(MAKE) -C $(@D)/gpio CC=$(TARGET_CC) PREFIX=$(@D) DESTDIR=
> > +endef
> > +
> > +define WIRINGPI_INSTALL_STAGING_CMDS
> > +	$(INSTALL) -D -m 0644 $(@D)/wiringPi/*.h $(STAGING_DIR)/usr/include
> > +	$(INSTALL) -D -m 0644 $(@D)/devLib/*.h $(STAGING_DIR)/usr/include
> 
> This is not good because $(INSTALL) -D expect a full destination path.
> I guess the easiest is just:

O.k, will fix...

> 
> 	cp -dpfr $(@D)/wiringPi/*.h $(STAGING_DIR)/usr/include
> 
> > +define WIRINGPI_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.so* $(TARGET_DIR)/usr/lib
> > +	ln -sf libwiringPi.so.2.29  $(TARGET_DIR)/usr/lib/libwiringPi.so
> > +	$(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.so* $(TARGET_DIR)/usr/lib
> > +	ln -sf libwiringPiDev.so.2.29 $(TARGET_DIR)/usr/lib/libwiringPiDev.so
> > +	$(INSTALL) -D -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin
> > +	$(INSTALL) -D -m 0755 $(@D)/gpio/pintest $(TARGET_DIR)/usr/bin
> 
> Same comments here: $(INSTALL) -D requires a full destination path.
> Otherwise, if $(TARGET_DIR)/usr/bin doesn't exist as a directory, you
> will have you "pintest" program installed as "bin" in $(TARGET_DIR)/usr.
> 
> Moreover, the upstream project has some "install" and "install-static"
> targets. You should use them instead of doing manual installation.
> 
O.k., will be in the next version...

> Finally, if you're installing unconditionally shared libraries, then it
> means that they are always being built. So your package should depend
> on !BR2_STATIC_LIBS.
> 
> Can you fix those comments and send an updated version ?

Yes, will do...

Thanks for review...

Regards,
Peter

> 
> Thanks!
> 
> Thomas
