From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 15:02:54 +0200
Subject: [Buildroot] [git commit] New package: acl
Message-ID: <20110713130342.C8D178A593@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=41d2a1477233231ae0445d5ac07320290b686b4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

POSIX Access Control Lists, which are used to define more
fine-grained discretionary access rights for files and
directories.

[Peter: needs largefile]
Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in     |    1 +
 package/acl/Config.in |   14 ++++++++++++++
 package/acl/acl.mk    |   28 ++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 package/acl/Config.in
 create mode 100644 package/acl/acl.mk

diff --git a/package/Config.in b/package/Config.in
index 069d8bb..2fa9ff5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -495,6 +495,7 @@ source "package/xmlstarlet/Config.in"
 endmenu
 
 menu "System tools"
+source "package/acl/Config.in"
 source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
diff --git a/package/acl/Config.in b/package/acl/Config.in
new file mode 100644
index 0000000..f3d10d5
--- /dev/null
+++ b/package/acl/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_ACL
+	bool "acl"
+	select BR2_PACKAGE_ATTR
+	depends on BR2_LARGEFILE
+	help
+	  POSIX Access Control Lists, which are used to define more
+	  fine-grained discretionary access rights for files and
+	  directories.
+	  This package also provides libacl.
+
+	  http://savannah.nongnu.org/projects/acl
+
+comment "acl requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
new file mode 100644
index 0000000..11768f6
--- /dev/null
+++ b/package/acl/acl.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# acl
+#
+#############################################################
+
+ACL_VERSION = 2.2.51
+ACL_SOURCE = acl-$(ACL_VERSION).src.tar.gz
+ACL_SITE = http://download.savannah.gnu.org/releases/acl
+ACL_INSTALL_STAGING = YES
+ACL_DEPENDENCIES = attr
+ACL_CONF_OPT = --enable-gettext=no
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+ACL_INSTALL_STAGING_OPT = 			\
+	prefix=$(STAGING_DIR)/usr 		\
+	exec_prefix=$(STAGING_DIR)/usr 		\
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
+	install-dev install-lib
+
+ACL_INSTALL_TARGET_OPT = 			\
+	prefix=$(TARGET_DIR)/usr 		\
+	exec_prefix=$(TARGET_DIR)/usr 		\
+	install install-lib
+
+$(eval $(call AUTOTARGETS,package,acl))
-- 
1.7.3.4
