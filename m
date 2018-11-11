From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sun, 11 Nov 2018 16:06:46 +0100
Subject: [Buildroot] [PATCH] libtool: Make libltdl a separate package
Message-ID: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will save megabytes on the target filesystem if target packages only
require libltdl part of libtool.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 package/Config.in                |  1 +
 package/libltdl/Config.in        | 10 ++++++++++
 package/libltdl/libltdl.hash     |  2 ++
 package/libltdl/libltdl.mk       | 18 ++++++++++++++++++
 package/libtool/libtool.mk       |  1 +
 package/pulseaudio/Config.in     |  2 +-
 package/pulseaudio/pulseaudio.mk |  2 +-
 7 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 package/libltdl/Config.in
 create mode 100644 package/libltdl/libltdl.hash
 create mode 100644 package/libltdl/libltdl.mk

diff --git a/package/Config.in b/package/Config.in
index b60e7700ad..d136ab1f15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1648,6 +1648,7 @@ menu "Other"
 	source "package/libite/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libloki/Config.in"
+	source "package/libltdl/Config.in"
 	source "package/libnpth/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
diff --git a/package/libltdl/Config.in b/package/libltdl/Config.in
new file mode 100644
index 0000000000..e45dc5f15f
--- /dev/null
+++ b/package/libltdl/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBLTDL
+	bool "libltdl"
+	help
+	  Library that hides the complexity of using shared/static
+	  libraries on different platforms behind a consistent, portable
+	  interface.
+
+	  This is only runtime part of libtool: libltdl.
+
+	  http://www.gnu.org/software/libtool/
diff --git a/package/libltdl/libltdl.hash b/package/libltdl/libltdl.hash
new file mode 100644
index 0000000000..baaac61232
--- /dev/null
+++ b/package/libltdl/libltdl.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f	libtool-2.4.6.tar.xz
diff --git a/package/libltdl/libltdl.mk b/package/libltdl/libltdl.mk
new file mode 100644
index 0000000000..6c9fc0bc49
--- /dev/null
+++ b/package/libltdl/libltdl.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libltdl
+#
+################################################################################
+
+# Same sources as libtool
+LIBLTDL_SOURCE = $(LIBTOOL_SOURCE)
+LIBLTDL_SITE = $(LIBTOOL_SITE)
+LIBLTDL_SUBDIR = libltdl
+LIBLTDL_INSTALL_STAGING = YES
+LIBLTDL_CONF_OPTS = --enable-ltdl-install
+LIBLTDL_DEPENDENCIES = host-m4
+LIBLTDL_LICENSE = LGPLv2.1
+LIBLTDL_LICENSE_FILES = $(LIBLTDL_SUBDIR)/COPYING.LIB
+LIBLTDL_PRE_CONFIGURE_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
+
+$(eval $(autotools-package))
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index bf97ee12b5..b9d492d1b5 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -9,6 +9,7 @@ LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
 LIBTOOL_CONF_ENV = HELP2MAN=true
+LIBTOOL_CONF_OPTS = --disable-ltdl-install
 LIBTOOL_DEPENDENCIES = host-m4
 HOST_LIBTOOL_DEPENDENCIES = host-m4
 LIBTOOL_LICENSE = GPL-2.0+
diff --git a/package/pulseaudio/Config.in b/package/pulseaudio/Config.in
index 6600006a60..5fa0f67d2c 100644
--- a/package/pulseaudio/Config.in
+++ b/package/pulseaudio/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_PULSEAUDIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBLTDL
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_PULSEAUDIO_ENABLE_ATOMIC
 	select BR2_PACKAGE_SPEEX
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index d1c35654cf..626f73309d 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -16,7 +16,7 @@ PULSEAUDIO_CONF_OPTS = \
 	--disable-manpages
 
 PULSEAUDIO_DEPENDENCIES = \
-	host-pkgconf libtool libsndfile speex host-intltool \
+	host-pkgconf libltdl libsndfile speex host-intltool \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
-- 
2.19.1
