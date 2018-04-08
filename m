From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Apr 2018 11:37:06 +0200
Subject: [Buildroot] [PATCH] package/liblo: fix build with musl
Message-ID: <20180408093706.1082-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 2759ba03979 (liblo: disable werror to fix build issues) tried to
fix the issue by passing --disable-werror, but this is not a recognised
option.

Instead, just fix the code for good.

Fixes:
    http://autobuild.buildroot.org/results/000a46954d0c6d3dbc4b4634a0d3a3c955fac679
    http://autobuild.buildroot.org/results/58cb834bbd69bafc5cb0f23c236919c609648c05
    http://autobuild.buildroot.org/results/9de1c2007818082e88d77572abf8ff8a72e01930
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alex Baldwin <alexbaldwinmusic@gmail.com>
---
Result of test-pkg with BR2_PACKAGE_LIBLO=y:
                             br-arm-full [1/7]: OK
                  br-arm-cortex-a9-glibc [2/7]: OK
                   br-arm-cortex-m4-full [3/7]: OK
                          br-x86-64-musl [4/7]: OK
                            br-bfin-full [5/7]: OK
                      br-arm-full-static [6/7]: OK
                armv5-ctng-linux-gnueabi [7/7]: OK
7 builds, 0 skipped, 0 build failed, 0 legal-info failed
---
 .../0001-server-use-correct-poll.h-header.patch    | 32 ++++++++++++++++++++++
 package/liblo/liblo.mk                             |  5 +---
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 package/liblo/0001-server-use-correct-poll.h-header.patch

diff --git a/package/liblo/0001-server-use-correct-poll.h-header.patch b/package/liblo/0001-server-use-correct-poll.h-header.patch
new file mode 100644
index 0000000000..04c0445534
--- /dev/null
+++ b/package/liblo/0001-server-use-correct-poll.h-header.patch
@@ -0,0 +1,32 @@
+From d59f2e6f42a9e4f8a9184d7ed75546f47dc50123 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 8 Apr 2018 11:09:02 +0200
+Subject: [PATCH] server: use correct poll.h header
+
+Fixes build with the musl C library:
+    http://autobuild.buildroot.net/results/000a46954d0c6d3dbc4b4634a0d3a3c955fac679
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Upstream status:
+  PR sent: https://github.com/radarsat1/liblo/pull/66
+---
+ src/server.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/server.c b/src/server.c
+index 01fa08f..11c62d2 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -51,7 +51,7 @@
+ #include <netdb.h>
+ #include <sys/socket.h>
+ #ifdef HAVE_POLL
+-#include <sys/poll.h>
++#include <poll.h>
+ #endif
+ #include <sys/un.h>
+ #include <arpa/inet.h>
+-- 
+2.14.1
+
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 7845c68ff2..e28e52803a 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -12,10 +12,7 @@ LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES
 
 # IPv6 support broken, issue known upstream
-# werror - not needed for release.
-LIBLO_CONF_OPTS += \
-	--disable-ipv6 \
-	--disable-werror
+LIBLO_CONF_OPTS = --disable-ipv6
 
 # Liblo uses atomic builtins, so we need to link with libatomic for
 # the architectures who explicitly need libatomic.
-- 
2.14.1
