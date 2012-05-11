From: Markos Chandras <markos.chandras@imgtec.com>
Date: Fri, 11 May 2012 11:24:14 +0100
Subject: [Buildroot] [PATCH] gpsd: Remove package version from the navcom
	patch
Message-ID: <1336731854-5526-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the buildroot infrastructure finds a patch file that contains the
$PKG-$VERSION tuple in the filename, it will only apply this kind of
patches, ignoring the rest of the patches in the package directory.
As a result of which, the gpsd-fix-libgpsmm.patch did not apply
because the gpsd-2.95-navcom.patch satisfies the $PKG-$VERSION convention.
The buildroot policy (as discussed during the Buildroot Developer meeting)
is to remove the package version from the patch filename.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/gpsd/gpsd-2.95-navcom.patch |   47 -----------------------------------
 package/gpsd/gpsd-navcom.patch      |   47 +++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 47 deletions(-)
 delete mode 100644 package/gpsd/gpsd-2.95-navcom.patch
 create mode 100644 package/gpsd/gpsd-navcom.patch

diff --git a/package/gpsd/gpsd-2.95-navcom.patch b/package/gpsd/gpsd-2.95-navcom.patch
deleted file mode 100644
index 659cea1..0000000
--- a/package/gpsd/gpsd-2.95-navcom.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-[PATCH] Navcom needs binary support
-
-Enable binary support when navcom driver is enabled, otherwise the build
-errors out with:
-
-./libgpsd.so: undefined reference to `navcom_binary'
-
-If no other drivers needing binary support are enabled.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- driver_navcom.c |    4 ++--
- gpsd.h-tail     |    2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-Index: gpsd-2.95/driver_navcom.c
-===================================================================
---- gpsd-2.95.orig/driver_navcom.c
-+++ gpsd-2.95/driver_navcom.c
-@@ -44,7 +44,7 @@
- #include <stdio.h>
- #include "gpsd.h"
- 
--#if defined(NAVCOM_ENABLE) && defined(BINARY_ENABLE)
-+#if defined(NAVCOM_ENABLE)
- #include "bits.h"
- 
- /* Have data which is 24 bits long */
-@@ -1339,4 +1339,4 @@
- };
- /* *INDENT-ON* */
- 
--#endif /* defined(NAVCOM_ENABLE) && defined(BINARY_ENABLE) */
-+#endif /* defined(NAVCOM_ENABLE) */
-Index: gpsd-2.95/gpsd.h-tail
-===================================================================
---- gpsd-2.95.orig/gpsd.h-tail
-+++ gpsd-2.95/gpsd.h-tail
-@@ -30,7 +30,7 @@
- #ifdef EARTHMATE_ENABLE
- #define ZODIAC_ENABLE	
- #endif
--#if defined(ZODIAC_ENABLE) || defined(SIRF_ENABLE) || defined(GARMIN_ENABLE) || defined(TSIP_ENABLE) || defined(EVERMORE_ENABLE) || defined(ITRAX_ENABLE) || defined(UBX_ENABLE) || defined(SUPERSTAR2_ENABLE) || defined(ONCORE_ENABLE)
-+#if defined(ZODIAC_ENABLE) || defined(SIRF_ENABLE) || defined(GARMIN_ENABLE) || defined(TSIP_ENABLE) || defined(EVERMORE_ENABLE) || defined(ITRAX_ENABLE) || defined(UBX_ENABLE) || defined(SUPERSTAR2_ENABLE) || defined(ONCORE_ENABLE) || defined(NAVCOM_ENABLE)
- #define BINARY_ENABLE	
- #endif
- #if defined(TRIPMATE_ENABLE) || defined(BINARY_ENABLE)
diff --git a/package/gpsd/gpsd-navcom.patch b/package/gpsd/gpsd-navcom.patch
new file mode 100644
index 0000000..659cea1
--- /dev/null
+++ b/package/gpsd/gpsd-navcom.patch
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
-- 
1.7.1
