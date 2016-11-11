From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 11 Nov 2016 09:54:06 +0100
Subject: [Buildroot] [PATCH for-master] package/efl: remove wayland
	dependency
Message-ID: <1478854446-3566-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wayland support requires DRM support in efl libraries since 1.18 bump,
but this support is not merged yet in Buildroot and waiting for review
[1].

For 2016.11, keep wayland support disabled to avoid build issues.

Fixes:
http://autobuild.buildroot.net/results/162133cbddcca1ea8be660a19771f04296c20fd2

[1] http://patchwork.ozlabs.org/patch/671260/
    http://patchwork.ozlabs.org/patch/671261/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 1 -
 package/efl/efl.mk    | 8 +-------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index f963ade..69b0dcf 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_EFL
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
 	select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
-	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	# https://phab.enlightenment.org/T2728
 	select BR2_PACKAGE_LUAJIT # Lua support broken
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 777ef3c..6af7aa0 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -42,6 +42,7 @@ EFL_CONF_OPTS = \
 	--disable-sdl \
 	--disable-spectre \
 	--disable-xinput22 \
+	--disable-wayland \
 	--with-doxygen=no
 
 # Disable untested configuration warning.
@@ -145,13 +146,6 @@ else
 EFL_CONF_OPTS += --with-crypto=none
 endif # BR2_PACKAGE_OPENSSL
 
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
-EFL_DEPENDENCIES += wayland libxkbcommon
-EFL_CONF_OPTS += --enable-wayland
-else
-EFL_CONF_OPTS += --disable-wayland
-endif
-
 ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
 EFL_CONF_OPTS += --enable-elput
 EFL_DEPENDENCIES += libinput libxkbcommon
-- 
2.5.5
