From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:56:05 +0100
Subject: [Buildroot] [git commit] package/sox: fix static build with id3tag
Message-ID: <20210207093542.C29D6813E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58fc4b5085763cf1837cab22e98b0eaa7fefaac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This build failure is raised since bump to
7524160b29a476f7e87bc14fddf12d349f9a3c5e

Fixes:
 - http://autobuild.buildroot.org/results/73efdacf237e3d567fa66f3b3f68e624f5e35bc7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nfigure.ac-fix-static-linking-with-id3tag.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/sox/0003-configure.ac-fix-static-linking-with-id3tag.patch b/package/sox/0003-configure.ac-fix-static-linking-with-id3tag.patch
new file mode 100644
index 0000000000..32d6f83b0c
--- /dev/null
+++ b/package/sox/0003-configure.ac-fix-static-linking-with-id3tag.patch
@@ -0,0 +1,47 @@
+From 8df3a56cfb104c84d4701562ae2e3c9dc4686798 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Feb 2021 11:08:45 +0100
+Subject: [PATCH] configure.ac: fix static linking with id3tag
+
+Put back -lz (i.e. ZLIB_LIBS) when searching for id3tag which was
+wrongly removed by commit 6ff0e9322f9891f5a6ac6c9b3bceffbfca16bec3. This
+will fix the following static build failure:
+
+configure:15290: checking for id3_file_open in -lid3tag
+configure:15315: /home/buildroot/autobuild/instance-0/output-1/host/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -static -Wall -Wmissing-prototypes -Wstrict-prototypes  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -Wl,--as-needed conftest.c -lid3tag    >&5
+conftest.c:60:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+   60 | char id3_file_open ();
+      | ^~~~
+conftest.c:62:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+   62 | main ()
+      | ^~~~
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libid3tag.a(util.o): in function `id3_util_compress':
+util.c:(.text+0x1ac): undefined reference to `compress2'
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libid3tag.a(util.o): in function `id3_util_decompress':
+util.c:(.text+0x240): undefined reference to `uncompress'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/73efdacf237e3d567fa66f3b3f68e624f5e35bc7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://sourceforge.net/p/sox/patches/123]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 39306398..896714f5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -83,7 +83,7 @@ dnl Various libraries
+ SOX_WITH_LIB([magic], [magic.h], [magic], [magic_open])
+ SOX_CHECK_LIB([ZLIB], [zlib.h], [z], [uncompress])
+ SOX_WITH_LIB([png], [png.h], [png], [png_set_rows], [], [], [], [$ZLIB_LIBS])
+-SOX_WITH_LIB([id3tag], [id3tag.h], [id3tag], [id3_file_open])
++SOX_WITH_LIB([id3tag], [id3tag.h], [id3tag], [id3_file_open], [], [], [], [$ZLIB_LIBS])
+ SOX_WITH_LIB([libgsm], [gsm/gsm.h gsm.h], [gsm], [gsm_create])
+ 
+ dnl Optional formats
+-- 
+2.29.2
+
