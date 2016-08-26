From: noe.rubinstein at gmail.com <noe.rubinstein@gmail.com>
Date: Fri, 26 Aug 2016 11:27:36 +0200
Subject: [Buildroot] [PATCH] Trousers: fix build with musl
Message-ID: <1472203656-5901-1-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: No? Rubinstein <nrubinstein@aldebaran.com>

The trousers code uses getpwent_r, which is not available in musl.
Detect the availability of getpwent_r in the TrouSerS build system, and
use it conditionally.

This broke the build of tpm-tools because linking with libtspi.so
failed.

Fixes this build failure:
http://autobuild.buildroot.net/results/830fc20c68a0653afa5567edffc2ededc4e45cc6

---

Runtime-tested by running tpm_version in a chroot and verifying that it
creates a "user.data" file with both the Buildroot-provided CodeSourcery
and Musl toolchains on x86_64.

Build tested with
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2016.08-rc1-4-g07e8d1c.tar.bz2

Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
---
 ...t-getpwent_r-is-available-before-using-it.patch | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch

diff --git a/package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch b/package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch
new file mode 100644
index 0000000..6ed440e
--- /dev/null
+++ b/package/trousers/0004-Check-that-getpwent_r-is-available-before-using-it.patch
@@ -0,0 +1,78 @@
+From 9e42c405f30d2b52d019598436ea346ef8586f43 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <nrubinstein@aldebaran.com>
+Date: Wed, 24 Aug 2016 18:55:25 +0200
+Subject: [PATCH] Check that getpwent_r is available before using it
+
+This fixes building trousers with musl
+---
+ configure.in        |  4 ++++
+ src/tspi/ps/tspps.c | 10 +++++-----
+ 2 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index fd3f5f1..e3d7acf 100644
+--- a/configure.in
++++ b/configure.in
+@@ -145,6 +145,10 @@ else
+ 	AC_MSG_ERROR(["gtk", "openssl" and "none" are the only supported gui options for trousers])
+ fi
+ 
++# Look for getpwent_r. If it is not found, getpwent will be used instead, with
++# an additional mutex.
++AC_CHECK_FUNC(getpwent_r, [AC_DEFINE(HAVE_GETPWENT_R)])
++
+ #
+ # The default port that the TCS daemon listens on
+ #
+diff --git a/src/tspi/ps/tspps.c b/src/tspi/ps/tspps.c
+index c6f9c3d..9d00d2a 100644
+--- a/src/tspi/ps/tspps.c
++++ b/src/tspi/ps/tspps.c
+@@ -45,7 +45,7 @@
+ 
+ static int user_ps_fd = -1;
+ static MUTEX_DECLARE_INIT(user_ps_lock);
+-#if (defined (__FreeBSD__) || defined (__OpenBSD__))
++#ifndef HAVE_GETPWENT_R
+ static MUTEX_DECLARE_INIT(user_ps_path);
+ #endif
+ static struct flock fl;
+@@ -60,7 +60,7 @@ get_user_ps_path(char **file)
+ 	TSS_RESULT result;
+ 	char *file_name = NULL, *home_dir = NULL;
+ 	struct passwd *pwp;
+-#if (defined (__linux) || defined (linux) || defined(__GLIBC__))
++#ifdef HAVE_GETPWENT_R
+ 	struct passwd pw;
+ #endif
+ 	struct stat stat_buf;
+@@ -72,7 +72,7 @@ get_user_ps_path(char **file)
+ 		*file = strdup(file_name);
+ 		return (*file) ? TSS_SUCCESS : TSPERR(TSS_E_OUTOFMEMORY);
+ 	}
+-#if (defined (__FreeBSD__) || defined (__OpenBSD__))
++#ifndef HAVE_GETPWENT_R
+ 	MUTEX_LOCK(user_ps_path);
+ #endif
+ 
+@@ -90,7 +90,7 @@ get_user_ps_path(char **file)
+ #else
+ 	setpwent();
+ 	while (1) {
+-#if (defined (__linux) || defined (linux) || defined(__GLIBC__))
++#ifdef HAVE_GETPWENT_R
+ 		rc = getpwent_r(&pw, buf, PASSWD_BUFSIZE, &pwp);
+ 		if (rc) {
+ 			LogDebugFn("USER PS: Error getting path to home directory: getpwent_r: %s",
+@@ -99,7 +99,7 @@ get_user_ps_path(char **file)
+ 			return TSPERR(TSS_E_INTERNAL_ERROR);
+ 		}
+ 
+-#elif (defined (__FreeBSD__) || defined (__OpenBSD__))
++#else
+ 		if ((pwp = getpwent()) == NULL) {
+ 			LogDebugFn("USER PS: Error getting path to home directory: getpwent: %s",
+                                    strerror(rc));
+-- 
+2.1.4
+
-- 
2.1.4
