From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Mar 2014 19:09:01 +0100
Subject: [Buildroot] [PATCH v8] xbmc: new package
In-Reply-To: <1393158585-27193-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1393158585-27193-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140303180901.GB3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-02-23 13:29 +0100, Maxime Hadjinlian spake thusly:
> XBMC is an award-winning free and open source (GPL) software media player and
> entertainment hub for digital media.
[--SNIP--]
> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
> new file mode 100644
> index 0000000..c38f82b
> --- /dev/null
> +++ b/package/xbmc/Config.in
> @@ -0,0 +1,191 @@
[--SNIP--]
> +menuconfig BR2_PACKAGE_XBMC
> +	bool "xbmc"
[--SNIP--]
> +	depends on BR2_TOOLCHAIN_USES_GLIBC && BR2_INSTALL_LIBSTDCPP
[--SNIP--]
> +	depends on BR2_PACKAGE_HAS_OPENGL_EGL || BR2_PACKAGE_HAS_OPENGL_ES
> +config BR2_PACKAGE_XBMC_AVAHI
> +	bool "avahi"
> +	# libdaemon uses fork()
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Are those two 'depends' really needed? XBMC depends on glibc, which
always has threads, and is only available for architectures with an MMU.

(Note: as discussed with Gustavo on IRC, glibc is not marked 'depends on
MMU', but should be. Patch in the pipe...)

So:
  - no depends on MMU, THREADS, IPv6, LARGEFILES
  - no comment stating so

Ditto for all the options, of course...

[--SNIP--]
> +config BR2_PACKAGE_XBMC_LIBNFS
> +	bool "nfs"
> +	select BR2_PACKAGE_LIBNFS
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC

Does it work with libtirpc?
If not, could it be easily made to?

[--SNIP--]
> diff --git a/package/xbmc/S50xbmc b/package/xbmc/S50xbmc
> new file mode 100755
> index 0000000..ce51f7e
> --- /dev/null
> +++ b/package/xbmc/S50xbmc
> @@ -0,0 +1,41 @@
> +#!/bin/sh
> +#
> +# Starts XBMC.
> +#
> +
> +BIN_NAME=xbmc.bin
> +XBMC=/usr/lib/xbmc/$BIN_NAME
> +XBMC_ARGS="--standalone -fs -n"
> +PIDFILE=/var/run/xbmc.pid

If here you'd add something like:
    [ -f /etc/defaults/xbmc ] && . /etc/defaults/xbmc

Then you'd be able to provide a /etc/defaults/xbmc that, for the RPi,
would contain:
    export LD_PRELOAD=/usr/lib/libcoffi.so

And install that in the if-rpi block below.

> +start() {
> +	echo -n "Starting XBMC: "
> +	start-stop-daemon -S -q -p $PIDFILE --exec $XBMC -- $XBMC_ARGS

Don't forget the comment from Martin Bark about going to background and
writing the PID file.

> +exit $?

Unneeded, that's always the behaviour of a shell script.

[--SNIP two patches--]
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> new file mode 100644
> index 0000000..d05c2f5
> --- /dev/null
> +++ b/package/xbmc/xbmc.mk
> @@ -0,0 +1,163 @@
> +################################################################################
> +#
> +# xbmc
> +#
> +################################################################################
> +
> +XBMC_VERSION = 12.3-Frodo
> +XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
> +XBMC_LICENSE = GPLv2
> +XBMC_LICENSE_FILES = LICENSE.GPL
> +XBMC_DEPENDENCIES = host-gperf host-lzo host-sdl_image host-swig
> +XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
> +	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
> +	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
> +	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
> +
> +XBMC_CONF_ENV = \
> +	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
> +	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
> +	PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
> +	PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> +	PYTHON_NOVERSIONCHECK="no-check" \
> +	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
> +
> +XBMC_CONF_OPT +=  \
> +	--disable-alsa \
> +	--disable-crystalhd \
> +	--disable-debug \
> +	--disable-dvdcss \
> +	--disable-gl \
> +	--disable-hal \
> +	--disable-joystick \
> +	--disable-mysql \
> +	--disable-openmax \
> +	--disable-optical-drive \
> +	--disable-projectm \
> +	--disable-pulse \
> +	--disable-sdl \
> +	--disable-ssh \
> +	--disable-vaapi \
> +	--disable-vdpau \
> +	--disable-vtbdecoder \
> +	--disable-x11 \
> +	--disable-xrandr \

Do you plan on sending a follow-up patch to add support for the
currently-disabled options (alsa, dvdcss, hal...), or is it
set-in-stone?

> +	--enable-gles \
> +	--enable-optimizations
> +
> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +XBMC_DEPENDENCIES += rpi-userland
> +XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
> +XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
> +	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"

Here, create/append to /etc/defaults/xbmc to use libcoffi.so.

Or as part of a new if-libcoffi block, maybe.

> +# Add HOST_DIR to PATH for codegenerator.mk to find swig
> +define XBMC_BOOTSTRAP
> +	cd $(@D) && PATH=$(HOST_PATH) ./bootstrap

Be prepared to adapt when Samuel's PATH rework is applied. ;-)

> +endef
> +XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
> +
> +define XBMC_CLEAN_UNUSED_ADDONS
> +	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/screensaver.rsxs.plasma
> +	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.milkdrop
> +	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.projectm
> +	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.itunes
> +endef
> +XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_UNUSED_ADDONS

Why do you forcibly disable those add-ons? Can it be a config option?

> +define XBMC_CLEAN_CONFLUENCE_SKIN
> +	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.png -delete
> +	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.jpg -delete
> +endef
> +XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_CONFLUENCE_SKIN

Are they not needed at all?

[--SNIP--]
> diff --git a/package/xbmc/xbmc.service b/package/xbmc/xbmc.service
> new file mode 100644
> index 0000000..3fe5895
> --- /dev/null
> +++ b/package/xbmc/xbmc.service
> @@ -0,0 +1,12 @@

Of course, for systemd, you'd have to use a different way to pass use of
libcoffi.so. Is it possible to add extra env in a unit file? :-/

> +[Unit]
> +Description = XBMC media center
> +After = network.target
> +
> +[Service]
> +Type = simple
> +ExecStart = /usr/lib/xbmc/xbmc.bin --standalone -fs -n
> +Restart = on-failure
> +
> +[Install]
> +WantedBy = multi-user.target
> +

No trailing line if not needed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
