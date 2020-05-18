From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 18 May 2020 11:47:55 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/mtdev2tuio: remove package
Message-ID: <20200518094755.11571-1-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtdev2tuio breaks the builds every now and then and is not
maintained upstream. It does not seem to be useful any more.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>

---
Changes v1 -> v2:
 - Add missing Config.in.legacy entry

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 Config.in.legacy                              |  7 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../0001-Fix-build-with-musl-libc.patch       | 30 ----------
 ...dev2tuio.c-fix-build-with-musl-1.2.0.patch | 57 -------------------
 package/mtdev2tuio/Config.in                  | 13 -----
 package/mtdev2tuio/mtdev2tuio.hash            |  3 -
 package/mtdev2tuio/mtdev2tuio.mk              | 27 ---------
 8 files changed, 7 insertions(+), 132 deletions(-)
 delete mode 100644 package/mtdev2tuio/0001-Fix-build-with-musl-libc.patch
 delete mode 100644 package/mtdev2tuio/0002-mtdev2tuio.c-fix-build-with-musl-1.2.0.patch
 delete mode 100644 package/mtdev2tuio/Config.in
 delete mode 100644 package/mtdev2tuio/mtdev2tuio.hash
 delete mode 100644 package/mtdev2tuio/mtdev2tuio.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 5605ba1fad..e5ab38783c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_MTDEV2TUIO
+	bool "mtdev2tuio package removed"
+	select BR2_LEGACY
+	help
+	  The mtdev2tuio package was removed as it breaks the builds
+	  every now and then and is not maintained upstream.
+
 config BR2_PACKAGE_EZXML
 	bool "ezxml package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0f1574c930..35098210fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2397,7 +2397,6 @@ N:	Stephan Hoffmann <sho@relinux.de>
 F:	package/cache-calibrator/
 F:	package/gtest/
 F:	package/mtdev/
-F:	package/mtdev2tuio/
 
 N:	Steve Calfee <stevecalfee@gmail.com>
 F:	package/python-pymysql/
diff --git a/package/Config.in b/package/Config.in
index c245abbc42..c4e0a4d12c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1877,7 +1877,6 @@ endif
 	source "package/mpfr/Config.in"
 	source "package/mpir/Config.in"
 	source "package/msgpack/Config.in"
-	source "package/mtdev2tuio/Config.in"
 	source "package/musl-compat-headers/Config.in"
 	source "package/musl-fts/Config.in"
 	source "package/openblas/Config.in"
