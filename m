From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Mar 2014 22:57:00 +0100
Subject: [Buildroot] [PATCH v10] xbmc: new package
Message-ID: <1395611820-3061-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

XBMC is an award-winning free and open source (GPL) software media player and
entertainment hub for digital media.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: gimli <ebsi4711@gmail.com>
Cc: Martin Bark <martin@barkynet.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
Chamges v9 -> v10:  (Yann)
  - further cleanup in dependencies
  - don't check for pre-existing startup script or systemd unit
    before installing therm
  - provide our own br-xbmc wrapper script
  - move XBMC's runtime config to a saner place
Changes v8 -> v9:
  - Include patch from Yann E. Morin (See commit log below)
  - Fix startup script (Martin Bark)
  - Cleanup dependencies (Yann E. Morin)
  - Remove RaspberryPi specific patch, most of them are now useless
    anyway.
Changes v7 -> v8:
  - Fix comments and dependencies on components (Thomas Petazzoni)
  - Change name for options (Thomas Petazzoni)
  - Remove depends on external toolchain (Martin Bark)
  - Fix various indent issues (Thomas Petazzoni)
  - Fix hook placement (Thomas Petazzoni)
  - Add host-gperf (Martin Bark)
Changes v6 -> v7:
  - Fix various capitalization issue (Thomas De Schampheleire)
  - Changes depends on !uclibc to a depends on glibc (Thomas De Schampheleire)
  - Remove TIFF being selected twice (Jerzy Grzegorek)
Changes v5 -> v6:
  - Fix missing depends on OpenGL (Yann E. Morin)
  - Remove LIBCEC_RBP Config option (Yann E. Morin)
  - Fix dependency that were, in the end, not optionnal (Martin Bark)
  - Fix OpenGL check (Martin Bark)
  - Uses BR2_HOST_NEEDS_JAVA (Martin Bark)
Changes v4 -> v5:
  - Remove MAKE1, seems to work fine with parallel build.
Changes v3 -> v4:
  - Rework init script
  - Add systemd startup service
Changes v2 -> v3:
  - Fix indent
  - Change librtmp to rtmpdump
Changes v1 -> v2:
  - Fix header (Yann E. Morin)
  - Fix comment on toolchain option (Peter Korsgaard)

---
package/xbmc: background XBMC and store PID in startup script

Otherwise the startup script:
  - hangs while XBMC is running,
  - is not able to stop XBMC on shutdown.

Reported-by: Martin Bark <martin@barkynet.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

(in v9)

---
package/xbmc: cleanup dependencies

XBMC needs an (e)glibc toolchain, which is only available on targets
with an MMU, so there's no need to repeat it. Add missing dependency
on threads.

Most of the required dependencies for sub-options are already matched,
as they already apply to XBMC itself.

Better annotate dependencies inherited from a 'select' dependency.

Fix un-met depdendency comments to repeat the feature prompt (eg.
'libcec' -> 'hdmi cec', 'libnfs' -> 'nfs' ...)

Re-order top-of-file comments, so they are in a more meaningful order.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

(in v9)

---
package/xbmc: further cleanup in sub-options dependencies

XBMC depends on a (e)glibc toolchain.

(e)glibc always has support for wide chars, IPv6, and largefiles.

So, sub-options of XBMC do not need to explicitly depend on those
toolchain options.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

(in v10)

---
package/xbmc: install startup script or systemd unit even if it exists

If the sysV init startup script (or the systemd unit) already exists,
it is not installed.

This is an issue when working on tweaking the sysV inint startup script
(or the systemd unit).

Always install it; don't check if it is already installed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

(in v10)

---
package/xbmc: add our own wrapper script

/usr/bin/xbmc is a wrapper script that calls to the real xbmc
executable in /usr/lib/xbmc/xbmc.bin.

We can not use this script, as it does some checks that are not
always valid. For example, it checks that it can run glxinfo,
which is not always available, although the target does have GL
extensions.

/usr/bin/xbmc-standlaone is basically a wrapper around that first
wrapper above, so we can't use it any more.

On the other hand, directly calling the real xbmc executable from
the startup script means we're loosing XBMC exit codes. Thos exit
codes are important, since XBMC exits with:
  - 0  : normal exit, no action required by user
  - 64 : normal exit, power-off required by user
  - 66 : normal exit, reboot required by user

Any other exit code is an error (save for 65, which I could not
find the reason for).

