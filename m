From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Oct 2016 12:04:02 -0300
Subject: [Buildroot] [PATCH] mpv: bump to version 0.21.0
Message-ID: <1477667042-1274-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It now requires gcc 4.9+ with arch atomics for stdatomic support
(https://gcc.gnu.org/wiki/C11Status) or alternatively
BR2_TOOLCHAIN_HAS_SYNC_1 for emulation fallback.

Fixes:
http://autobuild.buildroot.net/results/0b7/0b7b42a72ac2bef2dd476e23a71f87adad6690f6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpv/Config.in | 11 ++++++++---
 package/mpv/mpv.hash  |  2 +-
 package/mpv/mpv.mk    |  2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 25288a4..183700d 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -2,7 +2,10 @@ config BR2_PACKAGE_MPV
 	bool "mpv"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	# It needs basic atomics support
+	# Uses stdatomic.h (gcc 4.9+) or emulation via sync_add_and_fetch_1
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_TOOLCHAIN_HAS_SYNC_1
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
@@ -15,7 +18,9 @@ config BR2_PACKAGE_MPV
 
 	  https://mpv.io/
 
-comment "mpv needs a toolchain w/ threads, gcc >= 4.5"
+comment "mpv needs a toolchain w/ threads, gcc >= 4.9"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index eea0db0..d8fa3b4 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	fe6ec9d2ded5ce84b963f54b812d579d04f944f4a737f3ae639c4d5d9e842b56	v0.20.0.tar.gz
+sha256	d05f8ece859c500ef1649cdfea911ec1529df1898b8fda3e217766dc28dc9bd3	v0.21.0.tar.gz
 sha256	01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b	waf-1.8.12
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 4f04fdf..61e80e2 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.20.0
+MPV_VERSION = 0.21.0
 MPV_WAF_VERSION = 1.8.12
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
-- 
2.7.3
