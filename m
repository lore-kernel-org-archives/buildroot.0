From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 15:02:54 +0200
Subject: [Buildroot] [git commit] New package: attr
Message-ID: <20110713130342.9BC6F8A593@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=691a5ead68deb5c77442f7a88ede479e57a9758c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commands for Manipulating Filesystem Extended Attributes.

[Peter: needs largefile]
Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/attr/Config.in |   11 +++++++++++
 package/attr/attr.mk   |   27 +++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/attr/Config.in
 create mode 100644 package/attr/attr.mk

diff --git a/package/Config.in b/package/Config.in
index d073a1b..069d8bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -495,6 +495,7 @@ source "package/xmlstarlet/Config.in"
 endmenu
 
 menu "System tools"
+source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
diff --git a/package/attr/Config.in b/package/attr/Config.in
new file mode 100644
index 0000000..79f2336
--- /dev/null
+++ b/package/attr/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ATTR
+	bool "attr"
+	depends on BR2_LARGEFILE
+	help
+	  Commands for Manipulating Filesystem Extended Attributes.
+	  This package also provides libattr.
+
+	  http://savannah.nongnu.org/projects/attr
+
+comment "attr requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
new file mode 100644
index 0000000..b744ef6
--- /dev/null
+++ b/package/attr/attr.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# attr
+#
+#############################################################
+
+ATTR_VERSION = 2.4.46
+ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
+ATTR_SITE = http://download.savannah.gnu.org/releases/attr
+ATTR_INSTALL_STAGING = YES
+ATTR_CONF_OPT = --enable-gettext=no
+
+# While the configuration system uses autoconf, the Makefiles are
+# hand-written and do not use automake. Therefore, we have to hack
+# around their deficiencies by passing installation paths.
+ATTR_INSTALL_STAGING_OPT = 			\
+	prefix=$(STAGING_DIR)/usr 		\
+	exec_prefix=$(STAGING_DIR)/usr 		\
+	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib 	\
+	install-dev install-lib
+
+ATTR_INSTALL_TARGET_OPT = 			\
+	prefix=$(TARGET_DIR)/usr 		\
+	exec_prefix=$(TARGET_DIR)/usr 		\
+	install install-lib
+
+$(eval $(call AUTOTARGETS,package,attr))
-- 
1.7.3.4
