From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Aug 2015 18:14:57 +0200
Subject: [Buildroot] [PATCH 4/4 v2] package/vlc: update opencv support
In-Reply-To: <cover.1439136753.git.yann.morin.1998@free.fr>
References: <cover.1439136753.git.yann.morin.1998@free.fr>
Message-ID: <927987bbdcc79cc1a299cf2a1ba052a6ae82b702.1439136753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

vlc supports both opencv-2.4 and opencv-3, so adjust the vlc package to
reflect this.

Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/Config.in | 14 ++++++++++++--
 package/vlc/vlc.mk    |  6 +++++-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 6679cc9..71e4f34 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -11,8 +11,8 @@ config BR2_PACKAGE_VLC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
-	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
+	select BR2_PACKAGE_VLC_OPENCV_BACKEND if BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
 	help
 	  VLC is a free and open source cross-platform multimedia player
 	  and framework that plays most multimedia files as well as DVD,
@@ -20,6 +20,16 @@ config BR2_PACKAGE_VLC
 
 	  http://www.videolan.org/vlc/
 
+config BR2_PACKAGE_VLC_OPENCV_BACKEND
+	bool
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+
+config BR2_PACKAGE_VLC_OPENCV3_BACKEND
+	bool
+	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
+
 comment "vlc needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ C++, wchar, threads, headers >= 3.7"
 	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index fa74a7b..6f7fd58 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -153,9 +153,13 @@ else
 VLC_CONF_OPTS += --disable-gles2
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
+ifeq ($(BR2_PACKAGE_OPENCV)$(BR2_PACKAGE_OPENCV3),y)
 VLC_CONF_OPTS += --enable-opencv
+ifeq ($(BR2_PACKAGE_OPENCV),y)
+VLC_DEPENDENCIES += opencv
+else
 VLC_DEPENDENCIES += opencv3
+endif
 else
 VLC_CONF_OPTS += --disable-opencv
 endif
-- 
1.9.1
