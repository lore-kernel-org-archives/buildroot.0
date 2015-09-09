From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 15:13:21 +0100
Subject: [Buildroot] [PATCH] ffmpeg: bump to version 2.8
Message-ID: <1441808001-29967-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0016-ranlib.patch is not needed anymore since the problem that it fixes
is already handled upstream:

  https://github.com/FFmpeg/FFmpeg/commit/2c77ca459e9c9aceee5ed93f8dd8de09e9fbf8df

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ffmpeg/0016-ranlib.patch |   35 -----------------------------------
 package/ffmpeg/ffmpeg.hash       |    2 +-
 package/ffmpeg/ffmpeg.mk         |    2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/ffmpeg/0016-ranlib.patch

diff --git a/package/ffmpeg/0016-ranlib.patch b/package/ffmpeg/0016-ranlib.patch
deleted file mode 100644
index e88b25f..0000000
--- a/package/ffmpeg/0016-ranlib.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Fix ranlib check when cross-compiling
-
-Without this patch /usr/bin/ranlib is tested for "-D", not ranlib from the
-cross-compiler suite being in use.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr ffmpeg-2.6.2.org/configure ffmpeg-2.6.2/configure
---- ffmpeg-2.6.2.org/configure	2015-04-12 00:47:55.000000000 +0200
-+++ ffmpeg-2.6.2/configure	2015-04-16 21:53:24.313202517 +0200
-@@ -2719,11 +2719,6 @@
- nm_default="nm -g"
- objformat="elf"
- pkg_config_default=pkg-config
--if ranlib 2>&1 | grep -q "\-D "; then
--    ranlib_default="ranlib -D"
--else
--    ranlib_default="ranlib"
--fi
- strip_default="strip"
- yasmexe_default="yasm"
- windres_default="windres"
-@@ -3001,6 +2996,12 @@
-         die "Must specify target arch and OS when cross-compiling"
- fi
- 
-+if "${cross_prefix}ranlib" 2>&1 | grep -q "\-D "; then
-+    ranlib_default="ranlib -D"
-+else
-+    ranlib_default="ranlib"
-+fi
-+
- test -n "$valgrind" && toolchain="valgrind-memcheck"
- 
- case "$toolchain" in
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 2e6b413..9e44f2e 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7ceb7550ad628c526fa6c9ff23fdfb687a62f54d90c4a730998d8c2b417b9ef2	ffmpeg-2.7.2.tar.bz2
+sha256 9565236404d3515aab754283c687c0a001019003148bf7f708e643608c0690b8  ffmpeg-2.8.tar.bz2
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 54c9f52..f817471 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.7.2
+FFMPEG_VERSION = 2.8
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.7.1
