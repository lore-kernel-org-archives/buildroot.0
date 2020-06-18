From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jun 2020 22:17:07 +0200
Subject: [Buildroot] [git commit] package/libcamera: add v4l2 compatibility
 layer option
Message-ID: <20200618201530.9D7EC805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99cc53f3f4b473ccefae06edd85f5be1cf4e155c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/Config.in    | 5 +++++
 package/libcamera/libcamera.mk | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 56ca5aaf18..960d78b82e 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -16,6 +16,11 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 
 if BR2_PACKAGE_LIBCAMERA
 
+config BR2_PACKAGE_LIBCAMERA_V4L2
+	bool "libcamera v4l2 compatibility layer"
+	help
+	  libcamera v4l2 compatibility layer
+
 config BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	bool
 
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 1d3b382a32..fb0e54785b 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -15,8 +15,7 @@ LIBCAMERA_DEPENDENCIES = \
 LIBCAMERA_CONF_OPTS = \
 	-Dandroid=false \
 	-Ddocumentation=false \
-	-Dtest=false \
-	-Dv4l2=false
+	-Dtest=false
 LIBCAMERA_INSTALL_STAGING = yes
 LIBCAMERA_LICENSE = \
 	LGPL-2.1+ (library), \
@@ -37,6 +36,12 @@ LIBCAMERA_LICENSE_FILES = \
 	LICENSES/CC0-1.0.txt \
 	LICENSES/CC-BY-SA-4.0.txt
 
+ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
+LIBCAMERA_CONF_OPTS = -Dv4l2=true
+else
+LIBCAMERA_CONF_OPTS = -Dv4l2=false
+endif
+
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
 ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
 LIBCAMERA_PIPELINES-y += raspberrypi
