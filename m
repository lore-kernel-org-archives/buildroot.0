From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 13:11:33 +0100
Subject: [Buildroot] [PATCH 11/11 v4] package/nvidia-tegra23-codecs: new
	package
In-Reply-To: <cover.1421582718.git.yann.morin.1998@free.fr>
References: <cover.1421582718.git.yann.morin.1998@free.fr>
Message-ID: <cdf9d026f9e02b9a4c73069bcdbf2cc6e3cf54e3.1421582718.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nicolas Serafini <nicolas.serafini@sensefly.com>

nvidia-tegra23-codecs provides various HW-accelerated media codecs, such
as: AAC3, h264, jpeg, MP3...

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
[me:
  - split codecs from binaries into this patch
  - use our extractor helpers
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nvidia-tegra23/Config.in                   |  1 +
 .../nvidia-tegra23/nvidia-tegra23-codecs/Config.in |  7 ++++
 .../nvidia-tegra23-codecs.hash                     |  3 ++
 .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk | 41 ++++++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk

diff --git a/package/nvidia-tegra23/Config.in b/package/nvidia-tegra23/Config.in
index 950f2f8..89bdf83 100644
--- a/package/nvidia-tegra23/Config.in
+++ b/package/nvidia-tegra23/Config.in
@@ -28,6 +28,7 @@ config BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3
 endchoice
 
 source "package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in"
+source "package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in"
 endif
 
 comment "nvidia-tegra23 needs Xorg and a (e)glibc toolchain w/ EABIhf"
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in b/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
new file mode 100644
index 0000000..07a8e74
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NVIDIA_TEGRA23_CODECS
+	bool "nvidia-tegra23 codecs"
+	depends on BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
+	help
+	  NVIDIA Tegra restricted codecs from Linux For Tegra 16.4.0
+
+	  https://developer.nvidia.com/linux-tegra-rel-16
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
new file mode 100644
index 0000000..de4a461
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
@@ -0,0 +1,3 @@
+# From https://developer.nvidia.com/linux-tegra-rel-16
+sha1 d0889bf0ca408583a1e88657c6fd18f3659ef1bb Tegra20_Linux-codecs_R16.4.0_armhf.tbz2
+sha1 a9f298222d3b6a618ef96a6bed9641929b152c8a Tegra30_Linux-codecs_R16.4.0_armhf.tbz2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
new file mode 100644
index 0000000..d05dbb8
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# nvidia-tegra23-codecs
+#
+################################################################################
+
+NVIDIA_TEGRA23_CODECS_VERSION = $(NVIDIA_TEGRA23_VERSION)
+NVIDIA_TEGRA23_CODECS_SOURCE = $(NVIDIA_TEGRA23_BASE)-codecs_R$(NVIDIA_TEGRA23_CODECS_VERSION)_armhf.tbz2
+NVIDIA_TEGRA23_CODECS_SITE = $(NVIDIA_TEGRA23_SITE)
+NVIDIA_TEGRA23_CODECS_LICENSE = NVIDIA(r) Tegra(r) Software License Agreement
+NVIDIA_TEGRA23_CODECS_LICENSE_FILES = Tegra_Software_License_Agreement-Tegra-Linux-codecs.txt
+NVIDIA_TEGRA23_CODECS_REDISTRIBUTE = NO
+NVIDIA_TEGRA23_CODECS_DEPENDENCIES = nvidia-tegra23-binaries
+NVIDIA_TEGRA23_CODECS_INSTALL_STAGING = NO
+NVIDIA_TEGRA23_CODECS_INSTALL_TARGET = YES
+
+NVIDIA_TEGRA23_CODECS_FIRMWARE = \
+	nvmm_aacdec.axf nvmm_adtsdec.axf nvmm_h264dec.axf nvmm_h264dec2x.axf \
+	nvmm_jpegdec.axf nvmm_jpegenc.axf nvmm_manager.axf nvmm_mp3dec.axf \
+	nvmm_mpeg4dec.axf nvmm_service.axf
+
+# The archive contains an archive with the firmware codecs
+define NVIDIA_TEGRA23_CODECS_EXTRACT_CMDS
+	$(INSTALL) -d $(@D)
+	$(call suitable-extractor,$(NVIDIA_TEGRA23_CODECS_SOURCE)) \
+		$(DL_DIR)/$(NVIDIA_TEGRA23_CODECS_SOURCE) | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D) $(TAR_OPTIONS) -
+	$(INSTALL) -d $(@D)/restricted_codecs
+	$(call suitable-extractor,$(@D)/restricted_codecs.tbz2) \
+		$(@D)/restricted_codecs.tbz2 | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D)/restricted_codecs/ $(TAR_OPTIONS) -
+endef
+
+define NVIDIA_TEGRA23_CODECS_INSTALL_TARGET_CMDS
+	$(foreach codec,$(NVIDIA_TEGRA23_CODECS_FIRMWARE),
+		$(INSTALL) -D -m 0644 $(@D)/restricted_codecs/lib/firmware/$(codec) \
+			$(TARGET_DIR)/lib/firmware/$(codec); \
+	)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
