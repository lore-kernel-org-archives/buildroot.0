From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Sun,  7 Jul 2013 15:40:41 -0300
Subject: [Buildroot] [PATCH] icecast: new package
Message-ID: <1373222441-2848-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Icecast is a streaming media server which currently supports Ogg
Vorbis and MP3 audio streams. It can be used to create an Internet
radio station or a privately running jukebox and many things in
between. It is very versatile in that new formats can be added
relatively easily and supports open standards for commuincation and
interaction.

Icecast is distributed under the GNU GPL, version 2. A copy of this
license is included with this software in the COPYING file.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
I'm no longer working on this stuff because the box I was interested
in hadn't hardware FP support making it impossible to achieve what
I originally planned.

 package/multimedia/Config.in                       |  1 +
 package/multimedia/icecast/Config.in               | 13 +++++++++++
 .../multimedia/icecast/icecast-curl-config.patch   | 12 +++++++++++
 package/multimedia/icecast/icecast.mk              | 25 ++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/multimedia/icecast/Config.in
 create mode 100644 package/multimedia/icecast/icecast-curl-config.patch
 create mode 100644 package/multimedia/icecast/icecast.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 925051e..21cb64c 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -26,6 +26,7 @@ source "package/multimedia/gst1-plugins-bad/Config.in"
 source "package/multimedia/gst1-plugins-ugly/Config.in"
 source "package/multimedia/gst-omx/Config.in"
 
+source "package/multimedia/icecast/Config.in"
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/libvpx/Config.in"
 source "package/multimedia/madplay/Config.in"
diff --git a/package/multimedia/icecast/Config.in b/package/multimedia/icecast/Config.in
new file mode 100644
index 0000000..0d2c343
--- /dev/null
+++ b/package/multimedia/icecast/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_ICECAST
+	bool "icecast"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	help
+	  Icecast is a streaming media server which currently supports Ogg
+	  Vorbis and MP3 audio streams. It can be used to create an Internet
+	  radio station or a privately running jukebox and many things in
+	  between. It is very versatile in that new formats can be added
+	  relatively easily and supports open standards for commuincation and
+	  interaction.
diff --git a/package/multimedia/icecast/icecast-curl-config.patch b/package/multimedia/icecast/icecast-curl-config.patch
new file mode 100644
index 0000000..c193aa9
--- /dev/null
+++ b/package/multimedia/icecast/icecast-curl-config.patch
@@ -0,0 +1,12 @@
+--- icecast-2.3.2/configure	2008-09-29 20:11:37.000000000 +0200
++++ icecast-2.3.2.new/configure	2008-09-29 20:12:00.000000000 +0200
+@@ -24198,8 +24198,7 @@
+   { { echo "$as_me:$LINENO: error: cannot run test program while cross compiling
+ See \`config.log' for more details." >&5
+ echo "$as_me: error: cannot run test program while cross compiling
+-See \`config.log' for more details." >&2;}
+-   { (exit 1); exit 1; }; }
++See \`config.log' for more details." >&2;} }
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
diff --git a/package/multimedia/icecast/icecast.mk b/package/multimedia/icecast/icecast.mk
new file mode 100644
index 0000000..f840be1
--- /dev/null
+++ b/package/multimedia/icecast/icecast.mk
@@ -0,0 +1,25 @@
+############################################################
+#
+# Icecast (Shoutcast compatible streaming server)
+#
+############################################################
+
+ICECAST_SITE = http://downloads.xiph.org/releases/icecast
+ICECAST_VERSION = 2.3.2
+ICECAST_LICENSE = GPLv2
+ICECAST_LICENSE_FILES = COPYING
+
+ICECAST_DEPENDENCIES = host-pkgconf libxslt libxml2 libogg libvorbis libcurl
+
+ICECAST_CONF_OPT += --with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
+ICECAST_CONF_OPT += --with-ogg=$(STAGING_DIR)/usr
+ICECAST_CONF_OPT += --with-vorbis=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ICECAST_DEPENDENCIES += libcurl
+ICECAST_CONF_OPT += --with-curl-config=$(STAGING_DIR)/usr/bin/curl-config
+else
+ICECAST_CONF_OPT += --without-curl
+endif
+
+$(eval $(autotools-package))
-- 
1.8.1.5
