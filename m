From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:20:23 +0100
Subject: [Buildroot] [git commit] efl: remove broken JP2K loader
Message-ID: <20170309212028.49C6982489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac1910713ce0951db4010586fbe087f8d708aabb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option has been marked as broken since 2016.08. Since nobody
repaired it, we'll just remove it.

Since technically it was already removed in 2016.08, it's added to the
2016.08 section of the legacy menu.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Reviewed-By:  Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy      |  7 +++++++
 package/efl/Config.in | 10 ----------
 package/efl/efl.mk    |  8 +-------
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1f3d09b..67f6e4e 100644
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
index 5e89af6..960f275 100644
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
index 1e54f72..e0ec6d6bc 100644
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
