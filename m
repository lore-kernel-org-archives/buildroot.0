From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:18:09 +0200
Subject: [Buildroot] [git commit] postgresql: add replacement pg_config
Message-ID: <20140901132446.03D509D5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9dbaa77263f545f3af5fce0276b3e34dbc467d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Normally pg_config is a native application compiled for the
target architecture. Since we cannot execute those on the
host system, provide a simple shell script as replacement.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/pg_config     |   19 +++++++++++++++++++
 package/postgresql/postgresql.mk |    8 ++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/postgresql/pg_config b/package/postgresql/pg_config
new file mode 100644
index 0000000..85c0e63
--- /dev/null
+++ b/package/postgresql/pg_config
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+#
+# Minimal pg_config implementation as replacement for the native pg_config application
+# Only implements --includedir and --libdir
+#
+
+prefix=/usr
+
+case "$1" in
+  --includedir)
+	echo "$prefix/include"
+	;;
+  --libdir)
+	echo "$prefix/lib"
+	;;
+  *)
+	echo "Usage: $0 {--includedir|--libdir}"
+esac
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 6941e55..dd2e678 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -11,6 +11,7 @@ POSTGRESQL_LICENSE = PostgreSQL
 POSTGRESQL_LICENSE_FILES = COPYRIGHT
 
 POSTGRESQL_INSTALL_STAGING = YES
+POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPT += --disable-thread-safety
@@ -55,6 +56,13 @@ endef
 
 POSTGRESQL_POST_INSTALL_TARGET_HOOKS += POSTGRESQL_INSTALL_TARGET_FIXUP
 
+define POSTGRESQL_INSTALL_CUSTOM_PG_CONFIG
+	$(INSTALL) -m 0755 -D package/postgresql/pg_config \
+		$(STAGING_DIR)/usr/bin/pg_config
+endef
+
+POSTGRESQL_POST_INSTALL_STAGING_HOOKS += POSTGRESQL_INSTALL_CUSTOM_PG_CONFIG
+
 define POSTGRESQL_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/postgresql/S50postgresql \
 		$(TARGET_DIR)/etc/init.d/S50postgresql
