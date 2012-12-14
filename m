From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Dec 2012 00:58:02 +0100
Subject: [Buildroot] [git commit] package: add flashbench
Message-ID: <20121214235801.B5C489A217@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=018a49a507fb9354b10ff7afd39e9fe2603cab4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/flashbench/Config.in     |   14 ++++++++++++++
 package/flashbench/flashbench.mk |   22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dbb6704..7607e97 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -182,6 +182,7 @@ source "package/cifs-utils/Config.in"
 source "package/cramfs/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
+source "package/flashbench/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
 source "package/makedevs/Config.in"
diff --git a/package/flashbench/Config.in b/package/flashbench/Config.in
new file mode 100644
index 0000000..39cdb1d
--- /dev/null
+++ b/package/flashbench/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FLASHBENCH
+	bool "flashbench"
+	depends on BR2_LARGEFILE
+	help
+	  Flashbench - Identify characteristics of flash media.
+
+	  This is the tool used to identify the properties of
+	  SD cards and other media for the Linaro flash memory
+	  survey.
+
+	  https://wiki.linaro.org/WorkingGroups/KernelConsolidation/Projects/FlashCardSurvey
+
+comment "flashbench requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
new file mode 100644
index 0000000..ead1346
--- /dev/null
+++ b/package/flashbench/flashbench.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# flashbench
+#
+#############################################################
+
+FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
+FLASHBENCH_SITE = git://git.linaro.org/people/arnd/flashbench.git
+FLASHBENCH_LICENSE = GPLv2
+FLASHBENCH_LICENSE_FILES = COPYING
+
+define FLASHBENCH_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		LDFLAGS="$(TARGET_LDFLAGS) -lrt"
+endef
+
+define FLASHBENCH_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/flashbench $(TARGET_DIR)/usr/bin/flashbench
+	$(INSTALL) -m 755 -D $(@D)/erase $(TARGET_DIR)/usr/bin/erase
+endef
+
+$(eval $(generic-package))
