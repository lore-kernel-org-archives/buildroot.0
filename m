From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 12 Jan 2021 00:17:50 +0100
Subject: [Buildroot] [git commit] package/nvidia-modprobe: new package
Message-ID: <20210111225940.73E718155E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83aaf5106e4636b970783c3ba2b725b8250fc8e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nvidia-modprobe package adds a utility and headers for probing the NVIDIA
hardware at runtime.

https://github.com/NVIDIA/nvidia-modprobe

Signed-off-by: Christian Stewart <christian@paral.in>
[Arnout:
 - use upstream Makefile instead of building directly;
 - don't install to staging;
 - remove dependency on host-pkgconf;
 - correct license to GPL-2.0;
 - remove dependency on threads and glibc;
 - add dependency on MMU.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                            |  1 +
 package/nvidia-modprobe/Config.in            |  8 ++++++++
 package/nvidia-modprobe/nvidia-modprobe.hash |  3 +++
 package/nvidia-modprobe/nvidia-modprobe.mk   | 22 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 07e923bde1..5a16814ca8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -510,6 +510,7 @@ endmenu
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
+	source "package/nvidia-modprobe/Config.in"
 	source "package/nvme/Config.in"
 	source "package/ofono/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/nvidia-modprobe/Config.in b/package/nvidia-modprobe/Config.in
new file mode 100644
index 0000000000..4e287bc7dc
--- /dev/null
+++ b/package/nvidia-modprobe/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_NVIDIA_MODPROBE
+	bool "nvidia-modprobe"
+	depends on BR2_USE_MMU # fork()
+	help
+	  nvidia-modprobe package adds a utility and headers for
+	  probing the NVIDIA hardware at runtime.
+
+	  https://github.com/NVIDIA/nvidia-modprobe
diff --git a/package/nvidia-modprobe/nvidia-modprobe.hash b/package/nvidia-modprobe/nvidia-modprobe.hash
new file mode 100644
index 0000000000..99908680f0
--- /dev/null
+++ b/package/nvidia-modprobe/nvidia-modprobe.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 396b4102d3075a2dee3024652fae206a1b38ace54b8efb1e2c20757a11ec19f1  nvidia-modprobe-450.57.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nvidia-modprobe/nvidia-modprobe.mk b/package/nvidia-modprobe/nvidia-modprobe.mk
new file mode 100644
index 0000000000..75d416b31d
--- /dev/null
+++ b/package/nvidia-modprobe/nvidia-modprobe.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nvidia-modprobe
+#
+################################################################################
+
+NVIDIA_MODPROBE_VERSION = 450.57
+NVIDIA_MODPROBE_SITE = $(call github,NVIDIA,nvidia-modprobe,$(NVIDIA_MODPROBE_VERSION))
+NVIDIA_MODPROBE_LICENSE = GPL-2.0
+NVIDIA_MODPROBE_LICENSE_FILES = COPYING
+
+define NVIDIA_MODPROBE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		OUTPUTDIR=. ./nvidia-modprobe.unstripped
+endef
+
+define NVIDIA_MODPROBE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/nvidia-modprobe.unstripped \
+		$(TARGET_DIR)/usr/bin/nvidia-modprobe
+endef
+
+$(eval $(generic-package))
