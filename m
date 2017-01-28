From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 23:21:30 +1300
Subject: [Buildroot] [git commit] package/cbootimage: enable target variant
Message-ID: <20170128102305.31D5581E65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9edac7ec45958ebd22f156f7ca859e1dbf0673a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allow bootloader modification online on Tegra-targets

Signed-off-by: Misha Komarovskiy <zombah@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                | 1 +
 package/cbootimage/Config.in     | 9 +++++++++
 package/cbootimage/cbootimage.mk | 2 ++
 package/jsmn/jsmn.mk             | 4 ++--
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6ce19df..796ad33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -353,6 +353,7 @@ endmenu
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
+	source "package/cbootimage/Config.in"
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cryptsetup/Config.in"
diff --git a/package/cbootimage/Config.in b/package/cbootimage/Config.in
new file mode 100644
index 0000000..1a7fef0
--- /dev/null
+++ b/package/cbootimage/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CBOOTIMAGE
+	bool "cbootimage"
+	depends on BR2_arm || BR2_armeb
+	help
+	  This project provides a tool which compiles BCT (Boot
+	  Configuration Table) images to place into the boot flash of
+	  a Tegra-based device.
+
+	  https://github.com/NVIDIA/cbootimage
diff --git a/package/cbootimage/cbootimage.mk b/package/cbootimage/cbootimage.mk
index 20b17dd..1b5672d 100644
--- a/package/cbootimage/cbootimage.mk
+++ b/package/cbootimage/cbootimage.mk
@@ -10,4 +10,6 @@ CBOOTIMAGE_LICENSE = GPLv2
 CBOOTIMAGE_LICENSE_FILES = COPYING
 CBOOTIMAGE_AUTORECONF = YES
 
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
diff --git a/package/jsmn/jsmn.mk b/package/jsmn/jsmn.mk
index 30dd9c8..c98f279 100644
--- a/package/jsmn/jsmn.mk
+++ b/package/jsmn/jsmn.mk
@@ -17,8 +17,8 @@ define JSMN_BUILD_CMDS
 endef
 
 define JSMN_INSTALL_STAGING_CMDS
-	$(INSTALL) -m 0644 $(@D)/libjsmn.a $(STAGING_DIR)/usr/lib/libjsmn.a
-	$(INSTALL) -m 0644 $(@D)/jsmn.h $(STAGING_DIR)/usr/include/jsmn.h
+	$(INSTALL) -D -m 0644 $(@D)/libjsmn.a $(STAGING_DIR)/usr/lib/libjsmn.a
+	$(INSTALL) -D -m 0644 $(@D)/jsmn.h $(STAGING_DIR)/usr/include/jsmn.h
 endef
 
 $(eval $(generic-package))
