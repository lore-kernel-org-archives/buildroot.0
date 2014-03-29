From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:53:18 +0100
Subject: [Buildroot] [git commit] dbus-triggerd: new package
Message-ID: <20140329175403.EAA389C42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7698bd2eb977d7b23f547f1d374ccb7a0a137ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dbus-triggerd is a little daemon that can monitor dbus events, match
them against some watch-expressions, then trigger shell-commands.

It can be used in any situation where dbus-interaction is needed, and
shell script is preferred over other languages.

[Thomas: also pass $(TARGET_MAKE_ENV) in the environment.]

Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/dbus-triggerd/Config.in        |   15 +++++++++++++++
 package/dbus-triggerd/dbus-triggerd.mk |   20 ++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1932353..8c2c700 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -273,6 +273,7 @@ source "package/dbus/Config.in"
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
index 0000000..48d5fb2
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
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+endef
+
+define DBUS_TRIGGERD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
