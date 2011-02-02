From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 2 Feb 2011 22:44:21 +0100
Subject: [Buildroot] [git commit master 1/1] directfb: bump to version 1.4.11
Message-ID: <20110202214453.551858F34A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d1defbf3978648a687f25b8e8721b014e769b2ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...directfb-1.4.10-add-missing-lm-flag-patch.patch |   49 --------------------
 ...patch => directfb-1.4.11-ppc-compile-fix.patch} |    0
 package/directfb/directfb.mk                       |   11 ++---
 3 files changed, 4 insertions(+), 56 deletions(-)
 delete mode 100644 package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch
 rename package/directfb/{directfb-1.4.10-ppc-compile-fix.patch => directfb-1.4.11-ppc-compile-fix.patch} (100%)

diff --git a/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch b/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch
deleted file mode 100644
index b07f0c5..0000000
--- a/package/directfb/directfb-1.4.10-add-missing-lm-flag-patch.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From dbf8fd1d097420d02f0603155ca81fcc7e232a0a Mon Sep 17 00:00:00 2001
-From: Lionel Landwerlin <llandwerlin@gmail.com>
-Date: Sun, 7 Nov 2010 21:45:19 +0100
-Subject: [PATCH] Add -lm flag when nedded
-
-Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
----
- configure.in          |   14 ++++++++++++++
- src/media/Makefile.am |    2 +-
- 2 files changed, 15 insertions(+), 1 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 78c842d..aa608d4 100644
---- a/configure.in
-+++ b/configure.in
-@@ -533,6 +533,20 @@ AM_CONDITIONAL(DIRECTFB_BUILD_PURE_VOODOO, test "$DIRECTFB_BUILD_PURE_VOODOO" =
- 
- AC_SUBST(DEP_VOODOO)
- 
-+dnl If we're not building a pure voodoo lib, we need the sqrt symbol
-+dnl for src/media/idirectfbfont.c
-+MEDIALIB=""
-+if test "$enable_pure_voodoo" = "no"; then
-+  AC_CHECK_LIB(m, sqrt,
-+    MEDIALIB="-lm",
-+    AC_MSG_ERROR([
-+*** DirectFB requires libm.]))
-+  if test "$enable_shared" = "yes"; then
-+    DYNLIB+=" $MEDIALIB"
-+    AC_SUBST(DYNLIB)
-+  fi
-+fi
-+AC_SUBST(MEDIALIB)
- 
- AM_CONDITIONAL(ENABLE_MULTI, test "$enable_multi" = "yes")
- 
-diff --git a/src/media/Makefile.am b/src/media/Makefile.am
-index 1a39a25..a4bdb10 100644
---- a/src/media/Makefile.am
-+++ b/src/media/Makefile.am
-@@ -35,4 +35,4 @@ libdirectfb_media_la_SOURCES = \
- 	idirectfbdatabuffer_file.c	\
- 	idirectfbdatabuffer_memory.c	\
- 	idirectfbdatabuffer_streamed.c
--
-+libdirectfb_media_la_LDFLAGS = $(MEDIALIB)
--- 
-1.7.2.3
-
diff --git a/package/directfb/directfb-1.4.10-ppc-compile-fix.patch b/package/directfb/directfb-1.4.11-ppc-compile-fix.patch
similarity index 100%
rename from package/directfb/directfb-1.4.10-ppc-compile-fix.patch
rename to package/directfb/directfb-1.4.11-ppc-compile-fix.patch
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 309659a..ca0f8e4 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -3,15 +3,12 @@
 # directfb
 #
 #############################################################
-DIRECTFB_VERSION_MAJOR:=1.4
-DIRECTFB_VERSION:=$(DIRECTFB_VERSION_MAJOR).10
-DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
-DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
+DIRECTFB_VERSION_MAJOR = 1.4
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).11
+DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
+DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = YES
-DIRECTFB_LIBTOOL_PATCH = NO
 DIRECTFB_INSTALL_STAGING = YES
-DIRECTFB_INSTALL_TARGET = YES
-
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
 	--enable-static \
-- 
1.7.3.4
