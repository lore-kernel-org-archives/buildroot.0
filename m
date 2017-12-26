From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 Dec 2017 22:10:06 +0100
Subject: [Buildroot] [PATCH] package/libgta: new package
Message-ID: <20171226211006.9660-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Package tested with test-pkg and checked with check-package.
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libgta/Config.in   | 10 ++++++++++
 package/libgta/libgta.hash |  3 +++
 package/libgta/libgta.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/libgta/Config.in
 create mode 100644 package/libgta/libgta.hash
 create mode 100644 package/libgta/libgta.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index abbb99a022..9ff564b6e9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1462,6 +1462,7 @@ F:	package/iqvlinux/
 F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
+F:	package/libgta/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/lugaru/
diff --git a/package/Config.in b/package/Config.in
index b12227b684..0f0de43234 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1129,6 +1129,7 @@ menu "Graphics"
 	source "package/libglew/Config.in"
 	source "package/libglfw/Config.in"
 	source "package/libglu/Config.in"
+	source "package/libgta/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
 	source "package/libmediaart/Config.in"
diff --git a/package/libgta/Config.in b/package/libgta/Config.in
new file mode 100644
index 0000000000..894dced096
--- /dev/null
+++ b/package/libgta/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBGTA
+	bool "libgta"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_XZ
+	help
+	  Libgta is a portable library that implements the Generic
+	  Tagged Array (GTA) file format.
+
+	  http://gta.nongnu.org
diff --git a/package/libgta/libgta.hash b/package/libgta/libgta.hash
new file mode 100644
index 0000000000..d5fceb4205
--- /dev/null
+++ b/package/libgta/libgta.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 1d2ff713955eee28310de082a8fd8e236403c27dee3716ba1238c56e6643e4fb  libgta-1.0.8.tar.xz
+sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libgta/libgta.mk b/package/libgta/libgta.mk
new file mode 100644
index 0000000000..1189feeff9
--- /dev/null
+++ b/package/libgta/libgta.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# libgta
+#
+################################################################################
+
+LIBGTA_VERSION = 1.0.8
+LIBGTA_SITE = http://download.savannah.nongnu.org/releases/gta
+LIBGTA_SOURCE = libgta-$(LIBGTA_VERSION).tar.xz
+LIBGTA_INSTALL_STAGING = YES
+LIBGTA_DEPENDENCIES = host-pkgconf bzip2 xz zlib
+LIBGTA_LICENSE = LGPL-2.1+
+LIBGTA_LICENSE_FILES = COPYING
+
+LIBGTA_CONF_OPTS += -DGTA_BUILD_DOCUMENTATION=OFF
+
+ifeq ($(BR2_STATIC_LIBS),)
+LIBGTA_CONF_OPTS += -DGTA_BUILD_SHARED_LIB=ON
+else
+LIBGTA_CONF_OPTS += -DGTA_BUILD_SHARED_LIB=OFF
+endif
+
+ifeq ($(BR2_SHARED_LIBS),)
+LIBGTA_CONF_OPTS += -DGTA_BUILD_STATIC_LIB=ON
+else
+LIBGTA_CONF_OPTS += -DGTA_BUILD_STATIC_LIB=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.14.3
