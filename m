From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 12:41:00 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/nvidia-driver:
	install an egl.pc
Message-ID: <20170906112608.1B68F81932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6ae588ccc7e2419d9d90db5bb10e6f2fc4ea361
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

A lot of packages expect an egl.pc to decide that EGL is available. So,
provide one.

As suggested by Alexandre, use the one from nvidia-tegra23 as template.

Reported-by: Alexandre Maumen?? <alexandre@maumene.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexandre Maumen?? <alexandre@maumene.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 05a86bdf1fa9071de9701fba058d47d80a0925bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nvidia-driver/egl.pc           | 10 ++++++++++
 package/nvidia-driver/nvidia-driver.mk |  1 +
 2 files changed, 11 insertions(+)

diff --git a/package/nvidia-driver/egl.pc b/package/nvidia-driver/egl.pc
new file mode 100644
index 0000000..a5aeace
--- /dev/null
+++ b/package/nvidia-driver/egl.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: egl
+Description: Nvidia OpenGL library
+Version: 1
+Cflags: -I${includedir}
+Libs: -L${libdir} -lEGL
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 20beec8..1b85f3d 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -78,6 +78,7 @@ define NVIDIA_DRIVER_INSTALL_GL_DEV
 	$(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
 	$(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
 	$(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
+	$(INSTALL) -D -m 0644 package/nvidia-driver/egl.pc $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
 endef
 
 # Those libraries are 'private' libraries requiring an agreement with
