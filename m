From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Jan 2020 18:40:13 -0700
Subject: [Buildroot] [PATCH 1/2] package/gensio: new package
Message-ID: <20200121014014.32703-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A library to abstract stream I/O like serial port, TCP, telnet, UDP,
SSL, IPMI SOL, etc.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/gensio/Config.in   |  8 ++++++++
 package/gensio/gensio.hash |  6 ++++++
 package/gensio/gensio.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 41 insertions(+)
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
index 4c94914680..e932d46ef8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1992,6 +1992,7 @@ menu "Networking applications"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
+	source "package/gensio/Config.in"
 	source "package/gerbera/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/glorytun/Config.in"
diff --git a/package/gensio/Config.in b/package/gensio/Config.in
new file mode 100644
index 0000000000..b3931033d2
--- /dev/null
+++ b/package/gensio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GENSIO
+	bool "gensio"
+	depends on BR2_USE_MMU # fork()
+	help
+	  A library to abstract stream I/O like serial port, TCP, telnet, UDP,
+	  SSL, IPMI SOL, etc.
+
+	  https://github.com/cminyard/gensio
diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
new file mode 100644
index 0000000000..a4de99627c
--- /dev/null
+++ b/package/gensio/gensio.hash
@@ -0,0 +1,6 @@
+# From https://sourceforge.net/projects/ser2net/files/ser2net/
+md5 34e1d41fff06fe7d3b98887fff6c2e90  gensio-1.3.3.tar.gz
+sha1 50f3901378cab229594cfab4dafe4b6846957524  gensio-1.3.3.tar.gz
+# Locally computed:
+sha256 26f94b4fb8d689fc381c5fa7aa04db84b97785016c00e2bad8803d1bc668aa9b  gensio-1.3.3.tar.gz
+sha256 501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
new file mode 100644
index 0000000000..5c8e893d42
--- /dev/null
+++ b/package/gensio/gensio.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# gensio
+#
+################################################################################
+
+GENSIO_VERSION = 1.3.3
+GENSIO_SOURCE = gensio-$(GENSIO_VERSION).tar.gz
+GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
+GENSIO_LICENSE = GPL-2.0+
+GENSIO_LICENSE_FILES = COPYING
+GENSIO_INSTALL_STAGING = YES
+
+GENSIO_CONF_OPTS += \
+	--without-openipmi \
+	--without-swig \
+	--without-python
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
