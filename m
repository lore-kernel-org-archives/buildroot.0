From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Jun 2016 13:42:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Disable static build of DRI
	drivers if BR2_SHARED_STATIC_LIBS=y
Message-ID: <1466854943-18855-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using this defconfig

BR2_SHARED_STATIC_LIBS=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y

building DRI drivers in mesa3d fails with this message:

configure: error: Cannot use static libraries for DRI drivers

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ebd674f..5ba9d6e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -123,6 +123,11 @@ MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
 	--enable-driglx-direct \
 	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
+# fixes the following configure error:
+# configure: error: Cannot use static libraries for DRI drivers
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+MESA3D_CONF_OPTS += --disable-static
+endif
 endif
 
 # APIs
-- 
2.8.1
