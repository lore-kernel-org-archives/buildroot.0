From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jan 2020 12:14:15 +0100
Subject: [Buildroot] [git commit] package/gensio: new package
Message-ID: <20200125110422.59A8D83A34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b8050eb40f136a2f0d97348bd3b8400ec8b4329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A library to abstract stream I/O like serial port, TCP, telnet, UDP,
SSL, IPMI SOL, etc.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: explain why we need to unconditionally pass --with-openssl]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/gensio/Config.in   |  8 ++++++++
 package/gensio/gensio.hash |  7 +++++++
 package/gensio/gensio.mk   | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

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
index 0000000000..4d8ee9f614
--- /dev/null
+++ b/package/gensio/gensio.mk
@@ -0,0 +1,33 @@
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
+GENSIO_CONF_OPTS = \
+	--without-openipmi \
+	--without-swig \
+	--without-python
+
+# configure script by default searches host paths for openssl,
+# breaking cross compilation. Disable this by explicitly pointing it
+# at STAGING_DIR no matter if we have openssl enabled or not as it
+# will correctly disable openssl support if not found there
+GENSIO_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
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
