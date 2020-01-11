From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jan 2020 09:32:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libva-utils: fix non x11 build
Message-ID: <20200111083228.59137-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/70f/70fd6609fffdaa07be583420dab067da27b7d505/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: used another patch which does not require autoreconf (Thomas)

 .../0001-fix-build-without-x11.patch          | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libva-utils/0001-fix-build-without-x11.patch

diff --git a/package/libva-utils/0001-fix-build-without-x11.patch b/package/libva-utils/0001-fix-build-without-x11.patch
new file mode 100644
index 0000000000..0cb5030d7c
--- /dev/null
+++ b/package/libva-utils/0001-fix-build-without-x11.patch
@@ -0,0 +1,33 @@
+From 0d033c074b63ab0ef0798128b94b364ce33da93a Mon Sep 17 00:00:00 2001
+From: Ed Baker <edward.baker@intel.com>
+Date: Wed, 8 Jan 2020 13:43:38 -0700
+Subject: [PATCH] Ifdef va_x11 in VP sample for usrptr
+
+When updating libva-utils from 2.4.0 to 2.6.0 in Chrome OS I bumped into
+the following error:
+portage/media-video/libva-utils-2.6.0-r1/work/libva-utils-2.6.0/videoprocess/vppscaling_n_out_usrptr.cpp:41:10: fatal error:
+      'va/va_x11.h' file not found
+
+Downloaded from upstream PR:
+https://github.com/intel/libva-utils/pull/185
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Edward Baker <edward.baker@intel.com>
+---
+ videoprocess/vppscaling_n_out_usrptr.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/videoprocess/vppscaling_n_out_usrptr.cpp b/videoprocess/vppscaling_n_out_usrptr.cpp
+index 4a3a222..a853442 100644
+--- a/videoprocess/vppscaling_n_out_usrptr.cpp
++++ b/videoprocess/vppscaling_n_out_usrptr.cpp
+@@ -38,7 +38,9 @@
+ #include <va/va.h>
+ #include <va/va_vpp.h>
+ #include "va_display.h"
++#if 0
+ #include <va/va_x11.h>
++#endif
+ 
+ #define MAX_LEN   1024
+ 
-- 
2.20.1
