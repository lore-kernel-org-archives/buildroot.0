From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 24 Jan 2020 22:46:17 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/gensio: new package
Message-ID: <20200125054617.66028-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A library to abstract stream I/O like serial port, TCP, telnet, UDP,
SSL, IPMI SOL, etc.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix openssl path
  - fix licenses
  - fix config description format
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/gensio/Config.in   |  8 ++++++++
 package/gensio/gensio.hash |  7 +++++++
 package/gensio/gensio.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/gensio/Config.in
 create mode 100644 package/gensio/gensio.hash
 create mode 100644 package/gensio/gensio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a1eb052652..07fd0e0055 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1132,6 +1132,7 @@ F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
+F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
 F:	package/pipewire/
diff --git a/package/Config.in b/package/Config.in
index 4c94914680..592f827c0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1623,6 +1623,7 @@ menu "Networking"
 	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
 	source "package/freeradius-client/Config.in"
+	source "package/gensio/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
 	source "package/grpc/Config.in"
diff --git a/package/gensio/Config.in b/package/gensio/Config.in
new file mode 100644
index 0000000000..f874d1a469
--- /dev/null
+++ b/package/gensio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GENSIO
+	bool "gensio"
+	depends on BR2_USE_MMU # fork()
+	help
+	  A library to abstract stream I/O like serial port, TCP,
+	  telnet, UDP, SSL, IPMI SOL, etc.
+
+	  https://github.com/cminyard/gensio
diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
new file mode 100644
index 0000000000..e3c0f02067
--- /dev/null
+++ b/package/gensio/gensio.hash
@@ -0,0 +1,7 @@
+# From https://sourceforge.net/projects/ser2net/files/ser2net/
+md5 34e1d41fff06fe7d3b98887fff6c2e90  gensio-1.3.3.tar.gz
+sha1 50f3901378cab229594cfab4dafe4b6846957524  gensio-1.3.3.tar.gz
+# Locally computed:
+sha256 26f94b4fb8d689fc381c5fa7aa04db84b97785016c00e2bad8803d1bc668aa9b  gensio-1.3.3.tar.gz
+sha256 501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
+sha256 dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
new file mode 100644
index 0000000000..e883496081
--- /dev/null
+++ b/package/gensio/gensio.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# gensio
+#
+################################################################################
+
+GENSIO_VERSION = 1.3.3
+GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
+GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
+GENSIO_LICENSE_FILES = COPYING.LIB COPYING
+GENSIO_INSTALL_STAGING = YES
+
+GENSIO_CONF_OPTS += \
+	--without-openipmi \
+	--without-swig \
+	--without-python \
+	--with-openssl=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+GENSIO_DEPENDENCIES += openssl
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+GENSIO_CONF_OPTS += --with-pthreads
+else
+GENSIO_CONF_OPTS += --without-pthreads
+endif
+
+$(eval $(autotools-package))
-- 
2.20.1
