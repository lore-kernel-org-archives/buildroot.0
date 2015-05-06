From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 21:36:55 +0200
Subject: [Buildroot] [git commit] package/postgresql: fix pthread flags
	detection
Message-ID: <20150506193715.2A55C81DE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=257a2393d0696ae6897f171e1e4ca66aee3892a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PostgreSQL configure may not correctly determine flags for compiling and
linking with pthreads support when compiler or linker give irrelevant
warnings.

Record default compiler and linker output and see if adding pthread
option changes that, instead of assuming that linker and compiler are
silent by default.

Fixes:
  http://autobuild.buildroot.net/results/916487aae929c181d4e3f471c6c7508552f0b683/
  http://autobuild.buildroot.net/results/921a94d1a489d81b362c5b6a403a156b4691effd/
  http://autobuild.buildroot.net/results/dbcdc58ad32b7b811ea47b6fc0f926a477e30786/
  http://autobuild.buildroot.net/results/68b582f4caec223a646f095487263353f273156d/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ker-compiler-output-with-their-default-ou.patch |   56 ++++++++++++++++++++
 package/postgresql/postgresql.mk                   |    1 +
 2 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/package/postgresql/0001-Compare-linker-compiler-output-with-their-default-ou.patch b/package/postgresql/0001-Compare-linker-compiler-output-with-their-default-ou.patch
new file mode 100644
index 0000000..3eca82f
--- /dev/null
+++ b/package/postgresql/0001-Compare-linker-compiler-output-with-their-default-ou.patch
@@ -0,0 +1,56 @@
+From 58d05b2a57802345f43e628bc0807dbf0116cdcc Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 20 Mar 2015 16:37:51 +0300
+Subject: [PATCH] Compare linker/compiler output with their default output
+
+linker and compiler may have noisy output by default, making
+acx_pthread.m4 believe that pthread options that it tries are ignored
+as invalid.
+
+Record default compiler and linker output and see if adding pthread
+option changes that, instead of assuming that linker and compiler are
+silent by default.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ config/acx_pthread.m4 | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/config/acx_pthread.m4 b/config/acx_pthread.m4
+index 581164b..d254612 100644
+--- a/config/acx_pthread.m4
++++ b/config/acx_pthread.m4
+@@ -80,6 +80,22 @@
+ esac
+ 
+ if test x"$acx_pthread_ok" = xno; then
++
++cat >conftest.$ac_ext <<_ACEOF
++int
++main (int argc, char **argv)
++{
++  (void) argc;
++  (void) argv;
++  return 0;
++}
++_ACEOF
++rm -f conftest.$ac_objext conftest$ac_exeext
++
++# Record the default linker and compiler output
++ld_default_output="`(eval $ac_link 2>&1 1>&5)`"
++cc_default_output="`(eval $ac_compile 2>&1 1>&5)`"
++
+ for flag in $acx_pthread_flags; do
+ 
+         tryPTHREAD_CFLAGS=""
+@@ -143,7 +159,7 @@
+ _ACEOF
+             rm -f conftest.$ac_objext conftest$ac_exeext
+             # Check both linking and compiling, because they might tolerate different options.
+-            if test "`(eval $ac_link 2>&1 1>&5)`" = "" && test "`(eval $ac_compile 2>&1 1>&5)`" = ""; then
++            if test "`(eval $ac_link 2>&1 1>&5)`" = "$ld_default_output" && test "`(eval $ac_compile 2>&1 1>&5)`" = "$cc_default_output"; then
+                 # we continue with more flags because Linux needs -lpthread
+                 # for libpq builds on PostgreSQL.  The test above only
+                 # tests for building binaries, not shared libraries.
+-- 
+1.8.1.4
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 85ac0e6..1a6aa88 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -12,6 +12,7 @@ POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes
+POSTGRESQL_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # PostgreSQL does not build against uClibc with locales
