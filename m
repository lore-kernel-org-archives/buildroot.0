From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 15:26:28 +0200
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
	to 1.5.1
Message-ID: <20150329132636.224B580797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e009cbc0a5aeefcb8cc6c7b763bab0d834ba2938
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0002-wayland.patch, fixed upstream
http://cgit.freedesktop.org/vaapi/intel-driver/commit/?id=bf324e3440246a487997a1624ac862e3e4027f9e
Therefore autoreconf is not necessary anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva-intel-driver/0001-wayland.patch      |   50 --------------------
 package/libva-intel-driver/libva-intel-driver.hash |    4 +-
 package/libva-intel-driver/libva-intel-driver.mk   |    3 +-
 3 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/package/libva-intel-driver/0001-wayland.patch b/package/libva-intel-driver/0001-wayland.patch
deleted file mode 100644
index 2f8c859..0000000
--- a/package/libva-intel-driver/0001-wayland.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Fixes various wayland-related compile errors:
-
-i965_output_wayland.c:31:41: fatal error: wayland-drm-client-protocol.h:
- No such file or directory
-
-i965_output_wayland.h:31:26: error: unknown type name 'VADriverContextP'
-
-make[4]: *** No rule to make target `wayland-drm-client-protocol.h', needed by
- `i965_output_wayland.c'.  Stop.
-
-Patch sent upstream:
-http://lists.freedesktop.org/archives/libva/2014-July/002520.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libva-intel-driver-1.3.2.org/src/i965_output_wayland.c libva-intel-driver-1.3.2/src/i965_output_wayland.c
---- libva-intel-driver-1.3.2.org/src/i965_output_wayland.c	2014-06-03 02:36:44.000000000 +0200
-+++ libva-intel-driver-1.3.2/src/i965_output_wayland.c	2014-07-19 11:48:31.329043292 +0200
-@@ -28,7 +28,7 @@
- #include <va/va_backend.h>
- #include <va/va_backend_wayland.h>
- #include <wayland-client.h>
--#include <wayland-drm-client-protocol.h>
-+#include <va/wayland-drm-client-protocol.h>
- #include "intel_driver.h"
- #include "i965_output_wayland.h"
- #include "i965_drv_video.h"
-diff -uNr libva-intel-driver-1.3.2.org/src/i965_output_wayland.h libva-intel-driver-1.3.2/src/i965_output_wayland.h
---- libva-intel-driver-1.3.2.org/src/i965_output_wayland.h	2014-05-19 10:19:39.000000000 +0200
-+++ libva-intel-driver-1.3.2/src/i965_output_wayland.h	2014-07-19 11:48:09.201321881 +0200
-@@ -26,6 +26,7 @@
- #define I965_OUTPUT_WAYLAND_H
- 
- #include <stdbool.h>
-+#include <va/va_backend.h>
- 
- bool
- i965_output_wayland_init(VADriverContextP ctx);
-diff -uNr libva-intel-driver-1.3.2.org/src/Makefile.am libva-intel-driver-1.3.2/src/Makefile.am
---- libva-intel-driver-1.3.2.org/src/Makefile.am	2014-06-16 04:13:12.000000000 +0200
-+++ libva-intel-driver-1.3.2/src/Makefile.am	2014-07-19 11:53:02.885627916 +0200
-@@ -146,7 +146,7 @@
- endif
- 
- # Wayland protocol
--protocol_source_h = wayland-drm-client-protocol.h
-+#protocol_source_h = wayland-drm-client-protocol.h
- i965_output_wayland.c: $(protocol_source_h)
- @wayland_scanner_rules@
- 
diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 837a40e..b03bb1d 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# http://lists.freedesktop.org/archives/libva/2014-December/002982.html
-sha1	9f8dc82879d1cf6cbbe7ef49b5d659ccdf45acd7	libva-intel-driver-1.5.0.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-March/003250.html
+sha1	98b670517cbd2d0e5e2ef3f171b805815dff9057	libva-intel-driver-1.5.1.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 0d1a0a7..5755207 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.5.0
+LIBVA_INTEL_DRIVER_VERSION = 1.5.1
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
 LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
-LIBVA_INTEL_DRIVER_AUTORECONF = YES
 LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
