From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:28:27 +0200
Subject: [Buildroot] [git commit] shairplay-sync: new package
Message-ID: <20141025102843.D0E37B0F15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3d9cd9b523147d189c389c83c7f810776f02d5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rework init script to be more like other Buildroot init scripts,
   and fix indentation.
 - fix indentation in the .mk file
 - remove dependencies on host-autoconf and host-libtool, since the
   package has AUTORECONF = YES, this is not needed.
 - fix licensing informations.]

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/shairport-sync/Config.in         |   37 +++++++++++++++++++++
 package/shairport-sync/S99shairport-sync |   25 ++++++++++++++
 package/shairport-sync/shairport-sync.mk |   51 ++++++++++++++++++++++++++++++
 4 files changed, 114 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e5686f6..03639e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1091,6 +1091,7 @@ endif
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
+	source "package/shairport-sync/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
new file mode 100644
index 0000000..bf40524
--- /dev/null
+++ b/package/shairport-sync/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_SHAIRPORT_SYNC
+	bool "shairport-sync"
+	depends on BR2_USE_MMU # libdaemon
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa_lib
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_LIBDAEMON
+	select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_POPT
+	help
+	  Shairport Sync emulates an AirPort Express for the purpose of
+	  streaming audio from iTunes, iPods, iPhones, iPads and AppleTVs.
+	  Audio played by a Shairport Sync-powered device stays in synchrony
+	  with the source and thus with other devices that are playing the same
+	  source synchronously. Thus, for example, synchronised multi-room
+	  audio is possible without difficulty.
+
+	  https://github.com/mikebrady/shairport-sync
+
+if BR2_PACKAGE_SHAIRPORT_SYNC
+
+config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
+	bool "libsoxr support"
+	select BR2_PACKAGE_LIBSOXR
+	help
+	  Enable support for libsoxr, the SoX Resampler library.
+
+	  Briefly, Shairport Sync keeps in step with the audio source by
+	  deleting or inserting frames of audio into the stream as needed. This
+	  "interpolation" is normally inaudible, but it can be heard in some
+	  circumstances. Libsoxr allows this interpolation to be done much more
+	  smoothly and subtly.
+
+endif
+
+comment "shairport-sync needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/shairport-sync/S99shairport-sync b/package/shairport-sync/S99shairport-sync
new file mode 100644
index 0000000..8e88c1b
--- /dev/null
+++ b/package/shairport-sync/S99shairport-sync
@@ -0,0 +1,25 @@
+#! /bin/sh
+
+# Additional options that are passed to Shairport Sync
+OPTIONS=""
+
+case "$1" in
+    start)
+	echo -n "Starting shairport-sync: "
+	start-stop-daemon -S -q -m -b -p /var/run/shairport-sync.pid --exec /usr/bin/shairport-sync -- $OPTIONS
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	;;
+    stop)
+	echo -n "Stopping shairport-sync: "
+	start-stop-daemon -K -q -p /var/run/shairport-sync.pid
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	;;
+    restart)
+	$0 stop
+	$0 start
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+	;;
+esac
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
new file mode 100644
index 0000000..58343f4
--- /dev/null
+++ b/package/shairport-sync/shairport-sync.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# shairport-sync
+#
+################################################################################
+
+SHAIRPORT_SYNC_VERSION = 2.1.5
+SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
+
+# Note: the COPYING file contains the text of GPLv3, but none of the
+# code is under this license. Bug reported upstream at
+# https://github.com/mikebrady/shairport-sync/issues/13.
+SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
+SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
+SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libdaemon popt
+SHAIRPORT_SYNC_AUTORECONF = YES
+SHAIRPORT_SYNC_CONF_OPTS = --with-alsa # required
+
+# Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns)
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+SHAIRPORT_SYNC_DEPENDENCIES += avahi
+SHAIRPORT_SYNC_CONF_OPTS += --with-avahi
+else
+SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
+endif
+
+# OpenSSL or PolarSSL
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SHAIRPORT_SYNC_DEPENDENCIES += openssl
+SHAIRPORT_SYNC_CONF_OPTS += --with-openssl
+else
+SHAIRPORT_SYNC_DEPENDENCIES += polarssl
+SHAIRPORT_SYNC_CONF_OPTS += --with-polarssl
+endif
+
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
+SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
+SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
+endif
+
+define SHAIRPORT_SYNC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/shairport-sync \
+		$(TARGET_DIR)/usr/bin/shairport-sync
+endef
+
+define SHAIRPORT_SYNC_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/shairport-sync/S99shairport-sync \
+		$(TARGET_DIR)/etc/init.d/S99shairport-sync
+endef
+
+$(eval $(autotools-package))
