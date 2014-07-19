From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Jul 2014 12:43:28 +0200
Subject: [Buildroot] [PATCH 1/1] libva/libva-intel-driver: Fix
	wayland-related compile errors
Message-ID: <1405766608-22760-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/896/896010d8a9ef978386ea1af8e21f5999a735997d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../libva-intel-driver-0001-wayland.patch          |   50 ++++++++++++++++++++
 package/libva/libva-0002-wayland.patch             |   26 ++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 package/libva-intel-driver/libva-intel-driver-0001-wayland.patch
 create mode 100644 package/libva/libva-0002-wayland.patch

diff --git a/package/libva-intel-driver/libva-intel-driver-0001-wayland.patch b/package/libva-intel-driver/libva-intel-driver-0001-wayland.patch
new file mode 100644
index 0000000..2f8c859
--- /dev/null
+++ b/package/libva-intel-driver/libva-intel-driver-0001-wayland.patch
@@ -0,0 +1,50 @@
+Fixes various wayland-related compile errors:
+
+i965_output_wayland.c:31:41: fatal error: wayland-drm-client-protocol.h:
+ No such file or directory
+
+i965_output_wayland.h:31:26: error: unknown type name 'VADriverContextP'
+
+make[4]: *** No rule to make target `wayland-drm-client-protocol.h', needed by
+ `i965_output_wayland.c'.  Stop.
+
+Patch sent upstream:
+http://lists.freedesktop.org/archives/libva/2014-July/002520.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libva-intel-driver-1.3.2.org/src/i965_output_wayland.c libva-intel-driver-1.3.2/src/i965_output_wayland.c
+--- libva-intel-driver-1.3.2.org/src/i965_output_wayland.c	2014-06-03 02:36:44.000000000 +0200
++++ libva-intel-driver-1.3.2/src/i965_output_wayland.c	2014-07-19 11:48:31.329043292 +0200
+@@ -28,7 +28,7 @@
+ #include <va/va_backend.h>
+ #include <va/va_backend_wayland.h>
+ #include <wayland-client.h>
+-#include <wayland-drm-client-protocol.h>
++#include <va/wayland-drm-client-protocol.h>
+ #include "intel_driver.h"
+ #include "i965_output_wayland.h"
+ #include "i965_drv_video.h"
+diff -uNr libva-intel-driver-1.3.2.org/src/i965_output_wayland.h libva-intel-driver-1.3.2/src/i965_output_wayland.h
+--- libva-intel-driver-1.3.2.org/src/i965_output_wayland.h	2014-05-19 10:19:39.000000000 +0200
++++ libva-intel-driver-1.3.2/src/i965_output_wayland.h	2014-07-19 11:48:09.201321881 +0200
+@@ -26,6 +26,7 @@
+ #define I965_OUTPUT_WAYLAND_H
+ 
+ #include <stdbool.h>
++#include <va/va_backend.h>
+ 
+ bool
+ i965_output_wayland_init(VADriverContextP ctx);
+diff -uNr libva-intel-driver-1.3.2.org/src/Makefile.am libva-intel-driver-1.3.2/src/Makefile.am
+--- libva-intel-driver-1.3.2.org/src/Makefile.am	2014-06-16 04:13:12.000000000 +0200
++++ libva-intel-driver-1.3.2/src/Makefile.am	2014-07-19 11:53:02.885627916 +0200
+@@ -146,7 +146,7 @@
+ endif
+ 
+ # Wayland protocol
+-protocol_source_h = wayland-drm-client-protocol.h
++#protocol_source_h = wayland-drm-client-protocol.h
+ i965_output_wayland.c: $(protocol_source_h)
+ @wayland_scanner_rules@
+ 
diff --git a/package/libva/libva-0002-wayland.patch b/package/libva/libva-0002-wayland.patch
new file mode 100644
index 0000000..e309096
--- /dev/null
+++ b/package/libva/libva-0002-wayland.patch
@@ -0,0 +1,26 @@
+Fixes compile error in libva-intel-driver
+
+make[4]: Entering directory `/home/br/br/output/build/libva-intel-driver-1.3.2/src'
+  CC       i965_drv_video_la-i965_output_wayland.lo
+i965_output_wayland.c:31:41: fatal error: wayland-drm-client-protocol.h: No such file or directory
+compilation terminated.
+
+Patch sent upstream:
+http://lists.freedesktop.org/archives/libva/2014-July/002519.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libva-1.3.1.org/va/wayland/Makefile.am libva-1.3.1/va/wayland/Makefile.am
+--- libva-1.3.1.org/va/wayland/Makefile.am	2014-05-09 06:28:15.000000000 +0200
++++ libva-1.3.1/va/wayland/Makefile.am	2014-07-19 11:46:01.126931242 +0200
+@@ -54,8 +54,8 @@
+ 
+ noinst_LTLIBRARIES		= libva_wayland.la
+ libva_waylandincludedir		= ${includedir}/va
+-libva_waylandinclude_HEADERS	= $(source_h)
+-libva_wayland_la_SOURCES	= $(source_c) $(protocol_source_h)
++libva_waylandinclude_HEADERS	= $(source_h) $(protocol_source_h)
++libva_wayland_la_SOURCES	= $(source_c)
+ noinst_HEADERS			= $(source_h_priv)
+ 
+ # Wayland protocol
-- 
1.7.10.4
