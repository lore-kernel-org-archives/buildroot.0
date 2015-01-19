From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jan 2015 21:40:40 +0100
Subject: [Buildroot] [PATCH 10/11 v5] package/nvidia-tegra23-binaries:
	provides JPEG
In-Reply-To: <cover.1421699898.git.yann.morin.1998@free.fr>
References: <cover.1421699898.git.yann.morin.1998@free.fr>
Message-ID: <efaa3cd8c1b9caf8702e9a79748647e8abaf7c14.1421699898.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nicolas Serafini <nicolas.serafini@sensefly.com>

nvidia-tegra23-binaries provides HW-accelerated JPEG.

The existing JPEG providers are select via a choice in the virtual jpeg
package (which makes them very unlike other providers of virtual
packages). But we can not do that for nvidia-tegra23-binaries, because
it is a package in its own right, with a lot more features.

Instead, we create a new 'dummy' entry in the JPEG choice, that depends
on nvidia-tegra32-binaries. This new entry does not define a new
package, unlike the existign entries, but allows for a seamless
integration into the existing infra.

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
[yann.morin.1998 at free.fr: split out into its own patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: I (YEM) realy do not like the fact that the virtual package
JPEG behaves so differently from other virtual packages, and that
the providers get selected from a choice entry. That's just ugly,
ugly... :-(
---
 package/jpeg/Config.in                                         | 10 ++++++++++
 .../nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk         |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index f337aeb..a1a99aa 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -30,6 +30,15 @@ config BR2_PACKAGE_JPEG_TURBO
 
 	  http://www.libjpeg-turbo.org
 
+config BR2_PACKAGE_JPEG_TEGRA23
+	bool "jpeg accelerated for tegra2 or tegra3"
+	depends on BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
+	select BR2_PACKAGE_HAS_JPEG
+	help
+	  Accelerated libjpeg for tegra
+
+	  https://developer.nvidia.com/linux-tegra
+
 endchoice
 
 config BR2_PACKAGE_HAS_JPEG
@@ -39,5 +48,6 @@ config BR2_PACKAGE_PROVIDES_JPEG
 	string
 	default "libjpeg"    if BR2_PACKAGE_LIBJPEG
 	default "jpeg-turbo" if BR2_PACKAGE_JPEG_TURBO
+	default "nvidia-tegra23-binaries" if BR2_PACKAGE_JPEG_TEGRA23
 
 endif
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
index 01284d8..9cd6cdd 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
@@ -57,6 +57,11 @@ NVIDIA_TEGRA23_BINARIES_DRV = \
 NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS = \
 	libgstnv4l2.so libgstnvvidconv.so libgstnvxvimagesink.so libgstomx.so
 
+ifeq ($(BR2_PACKAGE_JPEG_TEGRA23),y)
+NVIDIA_TEGRA23_BINARIES_PROVIDES = jpeg
+NVIDIA_TEGRA23_BINARIES_LIBRARIES += libjpeg.so
+endif
+
 NVIDIA_TEGRA23_BINARIES_MULTIMEDIA_APPS = nvgstplayer nvgstcapture
 
 NVIDIA_TEGRA23_BINARIES_PKGCONFIG = egl.pc gles.pc glesv2.pc
-- 
1.9.1
