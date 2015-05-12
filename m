From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 10:51:31 +0200
Subject: [Buildroot] [PATCH] package: add host-faketime
Message-ID: <1431420691-5258-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For use by packages or post-build/image scripts to fake the current time for
obnoxious programs that insists on adding a timestamp.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host          |  1 +
 package/faketime/Config.in.host |  7 +++++++
 package/faketime/faketime.mk    | 20 ++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/faketime/Config.in.host
 create mode 100644 package/faketime/faketime.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 051bc4a..1e047aa 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -7,6 +7,7 @@ menu "Host utilities"
 	source "package/dosfstools/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
+	source "package/faketime/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
diff --git a/package/faketime/Config.in.host b/package/faketime/Config.in.host
new file mode 100644
index 0000000..0ebb963
--- /dev/null
+++ b/package/faketime/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_FAKETIME
+	bool "host faketime"
+	help
+	  Faketime reports faked system time to programs without
+	  having to change the system-wide time.
+
+	  https://github.com/wolfcw/libfaketime
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
new file mode 100644
index 0000000..292fe17
--- /dev/null
+++ b/package/faketime/faketime.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libfaketime
+#
+################################################################################
+
+FAKETIME_VERSION = v0.9.6
+FAKETIME_SITE = $(call github,wolfcw,libfaketime,$(FAKETIME_VERSION))
+FAKETIME_LICENSE = GPLv2
+FAKETIME_LICENSE_FILES = COPYING
+
+define HOST_FAKETIME_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr
+endef
+
+define HOST_FAKETIME_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+endef
+
+$(eval $(host-generic-package))
-- 
2.1.4
