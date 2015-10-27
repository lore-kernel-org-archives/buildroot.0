From: Viacheslav Volkov <sv99@inbox.ru>
Date: Tue, 27 Oct 2015 17:55:11 +0300
Subject: [Buildroot] [PATCH v3] rfkill: new package
Message-ID: <1445957711-10417-1-git-send-email-sv99@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add rfkill package.

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
---
Changes v2 -> v3:
  - wrapp comment to 72 characters length  (suggested by Vincent.Riera at imgtec.com)

Changes v1 -> v2:
  - correct Config.in  (suggested by Vincent.Riera at imgtec.com)
  - correct rfkill.mk

 package/Config.in          |  1 +
 package/rfkill/Config.in   |  7 +++++++
 package/rfkill/rfkill.hash |  2 ++
 package/rfkill/rfkill.mk   | 20 ++++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/rfkill/Config.in
 create mode 100644 package/rfkill/rfkill.hash
 create mode 100644 package/rfkill/rfkill.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..9933514 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -403,6 +403,7 @@ endif
 	source "package/pps-tools/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/read-edid/Config.in"
+	source "package/rfkill/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rtl8188eu/Config.in"
diff --git a/package/rfkill/Config.in b/package/rfkill/Config.in
new file mode 100644
index 0000000..3cb7c18
--- /dev/null
+++ b/package/rfkill/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RFKILL
+	bool "rfkill"
+	help
+	  rfkill is a small userspace tool to query the state of the 
+	  rfkill switches.
+
+	  https://wireless.wiki.kernel.org/en/users/documentation/rfkill/
diff --git a/package/rfkill/rfkill.hash b/package/rfkill/rfkill.hash
new file mode 100644
index 0000000..21be0a2
--- /dev/null
+++ b/package/rfkill/rfkill.hash
@@ -0,0 +1,2 @@
+# From: https://www.kernel.org/pub/software/network/rfkill/sha256sums.asc
+sha256	e0ae3004215e39a6c5c36e0726558740728d16f67ebdb8bea621250f6091d86a  rfkill-0.5.tar.xz
diff --git a/package/rfkill/rfkill.mk b/package/rfkill/rfkill.mk
new file mode 100644
index 0000000..b377c03
--- /dev/null
+++ b/package/rfkill/rfkill.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# rfkill
+#
+################################################################################
+
+RFKILL_VERSION = 0.5
+RFKILL_SOURCE = rfkill-$(RFKILL_VERSION).tar.xz
+RFKILL_SITE = https://www.kernel.org/pub/software/network/rfkill
+
+define RFKILL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		VERSION_SUFFIX="-br"
+endef
+
+define RFKILL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/rfkill $(TARGET_DIR)/usr/bin/rfkill
+endef
+
+$(eval $(generic-package))
-- 
2.6.1
