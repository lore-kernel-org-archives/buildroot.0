From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 14:21:55 +0200
Subject: [Buildroot] [git commit] package/sox: fix static build with magic
 and bzip2
Message-ID: <20210501120216.AC0C283AE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5f3c6ff1ab8a03aafe304756f8b418c964f4819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update patch added by commit 183d583fb5f19eb11637873d73e13fe14536efa6 to
use pkg-config instead of linking with zlib to fix the following static
build failure with a bzip2-enabled libmagic:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/9.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/lib/libmagic.a(compress.o): in function `uncompressbuf':
compress.c:(.text+0x422): undefined reference to `BZ2_bzDecompressInit'
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/9.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: compress.c:(.text+0x422): undefined reference to `BZ2_bzDecompressInit'

Fixes:
 - http://autobuild.buildroot.org/results/4c511c02e4c63b35ecf77a2658f88e8a0d9dbb4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...04-configure.ac-fix-static-linking-with-magic.patch | 18 +++++++++---------
 package/sox/sox.mk                                     |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch b/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch
index 2fbb8ff8a4..7d2e390df1 100644
--- a/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch
+++ b/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch
@@ -1,11 +1,12 @@
-From d591a38d934b2a6750f16c7bd46a9ad12233301c Mon Sep 17 00:00:00 2001
+From 4630e574e6c0269b94fd910e7c72b8ad1ee62ce7 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Wed, 3 Mar 2021 16:48:57 +0100
 Subject: [PATCH] configure.ac: fix static linking with magic
 
-Put back -lz (i.e. ZLIB_LIBS) when searching for magic which was
-wrongly removed by commit 6ff0e9322f9891f5a6ac6c9b3bceffbfca16bec3. This
-will fix the following static build failure:
+Use SOX_FMT_PKG to retrieve magic dependencies (e.g. bzip2 or zlib)
+indeed -lz (i.e. ZLIB_LIBS) was wrongly removed by commit
+6ff0e9322f9891f5a6ac6c9b3bceffbfca16bec3. This will fix the following
+static build failure:
 
 configure:11677: checking for magic_open in -lmagic
 configure:11702: /srv/storage/autobuild/run/instance-0/output-1/host/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -Wall -Wmissing-prototypes -Wstrict-prototypes  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -Wl,--as-needed conftest.c -lmagic    >&5
@@ -30,19 +31,18 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 896714f5..ca7bccaa 100644
+index 896714f5..8ae3202c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -80,8 +80,8 @@ SOX_REPORT([other], [LADSPA effect plugins], [$HAVE_LADSPA])
+@@ -80,7 +80,7 @@ SOX_REPORT([other], [LADSPA effect plugins], [$HAVE_LADSPA])
  
  dnl Various libraries
  
 -SOX_WITH_LIB([magic], [magic.h], [magic], [magic_open])
++SOX_FMT_PKG([magic], [libmagic])
  SOX_CHECK_LIB([ZLIB], [zlib.h], [z], [uncompress])
-+SOX_WITH_LIB([magic], [magic.h], [magic], [magic_open], [], [], [], [$ZLIB_LIBS])
  SOX_WITH_LIB([png], [png.h], [png], [png_set_rows], [], [], [], [$ZLIB_LIBS])
  SOX_WITH_LIB([id3tag], [id3tag.h], [id3tag], [id3_file_open], [], [], [], [$ZLIB_LIBS])
- SOX_WITH_LIB([libgsm], [gsm/gsm.h gsm.h], [gsm], [gsm_create])
 -- 
-2.30.0
+2.30.1
 
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 99ba20ac9c..dcc1a670b4 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -34,9 +34,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_FILE),y)
 SOX_DEPENDENCIES += file
-SOX_CONF_OPTS += --with-magic
+SOX_CONF_OPTS += --enable-magic
 else
-SOX_CONF_OPTS += --without-magic
+SOX_CONF_OPTS += --disable-magic
 endif
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
