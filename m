From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat,  6 Nov 2010 19:59:50 +0100
Subject: [Buildroot] [PATCH 2/2] directfb: add -lm when using freetype2 font
	interface
In-Reply-To: <1289069990-31304-1-git-send-email-llandwerlin@gmail.com>
References: <1289069990-31304-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1289069990-31304-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

This fix runtime/compilation problems seen with directfb 1.4.10.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 ...directfb-1.4.10-add-missing-lm-flag-patch.patch |   51 ++++++++++++++++++++
 package/directfb/directfb.mk                       |    2 +-
 2 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch

diff --git a/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch b/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch
new file mode 100644
index 0000000..22f91e3
--- /dev/null
+++ b/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch
@@ -0,0 +1,51 @@
+From 5a91f329f490ae3d63c239e37f3899e703e303ee Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <llandwerlin@gmail.com>
+Date: Fri, 5 Nov 2010 18:05:54 +0100
+Subject: [PATCH] directfb: add missing -lm flag patch
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ ....10-add-lm-to-link-flags-when-freetype-is.patch |   31 ++++++++++++++++++++
+ 1 files changed, 31 insertions(+), 0 deletions(-)
+ create mode 100644 package/directfb/directfb-1.4.10-add-lm-to-link-flags-when-freetype-is.patch
+
+diff --git a/package/directfb/directfb-1.4.10-add-lm-to-link-flags-when-freetype-is.patch b/package/directfb/directfb-1.4.10-add-lm-to-link-flags-when-freetype-is.patch
+new file mode 100644
+index 0000000..dc84f53
+--- /dev/null
++++ b/package/directfb/directfb-1.4.10-add-lm-to-link-flags-when-freetype-is.patch
+@@ -0,0 +1,31 @@
++From 9103055ed56999bb42cdf8fc5f08f2ad42e28426 Mon Sep 17 00:00:00 2001
++From: Lionel Landwerlin <llandwerlin@gmail.com>
++Date: Fri, 5 Nov 2010 18:00:20 +0100
++Subject: [PATCH] configure.in: add -lm to link flags when freetype is used
++
++Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
++---
++ configure.in |    7 +++++++
++ 1 files changed, 7 insertions(+), 0 deletions(-)
++
++diff --git a/configure.in b/configure.in
++index 78c842d..3f97b22 100644
++--- a/configure.in
+++++ b/configure.in
++@@ -830,6 +830,13 @@ AC_ARG_ENABLE(freetype,
++ if test "$enable_freetype" = "yes"; then
++   PKG_CHECK_MODULES(FREETYPE, freetype2, FREETYPE="yes", [FREETYPE="no",
++     AC_MSG_WARN([*** no freetype -- FreeType font provider will not be built.])])
+++  if test "$enable_shared" = "yes"; then
+++    AC_CHECK_LIB(m, sinf, ,
+++      AC_MSG_ERROR([
+++*** DirectFB requires libm.]))
+++    DYNLIB+=" -lm"
+++  fi
+++  AC_SUBST(DYNLIB)
++ fi
++ 
++ AM_CONDITIONAL(FREETYPE_PROVIDER, test "$FREETYPE" = "yes")
++-- 
++1.6.0.6
++
+-- 
+1.6.0.6
+
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 2703677..fc0e7fe 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -7,7 +7,7 @@ DIRECTFB_VERSION_MAJOR:=1.4
 DIRECTFB_VERSION:=$(DIRECTFB_VERSION_MAJOR).10
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
-DIRECTFB_AUTORECONF = NO
+DIRECTFB_AUTORECONF = YES
 DIRECTFB_LIBTOOL_PATCH = NO
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_INSTALL_TARGET = YES
-- 
1.7.2.3
