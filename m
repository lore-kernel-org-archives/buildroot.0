From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Feb 2014 08:51:27 +0100
Subject: [Buildroot] [PATCH 1/1] Qt4: adapt for X11
In-Reply-To: <1391178307-32431-1-git-send-email-cedric.chepied@openwide.fr>
References: <1391178307-32431-1-git-send-email-cedric.chepied@openwide.fr>
Message-ID: <20140201085127.1b31ac20@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric Ch?pied,

Great! X11 support in qt4 is definitely something nice to have!

On Fri, 31 Jan 2014 15:25:07 +0100, C?dric Ch?pied wrote:

> +config BR2_PACKAGE_QT_X11
> +	bool "X server support"

This should probably "depends on BR2_PACKAGE_XORG7", and it should
select all the X.org libraries that this option depends on (fontconfig
xlib_libXi xlib_libX11 xlib_libXrender xlib_libXcursor xlib_libXinerama
xlib_libXrandr xlib_libXext xlib_libXv).

> +	default n

Not needed, that's the default.

> +	help
> +	  Build Qt with X11 support

Also, there is already a choice of possible graphics backend in
Config.gfx.in. But I understand that there is actually a two-level
choice:

 * The normal Qt, for X11 support
 * The embedded Qt, for framebuffer, VNC, DirectFB, PowerVR support

Many we should reflect this choice in the Config.in menu.

> +
>  config BR2_PACKAGE_QT_DEBUG
>  	bool "Compile with debug support"
>  	help
> @@ -96,6 +102,7 @@ config BR2_PACKAGE_QT_GUI_MODULE
>  	  video output, or you don't require Qt GUI, say n.
>  
>  if BR2_PACKAGE_QT_GUI_MODULE
> +if !BR2_PACKAGE_QT_X11

And if we have the "choice" I described above, make this a positive if
rather than the negative one you have now.

>  menu "Pixel depths"
>  comment "Deselecting each option leads to Qt's default (8,16,32)"
>  
> @@ -176,6 +183,7 @@ config BR2_PACKAGE_QT_SYSTEMFREETYPE
>  	  Use shared libfreetype from the target system.
>  	  See http://www.freetype.org/
>  endchoice
> +endif # !BR2_PACKAGE_QT_X11
>  
>  config BR2_PACKAGE_QT_GIF
>  	bool "Enable GIF support"

From the Config.in side, I'm wondering why you're not touching
Config.gfx.in and how it is included. I believe that in the X11-capable
Qt, we can't enable framebuffer support and so on. Can we?

> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index bc329f0..1fb350c 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -111,6 +111,10 @@ ifneq ($(QT_PIXEL_DEPTHS),)
>  QT_CONFIGURE_OPTS += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
>  endif
>  
> +ifneq ($(BR2_PACKAGE_QT_X11),y)
> +### Embedded options
> +QT_CONFIGURE_OPTS += -no-gfx-qnx -no-kbd-qnx -no-mouse-qnx
> +
>  ### Display drivers
>  ifeq ($(BR2_PACKAGE_QT_GFX_LINUXFB),y)
>  QT_CONFIGURE_OPTS += -qt-gfx-linuxfb
> @@ -197,6 +201,12 @@ else
>  QT_CONFIGURE_OPTS += -no-kbd-qvfb
>  endif
>  
> +else
> +### X11 options
> +QT_CONFIGURE_OPTS += -no-gtkstyle -no-openvg -no-glib --disable-script
> +endif

It would be better to use some positive logic here for the test. So
either you completely invert the two cases, or thanks to the "choice"
I'm mentioning above, you can turn this into positive logic.

Also, why is the glib support always disable in the X11 case?

The --disable-script option looks weird since all options have only one
"-" at the beginning, and this one has two.

> +
> +
>  ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
>  QT_CONFIGURE_OPTS += -debug
>  else
> @@ -236,7 +246,12 @@ else
>  QT_EMB_PLATFORM = generic
>  endif
>  
> +ifneq ($(BR2_PACKAGE_QT_X11),y)
>  QT_CONFIGURE_OPTS += -embedded $(QT_EMB_PLATFORM)
> +else
> +QT_CONFIGURE_OPTS += -xplatform linux-$(QT_EMB_PLATFORM)-g++ -v

Is the "-v" really really to X11.

> +QT_DEPENDENCIES   += fontconfig xlib_libXi xlib_libX11 xlib_libXrender xlib_libXcursor xlib_libXinerama xlib_libXrandr xlib_libXext xlib_libXv
> +endif

Again, some positive logic would be good here. And probably you can
group this with the test case above.

>  
>  ifneq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
>  QT_CONFIGURE_OPTS += -no-gui
> @@ -453,7 +468,11 @@ endif
>  # End of workaround.
>  
>  # Variable for other Qt applications to use
> +ifneq ($(BR2_PACKAGE_QT_X11),y)
>  QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
> +else
> +QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec linux-$(QT_EMB_PLATFORM)-g++

Use = and not :=.

> +endif
>  
>  ################################################################################
>  # QT_QMAKE_SET -- helper macro to set <variable> = <value> in
> @@ -467,10 +486,26 @@ QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
>  # E.G. use like this:
>  # $(call QT_QMAKE_SET,variable,value,directory)
>  ################################################################################
> +ifneq ($(BR2_PACKAGE_QT_X11),y)
>  define QT_QMAKE_SET
>  	$(SED) '/$(1)/d' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
>  	$(SED) '/include.*qws.conf/a$(1) = $(2)' $(3)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
>  endef
> +else
> +define QT_QMAKE_SET
> +	$(SED) '/$(1)/d' $(3)/mkspecs/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
> +	$(SED) '/load(qt_config)/i$(1) = $(2)' $(3)/mkspecs/linux-$(QT_EMB_PLATFORM)-g++/qmake.conf
> +endef
> +endif

Instead of redefining the macro completely, what about making the path
to the qmake.conf file a variable, and change it depending on whether
you're building X11 or not.

> +
> +ifeq ($(BR2_PACKAGE_QT_X11),y)
> +define QT_CONFIGURE_MKSPECS
> +	cp -R $(@D)/mkspecs/linux-g++ $(@D)/mkspecs/linux-$(QT_EMB_PLATFORM)-g++

Hum, why?

> +	$(call QT_QMAKE_SET,QMAKE_INCDIR_X11,$(STAGING_DIR)/usr/X11R6/include,$(@D))
> +	$(call QT_QMAKE_SET,QMAKE_LIBDIR,$(STAGING_DIR)/lib/ $(STAGING_DIR)/usr/lib/,$(@D))
> +	$(call QT_QMAKE_SET,QMAKE_LIBDIR_X11,$(STAGING_DIR)/lib/ $(STAGING_DIR)/usr/lib/,$(@D))

Ok, but move these into a variable named QT_CONFIGURE_X11_MKSPECS

> +endef
> +endif
>  
>  ifneq ($(BR2_INET_IPV6),y)
>  define QT_CONFIGURE_IPV6
> @@ -487,6 +522,7 @@ endif
>  
>  define QT_CONFIGURE_CMDS
>  	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) confclean
> +	$(QT_CONFIGURE_MKSPECS)
>  	$(QT_CONFIGURE_IPV6)
>  	$(QT_CONFIGURE_CONFIG_FILE)
>  	# Fix compiler path

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
