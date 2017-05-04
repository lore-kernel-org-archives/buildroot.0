From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 21:35:42 +0200
Subject: [Buildroot] [git commit] libqmi: fix patch for
	canonicalize_file_name() issue
Message-ID: <20170504193634.5750C82489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d11848a21d4424a04e8428c4cd3bd5e972aacdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch added in commit c78b65c4f161ec101ff02880788ef22eb7c87d76 was
bogus: it adds some code conditionally on HAVE_CANONICALIZE_FILE_NAME
being undefined, but there is nothing that defines
HAVE_CANONICALIZE_FILE_NAME if canonicalize_file_name() is already
provided by the C library.

This commit fixes that by adding the appropriate autoconf check.

Fixes:

  http://autobuild.buildroot.net/results/4f0eb2af09c92ff4cd7448211ffda432754d4e60/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-musl-compat-canonicalize_file_name.patch    | 20 +++++++++++++++++---
 package/libqmi/libqmi.mk                             |  2 ++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/libqmi/0001-musl-compat-canonicalize_file_name.patch b/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
index 5656d55..fd606d8 100644
--- a/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
+++ b/package/libqmi/0001-musl-compat-canonicalize_file_name.patch
@@ -1,4 +1,4 @@
-From 2f44edc9fbcbf2202174aec723e8a8d191c13d2f Mon Sep 17 00:00:00 2001
+From 85863c9e051fe59add4e47dbfcb37072234f0110 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Mon, 1 May 2017 19:55:07 -0500
 Subject: [PATCH] musl compat canonicalize_file_name()
@@ -11,9 +11,23 @@ https://bugs.freedesktop.org/show_bug.cgi?id=99944
 
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 ---
+ configure.ac                |  2 ++
  src/libqmi-glib/qmi-utils.h | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
+ 2 files changed, 20 insertions(+)
 
+diff --git a/configure.ac b/configure.ac
+index 162d5ae..9cb82fd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -80,6 +80,8 @@ AC_SUBST(GLIB_LIBS)
+ GLIB_MKENUMS=`$PKG_CONFIG --variable=glib_mkenums glib-2.0`
+ AC_SUBST(GLIB_MKENUMS)
+ 
++AC_CHECK_FUNCS([canonicalize_file_name])
++
+ dnl qmi-firmware-update is optional, enabled by default
+ AC_ARG_ENABLE([firmware-update],
+               AS_HELP_STRING([--enable-firmware-update],
 diff --git a/src/libqmi-glib/qmi-utils.h b/src/libqmi-glib/qmi-utils.h
 index 4fd5199..4869da5 100644
 --- a/src/libqmi-glib/qmi-utils.h
@@ -44,5 +58,5 @@ index 4fd5199..4869da5 100644
  
  G_BEGIN_DECLS
 -- 
-1.9.1
+2.7.4
 
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 92b635d..917265f 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -10,6 +10,8 @@ LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING
 LIBQMI_INSTALL_STAGING = YES
+# 0001-musl-compat-canonicalize_file_name.patch
+LIBQMI_AUTORECONF = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
