From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 23 Oct 2018 13:15:55 -0400
Subject: [Buildroot] [PATCH] PostgreSQL: bump version to 11.0
Message-ID: <20181023171555.18043-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:
 - Add --without-llvm to CONF_OPTS as PostgreSQL now comes with an optional
   JIT.

 - Add POSTGRESQL_MAKE_OPTS += MAKELEVEL=0 to the MK file to avoid compiling
   errors about missing header files.

All test-pkg runs passed:
             br-arm-full [1/6]: OK
  br-arm-cortex-a9-glibc [2/6]: OK
   br-arm-cortex-m4-full [3/6]: SKIPPED
          br-x86-64-musl [4/6]: OK
      br-arm-full-static [5/6]: SKIPPED
armv5-ctng-linux-gnueabi [6/6]: OK

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/postgresql/postgresql.hash |  4 ++--
 package/postgresql/postgresql.mk   | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index a9cc93c76c..cfea589040 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v10.5/postgresql-10.5.tar.bz2.sha256
-sha256	6c8e616c91a45142b85c0aeb1f29ebba4a361309e86469e0fb4617b6a73c4011	postgresql-10.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v11.0/postgresql-11.0.tar.bz2.sha256
+sha256	bf9bba03d0c3902c188af12e454b35343c4a9bf9e377ec2fe50132efb44ef36b	postgresql-11.0.tar.bz2
 
 # License file, Locally calculated
 sha256	24cfc70cf16b3a23242c49ffce39510683bdd48cbedb8a46fe03976ee5f5c21e	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 540e1540ca..2915f5ce59 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 10.5
+POSTGRESQL_VERSION = 11.0
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
@@ -15,7 +15,14 @@ POSTGRESQL_CONF_ENV = \
 	ac_cv_type_struct_sockaddr_in6=yes \
 	pgac_cv_snprintf_long_long_int_modifier="ll" \
 	pgac_cv_snprintf_size_t_support=yes
-POSTGRESQL_CONF_OPTS = --disable-rpath
+
+POSTGRESQL_CONF_OPTS = \
+	--disable-rpath \
+	--without-llvm
+
+# This has to be set because Postgres' Makefile is being called from another
+# MakeFile in order to avoid rebuilding generated headers in recursive submakes.
+POSTGRESQL_MAKE_OPTS += MAKELEVEL=0
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # PostgreSQL does not build against uClibc with locales
-- 
2.17.2
