From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 May 2012 22:31:35 +0200
Subject: [Buildroot] [git commit branch/next] omap-u-boot-utils: add new
	host package
Message-ID: <20120519205424.4AE4A96D48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=761dc51bdb39963c0b99bb78ce9733762b42c5d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host                         |    1 +
 package/omap-u-boot-utils/Config.in.host       |    8 ++++++++
 package/omap-u-boot-utils/omap-u-boot-utils.mk |   21 +++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 861b736..9fcfede 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 source "package/lpc3250loader/Config.in.host"
+source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/uboot-tools/Config.in.host"
diff --git a/package/omap-u-boot-utils/Config.in.host b/package/omap-u-boot-utils/Config.in.host
new file mode 100644
index 0000000..63fbdf5
--- /dev/null
+++ b/package/omap-u-boot-utils/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
+	bool "host omap-u-boot-utils"
+	help
+	  U-Boot Utilities for Texas Instrument's OMAP platforms.
+	  This is a set of tools to control U-Boot from scripts, generate
+	  OMAP-specific signed image files and more.
+
+	  https://github.com/nmenon/omap-u-boot-utils
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
new file mode 100644
index 0000000..e2da9a1
--- /dev/null
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# omap-u-boot-utils
+#
+#############################################################
+
+OMAP_U_BOOT_UTILS_VERSION = 8aff852322
+OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils.git
+OMAP_U_BOOT_UTILS_SITE_METHOD = git
+
+define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define HOST_OMAP_U_BOOT_UTILS_INSTALL_CMDS
+	for f in gpsign pserial tagger ucmd ukermit ; do \
+		install -m 755 -D $(@D)/$$f $(HOST_DIR)/usr/bin/$$f ; \
+	done
+endef
+
+$(eval $(call GENTARGETS,host))
