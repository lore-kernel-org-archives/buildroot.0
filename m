From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 11:12:45 +0100
Subject: [Buildroot] [git commit] package/gerbera: new package
Message-ID: <20190206101123.B31CF814B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=636fb8eba28b16b81baddad0a34906ad956f6ff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A free media server.
Stream your media to devices on your home network.

https://gerbera.io

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas:
 - fix S99gerbera to be compliant with the init script pattern
   that was recently put in place
 - add -l option in init script for logging
 - license code is GPL-2.0]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |   1 +
 package/Config.in                              |   1 +
 package/gerbera/0001-Fix-atrailers-build.patch |  48 +++++++++
 package/gerbera/Config.in                      |  27 +++++
 package/gerbera/S99gerbera                     |  52 +++++++++
 package/gerbera/config.xml                     | 139 +++++++++++++++++++++++++
 package/gerbera/gerbera.hash                   |   3 +
 package/gerbera/gerbera.mk                     | 114 ++++++++++++++++++++
 8 files changed, 385 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e713f2d63..65b6a09121 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -741,6 +741,7 @@ F:	package/cairo/
 F:	package/duktape/
 F:	package/expat/
 F:	package/flatbuffers/
+F:	package/gerbera/
 F:	package/gtksourceview/
 F:	package/gssdp/
 F:	package/gupnp/
diff --git a/package/Config.in b/package/Config.in
index 222857ad18..ebba7b4df2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1861,6 +1861,7 @@ menu "Networking applications"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
+	source "package/gerbera/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/glorytun/Config.in"
 	source "package/gupnp-tools/Config.in"
