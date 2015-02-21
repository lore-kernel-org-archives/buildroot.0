From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 18:39:54 +0100
Subject: [Buildroot] [git commit] package/nvidia-driver: Add gl.pc
Message-ID: <20150302222721.BE5ED807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13d761486a2d119894466d9821348cd87e1e53d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to compile xserver, libgl provider have to provide gl.pc file.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nvidia-driver/gl.pc            |   11 +++++++++++
 package/nvidia-driver/nvidia-driver.mk |    1 +
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/nvidia-driver/gl.pc b/package/nvidia-driver/gl.pc
new file mode 100644
index 0000000..d822763
--- /dev/null
+++ b/package/nvidia-driver/gl.pc
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: gl
+Description: Nvidia OpenGL library
+Version: 10.4.2
+Libs: -L${libdir} -lGL -lm -lXext -lX11 -ldl
+Cflags: -I${includedir}  -DMESA_EGL_NO_X11_HEADERS
+glx_tls: no
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index f703fab..2a35f9b 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -102,6 +102,7 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
 	$(SED) 's:__GENERATED_BY__:Buildroot:' $(STAGING_DIR)/usr/lib/libGL.la
 	$(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
 	$(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
+	$(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
 endef
 
 # For target, install libraries and X.org modules
