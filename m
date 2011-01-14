From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 09:19:52 +0100
Subject: [Buildroot] rubix: pass target cflags
In-Reply-To: <BAY145-w120285E8572BD44A195EABC2F30@phx.gbl>
References: <BAY145-w120285E8572BD44A195EABC2F30@phx.gbl>
Message-ID: <20110114091952.154e11e6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

On Thu, 13 Jan 2011 21:21:59 -0700
Matt Johnson <mj1856@hotmail.com> wrote:

> -RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
> +RUBIX_MAKE_OPT = CC="$(TARGET_CC) $(TARGET_CFLAGS)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"

I was wondering why passing all those flags was necessary with an
autotools-based package.

And in fact, rubix is not autotools based. The ./configure script
contains:

=================================================================
#!/bin/sh

echo "Dummy configure script for autotools in buildroot"

exit 0
=================================================================

So I would prefer to see this package converted to the GENTARGETS
infrastructure. This should be relatively simple:

 * Remove RUBIX_INSTALL_STAGING, RUBIX_INSTALL_TARGET,
   RUBIX_INSTALL_TARGET_OPT, RUBIX_MAKE_OPT

 * Add the following lines

define RUBIX_BUILD_CMDS
	$(MAKE) 				\
	CC="$(TARGET_CC) $(TARGET_CFLAGS)" 	\
	XINC="-I$(STAGING_DIR)/usr/include/X11"	\
	XLIB="-L$(STAGING_DIR)/usr/lib -lX11"	\
	-C $(@D)
endef

define RUBIX_INSTALL_TARGET_CMDS
	$(MAKE) GAMESDIR=$(TARGET_DIR)/usr/games -C $(@D) install
endef

 * Replace AUTOTARGETS by GENTARGETS

And if you have time, it would be even better to switch to the upstream
version instead of this version on avr32linux.org. There is a new
version 1.0.6 available, that you can grab from
http://sed.free.fr/rubix/index.html.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
