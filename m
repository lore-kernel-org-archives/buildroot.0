From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:38:34 +0100
Subject: [Buildroot] [git commit] xorriso: new package
Message-ID: <20150114213931.D36C580DEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08c85a573ecd69267b3b02e19f5e1172edbe0455
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xorriso cd/dvd/bd iso 9660 manipulation and disc burner.

libburnia is a project for reading, mastering and writing
optical discs. Currently it is comprised of libraries named
libisofs, libburn, libisoburn, a cdrecord emulator named cdrskin,
and an integrated multi-session tool named xorriso.
The software runs on GNU/Linux, FreeBSD, Solaris, NetBSD.
It is base of the  GNU xorriso package and is actively maintained.

[Thomas:
 - Rewrap Config.in help text
 - Add optional dependencies on libcdio, readline, acl, attr, zlib,
   bzip2.
 - Handle thread support.
 - Add hash file.]

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/xorriso/Config.in    |   21 +++++++++++++
 package/xorriso/xorriso.hash |    2 +
 package/xorriso/xorriso.mk   |   66 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0299830..266de13 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -394,6 +394,7 @@ endif
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
 	source "package/wipe/Config.in"
+	source "package/xorriso/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
diff --git a/package/xorriso/Config.in b/package/xorriso/Config.in
new file mode 100644
index 0000000..cd60d7f
--- /dev/null
+++ b/package/xorriso/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_XORRISO
+	bool "xorriso"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
+	help
+	  xorriso cd/dvd/bd iso 9660 manipulation and disc burner.
+
+	  libburnia is a project for reading, mastering and writing
+	  optical discs. Currently it is comprised of libraries named
+	  libisofs, libburn, libisoburn, a cdrecord emulator named
+	  cdrskin, and an integrated multi-session tool named xorriso.
+	  The software runs on GNU/Linux, FreeBSD, Solaris, NetBSD.
+	  It is base of the GNU xorriso package and is actively
+	  maintained.
+
+	  http://libburnia-project.org/
+	  http://www.gnu.org/software/xorriso
+
+comment "xorriso needs a toolchain w/ wchar, largefile"
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE
diff --git a/package/xorriso/xorriso.hash b/package/xorriso/xorriso.hash
new file mode 100644
index 0000000..98a716d
--- /dev/null
+++ b/package/xorriso/xorriso.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 901204634651533f7cbd105eab560534702458258529aac4b2f0fc946992107e xorriso-1.3.8.tar.gz
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
new file mode 100644
index 0000000..3c068f7
--- /dev/null
+++ b/package/xorriso/xorriso.mk
@@ -0,0 +1,66 @@
+###############################################################################
+#
+# xorriso
+#
+###############################################################################
+
+XORRISO_VERSION = 1.3.8
+XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
+XORRISO_LICENSE = GPLv3+
+XORRISO_LICENSE_FILES = COPYING COPYRIGHT
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+XORRISO_DEPENDENCIES += libiconv
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCDIO),y)
+XORRISO_DEPENDENCIES += host-pkgconf libcdio
+XORRISO_CONF_OPTS += \
+	--enable-pkg-check-modules \
+	--enable-libcdio
+else
+XORRISO_CONF_OPTS += --disable-libcdio
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+XORRISO_DEPENDENCIES += readline
+XORRISO_CONF_OPTS += --enable-libreadline
+else
+XORRISO_CONF_OPTS += --disable-libreadline
+endif
+
+ifeq ($(BR2_PACKAGE_ACL),y)
+XORRISO_DEPENDENCIES += acl
+XORRISO_CONF_OPTS += --enable-libacl
+else
+XORRISO_CONF_OPTS += --disable-libacl
+endif
+
+ifeq ($(BR2_PACKAGE_ATTR),y)
+XORRISO_DEPENDENCIES += attr
+XORRISO_CONF_OPTS += --enable-xattr
+else
+XORRISO_CONF_OPTS += --disable-xattr
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+XORRISO_DEPENDENCIES += zlib
+XORRISO_CONF_OPTS += --enable-zlib
+else
+XORRISO_CONF_OPTS += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+XORRISO_DEPENDENCIES += bzip2
+XORRISO_CONF_OPTS += --enable-libbz2
+else
+XORRISO_CONF_OPTS += --disable-libbz2
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+XORRISO_CONF_OPTS += --enable-jtethreads
+else
+XORRISO_CONF_OPTS += --disable-jtethreads
+endif
+
+$(eval $(autotools-package))
