From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 May 2020 15:20:04 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/efl: bump to version 1.24.0
In-Reply-To: <20200504132004.3166916-1-romain.naour@gmail.com>
References: <20200504132004.3166916-1-romain.naour@gmail.com>
Message-ID: <20200504132004.3166916-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patch [1].

evas-modules option removed since all evas-modules are now built shared. [2]

Make sure that mono is disabled [3].

gstreamer support removed from emotion & evas [4].

emotion-loaders-disabler & emotion-generic-loaders-disabler removed [5].

Replace jpeg by openjpeg [6] otherwise the build system fail when only
libjpeg.so is provided (jpeg-turbo or libjpeg).

Update COMPLIANCE file hash due to esacpe library removal [7].

Update COPYING file hash due to new csharp,cxx libraries and esacpe,emotion
removal [8].

[1] https://git.enlightenment.org/core/efl.git/commit/?id=a2afcfc872c29bd2c4a60fdafbc655c90f938d1e
[2] https://git.enlightenment.org/core/efl.git/commit/?id=6d8e39a6425e721eb40e0cb1e67f1cbf5b223cc0
[3] https://git.enlightenment.org/core/efl.git/commit/?id=17a81bee4a53891e44a165a14ca20027f9aa0824
[4] https://git.enlightenment.org/core/efl.git/commit/?id=b8dc80c144fec54a521987535c57b995748ccece
[5] https://git.enlightenment.org/core/efl.git/commit/?id=075bab83c4288b5de20f6acfc6b0459656ea85e0
[6] https://git.enlightenment.org/core/efl.git/commit/?id=8ec6e28b7cc568a8bb636de90b2dd10f19db2be3
[7] https://git.enlightenment.org/core/efl.git/commit/?id=f3d9b8ee703621cfbb52a03d346335148318af7a
[8] https://git.enlightenment.org/core/efl.git/commit/?id=40a980174b7e29e6946f7425bd7a238ae45900f8
    https://git.enlightenment.org/core/efl.git/commit/?id=a3ade15d5a45e7d564b7c1304f561af9c4203991
    https://git.enlightenment.org/core/efl.git/commit/?id=31da42a0503556a59c190efcb0a79331e828bf6c

See:
https://www.enlightenment.org/news/efl-1.24.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2 update COMPLIANCE and COPYING files hash.

 ...-evas-fix-compilation-with-Dwl-false.patch | 31 -------------------
 package/efl/Config.in                         |  2 +-
 package/efl/efl.hash                          |  8 ++---
 package/efl/efl.mk                            | 15 +++------
 4 files changed, 10 insertions(+), 46 deletions(-)
 delete mode 100644 package/efl/0001-evas-fix-compilation-with-Dwl-false.patch

diff --git a/package/efl/0001-evas-fix-compilation-with-Dwl-false.patch b/package/efl/0001-evas-fix-compilation-with-Dwl-false.patch
deleted file mode 100644
index feac95fbc7..0000000000
--- a/package/efl/0001-evas-fix-compilation-with-Dwl-false.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e1c289912c4ad68380f8b317c6c91d25b5b73814 Mon Sep 17 00:00:00 2001
-From: Boris Faure <billiob@gmail.com>
-Date: Thu, 2 Jan 2020 11:38:31 +0000
-Subject: [PATCH] evas: fix compilation with -Dwl=false
-
-Reviewed-by: Chris Michael <cp.michael@samsung.com>
-Reviewed-by: Marcel Hollerbach <mail@marcel-hollerbach.de>
-Differential Revision: https://phab.enlightenment.org/D10994
-
-(cherry picked from commit a2afcfc872c29bd2c4a60fdafbc655c90f938d1e)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/modules/evas/engines/gl_drm/evas_engine.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/modules/evas/engines/gl_drm/evas_engine.c b/src/modules/evas/engines/gl_drm/evas_engine.c
-index a5b4c7a4c8..8c1d6013e7 100644
---- a/src/modules/evas/engines/gl_drm/evas_engine.c
-+++ b/src/modules/evas/engines/gl_drm/evas_engine.c
-@@ -3,8 +3,6 @@
- #include "../gl_common/evas_gl_define.h"
- #include "../software_generic/evas_native_common.h"
- 
--#include <wayland-client.h>
--
- #ifdef HAVE_DLSYM
- # include <dlfcn.h>      /* dlopen,dlclose,etc */
- #else
--- 
-2.24.1
-
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 3604c10156..9e392fbb21 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_EFL
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GIFLIB
-	select BR2_PACKAGE_JPEG # Emile needs libjpeg
+	select BR2_PACKAGE_OPENJPEG # Emile needs libopenjpeg
 	select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
 	select BR2_PACKAGE_LIBPNG
 	# https://phab.enlightenment.org/T2728
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 9c6102c368..042337e42b 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,8 +1,8 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.23.2.tar.xz.sha256sum
-sha256  ba8d9e4a4690a6c917c98ec090fffa6ffe005ab911811b8d443aa155ad95d493  efl-1.23.2.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.24.0.tar.xz.sha256sum
+sha256  b3b96e443c5e36a93e5fe443304ecb661a4707ef921385bf7d9ff24c9e980cfa  efl-1.24.0.tar.xz
 
