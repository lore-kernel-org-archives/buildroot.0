From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 19 Nov 2008 02:49:29 +0100
Subject: [Buildroot] [PATCH 1/7] package: add liboil package
In-Reply-To: <200811190244.44817.markus.heidelberg@web.de>
References: <200811190244.44817.markus.heidelberg@web.de>
Message-ID: <200811190249.29428.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Liboil is a library of simple functions that are optimized for various
CPUs. It is required by various GStreamer plugins.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/Config.in        |    1 +
 package/liboil/Config.in |    6 ++++++
 package/liboil/liboil.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/liboil/Config.in
 create mode 100644 package/liboil/liboil.mk

diff --git a/package/Config.in b/package/Config.in
index 2e842fb..23d3238 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -78,6 +78,7 @@ source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libiconv/Config.in"
 source "package/liblockfile/Config.in"
+source "package/liboil/Config.in"
 source "package/libsysfs/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
diff --git a/package/liboil/Config.in b/package/liboil/Config.in
new file mode 100644
index 0000000..0acbbfc
--- /dev/null
+++ b/package/liboil/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBOIL
+	bool "liboil"
+	help
+	  Library of simple functions that are optimized for various CPUs.
+
+	  http://liboil.freedesktop.org/
diff --git a/package/liboil/liboil.mk b/package/liboil/liboil.mk
new file mode 100644
index 0000000..092c83f
--- /dev/null
+++ b/package/liboil/liboil.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# liboil
+#
+#############################################################
+LIBOIL_VERSION = 0.3.15
+LIBOIL_SOURCE = liboil-$(LIBOIL_VERSION).tar.gz
+LIBOIL_SITE = http://liboil.freedesktop.org/download
+LIBOIL_AUTORECONF = NO
+LIBOIL_INSTALL_STAGING = YES
+LIBOIL_INSTALL_TARGET = YES
+
+# Checking if unaligned memory access works correctly cannot be done when cross
+# compiling. For the following architectures there is no information available
+# in the configure script.
+ifeq ($(BR2_avr32),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=no
+endif
+ifeq ($(BR2_cris),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
+endif
+ifeq ($(BR2_nios2),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=no
+endif
+ifeq ($(BR2_s390),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
+endif
+ifeq ($(BR2_x86_64),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
+endif
+
+LIBOIL_DEPENDENCIES = uclibc libglib2
+
+$(eval $(call AUTOTARGETS,package,liboil))
-- 
1.6.0.4.762.g0567f