So, provide our own simple wrapper that runs XBMC in a loop, until
it exits with one of the above error codes. If xbmc exit with 64,
the scripts calls 'halt' and stops the loop; with 66, it calls
'reboot' and stops the loop; with 0, it just breaks the loop; any
other exit code just loop over after a 1 second pause.

This wrapper expects the path to the real xbmc executable as first
argument, and calls it with the remaining arguments, if any.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

(in v10)

---
package/xbmc: don't store runtime config in /.xbmc

When run from a startup script, XBMC has no $HOME where to store its
configuration, so ends up storing it in /.xbmc  (yes, at the root of
the rootfs).

This is a problem for read-only filesystems, of course.

But we can't easily change that, so create /.xbmc as a symlink where
we want the config to eventually be, ie. /var/xbmc

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

(in v10)

---
---
 package/Config.in                               |   1 +
 package/xbmc/Config.in                          | 161 +++++++++++++++++++++
 package/xbmc/S50xbmc                            |  41 ++++++
 package/xbmc/br-xbmc                            |  36 +++++
 package/xbmc/xbmc-0001-Fixup-include-path.patch |  81 +++++++++++
 package/xbmc/xbmc.mk                            | 178 ++++++++++++++++++++++++
 package/xbmc/xbmc.service                       |  12 ++
 7 files changed, 510 insertions(+)
 create mode 100644 package/xbmc/Config.in
 create mode 100755 package/xbmc/S50xbmc
 create mode 100755 package/xbmc/br-xbmc
 create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
 create mode 100644 package/xbmc/xbmc.mk
 create mode 100644 package/xbmc/xbmc.service

diff --git a/package/Config.in b/package/Config.in
index 66ded0b..21a210e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -27,6 +27,7 @@ source "package/tstools/Config.in"
 source "package/vlc/Config.in"
 source "package/vorbis-tools/Config.in"
 source "package/wavpack/Config.in"
