From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 18:56:32 +0100
Subject: [Buildroot] [git commit] postgresql: enable uclibc build
Message-ID: <20150315181408.3035A8073F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5e4ca10220e2325d3a34c0a423388e40b27dbdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with uclibc and locale support failes with the following error
message:

regc_pg_locale.c: In function ???pg_wc_isdigit???:
regc_pg_locale.c:312:6: error: dereferencing pointer to incomplete type
      isdigit_l((unsigned char) c, pg_regex_locale));

This can be fixed by overwriting the HAVE_LOCALE_T detection (thanks
to Alex Potapenko <opotapenko@gmail.com> for the hint [1]).

[1] http://lists.busybox.net/pipermail/buildroot/2015-March/121088.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/Config.in     |    7 -------
 package/postgresql/postgresql.mk |    8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 3ef5e6c..519b2a1 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
-	# PostgreSQL does not build against uClibc with locales
-	# enabled, due to an uClibc bug, see
-	# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html.
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
@@ -16,6 +12,3 @@ config BR2_PACKAGE_POSTGRESQL
 	  archives with pg_dump and pg_restore.
 
 	  http://www.postgresql.org
-
-comment "postgresql needs a toolchain w/ glibc"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7dfef06..03154af 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,6 +13,14 @@ POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# PostgreSQL does not build against uClibc with locales
+# enabled, due to an uClibc bug, see
+# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
+# so overwrite automatic detection and disable locale support
+POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
+endif
+
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
