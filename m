From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 16:58:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/sox: fix static build with magic
Message-ID: <20210303155801.573321-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This build failure is raised since bump to
7524160b29a476f7e87bc14fddf12d349f9a3c5e

Fixes:
 - http://autobuild.buildroot.org/results/d96f27cd96926060046e2e1115777f5bceda3741

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ure.ac-fix-static-linking-with-magic.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/sox/0004-configure.ac-fix-static-linking-with-magic.patch

diff --git a/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch b/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch
new file mode 100644
index 0000000000..2fbb8ff8a4
--- /dev/null
+++ b/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch
@@ -0,0 +1,48 @@
+From d591a38d934b2a6750f16c7bd46a9ad12233301c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 3 Mar 2021 16:48:57 +0100
+Subject: [PATCH] configure.ac: fix static linking with magic
+
+Put back -lz (i.e. ZLIB_LIBS) when searching for magic which was
+wrongly removed by commit 6ff0e9322f9891f5a6ac6c9b3bceffbfca16bec3. This
+will fix the following static build failure:
+
+configure:11677: checking for magic_open in -lmagic
+configure:11702: /srv/storage/autobuild/run/instance-0/output-1/host/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -Wall -Wmissing-prototypes -Wstrict-prototypes  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -Wl,--as-needed conftest.c -lmagic    >&5
+conftest.c:53:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+   53 | char magic_open ();
+      | ^~~~
+conftest.c:55:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+   55 | main ()
+      | ^~~~
+/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /srv/storage/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmagic.a(compress.o): in function `uncompresszlib':
+compress.c:(.text+0x1d0): undefined reference to `inflateInit_'
+/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x1e4): undefined reference to `inflate'
+/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x1fc): undefined reference to `inflateEnd'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d96f27cd96926060046e2e1115777f5bceda3741
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet (waiting for feedback on third patch)]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 896714f5..ca7bccaa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -80,8 +80,8 @@ SOX_REPORT([other], [LADSPA effect plugins], [$HAVE_LADSPA])
+ 
+ dnl Various libraries
+ 
+-SOX_WITH_LIB([magic], [magic.h], [magic], [magic_open])
+ SOX_CHECK_LIB([ZLIB], [zlib.h], [z], [uncompress])
++SOX_WITH_LIB([magic], [magic.h], [magic], [magic_open], [], [], [], [$ZLIB_LIBS])
+ SOX_WITH_LIB([png], [png.h], [png], [png_set_rows], [], [], [], [$ZLIB_LIBS])
+ SOX_WITH_LIB([id3tag], [id3tag.h], [id3tag], [id3_file_open], [], [], [], [$ZLIB_LIBS])
+ SOX_WITH_LIB([libgsm], [gsm/gsm.h gsm.h], [gsm], [gsm_create])
+-- 
+2.30.0
+
-- 
2.30.0
