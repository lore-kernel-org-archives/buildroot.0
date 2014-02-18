From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 18 Feb 2014 18:02:04 +0100
Subject: [Buildroot] [PATCH v7 4/4] xbmc: new package
In-Reply-To: <20140218173828.5947589d@skate>
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392680233-24585-5-git-send-email-maxime.hadjinlian@gmail.com>
 <20140218173828.5947589d@skate>
Message-ID: <CAGduivyFw4z+UxWWj36kgZgvDDg6CnQ12zKH6QGtpZrLMBiaow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all
On Tue, Feb 18, 2014 at 5:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Tue, 18 Feb 2014 00:37:13 +0100, Maxime Hadjinlian wrote:
>
>> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
>> new file mode 100644
>> index 0000000..23650ed
>> --- /dev/null
>> +++ b/package/xbmc/Config.in
>> @@ -0,0 +1,165 @@
>> +comment "xbmc requires an OpenGL-capable backend"
>> +     depends on !(BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
>
> I would make the comment more specific:
>
> comment "xbmc requires an OpenGL ES and EGL backend"
>
>> +# External toolchain are required because of a missing bitdefs.h
>> +comment "xbmc needs an (e)glibc external toolchain w/ C++, wchar"
>> +     depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR) || BR2_TOOLCHAIN_BUILDROOT
>
> This dependency does not make much sense to me. Your comment mentions
> "external toolchain", but it is not reflected by the dependencies.
> Moreover, we now have glibc/eglibc support in the internal backend, so
> I don't really see how there could be a difference between internal and
> external here. Additionally, if the C library is glibc or eglibc, then
> you are guaranteed to have wchar support. So if what you need is
> eglibc/glibc, then please do:
>
> comment "xbmc needs an (e)glibc toolchain w/ C++"
>         depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
>
The problem I had with internal toolchain, {X}libc was that, the
bitdefs.h is missing, and XBMC needs it.
I'll look at it another time as maybe my tests were not thorough enough.

