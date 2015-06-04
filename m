From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jun 2015 22:44:54 +0200
Subject: [Buildroot] [git commit] gpsd: bump to version 3.15
Message-ID: <20150604211320.49B0881E29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=583edd3f865e1ba298d7e8fe765e27a0a0eb7069
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches #1 and #3. Drop the no longer needed patch #2.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Fix-build-error-when-ntpshm-is-false.patch |   39 ------------------
 package/gpsd/0002-sconstruct-disable-rpath.patch   |   18 --------
 ...apping-of-ntpshm_latch-function-in-ifdef-.patch |   43 --------------------
 package/gpsd/gpsd.hash                             |    2 +-
 package/gpsd/gpsd.mk                               |    2 +-
 5 files changed, 2 insertions(+), 102 deletions(-)

diff --git a/package/gpsd/0001-Fix-build-error-when-ntpshm-is-false.patch b/package/gpsd/0001-Fix-build-error-when-ntpshm-is-false.patch
deleted file mode 100644
index 9c444c4..0000000
--- a/package/gpsd/0001-Fix-build-error-when-ntpshm-is-false.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8e081f1bd5c82b842ee317cd55e70f646ae31f05 Mon Sep 17 00:00:00 2001
-From: Simon Dawson <spdawson@gmail.com>
-Date: Mon, 25 Aug 2014 10:26:11 +0100
-Subject: [PATCH] Fix build error when ntpshm is false
-To: gpsd-dev at nongnu.org
-
-The build fails as follows
-
-libgpsd_core.c: In function 'ntpshm_latch':
-libgpsd_core.c:1660:24: error: 'const struct gps_type_t' has no member named 'time_offset'
-  || device->device_type->time_offset == NULL)
-                        ^
-libgpsd_core.c:1663:33: error: 'const struct gps_type_t' has no member named 'time_offset'
-  fix_time += device->device_type->time_offset(device);
-                                 ^
-scons: *** [libgpsd_core.os] Error 1
-
-The solution is to wrap #ifdef NTPSHM_ENABLE around the ntpshm_latch function
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
----
-diff -Nurp a/libgpsd_core.c b/libgpsd_core.c
---- a/libgpsd_core.c	2014-08-22 21:33:55.000000000 +0100
-+++ b/libgpsd_core.c	2014-09-03 18:48:34.184931741 +0100
-@@ -1642,6 +1642,7 @@ void gpsd_zero_satellites( /*@out@*/ str
- #endif
- }
- 
-+#ifdef NTPSHM_ENABLE
- void ntpshm_latch(struct gps_device_t *device, struct timedrift_t /*@out@*/*td)
- /* latch the fact that we've saved a fix */
- {
-@@ -1672,5 +1673,6 @@ void ntpshm_latch(struct gps_device_t *d
-     device->last_fixtime.clock = td->clock.tv_sec + td->clock.tv_nsec / 1e9;
- #endif /* S_SPLINT_S */
- }
-+#endif /* NTPSHM_ENABLE */
- 
- /* end */
diff --git a/package/gpsd/0002-sconstruct-disable-rpath.patch b/package/gpsd/0002-sconstruct-disable-rpath.patch
deleted file mode 100644
index 8251cfc..0000000
--- a/package/gpsd/0002-sconstruct-disable-rpath.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Disable addition of RPATH to the generated libraries
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff -Nurp a/SConstruct b/SConstruct
---- a/SConstruct	2014-08-23 18:41:09.000000000 +0100
-+++ b/SConstruct	2014-08-25 09:46:53.754364989 +0100
-@@ -300,9 +300,6 @@ if env["sysroot"]:
- 
- # Don't hack RPATH unless libdir points somewhere that is not on the
- # minimum default load path.
--if env["shared"]:
--    if env["libdir"] not in ["/usr/lib", "/lib"]:
--        env.Prepend(RPATH=[installdir('libdir')])
- 
- # Give deheader a way to set compiler flags
- if 'MORECFLAGS' in os.environ:
diff --git a/package/gpsd/0003-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch b/package/gpsd/0003-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch
deleted file mode 100644
index 2d21690..0000000
--- a/package/gpsd/0003-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 519314d488624885a73f6204e3113aab850a36a0 Mon Sep 17 00:00:00 2001
-From: Simon Dawson <spdawson@gmail.com>
-Date: Wed, 3 Sep 2014 18:39:22 +0100
-Subject: [PATCH] Complete wrapping of ntpshm_latch function in #ifdef
- NTPSHM_ENABLE
-To: gpsd-dev at nongnu.org
-
-Currently, the build fails as follows
-
-gpsmon.o: In function `gpsmon_hook':
-gpsmon.c:(.text+0x8b0): undefined reference to `ntpshm_latch'
-collect2: error: ld returned 1 exit status
-scons: *** [gpsmon] Error 1
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
----
-diff -Nurp a/gpsd.h-tail b/gpsd.h-tail
---- a/gpsd.h-tail	2014-08-22 21:35:56.000000000 +0100
-+++ b/gpsd.h-tail	2014-09-03 18:52:04.048627518 +0100
-@@ -842,7 +842,9 @@ extern unsigned int ais_binary_encode(st
- extern void ntpshm_context_init(struct gps_context_t *);
- extern void ntpshm_session_init(struct gps_device_t *);
- extern int ntpshm_put(struct gps_device_t *, int, struct timedrift_t *);
-+#ifdef NTPSHM_ENABLE
- extern void ntpshm_latch(struct gps_device_t *device,  /*@out@*/struct timedrift_t *td);
-+#endif /* NTPSHM_ENABLE */
- extern void ntpshm_link_deactivate(struct gps_device_t *);
- extern void ntpshm_link_activate(struct gps_device_t *);
- 
-diff -Nurp a/gpsmon.c b/gpsmon.c
---- a/gpsmon.c	2014-08-22 21:06:58.000000000 +0100
-+++ b/gpsmon.c	2014-09-03 18:52:23.172628059 +0100
-@@ -778,8 +778,10 @@ static void gpsmon_hook(struct gps_devic
- 
-     report_unlock();
- 
-+#ifdef NTPSHM_ENABLE
-     /* Update the last fix time seen for PPS. FIXME: do this here? */
-     ntpshm_latch(device, &td);
-+#endif /* NTPSHM_ENABLE */
- }
- /*@+observertrans +nullpass +globstate +compdef +uniondef@*/
- 
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 80703c1..8e27ff0 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	ed66c6b6b1e2b4951de2c0b2399c22f77fe9f5927ef6b948dd8eb023ff53b7ee	gpsd-3.11.tar.gz
+sha256	81c89e271ae112313e68655ab30d227bc38fe7841ffbff0f1860b12a9d7696ea	gpsd-3.15.tar.gz
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 1bf4415..2199e31 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.11
+GPSD_VERSION = 3.15
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING
