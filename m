From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Aug 2013 10:54:19 +0200
Subject: [Buildroot] [git commit] opengl: libgles and libegl also provided
	by gpu-viv-bin-mx6q
Message-ID: <20130806085601.EBE5E9B1C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3e45e3f1f5127083fc1252b4b9ac9ca62693696
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gpu-viv-bin-mx6q package selects BR2_PACKAGE_HAS_OPENGL_EGL and
BR2_PACKAGE_HAS_OPENGL_ES, so when it is enabled, Buildroot believes
that OpenGL and EGL support is available.

However, both libgles.mk and libegl.mk do not add the dependency on
gpu-viv-bin-mx6q, so when pulling the libgles or libegl dependencies,
the build fails due to the absence of an OpenGL implementation. This
commit fixes that.

Fixes the build failure at
http://autobuild.buildroot.org/results/dbd/dbd938914883a9e205f967f7b4b4a8a7dc7be117/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opengl/libegl/libegl.mk   |    4 ++++
 package/opengl/libgles/libgles.mk |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index 97a4b85..c194b02 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -18,6 +18,10 @@ ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
 LIBEGL_DEPENDENCIES += sunxi-mali
 endif
 
+ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
+LIBEGL_DEPENDENCIES += gpu-viv-bin-mx6q
+endif
+
 ifeq ($(LIBEGL_DEPENDENCIES),)
 define LIBEGL_CONFIGURE_CMDS
 	echo "No libEGL implementation selected. Configuration error."
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index 2945496..ec157ac 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -18,6 +18,10 @@ ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
 LIBGLES_DEPENDENCIES += sunxi-mali
 endif
 
+ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
+LIBGLES_DEPENDENCIES += gpu-viv-bin-mx6q
+endif
+
 ifeq ($(LIBGLES_DEPENDENCIES),)
 define LIBGLES_CONFIGURE_CMDS
 	echo "No libGLES implementation selected. Configuration error."
