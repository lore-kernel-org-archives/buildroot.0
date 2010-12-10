From: heiko at zuerker.org <heiko@zuerker.org>
Date: Fri, 10 Dec 2010 15:20:28 -0600
Subject: [Buildroot] [PATCH v2] add acl and attr support for extended
	attributes and POSIX Access Control Lists
Message-ID: <2911fdf24c8da0851176d0fd2168a04e876ec3aa.1292015991.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>

In addition to providing the acl and extended attributes functionality,
these new packages satisfy newer udev versions, so you can build all extras.

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in      |    2 ++
 package/acl/Config.in  |   11 +++++++++++
 package/acl/acl.mk     |   17 +++++++++++++++++
 package/attr/Config.in |    7 +++++++
 package/attr/attr.mk   |   17 +++++++++++++++++
 5 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 package/acl/Config.in
 create mode 100644 package/acl/acl.mk
 create mode 100644 package/attr/Config.in
 create mode 100644 package/attr/attr.mk

diff --git a/package/Config.in b/package/Config.in
index 10d8918..3a0b042 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -470,6 +470,8 @@ source "package/which/Config.in"
 endmenu
 
 menu "System tools"
+source "package/acl/Config.in"
+source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 source "package/module-init-tools/Config.in"
diff --git a/package/acl/Config.in b/package/acl/Config.in
new file mode 100644
index 0000000..8ed1d20
--- /dev/null
+++ b/package/acl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ACL
+	bool "acl"
+	select BR2_PACKAGE_ATTR
+	help
+	  POSIX Access Control Lists, which are used to define more 
+	  fine-grained discretionary access rights for files and
+	  directories.
+	  This package also provides libacl.
+
+comment "acl requires attr to be built"
+        depends on !BR2_PACKAGE_ATTR
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
new file mode 100644
index 0000000..16410fe
--- /dev/null
+++ b/package/acl/acl.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# attr
+#
+#############################################################
+
+ACL_VERSION = 2.2.49
+ACL_SOURCE := acl_$(ACL_VERSION).orig.tar.gz
+ACL_SITE = http://ftp.debian.org/debian/pool/main/a/acl
+ACL_INSTALL_STAGING = YES
+ACL_DEPENDENCIES = attr
+ACL_INSTALL_STAGING = YES
+
+ACL_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr exec_prefix=$(TARGET_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib install-dev install-lib
+ACL_INSTALL_TARGET_OPT = prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install install-lib
+
+$(eval $(call AUTOTARGETS,package,acl))
diff --git a/package/attr/Config.in b/package/attr/Config.in
new file mode 100644
index 0000000..34920ed
--- /dev/null
+++ b/package/attr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ATTR
+	bool "attr"
+	help
+	  Extended attributes are name:value pairs associated permanently with
+	  files and directories, similar to the environment strings associated
+	  with a process
+	  This package also provides libattr.
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
new file mode 100644
index 0000000..2b584b1
--- /dev/null
+++ b/package/attr/attr.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# attr
+#
+#############################################################
+
+ATTR_VERSION = 2.4.44
+ATTR_SOURCE := attr_$(ATTR_VERSION).orig.tar.gz
+ATTR_SITE = http://ftp.debian.org/debian/pool/main/a/attr
+
+ATTR_INSTALL_STAGING = YES
+
+ATTR_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr exec_prefix=$(STAGING_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib install-dev install-lib
+ATTR_INSTALL_TARGET_OPT = prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install install-lib
+#install-lib
+
+$(eval $(call AUTOTARGETS,package,attr))
-- 
1.7.3.2
