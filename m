From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Date: Wed, 24 Oct 2012 23:58:12 +0300
Subject: [Buildroot] [PATCH] keyutils: new package
Message-ID: <1351112292-5617-1-git-send-email-jarkko.sakkinen@iki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux key management utilities

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
---
 package/Config.in            |    1 +
 package/keyutils/Config.in   |    7 +++++++
 package/keyutils/keyutils.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/keyutils/Config.in
 create mode 100644 package/keyutils/keyutils.mk

diff --git a/package/Config.in b/package/Config.in
index 1650c71..00d242d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -715,6 +715,7 @@ source "package/supervisor/Config.in"
 source "package/systemd/Config.in"
 source "package/util-linux/Config.in"
 source "package/dsp-tools/Config.in"
+source "package/keyutils/Config.in"
 endmenu
 
 menu "Text editors and viewers"
diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
new file mode 100644
index 0000000..2296e5b
--- /dev/null
+++ b/package/keyutils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KEYUTILS
+	bool "keyutils"
+	help
+	  Linux key management utilities
+
+	  http://people.redhat.com/dhowells/keyutils/
+
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
new file mode 100644
index 0000000..82b1f58
--- /dev/null
+++ b/package/keyutils/keyutils.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# keyutils
+#
+#############################################################
+
+KEYUTILS_VERSION = 1.5.5
+KEYUTILS_SITE = http://people.redhat.com/dhowells/keyutils/
+KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
+
+define KEYUTILS_BUILD_CMDS
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
+		CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define KEYUTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/keyctl $(TARGET_DIR)/bin/keyctl
+endef
+
+define KEYUTILS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/bin/keyctl
+endef
+
+define KEYUTILS_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
