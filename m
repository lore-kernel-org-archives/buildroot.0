From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 22:26:48 +0100
Subject: [Buildroot] [git commit branch/next] package/cog: new package
Message-ID: <20190211212604.CADFE800B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d34daf3926f6735703b4548b618cd28273481ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  2 ++
 package/Config.in     |  1 +
 package/cog/Config.in | 27 +++++++++++++++++++++++++++
 package/cog/cog.hash  |  5 +++++
 package/cog/cog.mk    | 17 +++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9746ba6792..45b59de276 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -67,6 +67,7 @@ F:	package/sngrep/
 
 N:	Adrian Perez de Castro <aperez@igalia.com>
 F:	package/brotli/
+F:	package/cog/
 F:	package/libepoxy/
 F:	package/libwpe/
 F:	package/webkitgtk/
@@ -824,6 +825,7 @@ F:	configs/olimex_a20_olinuxino_*
 F:	package/4th/
 F:	package/botan/
 F:	package/chipmunk/
+F:	package/cog/
 F:	package/dado/
 F:	package/ficl/
 F:	package/gdbm/
diff --git a/package/Config.in b/package/Config.in
index 0a5180a238..1b5d5c9d7f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/cog/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/cog/Config.in b/package/cog/Config.in
new file mode 100644
index 0000000000..768fcefaac
--- /dev/null
+++ b/package/cog/Config.in
@@ -0,0 +1,27 @@
+comment "cog needs wpewebkit and a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_WPEWEBKIT || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_COG
+	bool "cog"
+	depends on BR2_PACKAGE_WPEWEBKIT
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS
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
index 0000000000..97daf72744
--- /dev/null
+++ b/package/cog/cog.hash
@@ -0,0 +1,5 @@
+# Locally generated
+sha256 a6abadb78395226bac2e1dd5467feab2cc8c493eab6894a09a51a8e072e38c06  cog-v0.2.0.tar.gz
+
+# Hashes for license files:
+sha256 e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
new file mode 100644
index 0000000000..43f13152c8
--- /dev/null
+++ b/package/cog/cog.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cog
+#
+################################################################################
+
+COG_VERSION = v0.2.0
+COG_SITE = $(call github,Igalia,cog,$(COG_VERSION))
+COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
+COG_LICENSE = MIT
+COG_LICENSE_FILES = COPYING
+COG_CONF_OPTS = \
+	-DCOG_BUILD_PROGRAMS=ON \
+	-DCOG_PLATFORM_FDO=ON \
+	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
+
+$(eval $(cmake-package))
