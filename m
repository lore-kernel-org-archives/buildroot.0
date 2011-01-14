From: Matt Johnson <mj1856@hotmail.com>
Date: Fri, 14 Jan 2011 08:38:50 -0700
Subject: [Buildroot] rubix: pass target cflags
In-Reply-To: <20110114091952.154e11e6@surf>
References: <BAY145-w120285E8572BD44A195EABC2F30@phx.gbl>
	<20110114091952.154e11e6@surf>
Message-ID: <BAY145-ds18F6699FB60DB2F1D8D62AC2F30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

To be honest, I didn't really even examine it that much.  I'm doing testing
on an armv4t device under the CodeSourcery toolchain, which requires the
-march=armvt from CFLAGS.

Rubix seemed like an easy test for a native X app, so when it failed with
illegal instruction errors, I traced it to the missing cflags in the
makefile.

I'll work on the changes you suggest, but the easy fix does work for now, so
IMHO it should be merged in.

Thanks,
Matt

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of Thomas Petazzoni
Sent: Friday, January 14, 2011 1:20 AM
To: buildroot at busybox.net
Subject: Re: [Buildroot] rubix: pass target cflags

Matt,

On Thu, 13 Jan 2011 21:21:59 -0700
Matt Johnson <mj1856@hotmail.com> wrote:

> -RUBIX_MAKE_OPT = CC="$(TARGET_CC)"
XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib
-lX11"
> +RUBIX_MAKE_OPT = CC="$(TARGET_CC) $(TARGET_CFLAGS)"
XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib
-lX11"

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
	$(MAKE) GAMESDIR=$(TARGET_DIR)/usr/games -C $(@D) install endef

 * Replace AUTOTARGETS by GENTARGETS

And if you have time, it would be even better to switch to the upstream
version instead of this version on avr32linux.org. There is a new version
1.0.6 available, that you can grab from http://sed.free.fr/rubix/index.html.

Thanks!

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting,
training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
