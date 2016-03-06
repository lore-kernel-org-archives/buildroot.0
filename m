From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 16:12:03 +0100
Subject: [Buildroot] [git commit] procrank_linux: new package
Message-ID: <20160306151327.00FDC802FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3c486d3e85d0e7d3ec4e104b1a85006e87e404b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
[Thomas: add hash file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  3 +++
 package/procrank_linux/Config.in           |  7 +++++++
 package/procrank_linux/procrank_linux.hash |  2 ++
 package/procrank_linux/procrank_linux.mk   | 21 +++++++++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f02be44..12cf5d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1625,6 +1625,9 @@ endif
 	source "package/powerpc-utils/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/procps-ng/Config.in"
+endif
+	source "package/procrank_linux/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/psmisc/Config.in"
 endif
 	source "package/pwgen/Config.in"
diff --git a/package/procrank_linux/Config.in b/package/procrank_linux/Config.in
new file mode 100644
index 0000000..59d462b
--- /dev/null
+++ b/package/procrank_linux/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PROCRANK_LINUX
+	bool "procrank_linux"
+	help
+	  procrank is a tool commonly used by Android platform
+	  developers to find out how much memory is really being used.
+
+	  https://github.com/csimmonds/procrank_linux
diff --git a/package/procrank_linux/procrank_linux.hash b/package/procrank_linux/procrank_linux.hash
new file mode 100644
index 0000000..b28a8e3
--- /dev/null
+++ b/package/procrank_linux/procrank_linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1c3592b549b6793b29ab561568f493d0edbfe288ea2aed59afa689eaa26b5d9e procrank_linux-21c30ab4514a5b15ac6e813e21bee0d3d714cb08.tar.gz
diff --git a/package/procrank_linux/procrank_linux.mk b/package/procrank_linux/procrank_linux.mk
new file mode 100644
index 0000000..7e74319
--- /dev/null
+++ b/package/procrank_linux/procrank_linux.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# procrank_linux
+#
+################################################################################
+
+PROCRANK_LINUX_VERSION = 21c30ab4514a5b15ac6e813e21bee0d3d714cb08
+PROCRANK_LINUX_SITE = $(call github,csimmonds,procrank_linux,$(PROCRANK_LINUX_VERSION))
+PROCRANK_LINUX_LICENSE = Apache-2.0
+PROCRANK_LINUX_LICENSE_FILES = NOTICE
+
+define PROCRANK_LINUX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)"
+endef
+
+define PROCRANK_LINUX_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/procrank \
+		$(TARGET_DIR)/usr/bin/procrank
+endef
+
+$(eval $(generic-package))
