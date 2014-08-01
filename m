From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Fri, 01 Aug 2014 03:32:30 +0200
Subject: [Buildroot] [PATCH v3 1/3] libgtk3: new package
In-Reply-To: <20140728202729.0c16d3fe@free-electrons.com>
References: <1406565218-12653-1-git-send-email-hadrien.boutteville@gmail.com>	<1406565218-12653-2-git-send-email-hadrien.boutteville@gmail.com>
 <20140728202729.0c16d3fe@free-electrons.com>
Message-ID: <53DAEE2E.9060907@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 28 Jul 2014 20:27:29 +0200, Thomas Petazzoni wrote:
> On Mon, 28 Jul 2014 18:33:36 +0200, Hadrien Boutteville wrote:
> 
>> diff --git a/package/libgtk3/libgtk3-0001-no-gtk-doc.patch b/package/libgtk3/libgtk3-0001-no-gtk-doc.patch
>> new file mode 100644
>> index 0000000..0c12ee4
>> --- /dev/null
>> +++ b/package/libgtk3/libgtk3-0001-no-gtk-doc.patch
>> @@ -0,0 +1,11 @@
> 
> Missing description + SoB on this patch. You could re-use the
> description from Eric's patch on systemd.

I will fix it. I will re-use the one I wrote for libglib2 (based on
Eric's patch): it's the same patch, I just forgot to update this one.

>> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
>> new file mode 100644
>> index 0000000..d3f5e9b
>> --- /dev/null
>> +++ b/package/libgtk3/libgtk3.mk
>> @@ -0,0 +1,135 @@
>> +################################################################################
>> +#
>> +# libgtk3
>> +#
>> +################################################################################
>> +
>> +LIBGTK3_VERSION_MAJOR = 3.12
>> +LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).2
>> +
> 
> Unneeded empty line.

I will fix it.

>> +LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
>> +LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
>> +LIBGTK3_LICENSE = LGPLv2+
>> +LIBGTK3_LICENSE_FILES = COPYING
>> +LIBGTK3_INSTALL_STAGING = YES
>> +LIBGTK3_INSTALL_TARGET = YES
> 
> This last line is not needed.

Ditto.

>> +
>> +LIBGTK3_AUTORECONF = YES
>> +
>> +LIBGTK3_CONF_ENV = \
>> +		ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
>> +		ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource
> 
> One tab only for the indentation here.

Actually, I re-used the coding style from libgtk2 package but I totally
agree with one tab only. I will fix it.

>> +
>> +LIBGTK3_CONF_OPT = --disable-glibtest \
>> +		--enable-explicit-deps=no \
>> +		--enable-gtk2-dependency \
>> +		--disable-debug \
>> +		--disable-introspection
> 
> Same here.

Ditto.

>> +
>> +LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 libglib2 cairo pango atk \
>> +		gdk-pixbuf
> 
> And here.

Ditto.

>> +
>> +# Xorg dependencies
>> +LIBGTK3_CONF_OPT += --with-x \
>> +	--enable-x11-backend \
>> +	--x-includes=$(STAGING_DIR)/usr/include/X11 \
>> +	--x-libraries=$(STAGING_DIR)/usr/lib
>> +LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender \
>> +		xlib_libXi
> 
> And here.

Ditto.

>> +ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
>> +LIBGTK3_CONF_OPT += --enable-xinerama
>> +LIBGTK3_DEPENDENCIES += xlib_libXinerama
>> +else
>> +LIBGTK3_CONF_OPT += --disable-xinerama
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
>> +LIBGTK3_CONF_OPT += --enable-xrandr
>> +LIBGTK3_DEPENDENCIES += xlib_libXrandr
>> +else
>> +LIBGTK3_CONF_OPT += --disable-xrandr
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
>> +LIBGTK3_DEPENDENCIES += xlib_libXcursor
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
>> +LIBGTK3_CONF_OPT += --enable-xfixes
>> +LIBGTK3_DEPENDENCIES += xlib_libXfixes
>> +else
>> +LIBGTK3_CONF_OPT += --disable-xfixes
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
>> +LIBGTK3_CONF_OPT += --enable-xcomposite
>> +LIBGTK3_DEPENDENCIES += xlib_libXcomposite
>> +else
>> +LIBGTK3_CONF_OPT += --disable-xcomposite
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
>> +LIBGTK3_CONF_OPT += --enable-xdamage
>> +LIBGTK3_DEPENDENCIES += xlib_libXdamage
>> +else
>> +LIBGTK3_CONF_OPT += --disable-xdamage
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
>> +LIBGTK3_CONF_OPT += --enable-xkb
>> +LIBGTK3_DEPENDENCIES += xlib_libxkbfile
>> +endif
> 
> No --disable-xkb ?

I will fix it.