diff --git a/package/mtdev2tuio/0001-Fix-build-with-musl-libc.patch b/package/mtdev2tuio/0001-Fix-build-with-musl-libc.patch
deleted file mode 100644
index 810b66c61b..0000000000
--- a/package/mtdev2tuio/0001-Fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f974bb1f92603973711bea36a7869dfa8358aae0 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 31 Jan 2016 09:04:46 +0100
-Subject: [PATCH 1/1] Fix build with musl libc
-
-Include missing header to prevent build error detected by buildroot:
-http://autobuild.buildroot.net/results/aee/aee411047265bf205f8990a3d0d2310decb5fd19/build-end.log
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-Patch sent upstream: https://github.com/olivopaolo/mtdev2tuio/pull/2
-
- mtdev2tuio.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mtdev2tuio.c b/mtdev2tuio.c
-index 3a9174f..f2c98d5 100644
---- a/mtdev2tuio.c
-+++ b/mtdev2tuio.c
-@@ -41,6 +41,7 @@
- #include <getopt.h>
- #include <signal.h>
- #include <sys/utsname.h>
-+#include <sys/file.h>
- 
- #define NSEC_PER_USEC   1000L
- #define NSEC_PER_SEC    1000000000L
--- 
-2.7.0.rc3
-
diff --git a/package/mtdev2tuio/0002-mtdev2tuio.c-fix-build-with-musl-1.2.0.patch b/package/mtdev2tuio/0002-mtdev2tuio.c-fix-build-with-musl-1.2.0.patch
deleted file mode 100644
index 24ceff52ee..0000000000
--- a/package/mtdev2tuio/0002-mtdev2tuio.c-fix-build-with-musl-1.2.0.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 6fb492ba72b4ecbe5ebba44647e838fb998ee061 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 25 Apr 2020 12:19:32 +0200
-Subject: [PATCH] mtdev2tuio.c: fix build with musl 1.2.0
-
-time element is deprecated on new input_event structure in kernel's
-input.h [1]
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/olivopaolo/mtdev2tuio/pull/6]
----
- mtdev2tuio.c | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/mtdev2tuio.c b/mtdev2tuio.c
-index 3a9174f..fced70c 100644
---- a/mtdev2tuio.c
-+++ b/mtdev2tuio.c
-@@ -47,8 +47,13 @@
- 
- typedef __u64 nstime;
- 
--static inline __u64 timeval_to_ns(const struct timeval *tv) {
--  return ((__u64) tv->tv_sec * NSEC_PER_SEC) + tv->tv_usec * NSEC_PER_USEC ;
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
-+static inline __u64 timeval_to_ns(const struct input_event *ev) {
-+  return ((__u64) ev->input_event_sec * NSEC_PER_SEC) + ev->input_event_usec * NSEC_PER_USEC ;
- }
- 
- static float calc_speed(float s, float s_1, nstime t, nstime t_1) {
-@@ -159,7 +164,7 @@ static void process_event(struct state_t *s, struct device_t *d, const struct in
-       case ABS_MT_POSITION_X:
- 	s->slot[s->cs].x_1 = s->slot[s->cs].x ;
- 	s->slot[s->cs].x = (ev->value - d->x_ofs) * d->x_scale ;
--	time = timeval_to_ns(&ev->time) ;
-+	time = timeval_to_ns(ev) ;
- 	s->slot[s->cs].X = calc_speed(s->slot[s->cs].x, s->slot[s->cs].x_1, time, s->slot[s->cs].t_x) ;
- 	s->slot[s->cs].t_x = time ;
- 	// this slot has been changed
-@@ -168,7 +173,7 @@ static void process_event(struct state_t *s, struct device_t *d, const struct in
-       case ABS_MT_POSITION_Y :
- 	s->slot[s->cs].y_1 = s->slot[s->cs].y ;
- 	s->slot[s->cs].y = (ev->value - d->y_ofs) * d->y_scale ;
--	time = timeval_to_ns(&ev->time) ;
-+	time = timeval_to_ns(ev) ;
- 	s->slot[s->cs].Y = calc_speed(s->slot[s->cs].y, s->slot[s->cs].y_1, time, s->slot[s->cs].t_y) ;
- 	s->slot[s->cs].t_y = time ;
- 	// this slot has been changed
--- 
-2.25.1
-
diff --git a/package/mtdev2tuio/Config.in b/package/mtdev2tuio/Config.in
deleted file mode 100644
index 3e88d21845..0000000000
--- a/package/mtdev2tuio/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_MTDEV2TUIO
-	bool "mtdev2tuio"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
-	select BR2_PACKAGE_LIBLO
-	select BR2_PACKAGE_MTDEV
-	help
-	  mtdev2tuio is a simple application for converting touch
-	  events captured from libmtdev to TUIO 1.1
-
-	  https://github.com/olivopaolo/mtdev2tuio
-
-comment "mtdev2tuio needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mtdev2tuio/mtdev2tuio.hash b/package/mtdev2tuio/mtdev2tuio.hash
deleted file mode 100644
index 9932e9e180..0000000000
--- a/package/mtdev2tuio/mtdev2tuio.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  4a6aa319c44478dceaf01a24603690767e56c029a1f0380da0f31eac5a02e10f  mtdev2tuio-e1e7378d86abe751158e743586133022f32fa4d1.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
deleted file mode 100644
index e9085b007e..0000000000
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# mtdev2tuio
-#
-################################################################################
-
-MTDEV2TUIO_VERSION = e1e7378d86abe751158e743586133022f32fa4d1
-MTDEV2TUIO_SITE = $(call github,olivopaolo,mtdev2tuio,$(MTDEV2TUIO_VERSION))
-MTDEV2TUIO_DEPENDENCIES = mtdev liblo
-MTDEV2TUIO_LICENSE = GPL-3.0+
-MTDEV2TUIO_LICENSE_FILES = COPYING
-
-# mtdev2tuio Makefile misuses $(LD) as gcc, so we need to override LD
-# here. Liblo uses log(3), so we need to link with -lm
-define MTDEV2TUIO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) \
-		$(TARGET_CONFIGURE_OPTS) \
-		LD="$(TARGET_CC)" \
-		LIBS="-lmtdev -llo -lm" \
-		-C $(@D)
-endef
-
-define MTDEV2TUIO_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/mtdev2tuio $(TARGET_DIR)/usr/bin/mtdev2tuio
-endef
-
-$(eval $(generic-package))
-- 
2.20.1
