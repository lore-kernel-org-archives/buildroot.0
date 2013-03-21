From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Mar 2013 23:36:14 +0100
Subject: [Buildroot] [PATCH 2/2] package/connman: version bump to 1.12,
	and fix build with newer kernels headers
In-Reply-To: <cover.1363905191.git.yann.morin.1998@free.fr>
References: <cover.1363905191.git.yann.morin.1998@free.fr>
Message-ID: <88e36781f97cca585ae42d8658d85b8ff4d7ccfa.1363905191.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... while keeping compatibility with older ones.

Fixes autobuild failure:
http://autobuild.buildroot.org/results/f99ae7af46c70f7c356b7771321511a42eb3694d/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ce.patch => connman-000-uclibc-backtrace.patch} |    0
 .../connman-001-fix-for-latest-headers-3.8+.patch  |   19 +++++++++++++++++++
 package/connman/connman.mk                         |    2 +-
 3 files changed, 20 insertions(+), 1 deletions(-)
 rename package/connman/{connman-uclibc-backtrace.patch => connman-000-uclibc-backtrace.patch} (100%)
 create mode 100644 package/connman/connman-001-fix-for-latest-headers-3.8+.patch

diff --git a/package/connman/connman-uclibc-backtrace.patch b/package/connman/connman-000-uclibc-backtrace.patch
similarity index 100%
rename from package/connman/connman-uclibc-backtrace.patch
rename to package/connman/connman-000-uclibc-backtrace.patch
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
1.7.2.5
