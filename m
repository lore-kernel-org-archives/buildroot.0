From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 17 Feb 2015 23:02:56 +0100
Subject: [Buildroot] [PATCH 2/2] [RFC] mesa3d: Use LLVM as the shader
	compiler when applicable
In-Reply-To: <1424210576-18526-1-git-send-email-paul@crapouillou.net>
References: <1424210576-18526-1-git-send-email-paul@crapouillou.net>
Message-ID: <1424210576-18526-3-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/mesa3d/mesa3d.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index eb38a9a..7a825f3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -24,6 +24,17 @@ MESA3D_DEPENDENCIES = \
 	host-xutil_makedepend \
 	libdrm
 
+ifeq ($(BR2_PACKAGE_HOST_LLVM),y)
+MESA3D_DEPENDENCIES += elfutils host-llvm
+MESA3D_CONF_OPTS += --enable-gallium-llvm=yes \
+					--enable-r600-llvm-compiler=yes \
+					--with-llvm-prefix=$(HOST_DIR)/usr
+else
+MESA3D_CONF_OPTS += --enable-llvm-shared-libs=no \
+					--enable-r600-llvm-compiler=no \
+					--enable-gallium-llvm=no
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
-- 
2.1.4
