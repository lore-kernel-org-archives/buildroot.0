From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 15:37:45 +0100
Subject: [Buildroot] [git commit] package/ofono: bump to version 1.28
Message-ID: <20190125144018.EEE4581312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=081e3bbb20681ebe137fca41411935cdcf5a4059
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix musl TEMP_FAILURE_RETRY error

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/0002-fix-musl-compile.patch | 37 +++++++++++++++++++++++++++++++
 package/ofono/ofono.hash                  |  4 +++-
 package/ofono/ofono.mk                    |  2 +-
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/package/ofono/0002-fix-musl-compile.patch b/package/ofono/0002-fix-musl-compile.patch
new file mode 100644
index 0000000000..369fb71791
--- /dev/null
+++ b/package/ofono/0002-fix-musl-compile.patch
@@ -0,0 +1,37 @@
+From 4a1d114fa3a5d6bef1f71222787c1f6c3a952284 Mon Sep 17 00:00:00 2001
+From: Nicolas Serafini <nicolas.serafini@sensefly.com>
+Date: Thu, 24 Jan 2019 10:11:42 +0100
+Subject: [PATCH] mbim: add optional copy of TEMP_FAILURE_RETRY macro (fix musl
+ compile)
+
+TEMP_FAILURE_RETRY is not available on musl.
+
+Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
+---
+ drivers/mbimmodem/mbim.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/drivers/mbimmodem/mbim.c b/drivers/mbimmodem/mbim.c
+index 54b18acf..4b040528 100644
+--- a/drivers/mbimmodem/mbim.c
++++ b/drivers/mbimmodem/mbim.c
+@@ -37,6 +37,16 @@
+ #include "mbim-message.h"
+ #include "mbim-private.h"
+ 
++/* taken from glibc unistd.h for musl support */
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression)             \
++  (__extension__                                   \
++    ({ long int __result;                          \
++       do __result = (long int) (expression);      \
++       while (__result == -1L && errno == EINTR);  \
++       __result; }))
++#endif
++
+ #define MAX_CONTROL_TRANSFER 4096
+ #define HEADER_SIZE (sizeof(struct mbim_message_header) + \
+ 					sizeof(struct mbim_fragment_header))
+-- 
+2.20.1
+
diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index 37933f126b..2dbb9986c7 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256 a6b021cda0b444b772897cd637d5f455857fb5819b62c279a8302b44f9c7f2c3  ofono-1.21.tar.xz
+sha256 93bb2cedef54f897dd5200e22b072a6e38b5d9b44be57eebbbe8d513f0beb0e4	ofono-1.28.tar.xz
+# Locally computed
+sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index b4b7915a30..0552a181fd 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.21
+OFONO_VERSION = 1.28
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
