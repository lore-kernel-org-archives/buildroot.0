From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 13 Dec 2018 23:55:21 +0100
Subject: [Buildroot] [PATCH v1 2/2] iwd: bump version to 0.13
In-Reply-To: <20181213225521.26400-1-ps.report@gmx.net>
References: <20181213225521.26400-1-ps.report@gmx.net>
Message-ID: <20181213225521.26400-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- drop 0001-monitor-pcap.c-add-missing-sys-stat.h-include.patch
  (upstream applied [1])

- drop 0002-Fix-__iwd_backtrace_init-availability-detection.patch
  (upstream applied [2], [3])

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=330a930b01abe64262d1c46c2e27b33e9bbe1487
[2] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=40ec69876cbe40a36fec1d7bc007471b034708f5
[3] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=7d6e11ddd5c0414f8e00db63a0aa7b1c5695b026

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...cap.c-add-missing-sys-stat.h-include.patch | 46 --------------
 ...acktrace_init-availability-detection.patch | 62 -------------------
 package/iwd/iwd.hash                          |  2 +-
 package/iwd/iwd.mk                            |  2 +-
 4 files changed, 2 insertions(+), 110 deletions(-)
 delete mode 100644 package/iwd/0001-monitor-pcap.c-add-missing-sys-stat.h-include.patch
 delete mode 100644 package/iwd/0002-Fix-__iwd_backtrace_init-availability-detection.patch

diff --git a/package/iwd/0001-monitor-pcap.c-add-missing-sys-stat.h-include.patch b/package/iwd/0001-monitor-pcap.c-add-missing-sys-stat.h-include.patch
deleted file mode 100644
index 83be65dcd1..0000000000
--- a/package/iwd/0001-monitor-pcap.c-add-missing-sys-stat.h-include.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a879fc32d58625bd9361219c1285ab6e5f012467 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 2 Nov 2018 14:29:53 +0100
-Subject: [PATCH] monitor/pcap.c: add missing sys/stat.h include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-    CC       monitor/pcap.o
-  monitor/pcap.c: In function ?pcap_create?:
-  monitor/pcap.c:121:6: error: ?S_IRUSR? undeclared (first use in this function)
-        S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
-        ^
-  monitor/pcap.c:121:6: note: each undeclared identifier is reported only once for each function it appears in
-  monitor/pcap.c:121:16: error: ?S_IWUSR? undeclared (first use in this function)
-        S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
-                  ^
-  monitor/pcap.c:121:26: error: ?S_IRGRP? undeclared (first use in this function)
-        S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
-                            ^
-  monitor/pcap.c:121:36: error: ?S_IROTH? undeclared (first use in this function)
-        S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
-                                      ^
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- monitor/pcap.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/monitor/pcap.c b/monitor/pcap.c
-index 54ad9f5..785aefa 100644
---- a/monitor/pcap.c
-+++ b/monitor/pcap.c
-@@ -29,6 +29,7 @@
- #include <fcntl.h>
- #include <unistd.h>
- #include <stdlib.h>
-+#include <sys/stat.h>
- #include <sys/uio.h>
- #include <sys/types.h>
- #include <ell/ell.h>
--- 
-2.19.1
-
diff --git a/package/iwd/0002-Fix-__iwd_backtrace_init-availability-detection.patch b/package/iwd/0002-Fix-__iwd_backtrace_init-availability-detection.patch
deleted file mode 100644
index 53eeca0595..0000000000
--- a/package/iwd/0002-Fix-__iwd_backtrace_init-availability-detection.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 124f6437c246b60f4254651d95b65140b8964ccc Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 2 Nov 2018 14:38:37 +0100
-Subject: [PATCH] Fix __iwd_backtrace_init() availability detection
-
-Check for HAVE_EXECINFO_H for all __iwd_backtrace_init usages (and
-remove unused backtrace.h usage from plugins/ofono.c).
-
-Fixes:
-
-  src/main.o: In function `main':
-  main.c:(.text.startup+0x798): undefined reference to `__iwd_backtrace_init'
-  collect2: error: ld returned 1 exit status
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- plugins/ofono.c | 1 -
- src/backtrace.h | 2 +-
- src/main.c      | 2 +-
- 3 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/plugins/ofono.c b/plugins/ofono.c
-index 8c019ce..077045f 100644
---- a/plugins/ofono.c
-+++ b/plugins/ofono.c
-@@ -31,7 +31,6 @@
- 
- #include "src/dbus.h"
- #include "src/simauth.h"
--#include "src/backtrace.h"
- 
- /*
-  * This plugin takes care of all the communication with ofono in order to
-diff --git a/src/backtrace.h b/src/backtrace.h
-index bfdc858..829ba02 100644
---- a/src/backtrace.h
-+++ b/src/backtrace.h
-@@ -19,7 +19,7 @@
-  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-  *
-  */
--#ifdef __GLIBC__
-+#ifdef HAVE_EXECINFO_H
- void __iwd_backtrace_init();
- void __iwd_backtrace_print(unsigned int offset);
- #endif
-diff --git a/src/main.c b/src/main.c
-index c1a2c42..8035fa0 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -445,7 +445,7 @@ int main(int argc, char *argv[])
- 	if (debugopt)
- 		l_debug_enable(debugopt);
- 
--#ifdef __GLIBC__
-+#ifdef HAVE_EXECINFO_H
- 	__iwd_backtrace_init();
- #endif
- 
--- 
-2.19.1
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index cc3d419560..d8eefc064c 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 a4f9798d6a203396af06813adb52dce9708d2ad5726a86305435b1174e9b4cb2 iwd-0.11.tar.gz
+sha256 e416bd549474b2940b0e43ac680795fbafe2b4965fe6a977cd4c1caa1a05e897 iwd-0.13.tar.gz
 
 # License files
 sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 1cfc05be41..63736947cf 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 0.11
+IWD_VERSION = 0.13
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
-- 
2.19.2
