From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:49:34 +0100
Subject: [Buildroot] [git commit] package/softether: fix compilation error
	due to librt linking
Message-ID: <20150315135021.1793A8077E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbed64d46b30ceb77a559573b9f88f1289643a64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/home/buildroot/instance-0/output/build/host-softether-16b713b98da8dba29f0f845d5a8c36d6f7c34824/src/Mayaqua/Unix.c:2066:
undefined reference to `clock_gettime'

[Thomas: remove commit 766366411386f5bba773042ada58e6379a3d0adf, which
was a different fix for the same problem.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/softether/0006-librt.patch |   33 +++++++++++++++++++++++++++++++++
 package/softether/softether.mk     |    6 ------
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/package/softether/0006-librt.patch b/package/softether/0006-librt.patch
new file mode 100644
index 0000000..661c960
--- /dev/null
+++ b/package/softether/0006-librt.patch
@@ -0,0 +1,33 @@
+Downloaded from
+https://github.com/dajhorn/SoftEtherVPN/commit/9a8538a6f2287fe8bebd0a7185de408e31e5a7df
+
+Fixes
+http://autobuild.buildroot.net/results/48f/48f778a891e0bf6a60ed2e4bec057c338ec25ec9/
+and many others
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 9a8538a6f2287fe8bebd0a7185de408e31e5a7df Mon Sep 17 00:00:00 2001
+From: Darik Horn <dajhorn@vanadac.com>
+Date: Thu, 5 Jun 2014 21:02:02 -0400
+Subject: [PATCH] Add an explicit autoconf check for librt.
+
+The realtime extensions library is not automatically linked on Debian ARM
+platforms, so do an AC_CHECK_LIB for it in the configuration macro.
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 165623a..6f85393 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,6 +60,7 @@ CC="$PTHREAD_CC"
+ CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
+ LIBS="$PTHREAD_LIBS $LIBS"
+ 
++AC_CHECK_LIB([rt],[clock_gettime])
+ 
+ AX_CHECK_OPENSSL([
+ 	AC_SUBST(OPENSSL_LIBS)
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 8f8734d..a56f4cc 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -28,12 +28,6 @@ SOFTETHER_CONF_OPTS = \
 	--with-openssl="$(STAGING_DIR)/usr" \
 	--with-zlib="$(STAGING_DIR)/usr"
 
-# softether uses clock_gettime but forgets to link against -lrt
-# breaking the build against older libc's that don't provide this
-# symbol in libc
-SOFTETHER_CONF_ENV += LIBS+=" -lrt"
-HOST_SOFTETHER_CONF_ENV += LIBS+=" -lrt"
-
 # host-libiconv does not exist, therefore we need this extra line
 HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-openssl host-readline
 
