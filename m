From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Nov 2020 16:52:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/fontconfig: break circular
 dependency
Message-ID: <20201107155250.427556-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails because of the following circular dependency:

fontconfig -> util-linux -> udev -> systemd -> polkit ->
gobject-introspection -> cairo -> fontconfig

which results in the following build failure:

checking for UUID... no
checking where uuid functions comes from... configure: error:
*** uuid is required. install util-linux.

To break it, apply the same ugly workaround that was applied for
libglib2 and cryptsetup until a better solution is found:
https://patchwork.ozlabs.org/project/buildroot/patch/20201101150619.1709959-1-fontaine.fabrice at gmail.com/

Fixes:
 - http://autobuild.buildroot.org/results/2c6ef073e7e98e13daa409e1ea6130e9abd32c87

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fontconfig/fontconfig.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index ee82cc1de3..018a28556e 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -10,7 +10,8 @@ FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 # 0002-add-pthread-as-a-dependency-of-a-static-lib.patch
 FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
-FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf util-linux
+FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux)
 HOST_FONTCONFIG_DEPENDENCIES = \
 	host-freetype host-expat host-pkgconf host-gperf host-util-linux
 FONTCONFIG_LICENSE = fontconfig license
-- 
2.28.0
