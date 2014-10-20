From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 20 Oct 2014 15:21:49 +0200
Subject: [Buildroot] [PATCH 1/1] shairplay-sync: new package
Message-ID: <1413811309-16019-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/Config.in                        |  1 +
 package/shairport-sync/Config.in         | 72 ++++++++++++++++++++++++++++++++
 package/shairport-sync/S99shairport-sync | 31 ++++++++++++++
 package/shairport-sync/shairport-sync.mk | 49 ++++++++++++++++++++++
 4 files changed, 153 insertions(+)
 create mode 100644 package/shairport-sync/Config.in
 create mode 100644 package/shairport-sync/S99shairport-sync
 create mode 100644 package/shairport-sync/shairport-sync.mk

diff --git a/package/Config.in b/package/Config.in
index 89b46dc..e3151e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1086,6 +1086,7 @@ endif
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
+	source "package/shairport-sync/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
new file mode 100644
index 0000000..2eab88d
--- /dev/null
+++ b/package/shairport-sync/Config.in
@@ -0,0 +1,72 @@
+config BR2_PACKAGE_SHAIRPORT_SYNC
+	bool "shairport-sync"
+	depends on BR2_USE_MMU # libdaemon
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa_lib
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_LIBDAEMON
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
+choice
+	prompt "Choose SSL encryption backend"
+	default BR2_PACKAGE_SHAIRPORT_SYNC_OPENSSL
+
+config BR2_PACKAGE_SHAIRPORT_SYNC_OPENSSL
+	bool "OpenSSL"
+	select BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_SHAIRPORT_SYNC_POLARSSL
+	bool "PolarSSL"
+	select BR2_PACKAGE_POLARSSL
+endchoice
+
+choice
+	prompt "Choose mDNS backend"
+	default BR2_PACKAGE_SHAIRPORT_SYNC_AVAHI
+
+config BR2_PACKAGE_SHAIRPORT_SYNC_AVAHI
+	bool "Avahi"
+	depends on BR2_USE_WCHAR # avahi -> gettext
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON
+	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
+
+comment "Avahi support needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+
+config BR2_PACKAGE_SHAIRPORT_SYNC_TINYSVCMDNS
+	bool "tinysvcmdns"
+	help
+	  tinysvcmdns is a tiny mDNS responder which is only concerned with
+	  publishing services, without a system-wide daemon like Bonjour or
+	  Avahi. Its other goal is to be extremely small, embeddable, and have
+	  no external dependencies.
+endchoice
+
+config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
+	bool "libsoxr support"
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
index 0000000..377b0bb
--- /dev/null
+++ b/package/shairport-sync/S99shairport-sync
@@ -0,0 +1,31 @@
+#! /bin/sh
+
+NAME=shairport-sync
+DAEMON=/usr/bin/$NAME
+
+# Additional options that are passed to Shairport Sync
+OPTIONS=""
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting shairport-sync: "
+    start-stop-daemon --start --quiet --exec $DAEMON -- -d $OPTIONS
+    [ $? == 0 ] && echo "OK" || echo "FAIL"
+    ;;
+  stop)
+    echo -n "Stopping shairport-sync: "
+    start-stop-daemon --stop --quiet --name $NAME
+    [ $? == 0 ] && echo "OK" || echo "FAIL"
+    ;;
+  restart)
+    $0 stop
+    $0 start
+    ;;
+  *)
+  echo "Usage: $0 {start|stop|restart}"
+  exit 1
+  ;;
+esac
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
new file mode 100644
index 0000000..410281d
--- /dev/null
+++ b/package/shairport-sync/shairport-sync.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# shairport-sync
+#
+################################################################################
+
+SHAIRPORT_SYNC_VERSION = 2.1.5
+SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
+SHAIRPORT_SYNC_LICENSE = GPLv3+
+SHAIRPORT_SYNC_LICENSE_FILES = COPYING
+SHAIRPORT_SYNC_DEPENDENCIES = host-autoconf host-libtool alsa-lib libdaemon popt
+SHAIRPORT_SYNC_AUTORECONF = YES
+SHAIRPORT_SYNC_CONF_OPTS = --with-alsa # required
+
+# Avahi or tinysvcmdns
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_AVAHI),y)
+	SHAIRPORT_SYNC_DEPENDENCIES += avahi
+	SHAIRPORT_SYNC_CONF_OPTS += --with-openssl
+endif
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_TINYSVCMDNS),y)
+	SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
+endif
+
+# OpenSSL or PolarSSL
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_OPENSSL),y)
+	SHAIRPORT_SYNC_DEPENDENCIES += openssl
+	SHAIRPORT_SYNC_CONF_OPTS += --with-openssl
+endif
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_POLARSSL),y)
+	SHAIRPORT_SYNC_DEPENDENCIES += polarssl
+	SHAIRPORT_SYNC_CONF_OPTS += --with-polarssl
+endif
+
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
+	SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
+	SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
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
-- 
2.1.2
