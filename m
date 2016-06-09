From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Thu,  9 Jun 2016 16:46:16 +0200
Subject: [Buildroot] [PATCH 2/2 v2] couchdb: New package.
In-Reply-To: <1465483576-28267-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <20160520162929.04ca1b1b@free-electrons.com>
 <1465483576-28267-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <1465483576-28267-3-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
v1 -> v2:
* added default file to S96prepare-couchdb init script, to allow
  customizing where to store the log and maybe store the data on a
  tmpfs too.
* addressed arnout comments.

 package/Config.in                              |  1 +
 package/couchdb/0001-remove-unsafe-paths.patch | 41 +++++++++++++++++++++
 package/couchdb/Config.in                      | 22 +++++++++++
 package/couchdb/S96prepare-couchdb             | 14 +++++++
 package/couchdb/couchdb.hash                   |  6 +++
 package/couchdb/couchdb.mk                     | 51 ++++++++++++++++++++++++++
 6 files changed, 135 insertions(+)
 create mode 100644 package/couchdb/0001-remove-unsafe-paths.patch
 create mode 100644 package/couchdb/Config.in
 create mode 100644 package/couchdb/S96prepare-couchdb
 create mode 100644 package/couchdb/couchdb.hash
 create mode 100644 package/couchdb/couchdb.mk

diff --git a/package/Config.in b/package/Config.in
index 4729b63..256b4e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -866,6 +866,7 @@ endmenu
 
 menu "Database"
 	source "package/berkeleydb/Config.in"
+	source "package/couchdb/Config.in"
 	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
 	source "package/kompexsqlite/Config.in"
