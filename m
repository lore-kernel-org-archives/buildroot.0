From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 31 Dec 2018 14:39:32 +0100
Subject: [Buildroot] [PATCH] cog: new package
In-Reply-To: <20181231133932.29718-1-francois.perrad@gadz.org>
References: <20181231133932.29718-1-francois.perrad@gadz.org>
Message-ID: <20181231133932.29718-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS            |  2 ++
 package/Config.in     |  1 +
 package/cog/Config.in | 20 ++++++++++++++++++++
 package/cog/cog.hash  |  5 +++++
 package/cog/cog.mk    | 24 ++++++++++++++++++++++++
 5 files changed, 52 insertions(+)
 create mode 100644 package/cog/Config.in
 create mode 100644 package/cog/cog.hash
 create mode 100644 package/cog/cog.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index af392f73f..27dc7fe44 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -66,6 +66,7 @@ F:	package/sngrep/
 
 N:	Adrian Perez de Castro <aperez@igalia.com>
 F:	package/brotli/
+F:	package/cog/
 F:	package/libepoxy/
 F:	package/libwpe/
 F:	package/webkitgtk/
@@ -807,6 +808,7 @@ F:	configs/olimex_a20_olinuxino_*
 F:	package/4th/
 F:	package/botan/
 F:	package/chipmunk/
+F:	package/cog/
 F:	package/dado/
 F:	package/ficl/
 F:	package/gdbm/
diff --git a/package/Config.in b/package/Config.in
index 95a61da1c..88c179b0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -259,6 +259,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/cog/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/cog/Config.in b/package/cog/Config.in
new file mode 100644
index 000000000..bd4b6acb3
--- /dev/null
+++ b/package/cog/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_COG
+	bool "cog"
+	depends on BR2_PACKAGE_WPEWEBKIT
+	help
+	  Single "window" launcher for the WebKit WPE port, and
+	  helper library for implementing WPE launcher. It does
+	  not provide any chrome, and is suitable to be used
+	  as a Web application container.
+
+if BR2_PACKAGE_COG
+
+config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
+	string "home uri"
+	default "https://wpewebkit.org"
+	help
+	  Default URI to open when "cog" is launched. If an empty
+	  string is used, there is no default and the URI to open
+	  must be always specified in the command line.
+
+endif
diff --git a/package/cog/cog.hash b/package/cog/cog.hash
new file mode 100644
index 000000000..85f242413
--- /dev/null
+++ b/package/cog/cog.hash
@@ -0,0 +1,5 @@
+# Locally generated
+sha256 562ad3db11c3340f62a51df1dba44c2acfb2cf3210b2ebd2c1e2d2284ba38c2c  cog-1b83211d939c97f12331593217d2514e2e9cf0ba.tar.gz
+
+# Hashes for license files:
+sha256 e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
new file mode 100644
index 000000000..00593de95
--- /dev/null
+++ b/package/cog/cog.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# cog
+#
+################################################################################
+
+COG_VERSION = 1b83211d939c97f12331593217d2514e2e9cf0ba
+COG_SITE = $(call github,Igalia,cog,$(COG_VERSION))
+COG_DEPENDENCIES = wpewebkit wpebackend-fdo
+COG_LICENSE = MIT
+COG_LICENSE_FILES = COPYING
+COG_CONF_OPTS = \
+	-DCOG_BUILD_PROGRAMS=ON \
+	-DCOG_PLATFORM_FDO=ON \
+	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=ON
+COG_DEPENDENCIES += dbus
+else
+COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.17.1
