From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 25 Aug 2014 10:40:23 +0100
Subject: [Buildroot] [PATCH] gpsd: bump version to 3.11
Message-ID: <1408959623-26890-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...d-01-Fix-build-error-when-ntpshm-is-false.patch | 46 ++++++++++++++++++++++
 .../gpsd/gpsd-02-sconstruct-disable-rpath.patch    | 16 ++++----
 package/gpsd/gpsd.mk                               |  7 ++--
 3 files changed, 56 insertions(+), 13 deletions(-)
 create mode 100644 package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch

diff --git a/package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch b/package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch
new file mode 100644
index 0000000..d69d9e2
--- /dev/null
+++ b/package/gpsd/gpsd-01-Fix-build-error-when-ntpshm-is-false.patch
@@ -0,0 +1,46 @@
+From 8e081f1bd5c82b842ee317cd55e70f646ae31f05 Mon Sep 17 00:00:00 2001
+From: Simon Dawson <spdawson@gmail.com>
+Date: Mon, 25 Aug 2014 10:26:11 +0100
+Subject: [PATCH] Fix build error when ntpshm is false
+To: gpsd-dev at nongnu.org
+
+The build fails as follows
+
+libgpsd_core.c: In function 'ntpshm_latch':
+libgpsd_core.c:1660:24: error: 'const struct gps_type_t' has no member named 'time_offset'
+  || device->device_type->time_offset == NULL)
+                        ^
+libgpsd_core.c:1663:33: error: 'const struct gps_type_t' has no member named 'time_offset'
+  fix_time += device->device_type->time_offset(device);
+                                 ^
+scons: *** [libgpsd_core.os] Error 1
+
+The solution is to wrap #ifdef NTPSHM_ENABLE around the ntpshm_latch function
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+---
+ libgpsd_core.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgpsd_core.c b/libgpsd_core.c
+index 6ec08a4..f7e8075 100644
+--- a/libgpsd_core.c
++++ b/libgpsd_core.c
+@@ -1638,6 +1638,7 @@ void gpsd_zero_satellites( /*@out@*/ struct gps_data_t *out)
+ #endif
+ }
+ 
++#ifdef NTPSHM_ENABLE
+ void ntpshm_latch(struct gps_device_t *device, struct timedrift_t /*@out@*/*td)
+ /* latch the fact that we've saved a fix */
+ {
+@@ -1668,5 +1669,6 @@ void ntpshm_latch(struct gps_device_t *device, struct timedrift_t /*@out@*/*td)
+     device->last_fixtime.clock = td->clock.tv_sec + td->clock.tv_nsec / 1e9;
+ #endif /* S_SPLINT_S */
+ }
++#endif /* NTPSHM_ENABLE */
+ 
+ /* end */
+-- 
+1.9.1
+
diff --git a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
index 5cbdf13..8251cfc 100644
--- a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
+++ b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
@@ -4,16 +4,14 @@ Signed-off-by: Simon Dawson <spdawson@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
 diff -Nurp a/SConstruct b/SConstruct
---- a/SConstruct	2013-11-22 13:10:01.000000000 +0000
-+++ b/SConstruct	2013-11-23 11:26:57.698486777 +0000
-@@ -299,11 +299,6 @@ if env["sysroot"]:
- # system default load path. /lib and /usr/lib should always be on
- # this; listing them explicitly is a fail-safe against this ldconfig
- # invocation not doing what we expect.
+--- a/SConstruct	2014-08-23 18:41:09.000000000 +0100
++++ b/SConstruct	2014-08-25 09:46:53.754364989 +0100
+@@ -300,9 +300,6 @@ if env["sysroot"]:
+ 
+ # Don't hack RPATH unless libdir points somewhere that is not on the
+ # minimum default load path.
 -if env["shared"]:
--    sysrpath = Split(_getoutput("ldconfig -v -N -X 2>/dev/null | sed -n -e '/^\//s/://p'"))
--    if env["libdir"] not in ["/usr/lib", "/lib"] + sysrpath:
--        announce("Prepending %s to RPATH." % installdir('libdir', False))
+-    if env["libdir"] not in ["/usr/lib", "/lib"]:
 -        env.Prepend(RPATH=[installdir('libdir')])
  
  # Give deheader a way to set compiler flags
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 0f655ba..7dc27e8 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GPSD_VERSION = b4c32aa40cff1b4e1041d5f3004e9d9156cdf96f
-GPSD_SITE = git://git.savannah.nongnu.org/gpsd.git
+GPSD_VERSION = 3.11
+GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING
 GPSD_INSTALL_STAGING = YES
@@ -19,7 +19,6 @@ GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
 GPSD_SCONS_OPTS = \
 	arch=$(ARCH)\
 	prefix=/usr\
-	chrpath=no\
 	sysroot=$(STAGING_DIR)\
 	strip=no\
 	python=no
@@ -48,7 +47,7 @@ ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
 	GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
 	GPSD_DEPENDENCIES += qt host-pkgconf
 else
-	GPSD_SCONS_OPTS += libQgpsmm=no
+	GPSD_SCONS_OPTS += qt=no
 endif
 
 # If libusb is available build it before so the package can use it
-- 
1.9.1
