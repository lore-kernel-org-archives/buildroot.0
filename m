From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:55 +0200
Subject: [Buildroot] [PATCH v2 23/24] vlc: add opencv support
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-24-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add OpenCV support for video filter in vlc.

vlc source code still includes the headers from the deprecated OpenCV
API.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch
---
 package/vlc/Config.in | 1 +
 package/vlc/vlc.mk    | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index cdb0d16..ede9269 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_VLC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS if BR2_PACKAGE_OPENCV
 	help
 	  VLC is a free and open source cross-platform multimedia player
 	  and framework that plays most multimedia files as well as DVD,
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e14c9c3..6e0f61d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -125,6 +125,13 @@ else
 VLC_CONF_OPT += --disable-glx
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV),y)
+VCL_CONF_OPT += --with-opencv
+VLC_DEPENDENCIES += opencv
+else
+VLC_CONF_OPT += --without-opencv
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 VLC_CONF_OPT += --enable-opus
 VLC_DEPENDENCIES += libvorbis opus
-- 
1.9.2
