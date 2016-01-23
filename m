From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 22:52:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/iperf3: fix musl build
In-Reply-To: <1453585942-17556-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453585942-17556-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453585942-17556-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ported -D_GNU_SOURCE from https://dev.openwrt.org/changeset/45103
Sent patch upstream: https://github.com/esnet/iperf/issues/331

Fixes
http://autobuild.buildroot.net/results/50e/50e34db9e273ebb7b8a9198dec254f6b22e26eff/
http://autobuild.buildroot.net/results/efd/efd241ecfcece28b4541ce19851418a1a4172425/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iperf3/0002-musl.patch | 27 +++++++++++++++++++++++++++
 package/iperf3/iperf3.mk       |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 package/iperf3/0002-musl.patch

diff --git a/package/iperf3/0002-musl.patch b/package/iperf3/0002-musl.patch
new file mode 100644
index 0000000..764c00b
--- /dev/null
+++ b/package/iperf3/0002-musl.patch
@@ -0,0 +1,27 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr iperf-3.1.1.org/src/cjson.h iperf-3.1.1/src/cjson.h
+--- iperf-3.1.1.org/src/cjson.h	2015-11-19 18:23:48.000000000 +0100
++++ iperf-3.1.1/src/cjson.h	2016-01-23 22:45:28.000000000 +0100
+@@ -23,6 +23,8 @@
+ #ifndef cJSON__h
+ #define cJSON__h
+ 
++#include <stdint.h>
++
+ #ifdef __cplusplus
+ extern "C"
+ {
+diff -uNr iperf-3.1.1.org/src/timer.h iperf-3.1.1/src/timer.h
+--- iperf-3.1.1.org/src/timer.h	2015-11-19 18:23:48.000000000 +0100
++++ iperf-3.1.1/src/timer.h	2016-01-23 22:42:30.000000000 +0100
+@@ -30,6 +30,7 @@
+ #ifndef __TIMER_H
+ #define __TIMER_H
+ 
++#include <stdint.h>
+ #include <sys/time.h>
+ 
+ /* TimerClientData is an opaque value that tags along with a timer.  The
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
