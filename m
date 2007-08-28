From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 28 Aug 2007 23:19:42 +0200
Subject: [Buildroot] rxvt-package for all x11-versions
In-Reply-To: <f90898420708280735q1852713eh4a6c1846fc8d827d@mail.gmail.com>
References: <f90898420708280735q1852713eh4a6c1846fc8d827d@mail.gmail.com>
Message-ID: <20070828211941.GB11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 28, 2007 at 04:35:48PM +0200, Simon Pasch wrote:
>This is my attempt to realize a rxvt-version for xorg, tinyx and the new x11r7.
>I tested it with xorg and x11r7. (Don't know if it works with tinyx,
>because the tinyx-build fails)
>
>By the way...Is the file rxvt_2.6.4-10.diff needed anymore?!
>
>diff -Naur buildroot/package/rxvt.old/Config.in buildroot/package/rxvt/Config.in
>--- buildroot/package/rxvt.old/Config.in	2007-08-28 09:15:23.000000000 +0200
>+++ buildroot/package/rxvt/Config.in	2007-08-28 15:19:17.000000000 +0200
>@@ -1,10 +1,8 @@
> config BR2_PACKAGE_RXVT
> 	bool "rxvt"
> 	default n
>-	depends BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx
>-
>+	depends BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx ||
>BR2_PACKAGE_XSERVER_x11r7
> 	help
> 	  A nice small colour vt102 X terminal emulator.
>-	  Does not build for X11R7 yet.
>
> 	  http://www.rxvt.org/
>diff -Naur buildroot/package/rxvt.old/rxvt.mk buildroot/package/rxvt/rxvt.mk
>--- buildroot/package/rxvt.old/rxvt.mk	2007-08-28 09:15:23.000000000 +0200
>+++ buildroot/package/rxvt/rxvt.mk	2007-08-28 16:17:30.000000000 +0200
>@@ -27,6 +27,18 @@
> RXVT_DIR:=$(BUILD_DIR)/rxvt-$(RXVT_VERSION)
> RXVT_BINARY:=$(RXVT_DIR)/src/rxvt
>
>+ifeq ($(strip $(BR2_PACKAGE_XSERVER_xorg)),y)
>+RXVT_PREFIX:=/usr/X11R6
>+endif
>+
>+ifeq ($(strip $(BR2_PACKAGE_XSERVER_tinyx)),y)
>+RXVT_PREFIX:=/usr/X11R6
>+endif
>+
>+ifeq ($(strip $(BR2_PACKAGE_XSERVER_x11r7)),y)
>+RXVT_PREFIX:=/usr
>+endif
>+
> $(DL_DIR)/$(RXVT_SOURCE):
> 	 $(WGET) -P $(DL_DIR) $(RXVT_SITE)/$(RXVT_SOURCE)
>
>@@ -46,11 +58,11 @@
> 		--target=$(GNU_TARGET_NAME) \
> 		--host=$(GNU_TARGET_NAME) \
> 		--build=$(GNU_HOST_NAME) \
>-		--prefix=/usr/X11R6 \
>+		--prefix=$(RXVT_PREFIX) \

Given that the filesystem standard nowadays seem to mandate that all X11
apps should go into /usr, it would be way better to add one central
config BR2_X11_PREFIX
	string "/usr/X11R6" if BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx
	string "/usr" if !BR2_PACKAGE_XSERVER_xorg && !BR2_PACKAGE_XSERVER_tinyx
in package/Makefile.in, below the XSERVER settings.
Peronally i don't like that new convention to put the X11 bloat^Wstuff
into /usr, but that is not relevant here.

Please update accordingly and resend. TIA,
