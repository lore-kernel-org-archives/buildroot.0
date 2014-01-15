From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 15:00:46 +0100
Subject: [Buildroot] [git commit] mmc-utils: new package
Message-ID: <20140115140320.C4B489C4E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84179df8ae19657228583a394675a19eb96e8b8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mmc-utils provides tools to manipulate mmc device registers.

[Peter: drop uninstall, move to filesystem and flash utilities]
Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/mmc-utils/Config.in    |   10 ++++++++++
 package/mmc-utils/mmc-utils.mk |   19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 78c0e06..4611256 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -144,6 +144,7 @@ source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
 source "package/kobs-ng/Config.in"
 source "package/makedevs/Config.in"
+source "package/mmc-utils/Config.in"
 source "package/mtd/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ntfs-3g/Config.in"
diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
new file mode 100644
index 0000000..07650c8
--- /dev/null
+++ b/package/mmc-utils/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MMC_UTILS
+	bool "mmc-utils"
+	depends on BR2_LARGEFILE
+	help
+	  MMC utils
+
+	  https://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git
+
+comment "mmc-utils needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
new file mode 100644
index 0000000..372d840
--- /dev/null
+++ b/package/mmc-utils/mmc-utils.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# mmc-utils
+#
+################################################################################
+
+MMC_UTILS_VERSION = 11f2ceabc4ad3f0dd568e0ce68166e4803e0615b
+MMC_UTILS_SITE    = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
+MMC_UTILS_LICENSE = GPLv2
+
+define MMC_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define MMC_UTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/mmc $(TARGET_DIR)/usr/bin/mmc
+endef
+
+$(eval $(generic-package))
