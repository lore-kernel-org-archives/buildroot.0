From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 14:15:04 +0200
Subject: [Buildroot] [git commit] kompexsqlite: new package
Message-ID: <20150919121736.63188817E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddfd700a02ca6964fd3fddad6a69f53905e7235d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...kefile-use-autoconf-CXX-for-proper-builds.patch |   27 ++++++++++++++++++++
 package/kompexsqlite/Config.in                     |   12 +++++++++
 package/kompexsqlite/kompexsqlite.hash             |    2 +
 package/kompexsqlite/kompexsqlite.mk               |   14 ++++++++++
 5 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8c82534..45f2345 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -768,6 +768,7 @@ menu "Database"
 	source "package/berkeleydb/Config.in"
 	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
+	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
diff --git a/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch b/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
new file mode 100644
index 0000000..408c100
--- /dev/null
+++ b/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
@@ -0,0 +1,27 @@
+From 769693d9ddf63b04dd4aad6cad080f3cee3f997e Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 11 Jun 2015 14:08:38 -0300
+Subject: [PATCH] Makefile: use autoconf CXX for proper builds
+
+Status: applied upstream.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Makefile.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 91fb8b2..fe862cd 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -23,6 +23,7 @@ mandir = $(prefix)/share/man/man3
+ headerdir = $(prefix)/include/kompex
+ 
+ CC = @CC@
++CXX = @CXX@
+ CFLAGS = @CFLAGS@
+ CPPFLAGS = $(CFLAGS) @CPPFLAGS@
+ LDFLAGS = @LDFLAGS@
+-- 
+2.3.6
+
diff --git a/package/kompexsqlite/Config.in b/package/kompexsqlite/Config.in
new file mode 100644
index 0000000..b6d7d7f
--- /dev/null
+++ b/package/kompexsqlite/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_KOMPEXSQLITE
+	bool "kompexsqlite"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	help
+	  The Kompex SQLite Wrapper is an open source C++ wrapper
+	  library for SQLite.
+
+	  http://sqlitewrapper.kompex-online.com/index.php
+
+comment "kompexsqlite needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/kompexsqlite/kompexsqlite.hash b/package/kompexsqlite/kompexsqlite.hash
new file mode 100644
index 0000000..3c94adf
--- /dev/null
+++ b/package/kompexsqlite/kompexsqlite.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	73bec94fe5dd3a24bd8668b3a131a84dbe39a992579eebab1236aa0e73b2c9cc	v1.10.12-1.tar.gz
diff --git a/package/kompexsqlite/kompexsqlite.mk b/package/kompexsqlite/kompexsqlite.mk
new file mode 100644
index 0000000..7f57680
--- /dev/null
+++ b/package/kompexsqlite/kompexsqlite.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# kompexsqlite
+#
+################################################################################
+
+KOMPEXSQLITE_VERSION = v1.10.12-1
+KOMPEXSQLITE_SOURCE = $(KOMPEXSQLITE_VERSION).tar.gz
+KOMPEXSQLITE_SITE = https://github.com/Aethelflaed/kompex-sqlite-wrapper/archive
+KOMPEXSQLITE_INSTALL_STAGING = YES
+KOMPEXSQLITE_LICENSE = LGPLv3+ (wrapper), Public Domain (bundled sqlite)
+KOMPEXSQLITE_LICENSE_FILES = LICENSE.txt
+
+$(eval $(autotools-package))