diff --git a/package/gerbera/0001-Fix-atrailers-build.patch b/package/gerbera/0001-Fix-atrailers-build.patch
new file mode 100644
index 0000000000..ba99ef4714
--- /dev/null
+++ b/package/gerbera/0001-Fix-atrailers-build.patch
@@ -0,0 +1,48 @@
+From 5d4c24bcca7f8d7f550720461373fb84eefef27e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 12 May 2018 14:16:30 +0200
+Subject: [PATCH] Fix atrailers build
+
+i2i function is used in atrailers_service.cc but this function is
+defined only if defined(HAVE_JS) || defined(HAVE_TAGLIB) ||
+defined(YOUTUBE) || defined(HAVE_LIBMP4V2) as a result compilation
+fails if HAVE_CURL is set but HAVE_JS and HAVE_TAGLIG are not.
+As youtube and libmp4v2 support have been dropped, replace those by
+ATRAILERS in this list.
+
+[Upstream Status: merged (https://github.com/gerbera/gerbera/pull/300)]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/string_converter.cc | 2 +-
+ src/string_converter.h  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/string_converter.cc b/src/string_converter.cc
+index b0b1f20f..79f46008 100644
+--- a/src/string_converter.cc
++++ b/src/string_converter.cc
+@@ -226,7 +226,7 @@ Ref<StringConverter> StringConverter::p2i()
+ }
+ #endif
+ 
+-#if defined (HAVE_JS) || defined(HAVE_TAGLIB) || defined(YOUTUBE) || defined(HAVE_LIBMP4V2)
++#if defined (HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
+ 
+ Ref<StringConverter> StringConverter::i2i()
+ {
+diff --git a/src/string_converter.h b/src/string_converter.h
+index c0b64f29..ca8ae16f 100644
+--- a/src/string_converter.h
++++ b/src/string_converter.h
+@@ -66,7 +66,7 @@ public:
+     static zmm::Ref<StringConverter> p2i();
+ 
+ #endif
+-#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(YOUTUBE) || defined(HAVE_LIBMP4V2)
++#if defined(HAVE_JS) || defined(HAVE_TAGLIB) || defined(ATRAILERS)
+     /// \brief safeguard - internal to internal - needed to catch some
+     /// scenarious where the user may have forgotten to add proper conversion
+     /// in the script.
+-- 
+2.14.1
+
diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
new file mode 100644
index 0000000000..b0155d1b37
--- /dev/null
+++ b/package/gerbera/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_GERBERA
+	bool "gerbera"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_LIBUPNP # libupnp18
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBUPNP18
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_ZLIB
+	help
+	  A free media server.
+	  Stream your media to devices on your home network.
+
+	  https://gerbera.io
+
+comment "gerbera needs a toolchain w/ C++, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_PACKAGE_LIBUPNP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/gerbera/S99gerbera b/package/gerbera/S99gerbera
new file mode 100644
index 0000000000..8bbd221ce2
--- /dev/null
+++ b/package/gerbera/S99gerbera
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+DAEMON="gerbera"
+PIDFILE="/var/run/$NAME.pid"
+
+GERBERA_ARGS="-c /etc/gerbera/config.xml -l /var/log/gerbera.log"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -m -b -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- $GERBERA_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+        start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
diff --git a/package/gerbera/config.xml b/package/gerbera/config.xml
new file mode 100644
index 0000000000..fa990d1502
--- /dev/null
+++ b/package/gerbera/config.xml
@@ -0,0 +1,139 @@
+<config version="2" xmlns="http://mediatomb.cc/config/2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://mediatomb.cc/config/2 http://mediatomb.cc/config/2.xsd">
+  <!--
+     See http://gerbera.io or read the docs for more
+     information on creating and using config.xml configration files.
+    -->
+  <server>
+    <ui enabled="yes" show-tooltips="yes">
+      <accounts enabled="no" session-timeout="30">
+        <account user="gerbera" password="gerbera"/>
+      </accounts>
+    </ui>
+    <name>Gerbera</name>
+    <udn>uuid:ac20d9b6-5c82-48e6-80de-436965fbe1d7</udn>
+    <home>/var/lib/gerbera</home>
+    <webroot>/usr/share/gerbera/web</webroot>
+    <!--
+        How frequently (in seconds) to send ssdp:alive advertisements.
+        Minimum alive value accepted is: 62
+
+        The advertisement will be sent every (A/2)-30 seconds,
+        and will have a cache-control max-age of A where A is
+        the value configured here. Ex: A value of 62 will result
+        in an SSDP advertisement being sent every second.
+    -->
+    <alive>1800</alive>
+    <storage>
+      <sqlite3 enabled="yes">
+        <database-file>gerbera.db</database-file>
+      </sqlite3>
+    </storage>
+    <protocolInfo extend="no"/><!-- For PS3 support change to "yes" -->
+    <!--
+       Uncomment the lines below to get rid of jerky avi playback on the
+       DSM320 or to enable subtitles support on the DSM units
+    -->
+    <!--
+    <custom-http-headers>
+      <add header="X-User-Agent: redsonic"/>
+    </custom-http-headers>
+
+    <manufacturerURL>redsonic.com</manufacturerURL>
+    <modelNumber>105</modelNumber>
+    -->
+    <!-- Uncomment the line below if you have a Telegent TG100 -->
+    <!--
+       <upnp-string-limit>101</upnp-string-limit>
+    -->
+    <extended-runtime-options>
+      <mark-played-items enabled="no" suppress-cds-updates="yes">
+        <string mode="prepend">*</string>
+        <mark>
+          <content>video</content>
+        </mark>
+      </mark-played-items>
+    </extended-runtime-options>
+  </server>
+  <import hidden-files="no">
+    <scripting script-charset="UTF-8">
+      <virtual-layout type="builtin"/>
+    </scripting>
+    <mappings>
+      <extension-mimetype ignore-unknown="no">
+        <map from="mp3" to="audio/mpeg"/>
+        <map from="ogx" to="application/ogg"/>
+        <map from="ogv" to="video/ogg"/>
+        <map from="oga" to="audio/ogg"/>
+        <map from="ogg" to="audio/ogg"/>
+        <map from="ogm" to="video/ogg"/>
+        <map from="asf" to="video/x-ms-asf"/>
+        <map from="asx" to="video/x-ms-asf"/>
+        <map from="wma" to="audio/x-ms-wma"/>
+        <map from="wax" to="audio/x-ms-wax"/>
+        <map from="wmv" to="video/x-ms-wmv"/>
+        <map from="wvx" to="video/x-ms-wvx"/>
+        <map from="wm" to="video/x-ms-wm"/>
+        <map from="wmx" to="video/x-ms-wmx"/>
+        <map from="m3u" to="audio/x-mpegurl"/>
+        <map from="pls" to="audio/x-scpls"/>
+        <map from="flv" to="video/x-flv"/>
+        <map from="mkv" to="video/x-matroska"/>
+        <map from="mka" to="audio/x-matroska"/>
+        <!-- Uncomment the line below for PS3 divx support -->
+        <!-- <map from="avi" to="video/divx"/> -->
+        <!-- Uncomment the line below for D-Link DSM / ZyXEL DMA-1000 -->
+        <!-- <map from="avi" to="video/avi"/> -->
+      </extension-mimetype>
+      <mimetype-upnpclass>
+        <map from="audio/*" to="object.item.audioItem.musicTrack"/>
+        <map from="video/*" to="object.item.videoItem"/>
+        <map from="image/*" to="object.item.imageItem"/>
+        <map from="application/ogg" to="object.item.audioItem.musicTrack"/>
+      </mimetype-upnpclass>
+      <mimetype-contenttype>
+        <treat mimetype="audio/mpeg" as="mp3"/>
+        <treat mimetype="application/ogg" as="ogg"/>
+        <treat mimetype="audio/ogg" as="ogg"/>
+        <treat mimetype="audio/x-flac" as="flac"/>
+        <treat mimetype="audio/x-ms-wma" as="wma"/>
+        <treat mimetype="audio/x-wavpack" as="wv"/>
+        <treat mimetype="image/jpeg" as="jpg"/>
+        <treat mimetype="audio/x-mpegurl" as="playlist"/>
+        <treat mimetype="audio/x-scpls" as="playlist"/>
+        <treat mimetype="audio/x-wav" as="pcm"/>
+        <treat mimetype="audio/L16" as="pcm"/>
+        <treat mimetype="video/x-msvideo" as="avi"/>
+        <treat mimetype="video/mp4" as="mp4"/>
+        <treat mimetype="audio/mp4" as="mp4"/>
+        <treat mimetype="video/x-matroska" as="mkv"/>
+        <treat mimetype="audio/x-matroska" as="mka"/>
+      </mimetype-contenttype>
+    </mappings>
+  </import>
+  <transcoding enabled="no">
+    <mimetype-profile-mappings>
+      <transcode mimetype="video/x-flv" using="vlcmpeg"/>
+      <transcode mimetype="application/ogg" using="vlcmpeg"/>
+      <transcode mimetype="application/ogg" using="oggflac2raw"/>
+      <transcode mimetype="audio/x-flac" using="oggflac2raw"/>
+    </mimetype-profile-mappings>
+    <profiles>
+      <profile name="oggflac2raw" enabled="no" type="external">
+        <mimetype>audio/L16</mimetype>
+        <accept-url>no</accept-url>
+        <first-resource>yes</first-resource>
+        <accept-ogg-theora>no</accept-ogg-theora>
+        <agent command="ogg123" arguments="-d raw -o byteorder:big -f %out %in"/>
+        <buffer size="1048576" chunk-size="131072" fill-size="262144"/>
+      </profile>
+      <profile name="vlcmpeg" enabled="no" type="external">
+        <mimetype>video/mpeg</mimetype>
+        <accept-url>yes</accept-url>
+        <first-resource>yes</first-resource>
+        <accept-ogg-theora>yes</accept-ogg-theora>
+        <agent command="vlc" arguments="-I dummy %in --sout #transcode{venc=ffmpeg,vcodec=mp2v,vb=4096,fps=25,aenc=ffmpeg,acodec=mpga,ab=192,samplerate=44100,channels=2}:standard{access=file,mux=ps,dst=%out} vlc:quit"/>
+        <buffer size="14400000" chunk-size="512000" fill-size="120000"/>
+      </profile>
+    </profiles>
+  </transcoding>
+</config>
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
new file mode 100644
index 0000000000..a9281cc253
--- /dev/null
+++ b/package/gerbera/gerbera.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	a64fe5820aced590bcdc22600596dc8a41c0baf68d7c0ec5baf7a561ade820df	gerbera-v1.2.0.tar.gz
+sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6	LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
new file mode 100644
index 0000000000..b900a83c8c
--- /dev/null
+++ b/package/gerbera/gerbera.mk
@@ -0,0 +1,114 @@
+################################################################################
+#
+# gerbera
+#
+################################################################################
+
+GERBERA_VERSION = v1.2.0
+GERBERA_SITE = $(call github,gerbera,gerbera,$(GERBERA_VERSION))
+GERBERA_LICENSE = GPL-2.0
+GERBERA_LICENSE_FILES = LICENSE.md
+GERBERA_DEPENDENCIES = \
+	expat \
+	host-pkgconf \
+	libupnp18 \
+	sqlite \
+	util-linux \
+	zlib
+GERBERA_CONF_OPTS = \
+	-DWITH_DEBUG=OFF \
+	-DWITH_JS=OFF
+
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GERBERA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
+ifeq ($(BR2_PACKAGE_EXIV2),y)
+GERBERA_DEPENDENCIES += exiv2
+GERBERA_CONF_OPTS += -DWITH_EXIV2=ON
+else
+GERBERA_CONF_OPTS += -DWITH_EXIV2=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+GERBERA_DEPENDENCIES += ffmpeg
+GERBERA_CONF_OPTS += -DWITH_AVCODEC=ON
+else
+GERBERA_CONF_OPTS += -DWITH_AVCODEC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FILE),y)
+GERBERA_DEPENDENCIES += file
+GERBERA_CONF_OPTS += -DWITH_MAGIC=ON
+else
+GERBERA_CONF_OPTS += -DWITH_MAGIC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+GERBERA_DEPENDENCIES += libcurl
+GERBERA_CONF_OPTS += -DWITH_CURL=ON
+else
+GERBERA_CONF_OPTS += -DWITH_CURL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+GERBERA_DEPENDENCIES += libexif
+GERBERA_CONF_OPTS += -DWITH_EXIF=ON
+else
+GERBERA_CONF_OPTS += -DWITH_EXIF=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+GERBERA_DEPENDENCIES += libiconv
+endif
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+GERBERA_DEPENDENCIES += mysql
+GERBERA_CONF_OPTS += -DWITH_MYSQL=ON
+else
+GERBERA_CONF_OPTS += -DWITH_MYSQL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+GERBERA_DEPENDENCIES += systemd
+GERBERA_CONF_OPTS += -DWITH_SYSTEMD=ON
+else
+GERBERA_CONF_OPTS += -DWITH_SYSTEMD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_TAGLIB),y)
+GERBERA_DEPENDENCIES += taglib
+GERBERA_CONF_OPTS += -DWITH_TAGLIB=ON
+else
+GERBERA_CONF_OPTS += -DWITH_TAGLIB=OFF
+endif
+
+# gerbera does not provide a default configuration file, it can be
+# created during run time through --create-config:
+# http://docs.gerbera.io/en/latest/config-overview.html#generating-configuration
+# However, to have a correct home directory and UDN, install it ourself
+define GERBERA_INSTALL_CONFIGURATION
+	$(INSTALL) -D -m 0644 package/gerbera/config.xml \
+		$(TARGET_DIR)/etc/gerbera/config.xml
+endef
+
+GERBERA_POST_INSTALL_TARGET_HOOKS += GERBERA_INSTALL_CONFIGURATION
+
+define GERBERA_USERS
+	gerbera -1 gerbera -1 * /var/lib/gerbera - - Gerbera user
+endef
+
+define GERBERA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/gerbera/S99gerbera \
+		$(TARGET_DIR)/etc/init.d/S99gerbera
+endef
+
+# gerbera.service is installed by cmake in $(TARGET_DIR)/usr/lib/systemd/system
+define GERBERA_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/gerbera.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/gerbera.service
+endef
+
+$(eval $(cmake-package))
