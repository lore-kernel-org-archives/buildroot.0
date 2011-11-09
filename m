From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Nov 2011 09:42:22 +0100
Subject: [Buildroot] [git commit] gpsd: fix navcom driver build when no
	other drivers using binary are enabled
Message-ID: <20111109084558.7EA468F4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=891ba7a4efcf90aeabd13f215fbddd8c754f1da4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch sent upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/gpsd-2.95-navcom.patch |   47 +++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/gpsd-2.95-navcom.patch b/package/gpsd/gpsd-2.95-navcom.patch
new file mode 100644
index 0000000..659cea1
--- /dev/null
+++ b/package/gpsd/gpsd-2.95-navcom.patch
@@ -0,0 +1,47 @@
+[PATCH] Navcom needs binary support
+
+Enable binary support when navcom driver is enabled, otherwise the build
+errors out with:
+
+./libgpsd.so: undefined reference to `navcom_binary'
+
+If no other drivers needing binary support are enabled.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ driver_navcom.c |    4 ++--
+ gpsd.h-tail     |    2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+Index: gpsd-2.95/driver_navcom.c
+===================================================================
+--- gpsd-2.95.orig/driver_navcom.c
++++ gpsd-2.95/driver_navcom.c
+@@ -44,7 +44,7 @@
+ #include <stdio.h>
+ #include "gpsd.h"
+ 
+-#if defined(NAVCOM_ENABLE) && defined(BINARY_ENABLE)
++#if defined(NAVCOM_ENABLE)
+ #include "bits.h"
+ 
+ /* Have data which is 24 bits long */
+@@ -1339,4 +1339,4 @@
+ };
+ /* *INDENT-ON* */
+ 
+-#endif /* defined(NAVCOM_ENABLE) && defined(BINARY_ENABLE) */
++#endif /* defined(NAVCOM_ENABLE) */
+Index: gpsd-2.95/gpsd.h-tail
+===================================================================
+--- gpsd-2.95.orig/gpsd.h-tail
++++ gpsd-2.95/gpsd.h-tail
+@@ -30,7 +30,7 @@
+ #ifdef EARTHMATE_ENABLE
+ #define ZODIAC_ENABLE	
+ #endif
+-#if defined(ZODIAC_ENABLE) || defined(SIRF_ENABLE) || defined(GARMIN_ENABLE) || defined(TSIP_ENABLE) || defined(EVERMORE_ENABLE) || defined(ITRAX_ENABLE) || defined(UBX_ENABLE) || defined(SUPERSTAR2_ENABLE) || defined(ONCORE_ENABLE)
++#if defined(ZODIAC_ENABLE) || defined(SIRF_ENABLE) || defined(GARMIN_ENABLE) || defined(TSIP_ENABLE) || defined(EVERMORE_ENABLE) || defined(ITRAX_ENABLE) || defined(UBX_ENABLE) || defined(SUPERSTAR2_ENABLE) || defined(ONCORE_ENABLE) || defined(NAVCOM_ENABLE)
+ #define BINARY_ENABLE	
+ #endif
+ #if defined(TRIPMATE_ENABLE) || defined(BINARY_ENABLE)
