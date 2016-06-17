From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Fri, 17 Jun 2016 17:01:30 +0200
Subject: [Buildroot]  [PATCH v2 1/1] libuio: new package
Message-ID: <1466175690-25379-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/Config.in          |  1 +
 package/libuio/Config.in   |  8 ++++++++
 package/libuio/libuio.hash |  2 ++
 package/libuio/libuio.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/libuio/Config.in
 create mode 100644 package/libuio/libuio.hash
 create mode 100644 package/libuio/libuio.mk

diff --git a/package/Config.in b/package/Config.in
index 3d93951..4c145b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -404,6 +404,7 @@ endif
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
 	source "package/libump/Config.in"
+	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
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
index 0000000..c5c5d25
--- /dev/null
+++ b/package/libuio/libuio.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libuio
+#
+################################################################################
+
+LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607# v0.2.7
+LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
+LIBUIO_LICENSE = LGPLv2.1
+LIBUIO_LICENSE_FILES = COPYING
+LIBUIO_CONF_OPTS = --with-glib=no 
+LIBUIO_INSTALL_STAGING = YES
+# AUTORECONF doesn't seem to work
+LIBUIO_DEPENDENCIES = host-pkgconf host-gettext host-libtool \
+		      host-automake host-autoconf
+
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+LIBUIO_DEPENDENCIES += argp-standalone
+LIBUIO_CONF_ENV += LIBS="-largp"
+endif
+
+define LIBUIO_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+
+LIBUIO_PRE_CONFIGURE_HOOKS += LIBUIO_RUN_AUTOGEN
+
+$(eval $(autotools-package))
-- 
1.8.3.1
