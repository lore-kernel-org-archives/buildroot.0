From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  6 Oct 2015 21:35:30 +0200
Subject: [Buildroot] [PATCH v1] libdrm: update driver options
Message-ID: <1444160130-10549-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add AMD GPU driver (available since 2.4.63)
- freedreno is no longer experimental (since 2.4.59)
- add NVIDIA Tegra driver (available since 2.4.59)
- update help texts (install vs. installs, change to complete
  sentences)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libdrm/Config.in | 27 +++++++++++++++++++--------
 package/libdrm/libdrm.mk | 16 ++++++++++++++--
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index dda3aee..cf1c13b 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -22,42 +22,53 @@ config BR2_PACKAGE_LIBDRM_INTEL
 	select BR2_PACKAGE_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
-	  installs intel graphics driver
+	  Install intel graphics driver.
 
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
 	help
-	  install AMD/ATI graphics driver
+	  Install AMD/ATI graphics driver.
+
+config BR2_PACKAGE_LIBDRM_AMDGPU
+	bool "amdgpu"
+	help
+	  Install AMD GPU driver.
 
 config BR2_PACKAGE_LIBDRM_NOUVEAU
 	bool "nouveau"
 	depends on BR2_i386 || BR2_x86_64
 	help
-	  install Nvidia graphics driver
+	  Install NVIDIA graphics driver.
 
 config BR2_PACKAGE_LIBDRM_VMWGFX
 	bool "vmwgfx"
 	depends on BR2_i386 || BR2_x86_64
 	help
-	  installs Vmware graphics driver
+	  Installs Vmware graphics driver.
 
 config BR2_PACKAGE_LIBDRM_OMAP
 	bool "omap (experimental)"
 	depends on BR2_arm
 	help
-	  install the TI OMAP driver using an experimental API.
+	  Install the TI OMAP driver using an experimental API.
 
 config BR2_PACKAGE_LIBDRM_EXYNOS
 	bool "exynos (experimental)"
 	depends on BR2_arm
 	help
-	  installs Samsung Exynos driver using an experimental API.
+	  Install Samsung Exynos driver using an experimental API.
 
 config BR2_PACKAGE_LIBDRM_FREEDRENO
-	bool "freedreno (experimental)"
+	bool "freedreno"
+	depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be
+	help
+	  Install Qualcomm Snapdragon driver.
+
+config BR2_PACKAGE_LIBDRM_TEGRA
+	bool "tegra (experimental)"
 	depends on BR2_arm
 	help
-	  install Qualcomm Snapdragon driver using an experimental API.
+	  Install NVIDIA Tegra driver using an experimental API.
 
 endmenu
 
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 01fa8d5..8db2236 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -34,6 +34,12 @@ else
 LIBDRM_CONF_OPTS += --disable-radeon
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU),y)
+LIBDRM_CONF_OPTS += --enable-amdgpu
+else
+LIBDRM_CONF_OPTS += --disable-amdgpu
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
 LIBDRM_CONF_OPTS += --enable-nouveau
 else
@@ -59,9 +65,15 @@ LIBDRM_CONF_OPTS += --disable-exynos-experimental-api
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_FREEDRENO),y)
-LIBDRM_CONF_OPTS += --enable-freedreno-experimental-api
+LIBDRM_CONF_OPTS += --enable-freedreno
+else
+LIBDRM_CONF_OPTS += --disable-freedreno
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM_TEGRA),y)
+LIBDRM_CONF_OPTS += --enable-tegra-experimental-api
 else
-LIBDRM_CONF_OPTS += --disable-freedreno-experimental-api
+LIBDRM_CONF_OPTS += --disable-tegra-experimental-api
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-- 
2.1.4