>> +
>> +ifeq ($(BR2_PACKAGE_CUPS),y)
>> +LIBGTK3_CONF_OPT += --enable-cups
>> +LIBGTK3_DEPENDENCIES += cups
>> +else
>> +LIBGTK3_CONF_OPT += --disable-cups
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),)
>> +define LIBGTK3_POST_INSTALL_TWEAKS
>> +	rm -rf $(TARGET_DIR)/usr/bin/gtk3-demo \
>> +		$(TARGET_DIR)/usr/bin/gtk3-demo-application
>> +endef
>> +
>> +LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_POST_INSTALL_TWEAKS
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_LIBGTK3_TESTS),y)
>> +LIBGTK3_DEPENDENCIES += --enable-installed-tests
> 
> Really, _DEPENDENCIES ?

Erf, I never tested this option and actually I wonder if it's really useful.
For now, I will fix this typo.

>> +else
>> +LIBGTK3_CONF_OPT += --disable-installed-tests
>> +endif
>> +
>> +# We do not build a full version of libgtk3 for the host, because that
>> +# requires compiling Cairo, Pango, ATK and X.org for the host.
>> +# Therefore, we hack the build to only build gdk-pixbuf-from-source and
>> +# gtk-update-icon-cache, which are the host tools needed to build Gtk
>> +# for the target.
>> +
>> +HOST_LIBGTK3_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
>> +
>> +HOST_LIBGTK3_CFLAGS = $(shell $(HOST_DIR)/usr/bin/pkg-config \
>> +	--cflags --libs gdk-pixbuf-2.0)
> 
> This doesn't work, because it uses pkg-config in a configuration where
> it returns libraries/headers for the target. It causes build failures
> in some configuration:
> 
>>>> host-libgtk3 3.12.2 Building
> /usr/bin/gcc -O2 -I/home/test/outputs/gtk3/host/usr/include -L/home/test/outputs/gtk3/host/lib -L/home/test/outputs/gtk3/host/usr/lib -Wl,-rpath,/home/test/outputs/gtk3/host/usr/lib /home/test/outputs/gtk3/build/host-libgtk3-3.12.2/gtk/updateiconcache.c -I/home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gdk-pixbuf-2.0 -pthread -I/home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -I/home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/libpng16 -lgdk_pixbuf-2.0 -lgobject-2.0 -L/home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lglib-2.0 -lintl   -o /home/test/outputs/gtk3/build/host-libgtk3-3.12.2/gtk/gtk-update-icon-cache
> /home/test/outputs/gtk3/build/host-libgtk3-3.12.2/gtk/updateiconcache.c: In function 'find_string':
> /home/test/outputs/gtk3/build/host-libgtk3-3.12.2/gtk/updateiconcache.c:763: warning: cast from pointer to integer of different size
> /home/test/outputs/gtk3/build/host-libgtk3-3.12.2/gtk/updateiconcache.c: In function 'add_string':
> /home/test/outputs/gtk3/build/host-libgtk3-3.12.2/gtk/updateiconcache.c:769: warning: cast to pointer from integer of different size
> /usr/bin/ld: skipping incompatible /home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libintl.so when searching for -lintl
> /usr/bin/ld: skipping incompatible /home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libintl.a when searching for -lintl
> /usr/bin/ld: cannot find -lintl
> collect2: ld returned 1 exit status
> 
> So, you should replace that with:
> 
> HOST_LIBGTK3_FLAGS = \
> 	$(shell $(HOST_CONFIGURE_OPTS) $(PKG_CONFIG_HOST_BINARY) --cflags --libs gdk-pixbuf-2.0)
> 
> Note the rename from CFLAGS to just FLAGS, because it will contain both
> the --cflags and --libs flags.

OK, I fixed this with your solution but I still need to use CFLAGS
instead of FLAGS otherwise I have this error:

 updateiconcache.c:38:18: fatal error: glib.h: No such file or directory

>> +define HOST_LIBGTK3_CONFIGURE_CMDS
>> +	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
>> +	echo "#define HAVE_UNISTD_H 1" >> $(@D)/gtk/config.h
>> +	echo "#define HAVE_FTW_H 1" >> $(@D)/gtk/config.h
>> +endef
>> +
>> +define HOST_LIBGTK3_BUILD_CMDS
>> +	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
>> +		$(@D)/gtk/updateiconcache.c \
>> +		$(HOST_LIBGTK3_CFLAGS) \
>> +		-o $(@D)/gtk/gtk-update-icon-cache
>> +endef
>> +
>> +define HOST_LIBGTK3_INSTALL_CMDS
>> +	cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
> 
> 	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin/gtk-update-icon-cache
> 
> Could you repost an updated version of this patch quickly, so that I
> can apply it in time for 2014.08 ?

I'm sending the updated version.

Thanks,

Hadrien