>> +menuconfig BR2_PACKAGE_XBMC
>> +     bool "xbmc"
>> +     select BR2_HOST_NEEDS_JAVA
>> +     select BR2_PACKAGE_BOOST
>> +     select BR2_PACKAGE_BOOST_THREAD
>> +     select BR2_PACKAGE_BZIP2
>> +     select BR2_PACKAGE_EXPAT
>> +     select BR2_PACKAGE_FLAC
>> +     select BR2_PACKAGE_FONTCONFIG
>> +     select BR2_PACKAGE_FREETYPE
>> +     select BR2_PACKAGE_JASPER
>> +     select BR2_PACKAGE_JPEG
>> +     select BR2_PACKAGE_LIBASS
>> +     select BR2_PACKAGE_LIBCDIO
>> +     select BR2_PACKAGE_LIBCURL
>> +     select BR2_PACKAGE_LIBFRIBIDI
>> +     select BR2_PACKAGE_LIBGCRYPT
>> +     select BR2_PACKAGE_LIBID3TAG
>> +     select BR2_PACKAGE_LIBMAD
>> +     select BR2_PACKAGE_LIBMODPLUG
>> +     select BR2_PACKAGE_LIBMPEG2
>> +     select BR2_PACKAGE_LIBOGG
>> +     select BR2_PACKAGE_LIBPLIST
>> +     select BR2_PACKAGE_LIBPNG
>> +     select BR2_PACKAGE_LIBSAMPLERATE
>> +     select BR2_PACKAGE_LIBUNGIF
>> +     select BR2_PACKAGE_LIBVORBIS
>> +     select BR2_PACKAGE_LIBXML2
>> +     select BR2_PACKAGE_LZO
>> +     select BR2_PACKAGE_NCURSES
>> +     select BR2_PACKAGE_OPENSSL
>> +     select BR2_PACKAGE_PCRE
>> +     select BR2_PACKAGE_PYTHON
>> +     select BR2_PACKAGE_PYTHON_BSDDB
>> +     select BR2_PACKAGE_PYTHON_BZIP2
>> +     select BR2_PACKAGE_PYTHON_CURSES
>> +     select BR2_PACKAGE_PYTHON_PYEXPAT
>> +     select BR2_PACKAGE_PYTHON_READLINE
>> +     select BR2_PACKAGE_PYTHON_SQLITE
>> +     select BR2_PACKAGE_PYTHON_SSL
>> +     select BR2_PACKAGE_PYTHON_UNICODEDATA
>> +     select BR2_PACKAGE_PYTHON_ZLIB
>> +     select BR2_PACKAGE_READLINE
>> +     select BR2_PACKAGE_SQLITE
>> +     select BR2_PACKAGE_TAGLIB
>> +     select BR2_PACKAGE_TIFF
>> +     select BR2_PACKAGE_TINYXML
>> +     select BR2_PACKAGE_YAJL
>> +     select BR2_PACKAGE_ZLIB
>
> Wow! None of these dependencies are optional?
Nop, but keep in mind that XBMC is a full featured media center, it
does picture, video, streaming, and so on...
Also, I have voluntarily omitted some of the optional dependency in
order to add them little by little and have an "easier" first patch.
>
>> +     depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_USES_GLIBC
>
> Please update according to the discussion above.
>
>> +     depends on BR2_PACKAGE_HAS_OPENGL_EGL || BR2_PACKAGE_HAS_OPENGL_ES
>> +     depends on !BR2_TOOLCHAIN_BUILDROOT
>
> Ditto.
>
>> +     help
>> +       XBMC is an award-winning free and open source (GPL) software
>> +       media player and entertainment hub for digital media.
>> +
>> +       http://xbmc.org
>> +
>> +if BR2_PACKAGE_XBMC
>> +
>> +config BR2_PACKAGE_XBMC_AVAHI
>> +     bool "avahi"
>> +     select BR2_PACKAGE_AVAHI
>> +     select BR2_PACKAGE_AVAHI_DAEMON
>
> Missing MMU + thread dependency.
>
>> +     help
>> +       Enable Avahi support.
>> +       Select this if you want XBMC to support Bonjour protocol.
>> +
>> +config BR2_PACKAGE_XBMC_DBUS
>> +     bool "dbus"
>> +     select BR2_PACKAGE_DBUS
>
> Missing MMU + thread dependency.
>
>> +     help
>> +       Enable D-Bus support
>> +
>> +config BR2_PACKAGE_XBMC_LIBBLURAY
>> +     bool "libbluray"
>> +     select BR2_PACKAGE_LIBBLURAY
>
> Missing thread dependency.
>
>> +     help
>> +       Enable Blu-ray input support.
>> +       Select this if you want to play back Blu-ray content.
>> +
>> +config BR2_PACKAGE_XBMC_LIBCEC
>> +     bool "libcec"
>> +     select BR2_PACKAGE_LIBCEC
>> +     depends on BR2_INSTALL_LIBSTDCPP
>> +     depends on BR2_USE_WCHAR
>
> I think we should chose: either we replicate the toolchain dependencies
> of the packages we select (as you're doing here for libcec), or we do
> not. For example, in the Avahi example above, you did not replicate the
> MMU and thread dependencies of Avahi.
>
> Even though those dependencies are not needed now (because glibc is
> only available on MMU-capable platforms, always provides thread
> support), they might be needed later on, for example once XBMC becomes
> buildable with uClibc. Our policy is therefore to always replicate
> those dependencies, though I admit for this package, it's a little bit
> annoying because we know that XBMC as a whole will never build on
> non-MMU platforms, or without thread support.
>
Well.. They could always be specified, it doesn't really hurt, does it ?
> Maybe others could comment on this?
>
>> +     help
>> +       Enable CEC (Consumer Electronics Control) support.
>> +       Select this if you want XBMC to support HDMI CEC.
>> +
>> +comment "libcec requires a toolchain w/ C++, wchar support"
>> +     depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
>> +
>> +config BR2_PACKAGE_XBMC_LIBMICROHTTPD
>> +     bool "libmicrohttpd"
>
> Shouldn't this be named "web server" or something like this? What the
> user really cares about is not the name of the library needed to enable
> the feature, but rather the feature itself: the fact that this is going
> to enable a web server in XBMC, to do something.
>
> I guess the other sub-options should be reviewed in the light of this.
I fully agree, the current name are not user friendly at all.
>
>> +     select BR2_PACKAGE_LIBMICROHTTPD
>
> Missing thread dependency.
>
>> +     help
>> +       Enable webserver feature
>> +
>> +config BR2_PACKAGE_XBMC_LIBNFS
>> +     bool "libnfs"
>> +     select BR2_PACKAGE_LIBNFS
>> +     depends on BR2_LARGEFILE
>> +     depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>> +     help
>> +       Enable NFS server support.
>> +
>> +comment "libnfs support requires a toolchain w/ largefile, RPC support"
>> +     depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_NATIVE_RPC)
>> +
>> +config BR2_PACKAGE_XBMC_RTMPDUMP
>> +     bool "librtmp"
>> +     select BR2_PACKAGE_RTMPDUMP
>> +     help
>> +       Enable RTMP input support.
>> +       Select this if you want to play back rtmp stream.
>> +
>> +config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
>> +     bool "libshairport"
>> +     select BR2_PACKAGE_LIBSHAIRPLAY
>> +     depends on BR2_INET_IPV6
>> +     help
>> +       Enable Shairport support.
>> +       Select this if you want to stream content from an Apple device.
>> +
>> +comment "libshairport support requires a toolchain w/ IPv6 support"
>> +     depends on !(BR2_INET_IPV6)
>
> Parenthesis not needed.
>
>> +
>> +config BR2_PACKAGE_XBMC_LIBSMBCLIENT
>> +     bool "libsmbclient"
>> +     select BR2_PACKAGE_SAMBA
>> +     select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
>
> Missing MMU and thread dependencies.
>
>> +     help
>> +       Enable Samba support
>> +
>> +config BR2_PACKAGE_XBMC_LIBTHEORA
>> +     bool "libtheora"
>> +     select BR2_PACKAGE_LIBTHEORA
>> +     help
>> +       Enable Theora input support.
>> +       Select this if you want to play back OGG/OGV files (Video).
>> +
>> +config BR2_PACKAGE_XBMC_LIBUSB
>> +     bool "libusb"
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     select BR2_PACKAGE_LIBUSB
>> +     select BR2_PACKAGE_LIBUSB_COMPAT
>> +     help
>> +       Enable libusb support.
>> +
>> +config BR2_PACKAGE_XBMC_WAVPACK
>> +     bool "wavpack"
>> +     select BR2_PACKAGE_WAVPACK
>> +     help
>> +       Enable WAV input support.
>> +       Select this if you want to play back WV files.
>> +
>> +endif
>> diff --git a/package/xbmc/S50xbmc b/package/xbmc/S50xbmc
>> new file mode 100755
>> index 0000000..70cd320
>> --- /dev/null
>> +++ b/package/xbmc/S50xbmc
>> @@ -0,0 +1,41 @@
>> +#!/bin/sh
>> +#
>> +# Starts XBMC.
>> +#
>> +
>> +BIN_NAME=xbmc.bin
>> +XBMC=/usr/lib/xbmc/$BIN_NAME
>> +XBMC_ARGS="--standalone -fs -n"
>> +PIDFILE=/var/run/xbmc.pid
>> +
>> +start() {
>> +    echo -n "Starting XBMC: "
>> +    start-stop-daemon -S -q -p $PIDFILE --exec $XBMC -- $XBMC_ARGS
>> +    [ $? == 0 ] && echo "OK" || echo "FAIL"
>
> We use tab for indentation in our init scripts usually.
>
>> diff --git a/package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch b/package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
>> new file mode 100644
>> index 0000000..43960e6
>> --- /dev/null
>> +++ b/package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
>> @@ -0,0 +1,168 @@
>> +From 2541772a3ed71402a620466feb6a337b40f08880 Mon Sep 17 00:00:00 2001
>> +From: Maxime Hadjinlian <maximeh.hadjinlian@gmail.com>
>> +Date: Sat, 15 Dec 2012 23:41:06 +0100
>> +Subject: [PATCH] RaspberryPi Default Settings
>> +
>> +Add some default settings if the target platform is the RaspberryPi.
>> +Avoid the fact that the user _MUST_ have an advandcedsettings.xml to be able
>> +to use XBMC properly.
>
> Is this patch something that is going to be merged upstream by XBMC ?
> If not, I would very much prefer if Buildroot would ship this
> advancedsettings.xml, and would install if the target platform is
> RasberryPi. This would be more in line with what upstream does, no?
It will never be merged mainline. We can ship the xml file, that's
what I did at first but I thought it would not be well welcomed, but
if it's the preferred way, even better :)
>
>> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
>> new file mode 100644
>> index 0000000..f6aacc3
>> --- /dev/null
>> +++ b/package/xbmc/xbmc.mk
>> @@ -0,0 +1,149 @@
>> +################################################################################
>> +#
>> +# xbmc
>> +#
>> +################################################################################
>> +
>> +XBMC_VERSION = 12.3-Frodo
>> +XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
>> +XBMC_LICENSE = GPLv2
>> +XBMC_LICENSE_FILES = LICENSE.GPL
>> +XBMC_DEPENDENCIES = host-lzo host-sdl_image host-swig
>> +XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
>> +     libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
>> +     libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
>> +     openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
>> +
>> +XBMC_CONF_ENV += PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)"
>> +XBMC_CONF_ENV += PYTHON_LDFLAGS="-L$(STAGING_DIR)/usr/lib/ -lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm"
>
> Passing -L$(STAGING_DIR)/usr/lib should not be needed, since the
> cross compiler looks there by default for libraries.
>
>> +XBMC_CONF_ENV += PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)"
>> +XBMC_CONF_ENV += PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
>> +XBMC_CONF_ENV += PYTHON_NOVERSIONCHECK="no-check"
>> +XBMC_CONF_ENV += TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
>
> Only one line:
>
> XBMC_CONF_ENV = \
>         PYTHON_VERSION=... \
>         PYTHON_LDFLAGS=... \
>         ... \
>         TEXTUREPACKER=...
>
>> +
>> +XBMC_CONF_OPT +=  --disable-alsa --disable-crystalhd --disable-debug \
>> +     --disable-dvdcss --disable-gl --disable-hal --disable-joystick \
>> +     --disable-mysql --disable-openmax --disable-optical-drive \
>> +     --disable-projectm --disable-pulse --disable-sdl --disable-ssh \
>> +     --disable-vaapi --disable-vdpau --disable-vtbdecoder --disable-x11 \
>> +     --disable-xrandr --enable-gles --enable-optimizations
>
> We usually do one per line.
>
>> +
>> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>> +XBMC_DEPENDENCIES += rpi-userland
>> +XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
>> +XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
>> +     -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_DBUS),y)
>> +XBMC_DEPENDENCIES += dbus
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
>> +XBMC_DEPENDENCIES += libusb-compat
>> +XBMC_CONF_OPT += --enable-libusb
>> +else
>> +XBMC_CONF_OPT += --disable-libusb
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_LIBMICROHTTPD),y)
>> +XBMC_DEPENDENCIES += libmicrohttpd
>> +XBMC_CONF_OPT += --enable-webserver
>> +else
>> +XBMC_CONF_OPT += --disable-webserver
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_LIBSMBCLIENT),y)
>> +XBMC_DEPENDENCIES += samba
>> +XBMC_CONF_OPT += --enable-samba
>> +else
>> +XBMC_CONF_OPT += --disable-samba
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_LIBNFS),y)
>> +XBMC_DEPENDENCIES += libnfs
>> +XBMC_CONF_OPT += --enable-nfs
>> +else
>> +XBMC_CONF_OPT += --disable-nfs
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_RTMPDUMP),y)
>> +XBMC_DEPENDENCIES += rtmpdump
>> +XBMC_CONF_OPT += --enable-rtmp
>> +else
>> +XBMC_CONF_OPT += --disable-rtmp
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_LIBBLURAY),y)
>> +XBMC_DEPENDENCIES += libbluray
>> +XBMC_CONF_OPT += --enable-libbluray
>> +else
>> +XBMC_CONF_OPT += --disable-libbluray
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_LIBSHAIRPLAY),y)
>> +XBMC_DEPENDENCIES += libshairplay
>> +XBMC_CONF_OPT += --enable-airplay
>> +else
>> +XBMC_CONF_OPT += --disable-airplay
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_AVAHI),y)
>> +XBMC_DEPENDENCIES += avahi
>> +XBMC_CONF_OPT += --enable-avahi
>> +else
>> +XBMC_CONF_OPT += --disable-avahi
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_LIBCEC),y)
>> +XBMC_DEPENDENCIES += libcec
>> +XBMC_CONF_OPT += --enable-libcec
>> +else
>> +XBMC_CONF_OPT += --disable-libcec
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_XBMC_WAVPACK),y)
>> +XBMC_DEPENDENCIES += wavpack
>> +endif
>> +
>> +# Add HOST_DIR to PATH for codegenerator.mk to find swig
>> +# TODO: java binary from user's machine is currently used...
>
> This TODO can be removed I believe, due to your BR2_HOST_NEEDS_JAVA
> patch.
>
>> +define XBMC_BOOTSTRAP
>> +     cd $(@D) && PATH="$(HOST_DIR)/usr/bin/:$(PATH)" ./bootstrap
>
> PATH=$(HOST_PATH).
>
>> +endef
>> +
>> +define XBMC_CLEAN_UNUSED_ADDONS
>> +     rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/screensaver.rsxs.plasma
>> +     rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.milkdrop
>> +     rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.projectm
>> +     rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.itunes
>> +endef
>> +
>> +define XBMC_CLEAN_CONFLUENCE_SKIN
>> +     find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.png -delete
>> +     find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.jpg -delete
>> +endef
>> +
>> +define XBMC_INSTALL_INIT_SYSV
>> +     [ -f $(TARGET_DIR)/etc/init.d/S50xbmc ] || \
>> +             $(INSTALL) -D -m 755 package/xbmc/S50xbmc \
>> +             $(TARGET_DIR)/etc/init.d/S50xbmc
>> +endef
>> +
>> +define XBMC_INSTALL_INIT_SYSTEMD
>> +     [ -f $(TARGET_DIR)/etc/systemd/system/xbmc.service ] || \
>> +             $(INSTALL) -D -m 644 package/xbmc/xbmc.service \
>> +             $(TARGET_DIR)/etc/systemd/system/xbmc.service
>> +
>> +     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>> +
>> +     ln -fs ../xbmc.service \
>> +             $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/xbmc.service
>> +endef
>> +
>> +XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
>> +XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_ETC
>
> XBMC_INSTALL_ETC no longer exists it seems.
>
>> +XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_UNUSED_ADDONS
>> +XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_CONFLUENCE_SKIN
>
> I'd prefer to have those hook registrations near each of the hook
> declarations, i.e:
>
> define HOOK1
>
> endef
>
> FOOBAR_POST_INSTALL_TARGET_HOOKS += HOOK1
>
> define HOOK2
>
> endef
>
> FOOBAR_POST_INSTALL_TARGET_HOOKS += HOOK2
>
> Thanks a lot for the great work! The XBMC package is certainly not an
> easy one, but it will be a very welcome addition in Buildroot.
Thank you for the lengthy review, I will fix what you commented on and
go for another round.
Can't wait to have it merged :).
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
