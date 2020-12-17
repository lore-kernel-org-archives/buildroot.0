From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 17 Dec 2020 16:22:07 +0300
Subject: [Buildroot] [PATCH 1/2] package/postgresql: allow to select
 postgresql version
In-Reply-To: <20201217132208.778308-1-fido_max@inbox.ru>
References: <20201217132208.778308-1-fido_max@inbox.ru>
Message-ID: <20201217132208.778308-2-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages (like timescaledb) needs older version of PostgreSQL.
Another use case is support older database format. PostgreSQL can't
automatically upgrade database to next major version.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/Config.in       | 21 +++++++++++++++++++++
 package/postgresql/postgresql.hash |  3 +++
 package/postgresql/postgresql.mk   |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 2f677daf5b..f1d2e1ff62 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -22,3 +22,24 @@ config BR2_PACKAGE_POSTGRESQL
 comment "postgresql needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
+
+choice
+	prompt "PostgreSQL Version"
+	default BR2_POSTGRESQL_VERSION_12
+	help
+	  Select the version of postgresql you wish to use.
+
+config BR2_POSTGRESQL_VERSION_12
+	bool "postgresql 12"
+
+config BR2_POSTGRESQL_VERSION_13
+	bool "postgresql 13"
+
+endchoice
+
+config BR2_POSTGRESQL_VERSION
+	string
+	default "12.5"    if BR2_POSTGRESQL_VERSION_12
+	default "13.1"    if BR2_POSTGRESQL_VERSION_13
+	depends on BR2_PACKAGE_POSTGRESQL
\ No newline at end of file
diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index ef676cccc4..ed61e79a09 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,8 @@
 # From https://ftp.postgresql.org/pub/source/v13.1/postgresql-13.1.tar.bz2.sha256
 sha256  12345c83b89aa29808568977f5200d6da00f88a035517f925293355432ffe61f  postgresql-13.1.tar.bz2
 
+# From https://ftp.postgresql.org/pub/source/v13.1/postgresql-12.5.tar.bz2.sha256
+sha256  bd0d25341d9578b5473c9506300022de26370879581f5fddd243a886ce79ff95  postgresql-12.5.tar.bz2
+
 # License file, Locally calculated
 sha256  739e5d454d81d31a482469338b7c856f1f5c6b4cdda1551cea6f0f6d18eef62c  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 98361c00c8..09f226bd85 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 13.1
+POSTGRESQL_VERSION = $(call qstrip,$(BR2_POSTGRESQL_VERSION))
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.29.2
