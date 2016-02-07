From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 12:24:11 +0100
Subject: [Buildroot] [git commit] package/iperf3: fix musl build
Message-ID: <20160207112414.E32C28082C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be4ab74d321dc5055e66681311bdd9c953b48fe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ported -D_GNU_SOURCE from https://dev.openwrt.org/changeset/45103

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../iperf3/0002-Fix-build-using-musl-libc.patch    | 43 ++++++++++++++++++++++
 package/iperf3/iperf3.mk                           |  2 +
 2 files changed, 45 insertions(+)

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
