From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:34:41 +0200
Subject: [Buildroot] [git commit] package/nvidia-driver: don't install gl.pc
	when not providing libgl
Message-ID: <20150425090201.CF4FB81734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=861cc84f8c7150d0578b8ec6189b4fec6c7d04e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When nvidia-driver does not provide libgl (i.e. when it does not install
the X.org driver), it should also not install gl.pc, otherwise, packages
that depend on pkg-config will mis-detect presence of GL and fail to
build, like vlc:

    http://autobuild.buildroot.org/results/724/724fce8ce51c2c0578192b1369a1cfcea3d72638/

So, only install gl.pc when we install the X.org driver. Similarly, we
do not need to install libGL.la either.

Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nvidia-driver/nvidia-driver.mk |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index a85cc1c..71babfb 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -40,6 +40,15 @@ NVIDIA_DRIVER_LIBS = \
 	libvdpau libvdpau_nvidia \
 	libnvidia-ml
 
+# Install the gl.pc file
+define NVIDIA_DRIVER_INSTALL_GL_DEV
+	$(INSTALL) -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la
+	$(SED) 's:__GENERATED_BY__:Buildroot:' $(STAGING_DIR)/usr/lib/libGL.la
+	$(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
+	$(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
+	$(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
+endef
+
 # Those libraries are 'private' libraries requiring an agreement with
 # NVidia to develop code for those libs. There seems to be no restriction
 # on using those libraries (e.g. if the user has such an agreement, or
@@ -154,11 +163,7 @@ endef
 # For staging, install libraries and development files
 define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
 	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(STAGING_DIR))
-	$(INSTALL) -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la
-	$(SED) 's:__GENERATED_BY__:Buildroot:' $(STAGING_DIR)/usr/lib/libGL.la
-	$(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
-	$(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
-	$(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
+	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
 endef
 
 # For target, install libraries and X.org modules
