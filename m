From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] hal: add missing includes
Message-ID: <20091216153105.9F7BE77738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b08f1d00e0391c9b134bc2e6851de1770a764cfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build (with modern kernel headers)
- hald/linux/classdev.c needs sys/socket.h for struct sockaddr
- hald/linux/addons/addon-storage.c needs limits.h for INT_MAX

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                           |    2 +-
 package/hal/hal-include-fix.patch |   35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 package/hal/hal-include-fix.patch

diff --git a/CHANGES b/CHANGES
index 4851a9f..f8fd9d0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
-	directfb, gst-plugins-bad, iw, libfuse, libpcap, lighttpd,
+	directfb, gst-plugins-bad, hal, iw, libfuse, libpcap, lighttpd,
 	mesa, mtd-utils, pcre, qt, sshfs, tremor, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/hal/hal-include-fix.patch b/package/hal/hal-include-fix.patch
new file mode 100644
index 0000000..af2a7fe
--- /dev/null
+++ b/package/hal/hal-include-fix.patch
@@ -0,0 +1,35 @@
+[PATCH] hal: add missing includes
+
+- hald/linux/classdev.c needs sys/socket.h for struct sockaddr
+- hald/linux/addons/addon-storage.c needs limits.h for INT_MAX
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ hald/linux/addons/addon-storage.c |    1 +
+ hald/linux/classdev.c             |    1 +
+ 2 files changed, 2 insertions(+)
+
+Index: hal-0.5.8/hald/linux/addons/addon-storage.c
+===================================================================
+--- hal-0.5.8.orig/hald/linux/addons/addon-storage.c
++++ hal-0.5.8/hald/linux/addons/addon-storage.c
+@@ -29,6 +29,7 @@
+ 
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <linux/cdrom.h>
+ #include <linux/fs.h>
+ #include <mntent.h>
+Index: hal-0.5.8/hald/linux/classdev.c
+===================================================================
+--- hal-0.5.8.orig/hald/linux/classdev.c
++++ hal-0.5.8/hald/linux/classdev.c
+@@ -31,6 +31,7 @@
+ 
+ #include <ctype.h>
+ #include <limits.h>
++#include <sys/socket.h>
+ #include <linux/types.h>
+ #include <net/if_arp.h> /* for ARPHRD_... */
+ #include <stdlib.h>
-- 
1.6.3.3
