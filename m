From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  1 Jul 2016 18:32:22 +0200
Subject: [Buildroot] [PATCH v4] package/libuio: new package
Message-ID: <1467390742-19307-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joris Lijssens <joris.lijssens@gmail.com>

[Romain:
  fix autoreconf issue by using GETTEXTIZE and AUTORECONF
  fix issue with missing makeinfo
  move version number comment in .mk]
Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/Config.in                                  |  1 +
 .../0001-configure-remove-po-Makefile.in.patch     | 26 +++++++++++++++++++++
 package/libuio/Config.in                           |  8 +++++++
 package/libuio/libuio.hash                         |  2 ++
 package/libuio/libuio.mk                           | 27 ++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/libuio/0001-configure-remove-po-Makefile.in.patch
 create mode 100644 package/libuio/Config.in
 create mode 100644 package/libuio/libuio.hash
 create mode 100644 package/libuio/libuio.mk

diff --git a/package/Config.in b/package/Config.in
index f120025..280be4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -410,6 +410,7 @@ endif
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
+	source "package/libuio/Config.in"
 	source "package/libump/Config.in"
 	source "package/linux-backports/Config.in"
 	source "package/lirc-tools/Config.in"
diff --git a/package/libuio/0001-configure-remove-po-Makefile.in.patch b/package/libuio/0001-configure-remove-po-Makefile.in.patch
new file mode 100644
index 0000000..067465c
--- /dev/null
+++ b/package/libuio/0001-configure-remove-po-Makefile.in.patch
@@ -0,0 +1,26 @@
+From c5fa0b778e1c2a7d03ff6e661bdfa2faef878f68 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Fri, 1 Jul 2016 17:56:30 +0200
+Subject: [PATCH] configure: remove po/Makefile.in
+
+The file po/Makefile.in is automatically added to AC_OUTPUT while using gettexize
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f7fb40f..a25e463 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,5 +55,4 @@ dnl last but not least
+ AC_OUTPUT([Makefile
+ 	libuio.dox
+ 	libuio-uninstalled.pc
+-	libuio.pc
+-	po/Makefile.in])
++	libuio.pc])
+-- 
+2.5.5
+
diff --git a/package/libuio/Config.in b/package/libuio/Config.in
new file mode 100644
index 0000000..97be1e3
--- /dev/null
+++ b/package/libuio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBUIO
+	bool "libuio"
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	help
+	  libuio is a light-weight C programming library to handle UIO
+	  (Userspace I/O) device discovery and binding task.
+
+	  http://github.com/Linutronix/libuio
diff --git a/package/libuio/libuio.hash b/package/libuio/libuio.hash
new file mode 100644
index 0000000..6afe7de
--- /dev/null
+++ b/package/libuio/libuio.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 57f9617f75d20f7912b270568cffdf098fe9d0c1ca690c002e949be8424aa4e6 libuio-940861de278cb794bf9d775b76a4d1d4f9108607.tar.gz
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
new file mode 100644
index 0000000..cead7f2
--- /dev/null
+++ b/package/libuio/libuio.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libuio
+#
+################################################################################
+
+# v0.2.7
+LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607
+LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
+LIBUIO_LICENSE = LGPLv2.1
+LIBUIO_LICENSE_FILES = COPYING
+LIBUIO_CONF_OPTS = --with-glib=no 
+LIBUIO_INSTALL_STAGING = YES
+
+# Fetched from github, no pre-generated configure script provided
+LIBUIO_GETTEXTIZE = YES
+LIBUIO_AUTORECONF = YES
+
+# Avoid build issue when makeinfo is missing
+LIBUIO_CONF_ENV += MAKEINFO=true
+
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+LIBUIO_DEPENDENCIES += argp-standalone
+LIBUIO_CONF_ENV += LIBS="-largp"
+endif
+
+$(eval $(autotools-package))
-- 
2.5.5
