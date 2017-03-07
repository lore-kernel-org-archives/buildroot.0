From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 8 Mar 2017 00:50:54 +0100
Subject: [Buildroot] [PATCH 6/6] efl: remove broken JP2K loader
In-Reply-To: <20170307235054.25149-1-arnout@mind.be>
References: <20170307235054.25149-1-arnout@mind.be>
Message-ID: <20170307235054.25149-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option has been marked as broken since 2016.08. Since nobody
repaired it, we'll just remove it.

Since technically it was already removed in 2016.08, it's added to the
2016.08 section of the legacy menu.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
---
Romain, Gustavo, last chance to unbreak the package :-)
---
 Config.in.legacy      |  7 +++++++
 package/efl/Config.in | 10 ----------
 package/efl/efl.mk    |  8 +-------
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1f3d09b389..67f6e4e3a0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -475,6 +475,13 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_PACKAGE_EFL_JP2K
+	bool "libevas jp2k loader has been removed"
+	select BR2_LEGACY
+	  JP2K support in EFL requires openjpeg 1.x (libopenjpeg1.pc)
+	  while Buildroot only packages openjpeg 2.x. Therefore, the
+	  JP2K loader has been removed from EFL.
+
 config BR2_PACKAGE_SYSTEMD_COMPAT
 	bool "systemd compatibility libraries have been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 5e89af602c..960f2752c3 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -252,16 +252,6 @@ config BR2_PACKAGE_EFL_PNG
 	  This enables the loader code that loads png files using
 	  libpng.
 
-# JP2K support require openjpeg 1.x (libopenjpeg1.pc) which is not
-# available in Buildroot anymore.
-config BR2_PACKAGE_EFL_JP2K
-	bool "libevas jp2k loader"
-	select BR2_PACKAGE_OPENJPEG
-	depends on BROKEN # require openjpeg 1.x
-	help
-	  This enables the loader code that loads jp2k files using
-	  openjpeg.
-
 config BR2_PACKAGE_EFL_JPEG
 	bool "libevas jpeg loader"
 	help
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 1e54f72810..e0ec6d6bcc 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -38,6 +38,7 @@ EFL_CONF_OPTS = \
 	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
 	--with-elua=$(HOST_DIR)/usr/bin/elua \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
+	--disable-image-loader-jp2k \
 	--disable-lua-old \
 	--disable-poppler \
 	--disable-sdl \
@@ -251,13 +252,6 @@ else
 EFL_CONF_OPTS += --disable-image-loader-tiff
 endif
 
-ifeq ($(BR2_PACKAGE_EFL_JP2K),y)
-EFL_CONF_OPTS += --enable-image-loader-jp2k=yes
-EFL_DEPENDENCIES += openjpeg
-else
-EFL_CONF_OPTS += --disable-image-loader-jp2k
-endif
-
 ifeq ($(BR2_PACKAGE_EFL_WEBP),y)
 EFL_CONF_OPTS += --enable-image-loader-webp=yes
 EFL_DEPENDENCIES += webp
-- 
2.11.0
