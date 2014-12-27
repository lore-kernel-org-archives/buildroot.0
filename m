From: Tal Lubko <tallubko@yahoo.com>
Date: Sat, 27 Dec 2014 12:31:49 +0200
Subject: [Buildroot] [PATCH v1 2/2] intel-gpu-tools: - fixing dependencies -
	version bump from 1.8 to 1.9
In-Reply-To: <1419676309-850-1-git-send-email-tallubko@yahoo.com>
References: <1419676309-850-1-git-send-email-tallubko@yahoo.com>
Message-ID: <1419676309-850-2-git-send-email-tallubko@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tal Lubko <tallubko@yahoo.com>
---
 package/intel-gpu-tools/Config.in          | 11 +++++++++++
 package/intel-gpu-tools/intel-gpu-tools.mk |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/intel-gpu-tools/Config.in b/package/intel-gpu-tools/Config.in
index 2336d2a..6eab8c7 100644
--- a/package/intel-gpu-tools/Config.in
+++ b/package/intel-gpu-tools/Config.in
@@ -1,13 +1,24 @@
 config BR2_PACKAGE_INTEL_GPU_TOOLS
 	bool "intel-gpu-tools"
 	select BR2_PACKAGE_LIBDRM
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_LARGEFILE # libdrm & libpciaccess
 	select BR2_PACKAGE_LIBDRM_INTEL
+	depends on BR2_i386 || BR2_x86_64 # libdrm-intel
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
 	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBPCIACCESS
 
 	help
 	  This is a collection of tools for development and testing of the Intel DRM driver.
 
 	  https://01.org/linuxgraphics/
+
+comment "intel-gpu-tools needs a toolchain w/ largefile, threads, wchar"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/intel-gpu-tools/intel-gpu-tools.mk b/package/intel-gpu-tools/intel-gpu-tools.mk
index a001ea8..76d0abe 100644
--- a/package/intel-gpu-tools/intel-gpu-tools.mk
+++ b/package/intel-gpu-tools/intel-gpu-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GPU_TOOLS_VERSION = 1.8
+INTEL_GPU_TOOLS_VERSION = 1.9
 INTEL_GPU_TOOLS_SOURCE = intel-gpu-tools-$(INTEL_GPU_TOOLS_VERSION).tar.bz2
 INTEL_GPU_TOOLS_SITE = http://xorg.freedesktop.org/archive/individual/app
 INTEL_GPU_TOOLS_LICENSE = MIT
-- 
1.9.1
