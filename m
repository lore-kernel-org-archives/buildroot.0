From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 May 2016 11:57:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/bluez5_utils: tools/bneptest.c:
	Remove include linux/if_bridge.h to fix musl build
In-Reply-To: <1463911064-8854-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463911064-8854-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1463911064-8854-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/eba/ebaa0bcb9c325aa6ed0bbd6c7ec75d44befa7645/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...est.c-Remove-include-linux-if_bridge.h-to.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/bluez5_utils/0001-tools-bneptest.c-Remove-include-linux-if_bridge.h-to.patch

diff --git a/package/bluez5_utils/0001-tools-bneptest.c-Remove-include-linux-if_bridge.h-to.patch b/package/bluez5_utils/0001-tools-bneptest.c-Remove-include-linux-if_bridge.h-to.patch
new file mode 100644
index 0000000..e8a3ff4
--- /dev/null
+++ b/package/bluez5_utils/0001-tools-bneptest.c-Remove-include-linux-if_bridge.h-to.patch
@@ -0,0 +1,45 @@
+From 7c136b4f1941e5bb2a6c8d93985c5734c6aefb29 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@writeme.com>
+Date: Sun, 22 May 2016 09:48:57 +0200
+Subject: [PATCH 1/1] tools/bneptest.c: Remove include linux/if_bridge.h to fix
+ musl build
+
+Inspired by busybox commit:
+https://git.busybox.net/busybox/commit/networking/brctl.c?id=5fa6d1a632505789409a2ba6cf8e112529f9db18
+
+The build error was found by the autobuilders of the buildroot project:
+http://autobuild.buildroot.net/results/eba/ebaa0bcb9c325aa6ed0bbd6c7ec75d44befa7645/build-end.log
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@writeme.com>
+(Patch sent upstream:
+ http://article.gmane.org/gmane.linux.bluez.kernel/67621)
+---
+ tools/bneptest.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/tools/bneptest.c b/tools/bneptest.c
+index 1404252..b832d72 100644
+--- a/tools/bneptest.c
++++ b/tools/bneptest.c
+@@ -36,7 +36,17 @@
+ #include <net/if.h>
+ #include <linux/sockios.h>
+ #include <netinet/in.h>
+-#include <linux/if_bridge.h>
++/* #include <linux/if_bridge.h>
++ * breaks on musl: we already included netinet/in.h,
++ * if we also include <linux/if_bridge.h> here, we get this:
++ * In file included from /usr/include/linux/if_bridge.h:18,
++ *                  from networking/brctl.c:67:
++ * /usr/include/linux/in6.h:32: error: redefinition of 'struct in6_addr'
++ * /usr/include/linux/in6.h:49: error: redefinition of 'struct sockaddr_in6'
++ * /usr/include/linux/in6.h:59: error: redefinition of 'struct ipv6_mreq'
++ */
++/* From <linux/if_bridge.h> */
++#define BRCTL_SET_BRIDGE_FORWARD_DELAY 8
+ 
+ #include <glib.h>
+ 
+-- 
+2.8.1
+
-- 
2.8.1
