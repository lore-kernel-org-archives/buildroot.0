From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 21:18:35 +0100
Subject: [Buildroot] [git commit] package/libva-utils: fix build failure
 when x11 support is disabled
Message-ID: <20190211201708.1929088CF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9029aa1889a1b8d86ea321dd09f499ea369750a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/2f8/2f89e41f79e8bec1c0561b486ae5750fc87a6320/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uild-failure-when-x11-support-is-disabled.patch | 33 ++++++++++++++++++++++
 package/libva-utils/libva-utils.mk                 |  1 +
 2 files changed, 34 insertions(+)

diff --git a/package/libva-utils/0002-Fix-build-failure-when-x11-support-is-disabled.patch b/package/libva-utils/0002-Fix-build-failure-when-x11-support-is-disabled.patch
new file mode 100644
index 0000000000..b14b662abf
--- /dev/null
+++ b/package/libva-utils/0002-Fix-build-failure-when-x11-support-is-disabled.patch
@@ -0,0 +1,33 @@
+From ad66d3c202eb72ac5808f13a0489ac836dc55aac Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 11 Feb 2019 20:31:42 +0100
+Subject: [PATCH] Fix build failure when x11 support is disabled
+
+Patch suggested on upstream bug tracker:
+https://github.com/intel/libva-utils/issues/150#issuecomment-462059528
+
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
++SUBDIRS = common decode encode vainfo videoprocess vendor/intel
+ 
+ if USE_X11
+-SUBDIRS += putsurface
++SUBDIRS += putsurface vendor/intel/sfcsample
+ else
+ if USE_WAYLAND
+ SUBDIRS += putsurface
+-- 
+2.20.1
+
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index fab3894b18..be857bb4f1 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -10,6 +10,7 @@ LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBV
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
 # 0001-check-ssp.patch
+# 0002-Fix-build-failure-when-x11-support-is-disabled.patch
 LIBVA_UTILS_AUTORECONF = YES
 LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
 
