From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 14 Apr 2016 09:53:58 +0100
Subject: [Buildroot] [PATCH v2] postgresql: bump version to 9.5.2
Message-ID: <1460624038-17785-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove a patch which is no longer necessary and do not autoreconf.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - autoreconf is no longer needed since we removed the 0001 patch.
   (Highlighted by Thomas Petazzoni)

 ...ker-compiler-output-with-their-default-ou.patch | 56 ----------------------
 package/postgresql/postgresql.hash                 |  4 +-
 package/postgresql/postgresql.mk                   |  3 +-
 3 files changed, 3 insertions(+), 60 deletions(-)
 delete mode 100644 package/postgresql/0001-Compare-linker-compiler-output-with-their-default-ou.patch

diff --git a/package/postgresql/0001-Compare-linker-compiler-output-with-their-default-ou.patch b/package/postgresql/0001-Compare-linker-compiler-output-with-their-default-ou.patch
deleted file mode 100644
index 3eca82f..0000000
--- a/package/postgresql/0001-Compare-linker-compiler-output-with-their-default-ou.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 58d05b2a57802345f43e628bc0807dbf0116cdcc Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Fri, 20 Mar 2015 16:37:51 +0300
-Subject: [PATCH] Compare linker/compiler output with their default output
-
-linker and compiler may have noisy output by default, making
-acx_pthread.m4 believe that pthread options that it tries are ignored
-as invalid.
-
-Record default compiler and linker output and see if adding pthread
-option changes that, instead of assuming that linker and compiler are
-silent by default.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- config/acx_pthread.m4 | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/config/acx_pthread.m4 b/config/acx_pthread.m4
-index 581164b..d254612 100644
---- a/config/acx_pthread.m4
-+++ b/config/acx_pthread.m4
-@@ -80,6 +80,22 @@
- esac
- 
- if test x"$acx_pthread_ok" = xno; then
-+
-+cat >conftest.$ac_ext <<_ACEOF
-+int
-+main (int argc, char **argv)
-+{
-+  (void) argc;
-+  (void) argv;
-+  return 0;
-+}
-+_ACEOF
-+rm -f conftest.$ac_objext conftest$ac_exeext
-+
-+# Record the default linker and compiler output
-+ld_default_output="`(eval $ac_link 2>&1 1>&5)`"
-+cc_default_output="`(eval $ac_compile 2>&1 1>&5)`"
-+
- for flag in $acx_pthread_flags; do
- 
-         tryPTHREAD_CFLAGS=""
-@@ -143,7 +159,7 @@
- _ACEOF
-             rm -f conftest.$ac_objext conftest$ac_exeext
-             # Check both linking and compiling, because they might tolerate different options.
--            if test "`(eval $ac_link 2>&1 1>&5)`" = "" && test "`(eval $ac_compile 2>&1 1>&5)`" = ""; then
-+            if test "`(eval $ac_link 2>&1 1>&5)`" = "$ld_default_output" && test "`(eval $ac_compile 2>&1 1>&5)`" = "$cc_default_output"; then
-                 # we continue with more flags because Linux needs -lpthread
-                 # for libpq builds on PostgreSQL.  The test above only
-                 # tests for building binaries, not shared libraries.
--- 
-1.8.1.4
diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 9015e99..4e4adcb 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.4.6/postgresql-9.4.6.tar.bz2.sha256
-sha256	cbce1f4d01a6142c5d8bebe125623c5198ec04f363da7dd3d3b3a4100b4140a6  postgresql-9.4.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.5.2/postgresql-9.5.2.tar.bz2.sha256
+sha256 f8d132e464506b551ef498719f18cfe9d777709c7a1589dc360afc0b20e47c41  postgresql-9.5.2.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 444c1b1..3572821 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.4.6
+POSTGRESQL_VERSION = 9.5.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
@@ -14,7 +14,6 @@ POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
 		      pgac_cv_snprintf_long_long_int_format="%lld" \
 		      pgac_cv_snprintf_size_t_support=yes
-POSTGRESQL_AUTORECONF = YES
 POSTGRESQL_CONF_OPTS = --disable-rpath
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.7.3
