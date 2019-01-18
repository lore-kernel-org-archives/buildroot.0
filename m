From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:11:26 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/x11r7/xapp_rgb:
 add missing host-pkgconf dependency
Message-ID: <20190118131220.F2FF783631@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20fad0814e288fad8491b6cfbf333a093caabfe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Building a minimal defconfig such as:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XAPP_RGB=y

by running "make xapp_rgb" gives the following build failure:

checking for RGB... configure: error: in `/home/test/buildroot/output/build/xapp_rgb-1.0.6':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables RGB_CFLAGS
and RGB_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

The configure script uses pkg-config, but host-pkgconf is missing in
the list of dependencies.

This issue was detected thanks to per-package directory support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 401b7b94a39710cd9d9f5a98febd8f8ea528708d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_rgb/xapp_rgb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index 82878abad0..1c467c4525 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -9,6 +9,6 @@ XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
 XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RGB_LICENSE = MIT
 XAPP_RGB_LICENSE_FILES = COPYING
-XAPP_RGB_DEPENDENCIES = xproto_xproto
+XAPP_RGB_DEPENDENCIES = xproto_xproto host-pkgconf
 
 $(eval $(autotools-package))
