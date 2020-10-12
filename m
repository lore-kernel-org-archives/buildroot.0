From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Oct 2020 21:46:52 +0200
Subject: [Buildroot] [git commit] package/unixodbc: drop non upstreamable
 patch
Message-ID: <20201012194209.C5C088EB9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=915d5e6541ed44d5559ab29f221a82ce2f90e2a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is not upstreamable and replace it by using
--{dis,en}able-threads option

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/unixodbc/0001-fix-nopthread.patch | 39 -------------------------------
 package/unixodbc/unixodbc.mk              |  6 +++++
 2 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/package/unixodbc/0001-fix-nopthread.patch b/package/unixodbc/0001-fix-nopthread.patch
deleted file mode 100644
index 45933e54d6..0000000000
--- a/package/unixodbc/0001-fix-nopthread.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Fix pthread detection
-
-configure.in always calls AC_CHECK_COMP_OPT(pthread) which succeeds with the
-toolchain used although it does not contain thread support:
-
-checking for mutex_lock in -lthread ... no
-checking for pthread_mutex_lock in -lpthread... no
-checking for pthread_mutex_lock in -lc... no
-checking if compiler accepts -pthread... yes
-checking for pthread_mutex_lock in -lc... no
-checking for pthread_mutex_lock in -lpthread... no
-
-This positive configure check leads to
-
-    CFLAGS="$CFLAGS -pthread"
-
-in ./configure, line 15757 which causes a compilation bug
-/home/br/br4/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/../../../../arm-buildroot-linux-uclibcgnueab
-
-using this defconfig
-http://autobuild.buildroot.net/results/e86/e86e97ff7887f1bdc6bf913498392ff50f56ea88/defconfig
-
-This patch disables the freebsd-only code path. Patching configure directly
-prevents the need for autoreconf.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr unixODBC-2.3.2.org/configure unixODBC-2.3.2/configure
---- unixODBC-2.3.2.org/configure	2013-10-08 10:56:03.000000000 +0200
-+++ unixODBC-2.3.2/configure	2015-03-13 21:19:59.210429211 +0100
-@@ -15746,7 +15746,7 @@
- 
-     fi
- 
--    if test "x$gotthread" = "xno"; then
-+    if test "x$gotthread" = "xnot_needed_for_buildroot"; then
-       if test "x$ac_cv_c_compiler_gnu" = "xyes"; then
-                 { $as_echo "$as_me:${as_lineno-$LINENO}: checking if compiler accepts -pthread" >&5
- $as_echo_n "checking if compiler accepts -pthread... " >&6; }
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 2c936fe9d5..efcd5e3d4e 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -34,4 +34,10 @@ else
 UNIXODBC_CONF_OPTS += --disable-readline
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+UNIXODBC_CONF_OPTS += --enable-threads
+else
+UNIXODBC_CONF_OPTS += --disable-threads
+endif
+
 $(eval $(autotools-package))
