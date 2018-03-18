From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 15:16:46 +0100
Subject: [Buildroot] [git commit] make: fix build with glibc 2.27
Message-ID: <20180318141711.A48FE836EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=157231405d219e484aa3829acff23569f6a60d00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc 2.27 changed _GNU_GLOB_INTERFACE_VERSION to 2. This triggers build
of the internal glob implementation in make. This internal
implementation needs the __alloca symbol that glibc does not define.

Add upstream patch that adds support for _GNU_GLOB_INTERFACE_VERSION 2.

Add host-pkgconf dependency for the PKG_CHECK_MODULES macro. This macro
is only used for guile, which we currently disable unconditionally. So
host-pkgconf is only needed now so that autoreconf generates a valid
configure script.

Fixes:
http://autobuild.buildroot.net/results/8ff/8ff06ad8438cfcac85577b24675dd1d66f7d3d03/
http://autobuild.buildroot.net/results/5cc/5ccee6bb332e800e81052a3094746edde83403b1/
http://autobuild.buildroot.net/results/841/8418f5ed56dacd6900946e7d56ad36ad03c7bf7e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ac-Support-GLIBC-glob-interface-version-2.patch | 31 ++++++++++++++++++++++
 package/make/make.mk                               |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch b/package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch
new file mode 100644
index 0000000000..62e67f850a
--- /dev/null
+++ b/package/make/0001-configure.ac-Support-GLIBC-glob-interface-version-2.patch
@@ -0,0 +1,31 @@
+From 48c8a116a914a325a0497721f5d8b58d5bba34d4 Mon Sep 17 00:00:00 2001
+From: Paul Smith <psmith@gnu.org>
+Date: Sun, 19 Nov 2017 15:09:16 -0500
+Subject: [PATCH] * configure.ac: Support GLIBC glob interface version 2
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 48c8a116a914a3
+
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8c72568cf276..4710832ae568 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -404,10 +404,9 @@ AC_CACHE_CHECK([if system libc has GNU glob], [make_cv_sys_gnu_glob],
+ #include <glob.h>
+ #include <fnmatch.h>
+ 
+-#define GLOB_INTERFACE_VERSION 1
+ #if !defined _LIBC && defined __GNU_LIBRARY__ && __GNU_LIBRARY__ > 1
+ # include <gnu-versions.h>
+-# if _GNU_GLOB_INTERFACE_VERSION == GLOB_INTERFACE_VERSION
++# if _GNU_GLOB_INTERFACE_VERSION == 1 || _GNU_GLOB_INTERFACE_VERSION == 2
+    gnu glob
+ # endif
+ #endif],
+-- 
+2.16.2
+
diff --git a/package/make/make.mk b/package/make/make.mk
index 5717628fa3..01cd2eaa18 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -7,9 +7,11 @@
 MAKE_VERSION = 4.2.1
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
-MAKE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+MAKE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-pkgconf
 MAKE_LICENSE = GPL-3.0+
 MAKE_LICENSE_FILES = COPYING
+# Patching configure.ac
+MAKE_AUTORECONF = YES
 
 MAKE_CONF_OPTS = --without-guile
 
