From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:00:48 +0100
Subject: [Buildroot] [git commit] package/postgresql: add some additional
 output to pg_config
Message-ID: <20210125204123.E0E8583840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3ff618bd84f67992d354f0cc3343813b214b6a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some external packages call pg_config to determine the installed
PostgreSQL options. Add this output to Buildroots own pg_config,
so these packages correctly compile.

Added options:
	--pkgincludedir
	--pgxs
	--cflags
	--cc
	--pkglibdir
	--bindir
	--sharedir
	--localedir
	--docdir
	--mandir

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/pg_config     | 51 ++++++++++++++++++++++++++++++++++++++--
 package/postgresql/postgresql.mk |  2 ++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/package/postgresql/pg_config b/package/postgresql/pg_config
index 59a9e6cfad..3b0cb35f2c 100644
--- a/package/postgresql/pg_config
+++ b/package/postgresql/pg_config
@@ -2,7 +2,6 @@
 
 #
 # Minimal pg_config implementation as replacement for the native pg_config application
-# Only implements --includedir and --libdir
 #
 
 prefix=/usr
@@ -11,6 +10,9 @@ case "$1" in
   --includedir)
 	echo "$prefix/include"
 	;;
+  --pkgincludedir)
+	echo "$prefix/include/postgresql"
+	;;
   --includedir-server)
 	echo "$prefix/include/postgresql/server"
 	;;
@@ -23,6 +25,51 @@ case "$1" in
   --configure)
 	echo "@POSTGRESQL_CONF_OPTIONS@"
 	;;
+  --pgxs)
+	echo "$prefix/lib/postgresql/pgxs/src/makefiles/pgxs.mk"
+	;;
+  --cflags)
+	echo "@TARGET_CFLAGS@"
+	;;
+  --cc)
+	echo "@TARGET_CC@"
+	;;
+  --pkglibdir)
+	echo "/usr/lib/postgresql"
+	;;
+  --bindir)
+	echo "/usr/bin"
+	;;
+  --sharedir)
+	echo "/usr/share/postgresql"
+	;;
+  --localedir)
+	echo "/usr/share/locale"
+	;;
+  --docdir)
+	echo "/usr/share/doc/postgresql"
+	;;
+  --mandir)
+	echo "/usr/share/man"
+	;;
   *)
-	echo "Usage: $0 {--includedir|--includedir-server|--libdir|--version|--configure}"
+	echo "Usage: $0 {OPTION}"
+	echo
+	echo "Options:"
+	echo
+	echo "	--includedir		show location of C header files of the client interfaces"
+	echo "	--pkgincludedir		show location of other C header files"
+	echo "	--includedir-server	show location of C header files for the server"
+	echo "	--libdir		show location of object code libraries"
+	echo "	--version		show the PostgreSQL version"
+	echo "	--configure		show options given to configure script"
+	echo "	--pgxs			show location of extension makefile"
+	echo "	--cflags		show CFLAGS value used when PostgreSQL was built"
+	echo "	--cc			show CC value used when PostgreSQL was built"
+	echo "	--pkglibdir		show location of dynamically loadable modules"
+	echo "	--bindir		show location of user executables"
+	echo "	--sharedir		show location of architecture-independent support files"
+	echo "	--localedir		show location of locale support files"
+	echo "	--docdir		show location of documentation files"
+	echo "	--mandir		show location of manual pages"
 esac
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 31c83d64c7..6c0726e88b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -116,6 +116,8 @@ define POSTGRESQL_INSTALL_CUSTOM_PG_CONFIG
 		$(STAGING_DIR)/usr/bin/pg_config
 	$(SED) "s|@POSTGRESQL_CONF_OPTIONS@|$(POSTGRESQL_CONF_OPTS)|g" $(STAGING_DIR)/usr/bin/pg_config
 	$(SED) "s|@POSTGRESQL_VERSION@|$(POSTGRESQL_VERSION)|g" $(STAGING_DIR)/usr/bin/pg_config
+	$(SED) "s|@TARGET_CFLAGS@|$(TARGET_CFLAGS)|g" $(STAGING_DIR)/usr/bin/pg_config
+	$(SED) "s|@TARGET_CC@|$(TARGET_CC)|g" $(STAGING_DIR)/usr/bin/pg_config
 endef
 
 POSTGRESQL_POST_INSTALL_STAGING_HOOKS += POSTGRESQL_INSTALL_CUSTOM_PG_CONFIG
