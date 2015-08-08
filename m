From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  8 Aug 2015 18:39:13 +0200
Subject: [Buildroot] [PATCH] package/powertop: add missing headers for musl
Message-ID: <1439051953-11850-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported upstream:
https://github.com/fenrus75/powertop/pull/20

Fixes:
http://autobuild.buildroot.net/results/713/713df99bebd625434e029abdf360574de879afa3/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0003-add-missing-sys-time.h-header.patch       | 35 ++++++++++++++++++++++
 .../powertop/0004-add-missing-stdio.h-header.patch | 35 ++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 package/powertop/0003-add-missing-sys-time.h-header.patch
 create mode 100644 package/powertop/0004-add-missing-stdio.h-header.patch

diff --git a/package/powertop/0003-add-missing-sys-time.h-header.patch b/package/powertop/0003-add-missing-sys-time.h-header.patch
new file mode 100644
index 0000000..7156e42
--- /dev/null
+++ b/package/powertop/0003-add-missing-sys-time.h-header.patch
@@ -0,0 +1,35 @@
+From 283cab667a9ac3ae3a675b5e5d1a42191188699f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 8 Aug 2015 18:24:48 +0200
+Subject: [PATCH] add missing sys/time.h header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+struct timeval is defined in sys/time.h with a musl toolchain.
+
+Fixes:
+In file included from devices/devfreq.cpp:35:0:
+devices/devfreq.h:35:18: error: field ?stamp_before? has incomplete type ?timeval?
+  struct timeval  stamp_before, stamp_after;
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/devices/devfreq.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/devices/devfreq.h b/src/devices/devfreq.h
+index 16a60fb..4a8983b 100644
+--- a/src/devices/devfreq.h
++++ b/src/devices/devfreq.h
+@@ -27,6 +27,7 @@
+ 
+ #include "device.h"
+ #include "../parameters/parameters.h"
++#include <sys/time.h>
+ 
+ struct frequency;
+ 
+-- 
+2.4.3
+
diff --git a/package/powertop/0004-add-missing-stdio.h-header.patch b/package/powertop/0004-add-missing-stdio.h-header.patch
new file mode 100644
index 0000000..7619cca
--- /dev/null
+++ b/package/powertop/0004-add-missing-stdio.h-header.patch
@@ -0,0 +1,35 @@
+From e6cfd977c81b335664db1d5d3d6b5488c245e30f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 8 Aug 2015 18:26:15 +0200
+Subject: [PATCH] add missing stdio.h header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+snprinf is defined in stdio.h.
+
+Fixes:
+perf/perf_bundle.cpp: In function ?void parse_event_format(const char*)?:
+perf/perf_bundle.cpp:141:75: error: ?sprintf? was not declared in this scope
+  sprintf(file, "/sys/kernel/debug/tracing/events/%s/%s/format", sys, event);
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/perf/perf_bundle.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
+index cf1ae11..3d216ff 100644
+--- a/src/perf/perf_bundle.cpp
++++ b/src/perf/perf_bundle.cpp
+@@ -31,6 +31,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <unistd.h>
++#include <stdio.h>
+ 
+ #include "perf_bundle.h"
+ #include "perf_event.h"
+-- 
+2.4.3
+
-- 
2.4.3
