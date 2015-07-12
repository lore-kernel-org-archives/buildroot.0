From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 13:51:59 +0200
Subject: [Buildroot] [git commit] packages: do not use TAR_STRIP_COMPONENTS,
	but directly --strip-components
Message-ID: <20150712115229.AF96C800D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22ed697d11e033914cab7631fba899ba436a5a5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk                                 |    2 +-
 package/lsof/lsof.mk                               |    2 +-
 .../nvidia-tegra23-binaries.mk                     |    4 ++--
 .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk |    4 ++--
 package/perl/perl.mk                               |    2 +-
 toolchain/toolchain-external/toolchain-external.mk |    6 +++---
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index be242cb..d1693d5 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -53,7 +53,7 @@ endef
 
 define HOST_GCC_EXTRACT_CMDS
 	$(call suitable-extractor,$(GCC_SOURCE)) $(DL_DIR)/$(GCC_SOURCE) | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
+		$(TAR) --strip-components=1 -C $(@D) \
 		--exclude='libjava/*' \
 		--exclude='libgo/*' \
 		--exclude='gcc/testsuite/*' \
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 19b303b..f9b7661 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -34,7 +34,7 @@ endif
 define LSOF_EXTRACT_CMDS
 	$(call suitable-extractor,$(LSOF_SOURCE)) $(DL_DIR)/$(LSOF_SOURCE) | \
 		$(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
+	$(TAR) --strip-components=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
 endef
 
 define LSOF_CONFIGURE_CMDS
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
index 7b6029e..4f7cdcf 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
@@ -37,11 +37,11 @@ define NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
 	$(INSTALL) -d $(@D)/nv_tegra/nvidia_drivers
 	$(call suitable-extractor,$(@D)/nv_tegra/nvidia_drivers.tbz2) \
 		$(@D)/nv_tegra/nvidia_drivers.tbz2 | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D)/nv_tegra/nvidia_drivers/ $(TAR_OPTIONS) -
+	$(TAR) --strip-components=0 -C $(@D)/nv_tegra/nvidia_drivers/ $(TAR_OPTIONS) -
 	$(INSTALL) -d $(@D)/nv_tegra/nv_sample_apps/nvgstapps
 	$(call suitable-extractor,$(@D)/nv_tegra/nv_sample_apps/nvgstapps.tbz2) \
 		$(@D)/nv_tegra/nv_sample_apps/nvgstapps.tbz2 | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D)/nv_tegra/nv_sample_apps/nvgstapps/ $(TAR_OPTIONS) -
+	$(TAR) --strip-components=0 -C $(@D)/nv_tegra/nv_sample_apps/nvgstapps/ $(TAR_OPTIONS) -
 endef
 NVIDIA_TEGRA23_BINARIES_POST_EXTRACT_HOOKS += NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
 
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
index 18f083d..5514643 100644
--- a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
@@ -16,11 +16,11 @@ define NVIDIA_TEGRA23_CODECS_EXTRACT_CMDS
 	$(INSTALL) -d $(@D)
 	$(call suitable-extractor,$(NVIDIA_TEGRA23_CODECS_SOURCE)) \
 		$(DL_DIR)/$(NVIDIA_TEGRA23_CODECS_SOURCE) | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D) $(TAR_OPTIONS) -
+	$(TAR) --strip-components=0 -C $(@D) $(TAR_OPTIONS) -
 	$(INSTALL) -d $(@D)/restricted_codecs
 	$(call suitable-extractor,$(@D)/restricted_codecs.tbz2) \
 		$(@D)/restricted_codecs.tbz2 | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D)/restricted_codecs/ $(TAR_OPTIONS) -
+	$(TAR) --strip-components=0 -C $(@D)/restricted_codecs/ $(TAR_OPTIONS) -
 endef
 
 define NVIDIA_TEGRA23_CODECS_INSTALL_TARGET_CMDS
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 6794eef..091c032 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -28,7 +28,7 @@ PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
 # together with perl
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 22f8118..070f068 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -417,16 +417,16 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_
 define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
 	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+		$(TAR) --strip-components=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+		$(TAR) --strip-components=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 endef
 else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
 # Normal handling of toolchain tarball extraction.
 define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
 	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+		$(TAR) --strip-components=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 	$(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
 endef
 endif
