From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:41:52 +0100
Subject: [Buildroot] [git commit] imlib2: bump to version 1.4.6
Message-ID: <20150308071605.778EE805E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8be6f7bbc26640519688e359f3802daa5abde7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add two upstream patch to fix a warning and a build failure of the
version 1.4.6.

Also add AUTORECONF because one patch change the file
"src/lib/Makefile.am".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...AY_MISSING-redefined-warnings-when-X-is-d.patch |   75 ++++++++++++++++++++
 ...o-not-link-with-X-libs-when-X-is-disabled.patch |   29 ++++++++
 package/imlib2/imlib2.hash                         |    2 +-
 package/imlib2/imlib2.mk                           |    3 +-
 4 files changed, 107 insertions(+), 2 deletions(-)

diff --git a/package/imlib2/0001-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch b/package/imlib2/0001-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
new file mode 100644
index 0000000..f3327a0
--- /dev/null
+++ b/package/imlib2/0001-fix-X_DISPLAY_MISSING-redefined-warnings-when-X-is-d.patch
@@ -0,0 +1,75 @@
+From 49e3034ab714c9f05a6c0a04cf85ecbdb65c02d5 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Mon, 28 Jul 2014 22:59:35 -0400
+Subject: [PATCH 1/2] fix X_DISPLAY_MISSING redefined warnings when X is
+ disabled
+
+This is set up in config.h by configure, so avoid defining it again.
+---
+ src/bin/imlib2_conv.c | 2 ++
+ src/lib/api.c         | 2 ++
+ src/lib/image.h       | 2 ++
+ src/lib/script.c      | 2 ++
+ 4 files changed, 8 insertions(+)
+
+diff --git a/src/bin/imlib2_conv.c b/src/bin/imlib2_conv.c
+index 1b05b1f..1c46d0c 100644
+--- a/src/bin/imlib2_conv.c
++++ b/src/bin/imlib2_conv.c
+@@ -8,7 +8,9 @@
+ #include <stdio.h>
+ #include <string.h>
+ 
++#ifndef X_DISPLAY_MISSING
+ #define X_DISPLAY_MISSING
++#endif
+ #include <Imlib2.h>
+ 
+ #define PROG_NAME "imlib2_conv"
+diff --git a/src/lib/api.c b/src/lib/api.c
+index e29eaf0..178d2ca 100644
+--- a/src/lib/api.c
++++ b/src/lib/api.c
+@@ -4,8 +4,10 @@
+ #include <X11/Xutil.h>
+ #include <X11/extensions/shape.h>
+ #else
++#ifndef X_DISPLAY_MISSING
+ #define X_DISPLAY_MISSING
+ #endif
++#endif
+ #include <string.h>
+ #include <stdarg.h>
+ #include "common.h"
+diff --git a/src/lib/image.h b/src/lib/image.h
+index eef59d2..52dde9d 100644
+--- a/src/lib/image.h
++++ b/src/lib/image.h
+@@ -5,7 +5,9 @@
+ # ifdef BUILD_X11
+ #  include <X11/Xlib.h>
+ # else
++#ifndef X_DISPLAY_MISSING
+ #  define X_DISPLAY_MISSING
++#endif
+ # endif
+ 
+ # include <dlfcn.h>
+diff --git a/src/lib/script.c b/src/lib/script.c
+index 55ebd4e..7c974c0 100644
+--- a/src/lib/script.c
++++ b/src/lib/script.c
+@@ -13,8 +13,10 @@
+ #ifdef BUILD_X11
+ #include <X11/Xlib.h>
+ #else
++#ifndef X_DISPLAY_MISSING
+ #define X_DISPLAY_MISSING
+ #endif
++#endif
+ #include "image.h"
+ #include "file.h"
+ #include "dynamic_filters.h"
+-- 
+2.3.1
+
diff --git a/package/imlib2/0002-do-not-link-with-X-libs-when-X-is-disabled.patch b/package/imlib2/0002-do-not-link-with-X-libs-when-X-is-disabled.patch
new file mode 100644
index 0000000..e34f9bc
--- /dev/null
+++ b/package/imlib2/0002-do-not-link-with-X-libs-when-X-is-disabled.patch
@@ -0,0 +1,29 @@
+From f5caf5432609938794d7a72afe059cfcfccd38bf Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Mon, 28 Jul 2014 23:01:23 -0400
+Subject: [PATCH 2/2] do not link with X libs when X is disabled
+
+URL: https://bugs.gentoo.org/517670
+---
+ src/lib/Makefile.am | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/Makefile.am b/src/lib/Makefile.am
+index 64de98b..ea94991 100644
+--- a/src/lib/Makefile.am
++++ b/src/lib/Makefile.am
+@@ -86,7 +86,10 @@ AMD64_OBJS = $(AMD64_SRCS:.S=.lo)
+ 
+ EXTRA_DIST = $(MMX_SRCS) $(AMD64_SRCS) asm_loadimmq.S
+ 
+-MY_LIBS = -lXext -lX11 $(FREETYPE_LIBS) $(DLOPEN_LIBS) -lm
++MY_LIBS = $(FREETYPE_LIBS) $(DLOPEN_LIBS) -lm
++if BUILD_X11
++MY_LIBS += -lXext -lX11
++endif
+ 
+ if BUILD_MMX
+ libImlib2_la_LIBADD       = $(MMX_OBJS) $(MY_LIBS)
+-- 
+2.3.1
+
diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 356a95b..c8d5fe9 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  24700d93931838d2149cc2b4b58b9355cc81ec11d297f101a98dbb8d1c5c945a  imlib2-1.4.5.tar.bz2
+sha256 af51be727d62cfcff7457c753f355e44848fb997f33a7e1d43775276a9073274 imlib2-1.4.6.tar.bz2
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 62f3989..6539246 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.4.5
+IMLIB2_VERSION = 1.4.6
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = imlib2 license
 IMLIB2_LICENSE_FILES = COPYING
 
+IMLIB2_AUTORECONF = YES
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
 IMLIB2_CONF_OPTS = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
