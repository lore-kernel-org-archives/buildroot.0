From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 11 Jul 2019 16:09:59 +0200
Subject: [Buildroot] [git commit] package/atk: bump to version 2.33.3
Message-ID: <20190711140904.DADF980FFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0cd5b51f22da22b077be1efbece56a4d339de40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Disable introspection as otherwise build will fail since
  https://gitlab.gnome.org/GNOME/atk/commit/db2d7a6d3c45fe57420d5e5aa8d8509c52943e6e
- Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...n.build-replace-shared_library-by-library.patch | 33 ----------------------
 package/atk/atk.hash                               |  4 +--
 package/atk/atk.mk                                 |  5 ++--
 3 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/package/atk/0001-atk-meson.build-replace-shared_library-by-library.patch b/package/atk/0001-atk-meson.build-replace-shared_library-by-library.patch
deleted file mode 100644
index 6260cca89f..0000000000
--- a/package/atk/0001-atk-meson.build-replace-shared_library-by-library.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From da08587d9a57b45cc8a76cb31390c79c1199959b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 10 Jan 2019 10:13:03 +0100
-Subject: [PATCH] atk/meson.build: replace shared_library by library
-
-Use library instead of shared_library to allow the user to build a
-static libatk library
-
-Fixes:
- - http://autobuild.buildroot.org/results/347a37dd2585974bdbf3bf99158e8ee9127d1202
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://gitlab.gnome.org/GNOME/atk/merge_requests/11]
----
- atk/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/atk/meson.build b/atk/meson.build
-index 69ba6c5..0ad67e5 100644
---- a/atk/meson.build
-+++ b/atk/meson.build
-@@ -122,7 +122,7 @@ endif
- 
- atk_inc = include_directories('.')
- 
--libatk = shared_library('atk- at 0@'.format(atk_api_version),
-+libatk = library('atk- at 0@'.format(atk_api_version),
-                         sources: atk_sources + atk_enums + atk_marshals,
-                         soversion: atk_soversion,
-                         version: atk_libversion,
--- 
-2.14.1
-
diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 911e65fcc7..8c1bad5b1a 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.30/atk-2.30.0.sha256sum
-sha256 dd4d90d4217f2a0c1fee708a555596c2c19d26fef0952e1ead1938ab632c027b atk-2.30.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.33/atk-2.33.3.sha256sum
+sha256 532d1081e87b9f0a8d71733101e791818442fa1896531621d1aecc189e1a4ffe atk-2.33.3.tar.xz
 
 # Hash for license file
 sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 6a0cb370db..7039666059 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.30
-ATK_VERSION = $(ATK_VERSION_MAJOR).0
+ATK_VERSION_MAJOR = 2.33
+ATK_VERSION = $(ATK_VERSION_MAJOR).3
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
 ATK_LICENSE = LGPL-2.0+
@@ -13,6 +13,7 @@ ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
 ATK_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
 
+ATK_CONF_OPTS = -Dintrospection=false
 ATK_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
