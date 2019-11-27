From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 27 Nov 2019 15:17:12 +0800
Subject: [Buildroot] [PATCH v3 1/9] package/nxp: new package directory
Message-ID: <20191127071720.15623-1-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "nxp" directory is intended to contain all NXP
QorIQ (including PowerPC and LayerScape serial) related packages,
together with their download site and version info.

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
changes since v2:
1. change the sub-direcotry to "nxp".
2. add helper.mk macro to extract compressed file.

changes since v1:
no changes.
---
 package/Config.in     |  1 +
 package/nxp/Config.in |  4 ++++
 package/nxp/helper.mk | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/nxp/Config.in
 create mode 100644 package/nxp/helper.mk

diff --git a/package/Config.in b/package/Config.in
index 37861387e8..c697962ac0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -494,6 +494,7 @@ endmenu
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
+	source "package/nxp/Config.in"
 	source "package/ofono/Config.in"
 	source "package/on2-8170-modules/Config.in"
 	source "package/open2300/Config.in"
diff --git a/package/nxp/Config.in b/package/nxp/Config.in
new file mode 100644
index 0000000000..575542c7ab
--- /dev/null
+++ b/package/nxp/Config.in
@@ -0,0 +1,4 @@
+menu "NXP QorIQ libraries"
+	depends on BR2_aarch64 || BR2_arm || BR2_powerpc64 || BR2_powerpc
+
+endmenu
diff --git a/package/nxp/helper.mk b/package/nxp/helper.mk
new file mode 100644
index 0000000000..79e4236249
--- /dev/null
+++ b/package/nxp/helper.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# helper
+#
+################################################################################
+
+# Helper for self-extracting binaries distributed by NXP.
+#
+# The --force option makes sure it doesn't fail if the source
+# directory already exists. The --auto-accept skips the license check,
+# as it is not needed in Buildroot because we have legal-info. Since
+# there's a EULA in the binary file, we extract it in this macro, and
+# it should therefore be added to the LICENSE_FILES variable of
+# packages using this macro. Also, remember to set REDISTRIBUTE to
+# "NO". Indeed, this is a legal minefield: the EULA specifies that the
+# Board Support Package includes software and hardware (sic!) for
+# which a separate license is needed...
+#
+# $(1): full path to the archive file
+#
+define NXP_EXTRACT_HELPER
+	awk 'BEGIN      { start = 0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start = 1; }' \
+	    $(1) > $(@D)/EULA
+	cd $(@D) && sh $(1) --force --auto-accept
+	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
+	rmdir $(@D)/$(basename $(notdir $(1)))
+endef
+
+include $(sort $(wildcard package/nxp/*/*.mk))
-- 
2.17.1
