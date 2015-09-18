From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Sep 2015 10:10:17 +0200
Subject: [Buildroot] [git commit] libcddb: new package
Message-ID: <20150918083147.42E57819C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c932281060638c21d7705e5f42ece1db83c9e1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/libcddb/Config.in    |   20 ++++++++++++++++++++
 package/libcddb/libcddb.hash |    2 ++
 package/libcddb/libcddb.mk   |   26 ++++++++++++++++++++++++++
 4 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index de072e1..8c82534 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -696,6 +696,7 @@ menu "Audio/Sound"
 	source "package/libao/Config.in"
 	source "package/libbroadvoice/Config.in"
 	source "package/libcdaudio/Config.in"
+	source "package/libcddb/Config.in"
 	source "package/libcdio/Config.in"
 	source "package/libcodec2/Config.in"
 	source "package/libcue/Config.in"
diff --git a/package/libcddb/Config.in b/package/libcddb/Config.in
new file mode 100644
index 0000000..f2bb827
--- /dev/null
+++ b/package/libcddb/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBCDDB
+	bool "libcddb"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Libcddb is a C library to access data on a CDDB server
+	  (freedb.org). It allows you to:
+	    * search the database for possible CD matches;
+	    * retrieve detailed information about a specific CD;
+	    * submit new CD entries to the database.
+
+	  http://libcddb.sourceforge.net/index.html
+
+if BR2_PACKAGE_LIBCDDB
+
+config BR2_PACKAGE_LIBCDDB_INSTALL_CDDB_QUERY
+	bool "install cddb_query"
+	help
+	  cddb_query is an optionnal libcddb test program.
+
+endif
diff --git a/package/libcddb/libcddb.hash b/package/libcddb/libcddb.hash
new file mode 100644
index 0000000..9e60683
--- /dev/null
+++ b/package/libcddb/libcddb.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	35ce0ee1741ea38def304ddfe84a958901413aa829698357f0bee5bb8f0a223b	libcddb-1.3.2.tar.bz2
diff --git a/package/libcddb/libcddb.mk b/package/libcddb/libcddb.mk
new file mode 100644
index 0000000..7ddb1e7
--- /dev/null
+++ b/package/libcddb/libcddb.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libcddb
+#
+################################################################################
+
+LIBCDDB_VERSION = 1.3.2
+LIBCDDB_SOURCE = libcddb-$(LIBCDDB_VERSION).tar.bz2
+LIBCDDB_SITE = http://downloads.sourceforge.net/libcddb/
+LIBCDDB_LICENSE = LGPLv2+
+LIBCDDB_LICENSE_FILES = COPYING
+LIBCDDB_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+LIBCDDB_DEPENDENCIES += libiconv
+endif
+
+define LIBCDDB_REMOVE_CDDB_QUERY
+	rm -f $(TARGET_DIR)/usr/bin/cddb_query
+endef
+
+ifeq ($(BR2_PACKAGE_LIBCDDB_INSTALL_CDDB_QUERY),)
+LIBCDDB_POST_INSTALL_TARGET_HOOKS += LIBCDDB_REMOVE_CDDB_QUERY
+endif
+
+$(eval $(autotools-package))
