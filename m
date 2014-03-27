From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Thu, 27 Mar 2014 08:39:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] dbus-triggerd: new package
Message-ID: <1395905999-25181-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dbus-triggerd is a little daemon that can monitor dbus events, match
them against some watch-expressions, then trigger shell-commands.

It can be used in any situation where dbus-interaction is needed, and
shell script is preferred over other languages.

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
v2:
 - Cross-compile patch has been accepted upstream: bump package to last
   revision and remove patch
 - Makefile:
   - Add host-pkgconf dependency
   - Use TARGET_CONFIGURE_OPTS in build command
 - Config (based on dbus-cpp):
   - Add dbus dependencies
   - Add comment if toolchain dependency is not met
---
 package/Config.in                      |  1 +
 package/dbus-triggerd/Config.in        | 15 +++++++++++++++
 package/dbus-triggerd/dbus-triggerd.mk | 20 ++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/dbus-triggerd/Config.in
 create mode 100644 package/dbus-triggerd/dbus-triggerd.mk

diff --git a/package/Config.in b/package/Config.in
index cfa53d3..fa24b57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -272,6 +272,7 @@ source "package/dbus/Config.in"
 source "package/dbus-cpp/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
+source "package/dbus-triggerd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/devmem2/Config.in"
 endif
diff --git a/package/dbus-triggerd/Config.in b/package/dbus-triggerd/Config.in
new file mode 100644
index 0000000..a39f911
--- /dev/null
+++ b/package/dbus-triggerd/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_DBUS_TRIGGERD
+	bool "dbus-triggerd"
+	depends on BR2_USE_MMU # fork(), dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_DBUS
+	help
+	  dbus-triggerd is a tool to trigger shell-commands upon receiving
+	  a given dbus-signal.
+
+	  http://gareus.org/oss/dbustriggerd/start
+
+comment "dbus-triggerd needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_DBUS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus-triggerd/dbus-triggerd.mk b/package/dbus-triggerd/dbus-triggerd.mk
new file mode 100644
index 0000000..2c6e551
--- /dev/null
+++ b/package/dbus-triggerd/dbus-triggerd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# dbus-triggerd
+#
+################################################################################
+
+DBUS_TRIGGERD_VERSION = ba3dbec805cb707c94c54de21666bf18b79bcc09
+DBUS_TRIGGERD_SITE = git://rg42.org/dbustriggerd.git
+DBUS_TRIGGERD_LICENSE = GPLv2+
+DBUS_TRIGGERD_DEPENDENCIES = host-pkgconf dbus
+
+define DBUS_TRIGGERD_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+endef
+
+define DBUS_TRIGGERD_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.0
