From: Simon Dawson <spdawson@gmail.com>
Date: Wed,  3 Sep 2014 18:56:37 +0100
Subject: [Buildroot] [PATCH] gpsd: fix autobuild failures
Message-ID: <1409766997-4927-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a gpsd patch sent upstream. Fixes, for example:

  http://autobuild.buildroot.net/results/c68/c68203cc9cf59db0b645d1b20ee7bed4670bbbf0/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...d-01-Fix-build-error-when-ntpshm-is-false.patch | 17 +++------
 ...apping-of-ntpshm_latch-function-in-ifdef-.patch | 43 ++++++++++++++++++++++
 2 files changed, 48 insertions(+), 12 deletions(-)
 create mode 100644 package/gpsd/gpsd-03-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch

diff --git a/package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch b/package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch
index d69d9e2..9c444c4 100644
--- a/package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch
+++ b/package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch
@@ -19,14 +19,10 @@ The solution is to wrap #ifdef NTPSHM_ENABLE around the ntpshm_latch function
 
 Signed-off-by: Simon Dawson <spdawson@gmail.com>
 ---
- libgpsd_core.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libgpsd_core.c b/libgpsd_core.c
-index 6ec08a4..f7e8075 100644
---- a/libgpsd_core.c
-+++ b/libgpsd_core.c
-@@ -1638,6 +1638,7 @@ void gpsd_zero_satellites( /*@out@*/ struct gps_data_t *out)
+diff -Nurp a/libgpsd_core.c b/libgpsd_core.c
+--- a/libgpsd_core.c	2014-08-22 21:33:55.000000000 +0100
++++ b/libgpsd_core.c	2014-09-03 18:48:34.184931741 +0100
+@@ -1642,6 +1642,7 @@ void gpsd_zero_satellites( /*@out@*/ str
  #endif
  }
  
@@ -34,13 +30,10 @@ index 6ec08a4..f7e8075 100644
  void ntpshm_latch(struct gps_device_t *device, struct timedrift_t /*@out@*/*td)
  /* latch the fact that we've saved a fix */
  {
-@@ -1668,5 +1669,6 @@ void ntpshm_latch(struct gps_device_t *device, struct timedrift_t /*@out@*/*td)
+@@ -1672,5 +1673,6 @@ void ntpshm_latch(struct gps_device_t *d
      device->last_fixtime.clock = td->clock.tv_sec + td->clock.tv_nsec / 1e9;
  #endif /* S_SPLINT_S */
  }
 +#endif /* NTPSHM_ENABLE */
  
  /* end */
--- 
-1.9.1
-
diff --git a/package/gpsd/gpsd-03-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch b/package/gpsd/gpsd-03-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch
new file mode 100644
index 0000000..2d21690
--- /dev/null
+++ b/package/gpsd/gpsd-03-Complete-wrapping-of-ntpshm_latch-function-in-ifdef-.patch
@@ -0,0 +1,43 @@
+From 519314d488624885a73f6204e3113aab850a36a0 Mon Sep 17 00:00:00 2001
+From: Simon Dawson <spdawson@gmail.com>
+Date: Wed, 3 Sep 2014 18:39:22 +0100
+Subject: [PATCH] Complete wrapping of ntpshm_latch function in #ifdef
+ NTPSHM_ENABLE
+To: gpsd-dev at nongnu.org
+
+Currently, the build fails as follows
+
+gpsmon.o: In function `gpsmon_hook':
+gpsmon.c:(.text+0x8b0): undefined reference to `ntpshm_latch'
+collect2: error: ld returned 1 exit status
+scons: *** [gpsmon] Error 1
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+---
+diff -Nurp a/gpsd.h-tail b/gpsd.h-tail
+--- a/gpsd.h-tail	2014-08-22 21:35:56.000000000 +0100
++++ b/gpsd.h-tail	2014-09-03 18:52:04.048627518 +0100
+@@ -842,7 +842,9 @@ extern unsigned int ais_binary_encode(st
+ extern void ntpshm_context_init(struct gps_context_t *);
+ extern void ntpshm_session_init(struct gps_device_t *);
+ extern int ntpshm_put(struct gps_device_t *, int, struct timedrift_t *);
++#ifdef NTPSHM_ENABLE
+ extern void ntpshm_latch(struct gps_device_t *device,  /*@out@*/struct timedrift_t *td);
++#endif /* NTPSHM_ENABLE */
+ extern void ntpshm_link_deactivate(struct gps_device_t *);
+ extern void ntpshm_link_activate(struct gps_device_t *);
+ 
+diff -Nurp a/gpsmon.c b/gpsmon.c
+--- a/gpsmon.c	2014-08-22 21:06:58.000000000 +0100
++++ b/gpsmon.c	2014-09-03 18:52:23.172628059 +0100
+@@ -778,8 +778,10 @@ static void gpsmon_hook(struct gps_devic
+ 
+     report_unlock();
+ 
++#ifdef NTPSHM_ENABLE
+     /* Update the last fix time seen for PPS. FIXME: do this here? */
+     ntpshm_latch(device, &td);
++#endif /* NTPSHM_ENABLE */
+ }
+ /*@+observertrans +nullpass +globstate +compdef +uniondef@*/
+ 
-- 
1.9.1
