From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 25 Jan 2021 14:36:13 +0300
Subject: [Buildroot] [PATCH] package/postgresql: add full build option
In-Reply-To: <20210125113613.865987-1-fido_max@inbox.ru>
References: <20210125113613.865987-1-fido_max@inbox.ru>
Message-ID: <20210125113613.865987-2-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Postgresql includes some extra additional loadable modules.
We need just to pass "world/install-world" as make/install targets
to build this modules.

As a side effect documentation will also be built by "make world".

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/Config.in     | 9 +++++++++
 package/postgresql/postgresql.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 2f677daf5b..d162ab2bab 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -22,3 +22,12 @@ config BR2_PACKAGE_POSTGRESQL
 comment "postgresql needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
+if BR2_PACKAGE_POSTGRESQL
+
+config BR2_PACKAGE_POSTGRESQL_FULL
+	bool "postgresql-full"
+	help
+	  Build PostgreSQL, contrib, and documentation.
+
+endif
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 6c0726e88b..76d1202de0 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -23,6 +23,12 @@ POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # manually, you must unset MAKELEVEL or set it to zero"
 POSTGRESQL_MAKE_OPTS = MAKELEVEL=0
 
+ifeq ($(BR2_PACKAGE_POSTGRESQL_FULL),y)
+POSTGRESQL_MAKE_OPTS += world
+POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
+POSTGRESQL_INSTALL_STAGING_OPTS += DESTDIR=$(STAGING_DIR) install-world
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # PostgreSQL does not build against uClibc with locales
 # enabled, due to an uClibc bug, see
-- 
2.29.2