diff --git a/package/couchdb/0001-remove-unsafe-paths.patch b/package/couchdb/0001-remove-unsafe-paths.patch
new file mode 100644
index 0000000..45b8170
--- /dev/null
+++ b/package/couchdb/0001-remove-unsafe-paths.patch
@@ -0,0 +1,41 @@
+From 39b34b35ac4741f65c0a4707b480301154ab2de5 Mon Sep 17 00:00:00 2001
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+Date: Thu, 19 May 2016 16:52:53 +0200
+Subject: configure.ac: Remove unsafe paths
+
+Remove the unconditionnally added paths to the host.
+
+Upstream-Status: not-applicable: later versions do not use autotools
+anymore, but rebar.
+
+Signed-Off-By: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+
+---
+ configure.ac | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bf9ffc4..7b95554 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -195,17 +195,6 @@ AC_ARG_ENABLE([js-trunk],
+ AC_ARG_VAR([ERLC_FLAGS], [general flags to prepend to ERLC_FLAGS])
+ AC_ARG_VAR([FLAGS], [general flags to prepend to LDFLAGS and CPPFLAGS])
+ 
+-AS_CASE([$(uname -s)], [CYGWIN*], [] , [*], [
+-    CPPFLAGS="$CPPFLAGS -I/opt/local/include"
+-    CPPFLAGS="$CPPFLAGS -I/opt/local/include/js"
+-    CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-    CPPFLAGS="$CPPFLAGS -I/usr/local/include/js"
+-    CPPFLAGS="$CPPFLAGS -I/usr/include"
+-    CPPFLAGS="$CPPFLAGS -I/usr/include/js"
+-    LDFLAGS="$LDFLAGS -L/opt/local/lib"
+-    LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-])
+-
+ CPPFLAGS="$CPPFLAGS $FLAGS"
+ LDFLAGS="$LDFLAGS $FLAGS"
+ 
+-- 
+2.8.1
+
diff --git a/package/couchdb/Config.in b/package/couchdb/Config.in
new file mode 100644
index 0000000..1b83c0b
--- /dev/null
+++ b/package/couchdb/Config.in
@@ -0,0 +1,22 @@
+comment "CouchDB need a toolchain with C++, wchar, threads, dynamic libs."
+	depends on !BR2_BINFMT_FLAT
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_COUCHDB
+	bool "couchdb"
+	depends on BR2_USE_MMU # erlang, spidermonkey185
+	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_INSTALL_LIBSTDCPP # icu, spidermonkey185
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # erlang
+	depends on !BR2_STATIC_LIBS # erlang
+	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
+	depends on BR2_USE_WCHAR # icu
+
+	select BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_SPIDERMONKEY185
diff --git a/package/couchdb/S96prepare-couchdb b/package/couchdb/S96prepare-couchdb
new file mode 100644
index 0000000..2f36436
--- /dev/null
+++ b/package/couchdb/S96prepare-couchdb
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+REQUIRED_DIRS=/var/log/couchdb
+
+PREPARE_COUCHDB_DEFAULT=/etc/default/prepare-couchdb
+
+if [ -r "$PREPARE_COUCHDB_DEFAULT" ]; then
+	. "$PREPARE_COUCHDB_DEFAULT"
+fi
+
+case "$1" in
+	start)
+		install -d -o couchdb -g couchdb $REQUIRED_DIRS;;
+esac
diff --git a/package/couchdb/couchdb.hash b/package/couchdb/couchdb.hash
new file mode 100644
index 0000000..a8e702f
--- /dev/null
+++ b/package/couchdb/couchdb.hash
@@ -0,0 +1,6 @@
+# From https://archive.apache.org/dist/couchdb/source/1.6.1/apache-couchdb-1.6.1.tar.gz.{md5,sha}
+sha1	6275f3818579d7b307052e9735c42a8a64313229	apache-couchdb-1.6.1.tar.gz
+md5	01a2c8ab4fcde457529428993901a060		apache-couchdb-1.6.1.tar.gz
+
+# Locally generated after checking PGP signature
+sha256	5a601b173733ce3ed31b654805c793aa907131cd70b06d03825f169aa48c8627	apache-couchdb-1.6.1.tar.gz
diff --git a/package/couchdb/couchdb.mk b/package/couchdb/couchdb.mk
new file mode 100644
index 0000000..38a500f
--- /dev/null
+++ b/package/couchdb/couchdb.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# CouchDB
+#
+################################################################################
+
+COUCHDB_VERSION = 1.6.1
+COUCHDB_SITE = \
+	http://archive.apache.org/dist/couchdb/source/${COUCHDB_VERSION}
+COUCHDB_SOURCE = apache-couchdb-${COUCHDB_VERSION}.tar.gz
+
+COUCHDB_LICENSE = Apache-2.0
+COUCHDB_LICENSE_FILES = LICENSE
+
+COUCHDB_DEPENDENCIES = host-autoconf-archive host-pkgconf \
+	erlang icu libcurl openssl spidermonkey185
+
+# configure.ac is patched.
+COUCHDB_AUTORECONF = YES
+COUCHDB_AUTORECONF_OPTS = -I $(HOST_DIR)/usr/share/autoconf-archive
+
+COUCHDB_CONF_ENV = \
+	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config \
+	ICU_CONFIG=$(STAGING_DIR)/usr/bin/icu-config
+COUCHDB_CONF_OPTS = $(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),,--disable-init)
+
+# CouchDB's build system mixes the erl for the host and the erl for the
+# target.
+define COUCHDB_FIX_ERL_PATH
+	sed -i -re 's,$(HOST_DIR),,' \
+		$(TARGET_DIR)/usr/bin/couchdb \
+		$(TARGET_DIR)/usr/bin/couch-config
+endef
+COUCHDB_POST_INSTALL_TARGET_HOOKS += COUCHDB_FIX_ERL_PATH
+
+define COUCHDB_INSTALL_INIT_SYSV
+	mv $(TARGET_DIR)/etc/init.d/couchdb $(TARGET_DIR)/etc/init.d/S97couchdb
+	install -m 755 package/couchdb/S96prepare-couchdb \
+		$(TARGET_DIR)/etc/init.d/
+endef
+
+define COUCHDB_USERS
+	couchdb -1 couchdb -1 ! - /bin/sh - CouchDB Server
+endef
+
+define COUCHDB_PERMISSIONS
+	/etc/couchdb		r	755	couchdb	couchdb - - - -
+	/var/lib/couchdb	d	750	couchdb	couchdb - - - -
+endef
+
+$(eval $(autotools-package))
-- 
2.8.1
