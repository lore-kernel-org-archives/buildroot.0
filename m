From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 17 Feb 2021 08:39:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/taglib: drop config options to
 enable MP4/ASF support
Message-ID: <20210217073912.19314-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both options where removed in TagLib in [1] back in year 2011.

[1] https://github.com/taglib/taglib/commit/dd846904cbc1ef3ee628d77f0c9df88ef8967816 

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 Config.in.legacy         | 12 ++++++++++++
 package/taglib/Config.in | 10 ----------
 package/taglib/taglib.mk |  8 --------
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9deb67b31f..9c794877d4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_PACKAGE_TAGLIB_MP4
+	bool "taglib mp4 support"
+	select BR2_LEGACY
+	help
+	  mp4 support is enabled in TagLib by default since 2011.
+
+config BR2_PACKAGE_TAGLIB_ASF
+	"taglib wma support"
+	select BR2_LEGACY
+	help
+	  asf/wma support is enabled in TagLib by default since 2011.
+
 config BR2_PACKAGE_MPD_AUDIOFILE
 	bool "mpd audiofile support removed"
 	select BR2_LEGACY
diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index 9e6bb707fc..6a87a13215 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -11,15 +11,5 @@ config BR2_PACKAGE_TAGLIB
 
 	  http://taglib.org/
 
-if BR2_PACKAGE_TAGLIB
-
-config BR2_PACKAGE_TAGLIB_MP4
-	bool "taglib mp4 support"
-
-config BR2_PACKAGE_TAGLIB_ASF
-	bool "taglib wma support"
-
-endif
-
 comment "taglib needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 9381e16672..738be35756 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -20,14 +20,6 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 TAGLIB_DEPENDENCIES += zlib
 endif
 
-ifeq ($(BR2_PACKAGE_TAGLIB_ASF),y)
-TAGLIB_CONF_OPTS += -DWITH_ASF=ON
-endif
-
-ifeq ($(BR2_PACKAGE_TAGLIB_MP4),y)
-TAGLIB_CONF_OPTS += -DWITH_MP4=ON
-endif
-
 define TAGLIB_REMOVE_DEVFILE
 	rm -f $(TARGET_DIR)/usr/bin/taglib-config
 endef
-- 
2.30.1
