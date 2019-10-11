From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 11 Oct 2019 23:32:19 +0200
Subject: [Buildroot] [PATCH] package/sunwait: new package
Message-ID: <20191011213219.27955-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sunwait calculates sunrise or sunset times with civil, nautical,
astronomical and custom twilights.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/sunwait/Config.in    |  7 +++++++
 package/sunwait/sunwait.hash |  3 +++
 package/sunwait/sunwait.mk   | 20 ++++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/sunwait/Config.in
 create mode 100644 package/sunwait/sunwait.hash
 create mode 100644 package/sunwait/sunwait.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index eedef29088..4e8fd1abd7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -185,6 +185,7 @@ F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-web2py/
 F:	package/sshguard/
+F:	package/sunwait/
 F:	package/sysdig/
 
 N:	Anisse Astier <anisse@astier.eu>
diff --git a/package/Config.in b/package/Config.in
index 3a4b1c33bb..dbaf2ff09b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1865,6 +1865,7 @@ menu "Miscellaneous"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
 	source "package/shared-mime-info/Config.in"
+	source "package/sunwait/Config.in"
 	source "package/taskd/Config.in"
 	source "package/wine/Config.in"
 	source "package/xutil_util-macros/Config.in"
diff --git a/package/sunwait/Config.in b/package/sunwait/Config.in
new file mode 100644
index 0000000000..ea0ec171cb
--- /dev/null
+++ b/package/sunwait/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SUNWAIT
+	bool "sunwait"
+	help
+	  Sunwait calculates sunrise or sunset times with civil,
+	  nautical, astronomical and custom twilights.
+
+	  https://github.com/risacher/sunwait
diff --git a/package/sunwait/sunwait.hash b/package/sunwait/sunwait.hash
new file mode 100644
index 0000000000..8396fa27dd
--- /dev/null
+++ b/package/sunwait/sunwait.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  ef26ed05882d5286a64a37c4044f99b877cc54f58a46f0e37ca60c93398df910  sunwait-7326b53e5406c7ebd552ae6dc0fc659252a18e7f.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/sunwait/sunwait.mk b/package/sunwait/sunwait.mk
new file mode 100644
index 0000000000..4ed9338ea6
--- /dev/null
+++ b/package/sunwait/sunwait.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# sunwait
+#
+################################################################################
+
+SUNWAIT_VERSION = 7326b53e5406c7ebd552ae6dc0fc659252a18e7f
+SUNWAIT_SITE = $(call github,risacher,sunwait,$(SUNWAIT_VERSION))
+SUNWAIT_LICENSE = GPL-3.0
+SUNWAIT_LICENSE_FILES = LICENSE
+
+define SUNWAIT_BUILD_CMDS
+	$(MAKE) C=$(TARGET_CC) -C $(@D) all
+endef
+
+define SUNWAIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/sunwait $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
