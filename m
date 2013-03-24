From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:25 +0100
Subject: [Buildroot] [PATCH 01/22] package/connman: version bump to 1.12,
	and fix build with newer kernels headers
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... while keeping compatibility with older ones.

Fixes autobuild failure:
http://autobuild.buildroot.org/results/f99ae7af46c70f7c356b7771321511a42eb3694d/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/connman-000-uclibc-backtrace.patch |   44 ++++++++++++++++++++
 .../connman-001-fix-for-latest-headers-3.8+.patch  |   19 +++++++++
 package/connman/connman-uclibc-backtrace.patch     |   44 --------------------
 package/connman/connman.mk                         |    2 +-
 4 files changed, 64 insertions(+), 45 deletions(-)
 create mode 100644 package/connman/connman-000-uclibc-backtrace.patch
 create mode 100644 package/connman/connman-001-fix-for-latest-headers-3.8+.patch
 delete mode 100644 package/connman/connman-uclibc-backtrace.patch

diff --git a/package/connman/connman-000-uclibc-backtrace.patch b/package/connman/connman-000-uclibc-backtrace.patch
new file mode 100644
index 0000000..4b806c6
--- /dev/null
+++ b/package/connman/connman-000-uclibc-backtrace.patch
@@ -0,0 +1,44 @@
+[PATCH] fix build on uClibc without UCLIBC_HAS_BACKTRACE
+
+Backtrace support is only used for logging on signal errors, which
+isn't really critical, so simply remove backtrace info if not
+available in uClibc.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/log.c |    7 +++++++
+ 1 file changed, 7 insertions(+)
+
+Index: connman-0.78/src/log.c
+===================================================================
+--- connman-0.78.orig/src/log.c
++++ connman-0.78/src/log.c
+@@ -30,7 +30,12 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <syslog.h>
++#include <features.h>
++/* backtrace support is optional on uClibc */
++#if !(defined(__UCLIBC__) && !defined (__UCLIBC_HAS_BACKTRACE__))
++#define HAVE_BACKTRACE
+ #include <execinfo.h>
++#endif
+ #include <dlfcn.h>
+ 
+ #include "connman.h"
+@@ -112,6 +117,7 @@
+ 
+ static void print_backtrace(unsigned int offset)
+ {
++#ifdef HAVE_BACKTRACE
+ 	void *frames[99];
+ 	size_t n_ptrs;
+ 	unsigned int i;
+@@ -210,6 +216,7 @@
+ 
+ 	close(outfd[1]);
+ 	close(infd[0]);
++#endif /* HAVE_BACKTRACE */
+ }
+ 
+ static void signal_handler(int signo)
diff --git a/package/connman/connman-001-fix-for-latest-headers-3.8+.patch b/package/connman/connman-001-fix-for-latest-headers-3.8+.patch
new file mode 100644
index 0000000..ef1fabc
--- /dev/null
+++ b/package/connman/connman-001-fix-for-latest-headers-3.8+.patch
@@ -0,0 +1,19 @@
+tethering: fix build with kernel headers 3.8+
+
+Highly inspired by:
+    package/bridge-utils/bridge-utils-001-fix-for-kernel-headers-3.8+.patch
+    http://www.redhat.com/archives/libvir-list/2013-January/msg01253.html
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN connman-1.11.orig/src/tethering.c connman-1.11/src/tethering.c
+--- connman-1.11.orig/src/tethering.c	2012-12-22 22:52:47.000000000 +0100
++++ connman-1.11/src/tethering.c	2013-03-21 19:39:17.036029270 +0100
+@@ -35,6 +35,7 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <linux/if_tun.h>
++#include <netinet/in.h>
+ #include <linux/if_bridge.h>
+ 
+ #include "connman.h"
diff --git a/package/connman/connman-uclibc-backtrace.patch b/package/connman/connman-uclibc-backtrace.patch
deleted file mode 100644
index 4b806c6..0000000
--- a/package/connman/connman-uclibc-backtrace.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-[PATCH] fix build on uClibc without UCLIBC_HAS_BACKTRACE
-
-Backtrace support is only used for logging on signal errors, which
-isn't really critical, so simply remove backtrace info if not
-available in uClibc.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/log.c |    7 +++++++
- 1 file changed, 7 insertions(+)
-
-Index: connman-0.78/src/log.c
-===================================================================
---- connman-0.78.orig/src/log.c
-+++ connman-0.78/src/log.c
-@@ -30,7 +30,12 @@
- #include <stdlib.h>
- #include <string.h>
- #include <syslog.h>
-+#include <features.h>
-+/* backtrace support is optional on uClibc */
-+#if !(defined(__UCLIBC__) && !defined (__UCLIBC_HAS_BACKTRACE__))
-+#define HAVE_BACKTRACE
- #include <execinfo.h>
-+#endif
- #include <dlfcn.h>
- 
- #include "connman.h"
-@@ -112,6 +117,7 @@
- 
- static void print_backtrace(unsigned int offset)
- {
-+#ifdef HAVE_BACKTRACE
- 	void *frames[99];
- 	size_t n_ptrs;
- 	unsigned int i;
-@@ -210,6 +216,7 @@
- 
- 	close(outfd[1]);
- 	close(infd[0]);
-+#endif /* HAVE_BACKTRACE */
- }
- 
- static void signal_handler(int signo)
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index bb528b4..f29ff3b 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 #######################################################
 
-CONNMAN_VERSION = 1.11
+CONNMAN_VERSION = 1.12
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
-- 
1.7.9.5
