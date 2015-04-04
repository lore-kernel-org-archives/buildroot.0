From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Apr 2015 00:01:21 +0200
Subject: [Buildroot] [git commit] package/libva-intel-driver: Fix build
Message-ID: <20150404220340.14F0D81909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce6dfb51d63192d34c8a599292c1c562fe8afc6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package needs autoreconf to produce a working configure script when building
without wayland support.

Also fix a typo in .mk file.

Fixes
http://autobuild.buildroot.net/results/606/6061216fa6e2f4323117bb6cfb2b77753a89a679/
http://autobuild.buildroot.net/results/76d/76dc4b670e2131b94bd0c5cff45ccafd5e45033c/
http://autobuild.buildroot.net/results/d6f/d6f624baa3dde4fc4051d361ddaf98ecc5c84134/
http://autobuild.buildroot.net/results/91f/91f36f32ef43be897fef9352f97cc07781c4035a/
http://autobuild.buildroot.net/results/951/9517bb6d2c05c27cad0b24a4443021a34babedbd/
http://autobuild.buildroot.net/results/405/405dfffbcfdaa485d0000dad655b0c112688a58f/
http://autobuild.buildroot.net/results/925/92538fb07d5226bb8c3d3cc5e1429560b2e621f3/
http://autobuild.buildroot.net/results/d15/d154ca018da0c21762ed70acda4f224c50a1d808/

This is caused by the fact that WAYLAND_SCANNER_RULES (which is provided by
wayland) is outside the wayland conditional.

For more details, see the upstream bug:

https://bugs.freedesktop.org/show_bug.cgi?id=79478

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva-intel-driver/libva-intel-driver.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 5755207..8469314 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -9,6 +9,8 @@ LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
 LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
+# needed to work around https://bugs.freedesktop.org/show_bug.cgi?id=79478
+LIBVA_INTEL_DRIVER_AUTORECONF = YES
 LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -19,7 +21,7 @@ LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBVA_DEPENDENCIES += wayland
+LIBVA_INTEL_DRIVER_DEPENDENCIES += wayland
 LIBVA_INTEL_DRIVER_CONF_OPTS += --enable-wayland
 else
 LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-wayland
