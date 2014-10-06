From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 6 Oct 2014 12:21:47 +0100
Subject: [Buildroot] [PATCH] package/trinity: New package
Message-ID: <1412594507-48779-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding the Trinity Linux System call fuzz tester.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Config.in          |    1 +
 package/trinity/Config.in  |    6 ++++++
 package/trinity/trinity.mk |   31 +++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/trinity/Config.in
 create mode 100644 package/trinity/trinity.mk

diff --git a/package/Config.in b/package/Config.in
index 1021d4c..45ff5f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -88,6 +88,7 @@ endif
 	source "package/sysprof/Config.in"
 	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
+	source "package/trinity/Config.in"
 	source "package/valgrind/Config.in"
 	source "package/whetstone/Config.in"
 endmenu
diff --git a/package/trinity/Config.in b/package/trinity/Config.in
new file mode 100644
index 0000000..de9c467
--- /dev/null
+++ b/package/trinity/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TRINITY
+	bool "trinity"
+	help
+	  A Linux System call fuzz tester
+
+	  http://codemonkey.org.uk/projects/trinity/
diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
new file mode 100644
index 0000000..1e6c54a
--- /dev/null
+++ b/package/trinity/trinity.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# trinity
+#
+################################################################################
+
+TRINITY_VERSION = c02034ec08d951cde3429905e64afe450cbc47db
+TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
+TRINITY_LICENSE = GPLv2
+TRINITY_LICENSE_FILES = COPYING
+
+define TRINITY_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.sh)
+endef
+
+define TRINITY_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define TRINITY_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
+endef
+
+# Install helper scripts
+define TRINITY_INSTALL_HELPER_SCRIPTS
+	mkdir -p $(TARGET_DIR)/usr/libexec/trinity
+	cp -p $(@D)/scripts/* $(TARGET_DIR)/usr/libexec/trinity/
+endef
+TRINITY_POST_INSTALL_TARGET_HOOKS += TRINITY_INSTALL_HELPER_SCRIPTS
+
+$(eval $(generic-package))
-- 
1.7.1
