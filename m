From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 19:27:56 +0100
Subject: [Buildroot] [PATCH v2] package/iperf3: fix musl build
Message-ID: <1454178476-3057-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ported -D_GNU_SOURCE from https://dev.openwrt.org/changeset/45103

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../iperf3/0002-Fix-build-using-musl-libc.patch    | 43 ++++++++++++++++++++++
 package/iperf3/iperf3.mk                           |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 package/iperf3/0002-Fix-build-using-musl-libc.patch

diff --git a/package/iperf3/0002-Fix-build-using-musl-libc.patch b/package/iperf3/0002-Fix-build-using-musl-libc.patch
new file mode 100644
index 0000000..f220360
--- /dev/null
+++ b/package/iperf3/0002-Fix-build-using-musl-libc.patch
@@ -0,0 +1,43 @@
+From 1fe02385b60c9dcd8a04b8bd3ff5cff120ec35a6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 30 Jan 2016 19:23:20 +0100
+Subject: [PATCH 1/1] Fix build using musl libc
+
+Fixes https://github.com/esnet/iperf/issues/331
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Patch sent upstream: https://github.com/esnet/iperf/pull/344
+
+ src/cjson.h | 2 ++
+ src/timer.h | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/src/cjson.h b/src/cjson.h
+index d4449e6..7af19a9 100644
+--- a/src/cjson.h
++++ b/src/cjson.h
+@@ -23,6 +23,8 @@
+ #ifndef cJSON__h
+ #define cJSON__h
+ 
++#include <stdint.h>
++
+ #ifdef __cplusplus
+ extern "C"
+ {
+diff --git a/src/timer.h b/src/timer.h
+index 0f9c5eb..9b22b7f 100644
+--- a/src/timer.h
++++ b/src/timer.h
+@@ -30,6 +30,7 @@
+ #ifndef __TIMER_H
+ #define __TIMER_H
+ 
++#include <stdint.h>
+ #include <sys/time.h>
+ 
+ /* TimerClientData is an opaque value that tags along with a timer.  The
+-- 
+2.7.0.rc3
+
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 885a599..74d6cce 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -9,4 +9,6 @@ IPERF3_SITE = $(call github,esnet,iperf,$(IPERF3_VERSION))
 IPERF3_LICENSE = BSD-3c, BSD-2c, MIT
 IPERF3_LICENSE_FILES = LICENSE
 
+IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
 $(eval $(autotools-package))
-- 
2.7.0.rc3
