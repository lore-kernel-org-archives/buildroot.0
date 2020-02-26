From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:55:28 +0100
Subject: [Buildroot] [git commit] package/libxkbcommon: bump to version
 0.10.0 and convert to meson
Message-ID: <20200309140905.9AAA77F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=474b4832c109be75efd0a216a5dcbacac3da3d6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 0.9.x the autotools build system is removed from libxkbcommon
([1]), so convert to meson build system.

Remove the CFLAGS force of '-std=gnu99', believing meson sets it
automatically (a test build used '-std=c99').

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-October/040962.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxkbcommon/libxkbcommon.hash |  8 ++++----
 package/libxkbcommon/libxkbcommon.mk   | 12 +++++-------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index c734f3ad9f..5d4c3af10a 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-February/040102.html
-md5 3c4409058dfd203f641a563358e0187d  libxkbcommon-0.8.4.tar.xz
-sha1 0ce9df42239d451f61b2112c6ba8d0a1a0879009  libxkbcommon-0.8.4.tar.xz
-sha256 60ddcff932b7fd352752d51a5c4f04f3d0403230a584df9a2e0d5ed87c486c8b  libxkbcommon-0.8.4.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-January/041133.html
+md5 2d9ad3a46b317138b5e72a91cf105451  libxkbcommon-0.10.0.tar.xz
+sha1 d8f956f4bc5382d5d8e0e4dd590c4f090e0e985a  libxkbcommon-0.10.0.tar.xz
+sha256 57c3630cdc38fb4734cd57fa349e92244f5ae3862813e533cedbd86721a0b6f2  libxkbcommon-0.10.0.tar.xz
 
 # License file:
 sha256 086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 1f54de4267..3923d69c8d 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,22 +4,20 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.8.4
+LIBXKBCOMMON_VERSION = 0.10.0
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
-LIBXKBCOMMON_CONF_OPTS = --disable-wayland
-# uses C99 features
-LIBXKBCOMMON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+LIBXKBCOMMON_CONF_OPTS = -Denable-docs=false -Denable-wayland=false
 
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
