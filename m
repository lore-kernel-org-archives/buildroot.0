From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 29 Oct 2019 23:13:04 +0100
Subject: [Buildroot] [PATCH v1] package/libxkbcommon: bump version to 0.9.1
 and convert to meson
Message-ID: <20191029221304.455-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 0.9.x the autotools build system is removed from libxkbcommon
([1]), so convert to meson build system.

Remove the CFLAGS force of '-std=gnu99', believing meson sets it
automatically (a test build used '-std=c99').

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-October/040962.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2019-October/040963.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxkbcommon/libxkbcommon.hash |  6 ++----
 package/libxkbcommon/libxkbcommon.mk   | 12 +++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index c734f3ad9f..3f9c8cb846 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,7 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-February/040102.html
-md5 3c4409058dfd203f641a563358e0187d  libxkbcommon-0.8.4.tar.xz
-sha1 0ce9df42239d451f61b2112c6ba8d0a1a0879009  libxkbcommon-0.8.4.tar.xz
-sha256 60ddcff932b7fd352752d51a5c4f04f3d0403230a584df9a2e0d5ed87c486c8b  libxkbcommon-0.8.4.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-October/040963.html
+sha256 d4c6aabf0a5c1fc616f8a6a65c8a818c03773b9a87da9fbc434da5acd1199be0 libxkbcommon-0.9.1.tar.xz

 # License file:
 sha256 086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 1f54de4267..7bbb88d3b2 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,22 +4,20 @@
 #
 ################################################################################

-LIBXKBCOMMON_VERSION = 0.8.4
+LIBXKBCOMMON_VERSION = 0.9.1
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
-LIBXKBCOMMON_CONF_OPTS = --disable-wayland
-# uses C99 features
-LIBXKBCOMMON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+LIBXKBCOMMON_CONF_OPTS = -Denable-wayland=false

 ifeq ($(BR2_PACKAGE_XORG7),y)
-LIBXKBCOMMON_CONF_OPTS += --enable-x11
+LIBXKBCOMMON_CONF_OPTS += -Denable-x11=true
 LIBXKBCOMMON_DEPENDENCIES += libxcb
 else
-LIBXKBCOMMON_CONF_OPTS += --disable-x11
+LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
 endif

-$(eval $(autotools-package))
+$(eval $(meson-package))
--
2.23.0
