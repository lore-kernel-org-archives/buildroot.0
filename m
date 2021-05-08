From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 May 2021 18:38:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 19.1
Message-ID: <20210508163822.65699-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002 which was applied upstream:
https://github.com/xbmc/xbmc/commit/c9cf94d3108d742e50ea73b5553125ef5e405c73

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-jsonschemabuilder.mk                 |  4 +--
 .../kodi-texturepacker/kodi-texturepacker.mk  |  4 +--
 ...ux-fix-drm-object-build-with-gcc-4.9.patch | 34 -------------------
 package/kodi/kodi.hash                        |  2 +-
 package/kodi/kodi.mk                          |  4 +--
 5 files changed, 7 insertions(+), 41 deletions(-)
 delete mode 100644 package/kodi/0002-linux-fix-drm-object-build-with-gcc-4.9.patch

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 57062c3c8c..46090aee90 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,8 +6,8 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 19.0-Matrix
-KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
+KODI_JSONSCHEMABUILDER_VERSION = 19.1
+KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,v$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
 KODI_JSONSCHEMABUILDER_LICENSE = GPL-2.0
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index fd43566379..1e5f2aad66 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,8 +6,8 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 19.0-Matrix
-KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
+KODI_TEXTUREPACKER_VERSION = 19.1
+KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,v$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
 KODI_TEXTUREPACKER_LICENSE = GPL-2.0
diff --git a/package/kodi/0002-linux-fix-drm-object-build-with-gcc-4.9.patch b/package/kodi/0002-linux-fix-drm-object-build-with-gcc-4.9.patch
deleted file mode 100644
index b9a0efd336..0000000000
--- a/package/kodi/0002-linux-fix-drm-object-build-with-gcc-4.9.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4f3b35c58ffb755cd7371faa44e2914fd7be3f0a Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 4 Jan 2021 22:32:28 +0100
-Subject: [PATCH] [linux] fix drm object build with gcc-4.9
-
-Fixes build error introduced by PR18858:
-
-kodi/xbmc/windowing/gbm/drm/DRMObject.cpp: In member function 'std::tuple<bool, long unsigned int> KODI::WINDOWING::GBM::CDRMObject::GetPropertyValue(const string&, const string&) const':
-kodi/xbmc/windowing/gbm/drm/DRMObject.cpp:103:39: error: converting to 'std::tuple<bool, long unsigned int>' from initializer list would use explicit constructor 'constexpr std::tuple<_T1, _T2>::tuple(_U1&&, _U2&&) [with _U1 = bool; _U2 = long long unsigned int&; <template-parameter-2-3> = void; _T1 = bool; _T2 = long unsigned int]'
-     return {true, prop->enums[j].value};
-
-Patch sent upstream: https://github.com/xbmc/xbmc/pull/19020
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xbmc/windowing/gbm/drm/DRMObject.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xbmc/windowing/gbm/drm/DRMObject.cpp b/xbmc/windowing/gbm/drm/DRMObject.cpp
-index 7d27c6f059..f93f014f7d 100644
---- a/xbmc/windowing/gbm/drm/DRMObject.cpp
-+++ b/xbmc/windowing/gbm/drm/DRMObject.cpp
-@@ -100,7 +100,7 @@ std::tuple<bool, uint64_t> CDRMObject::GetPropertyValue(const std::string& name,
-     if (prop->enums[j].name != valueName)
-       continue;
- 
--    return {true, prop->enums[j].value};
-+    return std::make_tuple(true, prop->enums[j].value);
-   }
- 
-   return std::make_tuple(false, 0);
--- 
-2.29.2
-
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 17bbc33714..7999f312c8 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f7ef8a6f45862ae3b7ebfce4950d74f534be3cb4a0e67ce640963746b3f668f2  kodi-19.0-Matrix.tar.gz
+sha256  b8ded0d32328e85e8f8ab7747289d647ddb910f476f5ce1ae53582c7842fc852  kodi-19.1.tar.gz
 sha256  38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
 sha256  071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
 sha256  a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index d633dd841d..7e9d9f5f47 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,8 +6,8 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION = 19.0-Matrix
-KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
+KODI_VERSION = 19.1
+KODI_SITE = $(call github,xbmc,xbmc,v$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
 KODI_LICENSE_FILES = LICENSE.md
 # needed for binary addons
-- 
2.29.2
