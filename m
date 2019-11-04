From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:58:12 +0100
Subject: [Buildroot] [git commit] package/libupnp18: bump to version 1.8.5
Message-ID: <20191104205138.CDAED8E661@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f9a50a38e457f5d8aaf79d36ce7331bb06fb6e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches included in new version. No need for autoreconf anymore.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-fix-build-with-openssl.patch | 51 ----------------------
 ...to-detach-detached-thread-the-result-is-u.patch | 39 -----------------
 package/libupnp18/libupnp18.hash                   |  6 +--
 package/libupnp18/libupnp18.mk                     |  4 +-
 4 files changed, 4 insertions(+), 96 deletions(-)

diff --git a/package/libupnp18/0001-configure.ac-fix-build-with-openssl.patch b/package/libupnp18/0001-configure.ac-fix-build-with-openssl.patch
deleted file mode 100644
index 6a09821dae..0000000000
--- a/package/libupnp18/0001-configure.ac-fix-build-with-openssl.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c70d326f3ae88aa2dca903fb17a1f18d3b45a2ca Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 8 Feb 2019 16:45:32 +0100
-Subject: [PATCH] configure.ac: fix build with openssl
-
-- Add a call to PKG_CHECK_MODULES to get openssl libraries and its
-  dependencies if openssl support is enabled
-- Add OPENSSL_LIBS to libupnp.pc.in so that applications linking with
-  pupnp (such as mpd) will be able to retrieve openssl libraries
-
-Fixes:
- - http://autobuild.buildroot.org/results/a4148e516070b79816769f3443fc24d6d8192073
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mrjimenez/pupnp/pull/105]
----
- configure.ac  | 5 +++++
- libupnp.pc.in | 2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 670d363..190b30c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -722,6 +722,11 @@ AC_COMPILE_IFELSE(
- 			AC_MSG_ERROR([pthread_rwlock_t not available])])])
- echo "-------------------------------------------------------------------------------"
- 
-+if test "x$enable_open_ssl" = xyes ; then
-+	PKG_CHECK_MODULES(OPENSSL, libssl,
-+		[LIBS="$LIBS $OPENSSL_LIBS" CFLAGS="$CFLAGS $OPENSSL_CFLAGS"],
-+		[AC_MSG_ERROR([openssl not found])])
-+fi
- 
- AC_CONFIG_FILES([
- 	Makefile
-diff --git a/libupnp.pc.in b/libupnp.pc.in
-index bd2d7b3..54cba90 100644
---- a/libupnp.pc.in
-+++ b/libupnp.pc.in
-@@ -6,6 +6,6 @@ includedir=@includedir@
- Name: libupnp
- Description: Linux SDK for UPnP Devices
- Version: @VERSION@
--Libs: @PTHREAD_CFLAGS@ @PTHREAD_LIBS@ -L${libdir} -lupnp -lixml
-+Libs: @PTHREAD_CFLAGS@ @PTHREAD_LIBS@ -L${libdir} -lupnp -lixml @OPENSSL_LIBS@
- Cflags: @PTHREAD_CFLAGS@ -I${includedir}/upnp
- 
--- 
-2.14.1
-
diff --git a/package/libupnp18/0002-Do-not-try-to-detach-detached-thread-the-result-is-u.patch b/package/libupnp18/0002-Do-not-try-to-detach-detached-thread-the-result-is-u.patch
deleted file mode 100644
index 601ea89be7..0000000000
--- a/package/libupnp18/0002-Do-not-try-to-detach-detached-thread-the-result-is-u.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 04b454f693d0c71336252380d08f1d02967e133e Mon Sep 17 00:00:00 2001
-From: Jean-Francois Dockes <jf@dockes.org>
-Date: Sun, 27 Jan 2019 10:44:17 +0100
-Subject: [PATCH] Do not try to detach detached thread, the result is
- undefined. Fixes issue #102
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes runtime crash with musl 1.1.20+. The problem is that libupnp is
-calling pthread_detach() on a thread which was created in the detached state.
-
-Backported from: 04b454f693d0c71336252380d08f1d02967e133e
-
-(cherry picked from commit 386b7ed79146ecf7a3bba49f48cb8f41a9b49170)
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- upnp/src/threadutil/ThreadPool.c | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/upnp/src/threadutil/ThreadPool.c b/upnp/src/threadutil/ThreadPool.c
-index d272907..5e590ed 100644
---- a/upnp/src/threadutil/ThreadPool.c
-+++ b/upnp/src/threadutil/ThreadPool.c
-@@ -651,11 +651,6 @@ static int CreateWorker(
- 	rc = ithread_create(&temp, &attr, WorkerThread, tp);
- 	ithread_attr_destroy(&attr);
- 	if (rc == 0) {
--		rc = ithread_detach(temp);
--		/* ithread_detach will return EINVAL if thread has been
--		 successfully detached by ithread_create */
--		if (rc == EINVAL)
--			rc = 0;
- 		tp->pendingWorkerThreadStart = 1;
- 		/* wait until the new worker thread starts */
- 		while (tp->pendingWorkerThreadStart) {
--- 
-2.21.0
-
diff --git a/package/libupnp18/libupnp18.hash b/package/libupnp18/libupnp18.hash
index c32ebef739..9d44bbf41b 100644
--- a/package/libupnp18/libupnp18.hash
+++ b/package/libupnp18/libupnp18.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.8.4/libupnp-1.8.4.tar.bz2.sha1
-sha1 93e7b3c94cf53eb59533b4b7b137ef5cc651e28b  libupnp-1.8.4.tar.bz2
+# From https://sourceforge.net/projects/pupnp/files/pupnp/libupnp-1.8.5/libupnp-1.8.5.tar.bz2.sha1
+sha1 4d687f8f7d6279fddc4c6faff7f5e3513e765d8a  libupnp-1.8.5.tar.bz2
 # Locally computed:
-sha256	188d3f786d92fe14191f17634d2d87847eee7d2b568a5257ea23262fec9973d6	libupnp-1.8.4.tar.bz2
+sha256	55c4c30543b4cdaff3ed3a1c72bf118173369e9009eeed0bbd6e2ae62c6f0e93	libupnp-1.8.5.tar.bz2
 sha256	c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3	COPYING
diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
index 35e8dc4a47..fef5fea809 100644
--- a/package/libupnp18/libupnp18.mk
+++ b/package/libupnp18/libupnp18.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP18_VERSION = 1.8.4
+LIBUPNP18_VERSION = 1.8.5
 LIBUPNP18_SOURCE = libupnp-$(LIBUPNP18_VERSION).tar.bz2
 LIBUPNP18_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libupnp-$(LIBUPNP18_VERSION)
 LIBUPNP18_CONF_ENV = ac_cv_lib_compat_ftime=no
@@ -12,8 +12,6 @@ LIBUPNP18_INSTALL_STAGING = YES
 LIBUPNP18_LICENSE = BSD-3-Clause
 LIBUPNP18_LICENSE_FILES = COPYING
 LIBUPNP18_DEPENDENCIES = host-pkgconf
-# We're patching configure.ac
-LIBUPNP18_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUPNP18_CONF_OPTS += --enable-open-ssl
