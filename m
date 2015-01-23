From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 00:24:39 +0100
Subject: [Buildroot] [PATCH 10/14 v6] package/nvidia-driver: Add gl.pc
In-Reply-To: <cover.1422055104.git.yann.morin.1998@free.fr>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
Message-ID: <f86baec76e7a2f004cc033818a3ce305cced7385.1422055104.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: J?r?me Pouiller <jezz@sysmic.org>

In order to compile xserver, libgl provider have to provide gl.pc file.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nvidia-driver/gl.pc            | 11 +++++++++++
 package/nvidia-driver/nvidia-driver.mk |  1 +
 2 files changed, 12 insertions(+)
 create mode 100644 package/nvidia-driver/gl.pc

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
index 714892d..d53dc06 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -96,6 +96,7 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
 	$(SED) 's:__GENERATED_BY__:Buildroot:' $(STAGING_DIR)/usr/lib/libGL.la
 	$(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
 	$(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
+	$(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
 endef
 
 # For target, install libraries and X.org modules
-- 
1.9.1
