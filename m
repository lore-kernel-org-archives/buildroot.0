From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 21 Jan 2015 12:23:25 +0100
Subject: [Buildroot] [RFC 1/4] nvidia-driver: Add gl.pc
In-Reply-To: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
References: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
Message-ID: <1421839408-15839-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to compile xserver, libgl provider have to provide gl.pc file.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
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
index 8ebc503..3b8b2ae 100644
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