-sha256  d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
-sha256  aacde32f865e7166fd8efb117f6a3436c8c6fbe8cce0e4501cb2dbe8c10c86f6  COPYING
+sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
+sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
 sha256  e5133b4034a4749a781e2220ffb230b60a282b88861f1124d69a58abd5143994  COPYING.images
 sha256  c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c  licenses/COPYING.ASL
 sha256  af4ffe7ed1795a6e9cd3b3ce8747fdc45da449ff58cf35b8027c0699a66fd5cf  licenses/COPYING.BSD
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 0557a8c1cf..c861d8bc98 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.23.2
+EFL_VERSION = 1.24.0
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
@@ -23,7 +23,7 @@ EFL_LICENSE_FILES = \
 EFL_INSTALL_STAGING = YES
 
 EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
-	giflib jpeg libpng luajit lz4 zlib
+	giflib openjpeg libpng luajit lz4 zlib
 
 # Configure options:
 # elua=true: build elua for the target.
@@ -35,10 +35,9 @@ EFL_CONF_OPTS = \
 	-Davahi=false \
 	-Dbuild-examples=false \
 	-Dbuild-tests=false \
+	-Ddotnet=false \
 	-Decore-imf-loaders-disabler=ibus,scim,xim \
 	-Delua=true \
-	-Demotion-generic-loaders-disabler=vlc \
-	-Demotion-loaders-disabler=gstreamer,gstreamer1,libvlc,xine \
 	-Dembedded-lz4=false \
 	-Dlua-interpreter=luajit \
 	-Dnetwork-backend=none \
@@ -199,15 +198,12 @@ endif
 
 EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
 
-# Evas loaders are shared by default.
-EFL_CONF_OPTS += -Devas-modules=shared
-
 # json evas loader is disabled by default by upstream.
 # Disable libspectre (ps).
 # Keep all other evas loader enabled or handled below.
 EFL_EVAS_LOADERS_DISABLER = gst json ps
 
-# efl already depends on jpeg.
+# efl already depends on openjpeg.
 ifeq ($(BR2_PACKAGE_EFL_JPEG),)
 EFL_EVAS_LOADERS_DISABLER += jp2k
 endif
@@ -307,14 +303,13 @@ HOST_EFL_CONF_OPTS += \
 	-Dbuild-examples=false \
 	-Dbuild-tests=false \
 	-Dcrypto=openssl \
+	-Ddotnet=false \
 	-Decore-imf-loaders-disabler=ibus,scim,xim \
 	-Dedje-sound-and-video=false \
 	-Deeze=false \
 	-Delogind=false \
 	-Delua=true \
 	-Dembedded-lz4=true \
-	-Demotion-generic-loaders-disabler=vlc \
-	-Demotion-loaders-disabler=gstreamer,gstreamer1,libvlc,xine \
 	-Dfontconfig=false \
 	-Dfribidi=false \
 	-Dglib=true \
-- 
2.25.4
