From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 12:31:55 +0200
Subject: [Buildroot] [PATCH] lxc: fix offsetof() related musl build issue
Message-ID: <20180420103155.4203-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch that fixes a build issue with musl due to the
fact that offsetof() is used without including <stddef.h>.

Fixes:

  http://autobuild.buildroot.net/results/3c6e34cbcd43aba4dd2b18687bd89fc369c9dab7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ools-lxc_monitor-include-missing-stddef.h.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch

diff --git a/package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch b/package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch
new file mode 100644
index 0000000000..525d5d72b0
--- /dev/null
+++ b/package/lxc/0001-lxc-tools-lxc_monitor-include-missing-stddef.h.patch
@@ -0,0 +1,40 @@
+From 77d407537f57c3fb92787bdda1eeaec7941d344f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 20 Apr 2018 12:26:33 +0200
+Subject: [PATCH] lxc/tools/lxc_monitor: include missing <stddef.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+lxc_monitor.c uses offsetof(), so it should include
+<stddef.h>. Otherwise the build fails with the musl C library:
+
+tools/lxc_monitor.c: In function ?lxc_abstract_unix_connect?:
+tools/lxc_monitor.c:324:9: warning: implicit declaration of function ?offsetof? [-Wimplicit-function-declaration]
+         offsetof(struct sockaddr_un, sun_path) + len + 1);
+         ^~~~~~~~
+tools/lxc_monitor.c:324:18: error: expected expression before ?struct?
+         offsetof(struct sockaddr_un, sun_path) + len + 1);
+                  ^~~~~~
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: https://github.com/lxc/lxc/pull/2285
+---
+ src/lxc/tools/lxc_monitor.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lxc/tools/lxc_monitor.c b/src/lxc/tools/lxc_monitor.c
+index 72dca8e2..c60e14ff 100644
+--- a/src/lxc/tools/lxc_monitor.c
++++ b/src/lxc/tools/lxc_monitor.c
+@@ -30,6 +30,7 @@
+ #include <libgen.h>
+ #include <poll.h>
+ #include <regex.h>
++#include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.14.3
+
-- 
2.14.3
