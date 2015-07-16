From: Ed Swierk <eswierk@skyportsystems.com>
Date: Thu, 16 Jul 2015 13:59:35 -0700
Subject: [Buildroot] [PATCH] Add xxhash package
Message-ID: <1437080375-96542-1-git-send-email-eswierk@skyportsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"xxHash is an extremely fast hash algorithm, running at RAM
speed limits."

Signed-off-by: Ed Swierk <eswierk@skyportsystems.com>
---
 package/Config.in        |  1 +
 package/xxhash/Config.in |  7 +++++++
 package/xxhash/xxhash.mk | 19 +++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/xxhash/Config.in
 create mode 100644 package/xxhash/xxhash.mk

diff --git a/package/Config.in b/package/Config.in
index 86a53c8..916ff47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1395,6 +1395,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/which/Config.in"
 endif
 	source "package/xmlstarlet/Config.in"
+	source "package/xxhash/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/xxhash/Config.in b/package/xxhash/Config.in
new file mode 100644
index 0000000..6720225
--- /dev/null
+++ b/package/xxhash/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XXHASH
+	bool "xxhash"
+	help
+	  xxHash is an extremely fast hash algorithm, running at RAM
+	  speed limits.
+	  
+	  https://github.com/Cyan4973/xxHash
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
new file mode 100644
index 0000000..ba680ba
--- /dev/null
+++ b/package/xxhash/xxhash.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# xxhash
+#
+################################################################################
+
+XXHASH_VERSION = r40
+XXHASH_SITE = $(call github,Cyan4973,xxHash,$(XXHASH_VERSION))
+XXHASH_LICENSE = Free
+
+define XXHASH_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) xxhsum
+endef
+
+define XXHASH_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/xxhsum $(TARGET_DIR)/usr/bin/xxhsum
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
