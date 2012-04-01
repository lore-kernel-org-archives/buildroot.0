From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Sun,  1 Apr 2012 14:18:43 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v2=5D_Add_fmtools_package=2E?=
Message-ID: <1333282723-7276-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change from v1:
- use $(TARGET_CONFIGURE_OPTS) instead of setting CC and LD individually
  (thanks Baruch)

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in          |    1 +
 package/fmtools/Config.in  |    9 +++++++++
 package/fmtools/fmtools.mk |   19 +++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/fmtools/Config.in
 create mode 100644 package/fmtools/fmtools.mk

diff --git a/package/Config.in b/package/Config.in
index 68d28fa..94faf44 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -175,6 +175,7 @@ source "package/e2fsprogs/Config.in"
 source "package/eeprog/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
+source "package/fmtools/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/gdisk/Config.in"
 source "package/genext2fs/Config.in"
diff --git a/package/fmtools/Config.in b/package/fmtools/Config.in
new file mode 100644
index 0000000..41c883c
--- /dev/null
+++ b/package/fmtools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FMTOOLS
+	bool "fmtools"
+	help
+	  fmtools is a pair of simple command-line utilities for
+	  ?video4linux? radio tuner cards under Linux. It includes
+	  fm for power control, tuning, and volume and fmscan for
+	  scanning for stations.
+
+	  http://www.stanford.edu/~blp/fmtools/
diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
new file mode 100644
index 0000000..32facd6
--- /dev/null
+++ b/package/fmtools/fmtools.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# fmtools
+#
+#############################################################
+
+FMTOOLS_VERSION = 1.0.2
+FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
+
+define FMTOOLS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define FMTOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/fm $(TARGET_DIR)/usr/sbin
+	$(INSTALL) -D -m 0755 $(@D)/fmscan $(TARGET_DIR)/usr/sbin
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.5.4
