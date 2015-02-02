From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  2 Feb 2015 15:39:00 +0100
Subject: [Buildroot] [PATCH 4/4] matchbox-panel: fixed undefined reference
	to `log' and `lrint'
In-Reply-To: <1422887940-31198-1-git-send-email-arnout@mind.be>
References: <1422887940-31198-1-git-send-email-arnout@mind.be>
Message-ID: <1422887940-31198-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jean-Paul Etienne <fractalclone@gmail.com>

Encountered the following while compiling matchbox-panel

mb-applet-wireless.o: In function `update_wireless':
.. matchbox-panel-0.9.3/applets/mb-applet-wireless.c:143: undefined reference to `log'
.. matchbox-panel-0.9.3/applets/mb-applet-wireless.c:143: undefined reference to `lrint'

fixed the issue by adding
1) #include <math.h> in mb-applet-wireless.c
2) -lm option to WIRELESS_LIB in applets/Makefile.in

Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[arnout: rename patch and add description and Signed-off-by]

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../matchbox-panel/0002-mb-applet-wireless.patch   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/matchbox/matchbox-panel/0002-mb-applet-wireless.patch

diff --git a/package/matchbox/matchbox-panel/0002-mb-applet-wireless.patch b/package/matchbox/matchbox-panel/0002-mb-applet-wireless.patch
new file mode 100644
index 0000000..93633b3
--- /dev/null
+++ b/package/matchbox/matchbox-panel/0002-mb-applet-wireless.patch
@@ -0,0 +1,34 @@
+mb-applet-wireless: fix undefined reference to `log' and `lrint'
+
+mb-applet-wireless.o: In function `update_wireless':
+.. matchbox-panel-0.9.3/applets/mb-applet-wireless.c:143: undefined reference to `log'
+.. matchbox-panel-0.9.3/applets/mb-applet-wireless.c:143: undefined reference to `lrint'
+
+Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+[arnout: add description and Signed-off-by]
+---
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
2.1.4
