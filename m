From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:24:10 +0200
Subject: [Buildroot] [git commit] package/nvidia-tegra23-codecs: new package
Message-ID: <20150426202425.2BAA5818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25967591813409ae8c4a1358b3751a080975d95d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nvidia-tegra23-codecs provides various HW-accelerated media codecs, such
as: AAC3, h264, jpeg, MP3...

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
[me:
  - split codecs from binaries into this patch
  - use our extractor helpers
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

[Thomas:
  - Remove <pkg>_DEPENDENCIES variable that contained
    nvidia-tegra23-binaries, since this dependency is a runtime
    dependency only.
  - Remove 'NVIDIA_TEGRA23_CODECS_INSTALL_STAGING = NO', since this is
    the default.
  - Remove 'NVIDIA_TEGRA23_CODECS_INSTALL_TARGET = YES', since this is
    the default.
  - Instead of using a NVIDIA_TEGRA23_CODECS_FIRMWARE variable listing
    the firmware files to copy, simply copy all firmware files.]
---
 package/nvidia-tegra23/Config.in                   |    1 +
 .../nvidia-tegra23/nvidia-tegra23-codecs/Config.in |    7 ++++
 .../nvidia-tegra23-codecs.hash                     |    3 ++
 .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk |   32 ++++++++++++++++++++
 4 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/nvidia-tegra23/Config.in b/package/nvidia-tegra23/Config.in
index 28c99c7..eb33581 100644
--- a/package/nvidia-tegra23/Config.in
+++ b/package/nvidia-tegra23/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3
 endchoice
 
 source "package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in"
+source "package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in"
 endif
 
 comment "nvidia-tegra23 needs Xorg <= 1.14 and a (e)glibc toolchain w/ EABIhf"
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in b/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
new file mode 100644
index 0000000..df9de69
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NVIDIA_TEGRA23_CODECS
+	bool "nvidia-tegra23 codecs"
+	depends on BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
+	help
+	  NVIDIA Tegra restricted codecs from Linux For Tegra 16.5.
+
+	  https://developer.nvidia.com/linux-tegra-rel-16
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
new file mode 100644
index 0000000..9b5c614
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
@@ -0,0 +1,3 @@
+# From https://developer.nvidia.com/linux-tegra-rel-16
+sha1 540e89d5462537cd59c8a86efdb786b3b4310868 Tegra20_Linux-codecs_R16.5_armhf.tbz2
+sha1 3637efe808f25594e3cdc2756aef6e0274ab70f4 Tegra30_Linux-codecs_R16.5_armhf.tbz2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
new file mode 100644
index 0000000..18f083d
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
@@ -0,0 +1,32 @@
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
+	mkdir -p $(TARGET_DIR)/lib/firmware/
+	cp -dpfr $(@D)/restricted_codecs/lib/firmware/*.axf \
+		$(TARGET_DIR)/lib/firmware/
+endef
+
+$(eval $(generic-package))
