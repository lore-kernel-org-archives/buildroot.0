From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 19 Mar 2014 12:27:58 -0500
Subject: [Buildroot] [PATCH] rsyslog: Update patch to upstreamed version
Message-ID: <1395250078-16782-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch for the libgcrypt-config path correction was accepted by the
mainline for rsyslog. Updating the buildroot patch until a new version
with the fix is released.
---
 ...yslog-0001-libgcrypt-config-path-override.patch |   22 +++++++++++--------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch b/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
index 6af0db7..c0d8bfa 100644
--- a/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
+++ b/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
@@ -1,6 +1,6 @@
-From 2d498883b19c386abacffca969eb404c9407a8cc Mon Sep 17 00:00:00 2001
+From 86d19e4e63c3fa5b9690991f3e29ffab93990acd Mon Sep 17 00:00:00 2001
 From: Clayton Shotwell <clshotwe@rockwellcollins.com>
-Date: Mon, 10 Mar 2014 14:40:35 -0500
+Date: Wed, 19 Mar 2014 08:28:55 -0500
 Subject: [PATCH] configure: Allow overriding of libgcrypt-config
 
 Allow the overriding of the libgcrypt-config path if it is not at
@@ -8,14 +8,14 @@ a standard location.
 
 Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
 ---
- configure.ac |   12 ++++--------
- 1 file changed, 4 insertions(+), 8 deletions(-)
+ configure.ac |   14 +++++---------
+ 1 file changed, 5 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 9643b84..7eb7712 100644
+index 314c16e..bf017d2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -820,19 +820,15 @@ AC_ARG_ENABLE(libgcrypt,
+@@ -797,22 +797,18 @@ AC_ARG_ENABLE(libgcrypt,
          [enable_libgcrypt=yes]
  )
  if test "x$enable_libgcrypt" = "xyes"; then
@@ -25,8 +25,8 @@ index 9643b84..7eb7712 100644
 -            [yes],,,
 -            )
 -        if test "x${HAVE_LIBGCRYPT_CONFIG}" != "xyes"; then
-+	AC_PATH_PROG(LIBGCRYPT_CONFIG,libgcrypt-config)
-+        if test "x${LIBGCRYPT_CONFIG}" == "x"; then
++	AC_PATH_PROG([LIBGCRYPT_CONFIG],[libgcrypt-config],[no])
++        if test "x${LIBGCRYPT_CONFIG}" = "xno"; then
             AC_MSG_FAILURE([libgcrypt-config not found in PATH])
          fi
          AC_CHECK_LIB(
@@ -38,7 +38,11 @@ index 9643b84..7eb7712 100644
 +        	LIBGCRYPT_LIBS="`${LIBGCRYPT_CONFIG} --libs`"
          	],
          	[AC_MSG_FAILURE([libgcrypt is missing])],
-         	[`libgcrypt-config --libs --cflags`]
+-        	[`libgcrypt-config --libs --cflags`]
++        	[`${LIBGCRYPT_CONFIG} --libs --cflags`]
+         	)
+ 	AC_DEFINE([ENABLE_LIBGCRYPT], [1], [Indicator that LIBGCRYPT is present])
+ fi
 -- 
 1.7.9.5
 
-- 
1.7.1
