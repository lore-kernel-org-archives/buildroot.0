From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 7 Aug 2018 17:32:51 +0200
Subject: [Buildroot] [PATCH] mmc-utils: Rely on our own _FORTIFY_SOURCE
Message-ID: <48287dd12fcef0440cc49ff86343867d6cb8429e.1533656185.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream always forced _FORTIFY_SOURCE=2. At first, I tried changing
their flags to undefine that macro first, but that did not work well.
This patch ensures that the package always respects our toolchain
settings, even in cases where we are not fortifying the build.

This fixes a build failure where the mmc-utils package failed to build
with, e.g., BR2_FORTIFY_SOURCE_1:

  <command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
  <command-line>:0:0: note: this is the location of the previous definition

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 ...on-the-build-env-for-_FORTIFY_SOURCE.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/mmc-utils/0001-Rely-on-the-build-env-for-_FORTIFY_SOURCE.patch

diff --git a/package/mmc-utils/0001-Rely-on-the-build-env-for-_FORTIFY_SOURCE.patch b/package/mmc-utils/0001-Rely-on-the-build-env-for-_FORTIFY_SOURCE.patch
new file mode 100644
index 0000000000..b099efa6c4
--- /dev/null
+++ b/package/mmc-utils/0001-Rely-on-the-build-env-for-_FORTIFY_SOURCE.patch
@@ -0,0 +1,27 @@
+From 0c893e6f272351572548264bf423208a7b76bb16 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
+Date: Tue, 7 Aug 2018 17:29:35 +0200
+Subject: [PATCH] Rely on the build env for _FORTIFY_SOURCE
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index aa27ff2..a3890b2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,5 @@
+ CC ?= gcc
+-AM_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2
++AM_CFLAGS = -D_FILE_OFFSET_BITS=64
+ CFLAGS ?= -g -O2
+ objects = \
+ 	mmc.o \
+-- 
+2.17.1
+
-- 
2.17.1
