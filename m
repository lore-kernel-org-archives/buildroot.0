From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 16:03:35 +0100
Subject: [Buildroot] [git commit] package/kodi: bump version to 18.6-Leia
Message-ID: <20200315140204.6FAFB80D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72aa89b22759871feb9265a9ca323dcf1da006cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:
https://github.com/xbmc/xbmc/commit/d1b2a27d2d2795fe82c103b49faef74b55df22c7
https://github.com/xbmc/xbmc/commit/d5947e6733fd564edb68df91fd6d389d9fb82319

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kodi-jsonschemabuilder.mk                      |  2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk   |  2 +-
 .../kodi/0003-Add-missing-cassert-includes.patch   | 50 ----------------------
 ...004-Backport-Add-missing-cstddef-includes.patch | 44 -------------------
 package/kodi/kodi.hash                             |  2 +-
 package/kodi/kodi.mk                               |  2 +-
 6 files changed, 4 insertions(+), 98 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 31003fe856..934392e916 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 18.5-Leia
+KODI_JSONSCHEMABUILDER_VERSION = 18.6-Leia
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index e33e680e16..dc5984cedc 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 18.5-Leia
+KODI_TEXTUREPACKER_VERSION = 18.6-Leia
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/0003-Add-missing-cassert-includes.patch b/package/kodi/0003-Add-missing-cassert-includes.patch
deleted file mode 100644
index ec52f32d0d..0000000000
--- a/package/kodi/0003-Add-missing-cassert-includes.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 711845d533f9f6b5fe68b7cbcc8f369ce7efe445 Mon Sep 17 00:00:00 2001
-From: Craig Andrews <candrews@integralblue.com>
-Date: Thu, 5 Dec 2019 14:49:50 -0500
-Subject: [PATCH] Add missing cassert includes
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Without these includes, ???assert??? was not declared in this scope errors
-occur.
-
-Backport of https://github.com/xbmc/xbmc/pull/17000
-
-Patch sent upstream: https://github.com/xbmc/xbmc/pull/17213
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp | 2 ++
- xbmc/windowing/GraphicContext.cpp                  | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp b/xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp
-index 222d1fa2c8..070ea0ae46 100644
---- a/xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp
-+++ b/xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp
-@@ -33,6 +33,8 @@
- #include "utils/Variant.h"
- #include "ServiceBroker.h"
- 
-+#include <cassert>
-+
- #define SETTING_PROFILE_NAME          "profile.name"
- #define SETTING_PROFILE_IMAGE         "profile.image"
- #define SETTING_PROFILE_DIRECTORY     "profile.directory"
-diff --git a/xbmc/windowing/GraphicContext.cpp b/xbmc/windowing/GraphicContext.cpp
-index 1ced49671b..0ddbe64c9f 100644
---- a/xbmc/windowing/GraphicContext.cpp
-+++ b/xbmc/windowing/GraphicContext.cpp
-@@ -24,6 +24,8 @@
- #include "guilib/GUIWindowManager.h"
- #include "guilib/TextureManager.h"
- 
-+#include <cassert>
-+
- using namespace KODI::MESSAGING;
- 
- CGraphicContext::CGraphicContext(void) = default;
--- 
-2.20.1
-
diff --git a/package/kodi/0004-Backport-Add-missing-cstddef-includes.patch b/package/kodi/0004-Backport-Add-missing-cstddef-includes.patch
deleted file mode 100644
index 607c80610a..0000000000
--- a/package/kodi/0004-Backport-Add-missing-cstddef-includes.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d1b2a27d2d2795fe82c103b49faef74b55df22c7 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 18 Jan 2020 14:49:16 +0100
-Subject: [PATCH] [Backport] Add missing cstddef includes
-
-Backport of https://github.com/xbmc/xbmc/pull/17214
-
-Patch sent upstream: https://github.com/xbmc/xbmc/pull/17215
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- .../rendering/VideoRenderers/RPRendererGuiTexture.cpp           | 2 ++
- xbmc/pictures/SlideShowPicture.cpp                              | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/xbmc/cores/RetroPlayer/rendering/VideoRenderers/RPRendererGuiTexture.cpp b/xbmc/cores/RetroPlayer/rendering/VideoRenderers/RPRendererGuiTexture.cpp
-index 5485358cad..ad2bf1b984 100644
---- a/xbmc/cores/RetroPlayer/rendering/VideoRenderers/RPRendererGuiTexture.cpp
-+++ b/xbmc/cores/RetroPlayer/rendering/VideoRenderers/RPRendererGuiTexture.cpp
-@@ -17,6 +17,8 @@
- using namespace DirectX;
- #endif
- 
-+#include <cstddef>
-+
- using namespace KODI;
- using namespace RETRO;
- 
-diff --git a/xbmc/pictures/SlideShowPicture.cpp b/xbmc/pictures/SlideShowPicture.cpp
-index 05848191d2..08fc754471 100644
---- a/xbmc/pictures/SlideShowPicture.cpp
-+++ b/xbmc/pictures/SlideShowPicture.cpp
-@@ -32,6 +32,8 @@ using namespace DirectX;
- using namespace Microsoft::WRL;
- #endif
- 
-+#include <cstddef>
-+
- #define IMMEDIATE_TRANSITION_TIME          20
- 
- #define PICTURE_MOVE_AMOUNT              0.02f
--- 
-2.20.1
-
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 578befec1b..357cd55c7b 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 108979df8b41ab4168f5cdc0233f46e38767eda5921f4ccae16584e98d0d6b29  kodi-18.5-Leia.tar.gz
+sha256 47e6d7d4e01dbda92ff83a3e141ac43003e918133e78b3a4b79faff65184711c  kodi-18.6-Leia.tar.gz
 sha256 e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  kodi-ffmpeg-4.0.4-Leia-18.4.tar.gz
 sha256 38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
 sha256 071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 2f2a92a889..71b6d44415 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION = 18.5-Leia
+KODI_VERSION = 18.6-Leia
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
 KODI_LICENSE_FILES = LICENSE.md
