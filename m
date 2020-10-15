From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Oct 2020 08:09:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/sslh: fix static build with pcre
Message-ID: <20201015060901.137916-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix static build failure with sslh version 1.19b and above

Fixes:
 - http://autobuild.buildroot.org/results/a601824fc0c205a6a940e0f9f079ce2c39840605

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...akefile-fix-static-linking-with-pcre.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch

diff --git a/package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch b/package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch
new file mode 100644
index 0000000000..5fc3296da5
--- /dev/null
+++ b/package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch
@@ -0,0 +1,41 @@
+From 0d9e004d324cc030c173de04c40db51a0f22bb5c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 15 Oct 2020 07:58:05 +0200
+Subject: [PATCH] Makefile: fix static linking with pcre
+
+Static build with pcre is broken since version 1.19b and
+https://github.com/yrutschle/sslh/commit/cb90cc97ae64a445242e517847c6e44b7003eda4
+because -lpcre has been replaced by -lpcreposix which will result in
+the following static build failure:
+
+/srv/storage/autobuild/run/instance-1/output-1/host/bin/mipsel-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -static -o echosrv echosrv.o probe.o common.o tls.o  -lpcreposix -lconfig -lcap
+/srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/8.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-1/output-1/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpcreposix.a(libpcreposix_la-pcreposix.o): in function `regfree':
+pcreposix.c:(.text+0x120): undefined reference to `pcre_free'
+
+So append -lpcre after -lpcreposix
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a601824fc0c205a6a940e0f9f079ce2c39840605
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/yrutschle/sslh/pull/280]
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 986cf1c..ecadc22 100644
+--- a/Makefile
++++ b/Makefile
+@@ -43,7 +43,7 @@ endif
+ 
+ ifneq ($(strip $(USELIBPCRE)),)
+ 	CPPFLAGS+=-DLIBPCRE
+-	LIBS:=$(LIBS) -lpcreposix
++	LIBS:=$(LIBS) -lpcreposix -lpcre
+ endif
+ 
+ ifneq ($(strip $(USELIBCONFIG)),)
+-- 
+2.28.0
+
-- 
2.28.0
