From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 14 Feb 2018 12:13:51 +0100
Subject: [Buildroot] [PATCH 1/1] libgit2: New package.
In-Reply-To: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
References: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20180214111351.4801-2-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/libgit2/Config.in    |  9 +++++++++
 package/libgit2/libgit2.hash |  3 +++
 package/libgit2/libgit2.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/libgit2/Config.in
 create mode 100644 package/libgit2/libgit2.hash
 create mode 100644 package/libgit2/libgit2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 293bd73797..c291156476 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1300,6 +1300,9 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
 F:	package/evemu/
 F:	package/libevdev/
 
+N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+F:	package/libgit2/
+
 N:	Nicolas Serafini <nicolas.serafini@sensefly.com>
 F:	package/exiv2/
 F:	package/nvidia-tegra23/nvidia-tegra23-binaries/
diff --git a/package/Config.in b/package/Config.in
index 19dda8aad9..94b3654210 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1071,6 +1071,7 @@ menu "Database" (i have no idea where to put it)
 	source "package/hiredis/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/libgit2/Config.in"
 	source "package/libpqxx/Config.in"
 	source "package/mongodb/Config.in"
 	source "package/mysql/Config.in"
diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
new file mode 100644
index 0000000000..53ba4d4245
--- /dev/null
+++ b/package/libgit2/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBGIT2
+	bool "libgit2"
+	select BR2_PACKAGE_ZLIB
+	help
+	  libgit2 is a portable, pure C implementation of the Git core
+	  methods provided as a linkable library with a solid API,
+	  allowing to build Git functionality into your application.
+
+	  https://github.com/libgit2/libgit2
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
new file mode 100644
index 0000000000..f642bdb230
--- /dev/null
+++ b/package/libgit2/libgit2.hash
@@ -0,0 +1,3 @@
+# Manually generated
+sha256	6a62393e0ceb37d02fe0d5707713f504e7acac9006ef33da1e88960bd78b6eac  libgit2-v0.26.0.tar.gz
+sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
new file mode 100644
index 0000000000..5dec01b337
--- /dev/null
+++ b/package/libgit2/libgit2.mk
@@ -0,0 +1,25 @@
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
+LIBGIT2_DEPENDENCIES = zlib \
+	$(if $(BR2_PACKAGE_LIBSSH),libssh) \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_LIBCURL),libcurl)
+
+# USE_ICONV looks for a Iconv.pc.  libiconv does not have it.
+LIBGIT2_CONF_OPTS = -DUSE_GSSAPI=OFF -DBUILD_CLAR=OFF -DUSE_ICONV=OFF \
+	-DTHREADSAFE=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF) \
+	-DUSE_SSH=$(if $(BR2_PACKAGE_LIBSSH),ON,OFF) \
+	-DCURL=$(if $(BR2_PACKAGE_LIBCURL),ON,OFF) \
+	-DUSE_OPENSSL=$(if $(BR2_PACKAGE_OPENSSL),ON,OFF)
+
+$(eval $(cmake-package))
-- 
2.15.1
