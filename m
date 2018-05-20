From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 22:24:37 +0200
Subject: [Buildroot] [git commit branch/next] libgit2: new package
Message-ID: <20180520202408.EF22781158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02f6e638c877ebc5b1d142bee077d6a241b99474
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
[Thomas:
 - Do not select BR2_PACKAGE_ZLIB, because zlib is an optional
   dependency.
 - Handle optional dependencies in a more usual way in libgit2.mk:
   group the addition in _DEPENDENCIES and in _CONF_OPTS for a given
   library together.
 - libgit2 can optionally use libssh2, not libssh.
 - Add the optional dependency on zlib.
 - Always pass USE_ICONV=ON, the detection works perfectly fine, with
   both a C library providing iconv support built-in, and with
   libiconv. If neither provides iconv, it gets disabled automatically
   as expected.
 - Add libiconv as an optional dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/libgit2/Config.in    |  8 +++++++
 package/libgit2/libgit2.hash |  3 +++
 package/libgit2/libgit2.mk   | 54 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 978ba9625c..78c356fed9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1394,6 +1394,9 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
 F:	package/evemu/
 F:	package/libevdev/
 
+N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+F:	package/libgit2/
+
 N:	Nicolas Serafini <nicolas.serafini@sensefly.com>
 F:	package/exiv2/
 F:	package/nvidia-tegra23/nvidia-tegra23-binaries/
diff --git a/package/Config.in b/package/Config.in
index 6c0583a745..b66f27a083 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1101,6 +1101,7 @@ menu "Database"
 	source "package/hiredis/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/libgit2/Config.in"
 	source "package/libpqxx/Config.in"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
new file mode 100644
index 0000000000..24a1f3b5a9
--- /dev/null
+++ b/package/libgit2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBGIT2
+	bool "libgit2"
+	help
+	  libgit2 is a portable, pure C implementation of the Git core
+	  methods provided as a linkable library with a solid API,
+	  allowing to build Git functionality into your application.
+
+	  https://github.com/libgit2/libgit2
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
new file mode 100644
index 0000000000..cc09af3627
--- /dev/null
+++ b/package/libgit2/libgit2.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	6a62393e0ceb37d02fe0d5707713f504e7acac9006ef33da1e88960bd78b6eac  libgit2-v0.26.0.tar.gz
+sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
new file mode 100644
index 0000000000..277a8d46ac
--- /dev/null
+++ b/package/libgit2/libgit2.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# libgit2
+#
+################################################################################
+
+LIBGIT2_VERSION = v0.26.0
+LIBGIT2_SITE = $(call github,libgit2,libgit2,$(LIBGIT2_VERSION))
+LIBGIT2_LICENSE = GPL-2.0 with linking exception
+LIBGIT2_LICENSE_FILES = COPYING
+LIBGIT2_INSTALL_STAGING = YES
+
+LIBGIT2_CONF_OPTS = \
+	-DUSE_GSSAPI=OFF \
+	-DBUILD_CLAR=OFF \
+	-DUSE_ICONV=ON \
+	-DTHREADSAFE=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
+
+# If libiconv is available (for !locale toolchains), then we can use
+# it for iconv support. Note that USE_ICONV=ON is still correct even
+# without libiconv because (1) most toolchain have iconv support
+# without libiconv and (2) even if USE_ICONV=ON but iconv support is
+# not available, libgit2 simply avoids using iconv.
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+LIBGIT2_DEPENDENCIES += libiconv
+endif
+
+# No option to explicitly enable/disable zlib
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBGIT2_DEPENDENCIES += zlib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+LIBGIT2_DEPENDENCIES += libssh2
+LIBGIT2_CONF_OPTS += -DUSE_SSH=ON
+else
+LIBGIT2_CONF_OPTS += -DUSE_SSH=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBGIT2_DEPENDENCIES += openssl
+LIBGIT2_CONF_OPTS += -DUSE_OPENSSL=ON
+else
+LIBGIT2_CONF_OPTS += -DUSE_OPENSSL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBGIT2_DEPENDENCIES += libcurl
+LIBGIT2_CONF_OPTS += -DCURL=ON
+else
+LIBGIT2_CONF_OPTS += -DCURL=OFF
+endif
+
+$(eval $(cmake-package))
