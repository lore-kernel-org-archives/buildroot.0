From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 23 Jun 2019 13:03:09 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/harfbuzz: fix build without
 cairo-svg
Message-ID: <20190623190309.61714-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/f6c0b85fa476e0f52cc06f0133d2e4f9920f7556
test-ot-color.cc:40:10: fatal error: cairo-svg.h: No such file or directory
   40 | #include <cairo-svg.h>
      |          ^~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...airo-svg-dependency-to-test-ot-color.patch | 38 +++++++++++++++++++
 package/harfbuzz/harfbuzz.mk                  |  2 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch

diff --git a/package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch b/package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch
new file mode 100644
index 0000000000..ea759e5afc
--- /dev/null
+++ b/package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch
@@ -0,0 +1,38 @@
+From c2d7dfc68ffcb389c9f73b5ef94da7b270bdcf9e Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 22 Jun 2019 19:38:48 -0600
+Subject: [PATCH] Add missing cairo-svg dependency to test-ot-color
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+c2d7dfc68ffcb389c9f73b5ef94da7b270bdcf9e]
+---
+ src/test-ot-color.cc | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/test-ot-color.cc b/src/test-ot-color.cc
+index 44bd2eb6..e9126c06 100644
+--- a/src/test-ot-color.cc
++++ b/src/test-ot-color.cc
+@@ -25,7 +25,9 @@
+ 
+ #include "hb.hh"
+ 
+-#ifndef HB_NO_COLOR
++#include <cairo.h>
++
++#if !defined(HB_NO_COLOR) && defined(CAIRO_HAS_SVG_SURFACE)
+ 
+ #include "hb-ot.h"
+ 
+@@ -35,7 +37,6 @@
+ #include FT_FREETYPE_H
+ #include FT_GLYPH_H
+ 
+-#include <cairo.h>
+ #include <cairo-ft.h>
+ #include <cairo-svg.h>
+ 
+-- 
+2.20.1
+
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 1144133254..ded5e554e6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -30,7 +30,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 HARFBUZZ_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -pthread"
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
+ifeq ($(BR2_PACKAGE_CAIRO),y)
 HARFBUZZ_DEPENDENCIES += cairo
 HARFBUZZ_CONF_OPTS += --with-cairo=yes
 else
-- 
2.20.1
