From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 15 Jan 2017 21:34:35 +0100
Subject: [Buildroot] [PATCH 2/2] package/mpd: drop dependency on libglib2
In-Reply-To: <20170115203435.908-1-joerg.krause@embedded.rocks>
References: <20170115203435.908-1-joerg.krause@embedded.rocks>
Message-ID: <20170115203435.908-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.20.x does not depend on libglib2 anymore. Note, that the
dependency on MMU and Thread remain, as MPD uses fork() and thread
functionality.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/Config.in | 7 +++----
 package/mpd/mpd.mk    | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e0bb60447..9b22f68ce 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,13 +1,12 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # libglib2, flac
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # flac
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
 	help
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 82aca9665..446973730 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -8,7 +8,7 @@ MPD_VERSION_MAJOR = 0.20
 MPD_VERSION = $(MPD_VERSION_MAJOR).2
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
-MPD_DEPENDENCIES = host-pkgconf boost libglib2
+MPD_DEPENDENCIES = host-pkgconf boost
 MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 MPD_AUTORECONF = YES
-- 
2.11.0
