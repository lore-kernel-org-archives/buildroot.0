From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2014 22:48:56 +0100
Subject: [Buildroot] [git commit] libbluray: new package
Message-ID: <20140119214934.848BB9C559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adb614b89139ffc2986a878bd33fa7de8453477b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBBLURAY is a client library for accessing bluray disks.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

[Peter: zlib+bzip2 not needed, freetype+libxml optional]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/libbluray/Config.in    |    6 ++++++
 package/libbluray/libbluray.mk |   31 +++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2f62d6c..3f78651 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -627,6 +627,7 @@ source "package/yajl/Config.in"
 endmenu
 
 menu "Multimedia"
+source "package/libbluray/Config.in"
 source "package/libdvbsi/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libdvdread/Config.in"
diff --git a/package/libbluray/Config.in b/package/libbluray/Config.in
new file mode 100644
index 0000000..eeb93dc
--- /dev/null
+++ b/package/libbluray/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBBLURAY
+	bool "libbluray"
+	help
+	  libbluray is a client library for accessing bluray disks.
+
+	  http://www.videolan.org/developers/libbluray.html
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
new file mode 100644
index 0000000..98ab106
--- /dev/null
+++ b/package/libbluray/libbluray.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libbluray
+#
+################################################################################
+
+LIBBLURAY_VERSION = 0.5.0
+LIBBLURAY_SITE = ftp://ftp.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
+LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
+LIBBLURAY_INSTALL_STAGING = YES
+LIBBLURAY_LICENSE = LGPLv2.1+
+LIBBLURAY_LICENSE_FILES = COPYING
+LIBBLURAY_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+	LIBBLURAY_DEPENDENCIES += libiconv
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+	LIBBLURAY_DEPENDENCIES += freetype
+else
+	LIBBLURAY_CONF_OPT += --without-freetype
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+	LIBBLURAY_DEPENDENCIES += libxml2
+else
+	LIBBLURAY_CONF_OPT += --without-libxml2
+endif
+
+$(eval $(autotools-package))
