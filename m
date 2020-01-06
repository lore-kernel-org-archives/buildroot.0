From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Jan 2020 06:51:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/libva-utils: fix non x11 build
Message-ID: <20200106055116.149922-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/70f/70fd6609fffdaa07be583420dab067da27b7d505/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-fix-build-without-x11.patch          | 33 +++++++++++++++++++
 package/libva-utils/libva-utils.mk            |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 package/libva-utils/0001-fix-build-without-x11.patch

diff --git a/package/libva-utils/0001-fix-build-without-x11.patch b/package/libva-utils/0001-fix-build-without-x11.patch
new file mode 100644
index 0000000000..905e90410f
--- /dev/null
+++ b/package/libva-utils/0001-fix-build-without-x11.patch
@@ -0,0 +1,33 @@
+From 5efef48d74d772cb5318345aa61d94d27e0c42d1 Mon Sep 17 00:00:00 2001
+From: Lukas Rusak <lorusak@gmail.com>
+Date: Fri, 22 Feb 2019 18:43:25 -0800
+Subject: [PATCH] only build sfcsample when x11 is enabled
+
+Downloaded from https://github.com/LibreELEC/LibreELEC.tv/pull/4093
+
+Bug was reported upstream:
+https://github.com/intel/libva-utils/issues/153#issuecomment-569255639
+
+Signed-off-by: Lukas Rusak <lorusak@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d28175a..12da79e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -24,10 +24,10 @@ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
+ 
+ AUTOMAKE_OPTIONS = foreign
+ 
+-SUBDIRS = common decode encode vainfo videoprocess vendor/intel vendor/intel/sfcsample
++SUBDIRS = common decode encode vainfo vendor/intel
+ 
+ if USE_X11
+-SUBDIRS += putsurface
++SUBDIRS += putsurface vendor/intel/sfcsample
+ else
+ if USE_WAYLAND
+ SUBDIRS += putsurface
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 40b05e4590..51ee858b57 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -10,6 +10,8 @@ LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBV
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
 LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
+# 0001-fix-build-without-x11.patch
+LIBVA_UTILS_AUTORECONF = YES
 
 define LIBVA_UTILS_CREATE_M4_DIR
 	@mkdir -p $(@D)/m4
-- 
2.20.1
