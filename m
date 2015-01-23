From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Fri, 23 Jan 2015 01:25:04 +0100
Subject: [Buildroot] [PATCH 1/1] matchbox-panel: fixed undefined reference
	to `log' and `lrint'
Message-ID: <1421972704-16309-1-git-send-email-fractalclone@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Encountered the following while compiling matchbox-panel

mb-applet-wireless.o: In function `update_wireless':
.. matchbox-panel-0.9.3/applets/mb-applet-wireless.c:143: undefined reference to `log'
.. matchbox-panel-0.9.3/applets/mb-applet-wireless.c:143: undefined reference to `lrint'

fixed the issue by adding
1) #include <math.h> in mb-applet-wireless.c
2) -lm option to WIRELESS_LIB in applets/Makefile.in

Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
---
 .../matchbox-panel-0.9.3-mb-applet-wireless.patch  | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/matchbox/matchbox-panel/matchbox-panel-0.9.3-mb-applet-wireless.patch

diff --git a/package/matchbox/matchbox-panel/matchbox-panel-0.9.3-mb-applet-wireless.patch b/package/matchbox/matchbox-panel/matchbox-panel-0.9.3-mb-applet-wireless.patch
new file mode 100644
index 0000000..9c946b2
--- /dev/null
+++ b/package/matchbox/matchbox-panel/matchbox-panel-0.9.3-mb-applet-wireless.patch
@@ -0,0 +1,24 @@
+diff -rup matchbox-panel-0.9.3.orig/applets/Makefile.in matchbox-panel-0.9.3/applets/Makefile.in
+--- matchbox-panel-0.9.3.orig/applets/Makefile.in	2015-01-23 00:16:47.594850985 +0100
++++ matchbox-panel-0.9.3/applets/Makefile.in	2015-01-23 00:15:18.458694947 +0100
+@@ -198,7 +198,7 @@ WANT_SMALL_ICONS_FALSE = @WANT_SMALL_ICO
+ WANT_SMALL_ICONS_TRUE = @WANT_SMALL_ICONS_TRUE@
+ WANT_WIFI_FALSE = @WANT_WIFI_FALSE@
+ WANT_WIFI_TRUE = @WANT_WIFI_TRUE@
+-WIRELESS_LIBS = @WIRELESS_LIBS@
++WIRELESS_LIBS = @WIRELESS_LIBS@ -lm
+ XGETTEXT = @XGETTEXT@
+ ac_ct_CC = @ac_ct_CC@
+ ac_ct_STRIP = @ac_ct_STRIP@
+diff -rup matchbox-panel-0.9.3.orig/applets/mb-applet-wireless.c matchbox-panel-0.9.3/applets/mb-applet-wireless.c
+--- matchbox-panel-0.9.3.orig/applets/mb-applet-wireless.c	2015-01-23 00:16:31.531822865 +0100
++++ matchbox-panel-0.9.3/applets/mb-applet-wireless.c	2015-01-23 00:03:43.067563827 +0100
+@@ -50,6 +50,8 @@
+ 
+ #endif
+ 
++#include <math.h>
++
+ #ifdef MB_HAVE_PNG
+ #define IMG_EXT "png"
+ #else
-- 
1.9.3