+source "package/xbmc/Config.in"
 source "package/yavta/Config.in"
 endmenu
 
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
new file mode 100644
index 0000000..e078d2f
--- /dev/null
+++ b/package/xbmc/Config.in
@@ -0,0 +1,161 @@
+comment "xbmc needs an (e)glibc toolchain w/ C++, threads"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "xbmc requires an OpenGL ES and EGL backend"
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+
+menuconfig BR2_PACKAGE_XBMC
+	bool "xbmc"
+	select BR2_HOST_NEEDS_JAVA
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_JASPER
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBASS
+	select BR2_PACKAGE_LIBCDIO
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBFRIBIDI
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_LIBMAD
+	select BR2_PACKAGE_LIBMODPLUG
+	select BR2_PACKAGE_LIBMPEG2
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBPLIST
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBSAMPLERATE
+	select BR2_PACKAGE_LIBUNGIF
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_BSDDB
+	select BR2_PACKAGE_PYTHON_BZIP2
+	select BR2_PACKAGE_PYTHON_CURSES
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	select BR2_PACKAGE_PYTHON_READLINE
+	select BR2_PACKAGE_PYTHON_SQLITE
+	select BR2_PACKAGE_PYTHON_SSL
+	select BR2_PACKAGE_PYTHON_UNICODEDATA
+	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_TAGLIB
+	select BR2_PACKAGE_TIFF
+	select BR2_PACKAGE_TINYXML
+	select BR2_PACKAGE_YAJL
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES
+	help
+	  XBMC is an award-winning free and open source (GPL) software
+	  media player and entertainment hub for digital media.
+
+	  http://xbmc.org
+
+if BR2_PACKAGE_XBMC
+
+config BR2_PACKAGE_XBMC_AVAHI
+	bool "avahi"
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON
+	help
+	  Enable Avahi support.
+	  Select this if you want XBMC to support Bonjour protocol.
+
+config BR2_PACKAGE_XBMC_DBUS
+	bool "dbus"
+	select BR2_PACKAGE_DBUS
+	help
+	  Enable D-Bus support
+
+config BR2_PACKAGE_XBMC_LIBBLURAY
+	bool "blu-ray"
+	select BR2_PACKAGE_LIBBLURAY
+	help
+	  Enable Blu-ray input support.
+	  Select this if you want to play back Blu-ray content.
+
+config BR2_PACKAGE_XBMC_LIBCEC
+	bool "hdmi cec"
+	depends on !BR2_PREFER_STATIC_LIB # libcec
+	select BR2_PACKAGE_LIBCEC
+	help
+	  Enable CEC (Consumer Electronics Control) support.
+	  Select this if you want XBMC to support HDMI CEC.
+
+comment "hdmi cec support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
+config BR2_PACKAGE_XBMC_LIBMICROHTTPD
+	bool "web server"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  Enable webserver feature
+
+config BR2_PACKAGE_XBMC_LIBNFS
+	bool "nfs"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBNFS
+	help
+	  Enable NFS server support.
+
+comment "nfs support needs a toolchain w/ RPC support"
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
+config BR2_PACKAGE_XBMC_RTMPDUMP
+	bool "rtmp"
+	select BR2_PACKAGE_RTMPDUMP
+	help
+	  Enable RTMP input support.
+	  Select this if you want to play back rtmp stream.
+
+config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
+	bool "shairport"
+	select BR2_PACKAGE_LIBSHAIRPLAY
+	help
+	  Enable Shairport support.
+	  Select this if you want to stream content from an Apple device.
+
+config BR2_PACKAGE_XBMC_LIBSMBCLIENT
+	bool "samba"
+	select BR2_PACKAGE_SAMBA
+	select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
+	help
+	  Enable Samba support
+
+config BR2_PACKAGE_XBMC_LIBTHEORA
+	bool "theora"
+	select BR2_PACKAGE_LIBTHEORA
+	help
+	  Enable Theora input support.
+	  Select this if you want to play back OGG/OGV files (Video).
+
+config BR2_PACKAGE_XBMC_LIBUSB
+	bool "usb"
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Enable libusb support.
+
+config BR2_PACKAGE_XBMC_WAVPACK
+	bool "wavpack"
+	select BR2_PACKAGE_WAVPACK
+	help
+	  Enable WAV input support.
+	  Select this if you want to play back WV files.
+
+endif
diff --git a/package/xbmc/S50xbmc b/package/xbmc/S50xbmc
new file mode 100755
index 0000000..c53d3cd
--- /dev/null
+++ b/package/xbmc/S50xbmc
@@ -0,0 +1,41 @@
+#!/bin/sh
+#
+# Starts XBMC.
+#
+
+BIN=/usr/bin/br-xbmc
+XBMC=/usr/lib/xbmc/xbmc.bin
+XBMC_ARGS="--standalone -fs -n"
+PIDFILE=/var/run/xbmc.pid
+
+start() {
+	echo -n "Starting XBMC: "
+	start-stop-daemon -S -q -b -m -p $PIDFILE --exec $BIN -- $XBMC $XBMC_ARGS
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	echo -n "Stopping XBMC: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start)
+		start
+	;;
+	stop)
+		stop
+	;;
+	restart|reload)
+		restart
+	;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/xbmc/br-xbmc b/package/xbmc/br-xbmc
new file mode 100755
index 0000000..89467d3
--- /dev/null
+++ b/package/xbmc/br-xbmc
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+# We're called with the real XBMC executable as
+# first argument, followed by any XBMC extra args
+XBMC="${1}"
+shift
+
+# In case someone asked we terminate, just kill
+# the XBMC process
+trap_kill() {
+    LOOP=0
+    killall "${XBMC##*/}"
+}
+trap trap_kill INT QUIT TERM
+
+LOOP=1
+while [ ${LOOP} -eq 1 ]; do
+    # Hack: Busybox ash does not catch signals while a non-builtin
+    # is running, and only catches the signal when the non-builtin
+    # command ends. So, we jsut background the XBMC binary, and wait
+    # for it. But Busybox' ash's wait builtin does not return the
+    # exit code even if there was only one job (which is correct
+    # for POSIX). So we explicitly wait for the XBMC job
+    "${XBMC}" "${@}" &
+    wait %1
+    ret=$?
+    case "${ret}" in
+        0)  ;;
+        64) halt;   LOOP=0;;
+        66) reboot; LOOP=0;;
+        *)  # Crash
+            sleep 1
+            ;;
+    esac
+done
+exit ${ret}
diff --git a/package/xbmc/xbmc-0001-Fixup-include-path.patch b/package/xbmc/xbmc-0001-Fixup-include-path.patch
new file mode 100644
index 0000000..be99bd6
--- /dev/null
+++ b/package/xbmc/xbmc-0001-Fixup-include-path.patch
@@ -0,0 +1,81 @@
+From 63c255f1f5d68363f49193aceed343e602dc8bdf Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Thu, 26 Dec 2013 21:17:10 +0100
+Subject: [PATCH] Fixup include path
+
+Patch originally taken from :
+http://repository.timesys.com/buildsources/x/xbmc/xbmc-11.0/xbmc-11.0-fixups.patch
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ lib/enca/configure                           | 3 ---
+ lib/enca/configure.ac                        | 3 ---
+ lib/libdvd/libdvdread/misc/dvdread-config.sh | 6 +++---
+ lib/timidity/configure.in                    | 6 +++---
+ 4 files changed, 6 insertions(+), 12 deletions(-)
+
+diff --git a/lib/enca/configure b/lib/enca/configure
+index c839a51..7af5a09 100644
+--- a/lib/enca/configure
++++ b/lib/enca/configure
+@@ -12011,9 +12011,6 @@ fi
+ if test "$prefix" = "NONE"; then
+   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
+   CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
+-else
+-  LDFLAGS="$LDFLAGS -L$prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$prefix/include"
+ fi
+ 
+ 
+diff --git a/lib/enca/configure.ac b/lib/enca/configure.ac
+index 41434df..47d5367 100644
+--- a/lib/enca/configure.ac
++++ b/lib/enca/configure.ac
+@@ -100,9 +100,6 @@ dnl Dirty path hack.  Helps some people with badly set up search paths.
+ if test "$prefix" = "NONE"; then
+   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
+   CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
+-else
+-  LDFLAGS="$LDFLAGS -L$prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$prefix/include"
+ fi
+ 
+ dnl Checks for libraries.
+diff --git a/lib/libdvd/libdvdread/misc/dvdread-config.sh b/lib/libdvd/libdvdread/misc/dvdread-config.sh
+index e170c7e..25ee893 100644
+--- a/lib/libdvd/libdvdread/misc/dvdread-config.sh
++++ b/lib/libdvd/libdvdread/misc/dvdread-config.sh
+@@ -48,9 +48,9 @@ if test "$echo_prefix" = "yes"; then
+ fi
+ 
+ if test "$echo_cflags" = "yes"; then
+-      echo -I$prefix/include $extracflags
++      echo $extracflags
+ fi
+ 
+ if test "$echo_libs" = "yes"; then
+-      echo -L$libdir $dvdreadlib
+-fi      
++      echo $dvdreadlib
++fi
+diff --git a/lib/timidity/configure.in b/lib/timidity/configure.in
+index 9f2835b..733470a 100644
+--- a/lib/timidity/configure.in
++++ b/lib/timidity/configure.in
+@@ -100,9 +100,9 @@ done
+ 
+ # add $prefix if specified.
+ if test "x$prefix" != xNONE -a "x$prefix" != "x$ac_default_prefix" -a "x$prefix" != "x/usr"; then
+-  LDFLAGS="-L$prefix/lib $LDFLAGS"
+-  SHLDFLAGS="-L$prefix/lib $SHLDFLAGS"
+-  CPPFLAGS="-I$prefix/include $CPPFLAGS"
++  LDFLAGS="$LDFLAGS"
++  SHLDFLAGS="$SHLDFLAGS"
++  CPPFLAGS="$CPPFLAGS"
+ fi
+ 
+ dnl add --with-includes, --with-libraries
+-- 
+1.8.5.2
+
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
new file mode 100644
index 0000000..a43b41d
--- /dev/null
+++ b/package/xbmc/xbmc.mk
@@ -0,0 +1,178 @@
+################################################################################
+#
+# xbmc
+#
+################################################################################
+
+XBMC_VERSION = 12.3-Frodo
+XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
+XBMC_LICENSE = GPLv2
+XBMC_LICENSE_FILES = LICENSE.GPL
+XBMC_DEPENDENCIES = host-gperf host-lzo host-sdl_image host-swig
+XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
+	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
+	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
+	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
+
+XBMC_CONF_ENV = \
+	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
+	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
+	PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
+	PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	PYTHON_NOVERSIONCHECK="no-check" \
+	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
+
+XBMC_CONF_OPT +=  \
+	--disable-alsa \
+	--disable-crystalhd \
+	--disable-debug \
+	--disable-dvdcss \
+	--disable-gl \
+	--disable-hal \
+	--disable-joystick \
+	--disable-mysql \
+	--disable-openmax \
+	--disable-optical-drive \
+	--disable-projectm \
+	--disable-pulse \
+	--disable-sdl \
+	--disable-ssh \
+	--disable-vaapi \
+	--disable-vdpau \
+	--disable-vtbdecoder \
+	--disable-x11 \
+	--disable-xrandr \
+	--enable-gles \
+	--enable-optimizations
+
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+XBMC_DEPENDENCIES += rpi-userland
+XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
+XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+XBMC_DEPENDENCIES += dbus
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
+XBMC_DEPENDENCIES += libusb-compat
+XBMC_CONF_OPT += --enable-libusb
+else
+XBMC_CONF_OPT += --disable-libusb
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBMICROHTTPD),y)
+XBMC_DEPENDENCIES += libmicrohttpd
+XBMC_CONF_OPT += --enable-webserver
+else
+XBMC_CONF_OPT += --disable-webserver
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBSMBCLIENT),y)
+XBMC_DEPENDENCIES += samba
+XBMC_CONF_OPT += --enable-samba
+else
+XBMC_CONF_OPT += --disable-samba
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBNFS),y)
+XBMC_DEPENDENCIES += libnfs
+XBMC_CONF_OPT += --enable-nfs
+else
+XBMC_CONF_OPT += --disable-nfs
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_RTMPDUMP),y)
+XBMC_DEPENDENCIES += rtmpdump
+XBMC_CONF_OPT += --enable-rtmp
+else
+XBMC_CONF_OPT += --disable-rtmp
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBBLURAY),y)
+XBMC_DEPENDENCIES += libbluray
+XBMC_CONF_OPT += --enable-libbluray
+else
+XBMC_CONF_OPT += --disable-libbluray
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBSHAIRPLAY),y)
+XBMC_DEPENDENCIES += libshairplay
+XBMC_CONF_OPT += --enable-airplay
+else
+XBMC_CONF_OPT += --disable-airplay
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_AVAHI),y)
+XBMC_DEPENDENCIES += avahi
+XBMC_CONF_OPT += --enable-avahi
+else
+XBMC_CONF_OPT += --disable-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBCEC),y)
+XBMC_DEPENDENCIES += libcec
+XBMC_CONF_OPT += --enable-libcec
+else
+XBMC_CONF_OPT += --disable-libcec
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_WAVPACK),y)
+XBMC_DEPENDENCIES += wavpack
+endif
+
+# Add HOST_DIR to PATH for codegenerator.mk to find swig
+define XBMC_BOOTSTRAP
+	cd $(@D) && PATH=$(HOST_PATH) ./bootstrap
+endef
+XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
+
+define XBMC_CLEAN_UNUSED_ADDONS
+	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/screensaver.rsxs.plasma
+	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.milkdrop
+	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.projectm
+	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.itunes
+endef
+XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_UNUSED_ADDONS
+
+define XBMC_CLEAN_CONFLUENCE_SKIN
+	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.png -delete
+	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.jpg -delete
+endef
+XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_CONFLUENCE_SKIN
+
+define XBMC_INSTALL_BR_WRAPPER
+	$(INSTALL) -D -m 0755 package/xbmc/br-xbmc \
+		$(TARGET_DIR)/usr/bin/br-xbmc
+endef
+XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_BR_WRAPPER
+
+# When run from a startup script, XBMC has no $HOME where to store its
+# configuration, so ends up storing it in /.xbmc  (yes, at the root of
+# the rootfs). This is a problem for read-only filesystems. But we can't
+# easily change that, so create /.xbmc as a symlink where we want the
+# config to eventually be.
+define XBMC_INSTALL_CONFIG_DIR
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/xbmc
+	ln -sf /var/xbmc $(TARGET_DIR)/.xbmc
+endef
+XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_CONFIG_DIR
+
+define XBMC_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/xbmc/S50xbmc \
+		$(TARGET_DIR)/etc/init.d/S50xbmc
+endef
+
+define XBMC_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/xbmc/xbmc.service \
+		$(TARGET_DIR)/etc/systemd/system/xbmc.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../xbmc.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/xbmc.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/xbmc/xbmc.service b/package/xbmc/xbmc.service
new file mode 100644
index 0000000..3fe5895
--- /dev/null
+++ b/package/xbmc/xbmc.service
@@ -0,0 +1,12 @@
+[Unit]
+Description = XBMC media center
+After = network.target
+
+[Service]
+Type = simple
+ExecStart = /usr/lib/xbmc/xbmc.bin --standalone -fs -n
+Restart = on-failure
+
+[Install]
+WantedBy = multi-user.target
+
-- 
1.8.3.2
