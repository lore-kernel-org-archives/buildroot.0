From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 31 Mar 2016 21:01:01 +0200
Subject: [Buildroot] [PATCH] yajl: disable parallel build
Message-ID: <1459450861-1074-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The yajl build system contains a race condition, which gets triggered by
high BR2_JLEVEL settings - It tries to link the executable gen-extra-close
against libyajl before it is created:

[ 21%] Linking C executable gen-extra-close
[ 26%] Building C object src/CMakeFiles/yajl_s.dir/yajl_buf.c.o
/home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: cannot find -lyajl

Fix it by disabling parallel build.

Fixes:
http://autobuild.buildroot.net/results/a9b/a9b5209377acb51e69f376e0c008ee71fe00397a/
http://autobuild.buildroot.net/results/55f/55fe22463d49addb42b635d10be5176522f4a561/
http://autobuild.buildroot.net/results/808/808acca0cfed93465845c2aa055a7a4fc56a8a17/
http://autobuild.buildroot.net/results/b92/b92a9c84b71a8a2d022d307245ca6be36a000e6c/
http://autobuild.buildroot.net/results/55d/55df698ab53f7d94235166e8576eb681ed68668e/
.. and more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/yajl/yajl.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 7770e86..4346e42 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -11,4 +11,7 @@ YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
 YAJL_PATCH = https://github.com/vriera/yajl/commit/6d09f11b8fd358cab0e31b965327e64a599f9ce9.patch
 
+# Parallel build is broken
+YAJL_MAKE = $(MAKE1)
+
 $(eval $(cmake-package))
-- 
2.8.0
