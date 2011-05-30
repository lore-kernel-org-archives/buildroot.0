From: Daniel Mack <zonque@gmail.com>
Date: Mon, 30 May 2011 20:16:30 +0200
Subject: [Buildroot] [PATCH 2/2] Add package attr
In-Reply-To: <1306779390-19947-1-git-send-email-zonque@gmail.com>
References: <1306779390-19947-1-git-send-email-zonque@gmail.com>
Message-ID: <1306779390-19947-3-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in      |    1 +
 package/attr/Config.in |    6 ++++++
 package/attr/attr.mk   |   25 +++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/attr/Config.in
 create mode 100644 package/attr/attr.mk

diff --git a/package/Config.in b/package/Config.in
index cefe90e..84bb761 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -484,6 +484,7 @@ endmenu
 
 menu "System tools"
 source "package/acl/Config.in"
+source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
diff --git a/package/attr/Config.in b/package/attr/Config.in
new file mode 100644
index 0000000..766c346
--- /dev/null
+++ b/package/attr/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ATTR
+	bool "attr"
+	help
+	  Commands for Manipulating Filesystem Extended Attributes
+	  See http://savannah.nongnu.org/projects/attr
+
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
new file mode 100644
index 0000000..3f76bd4
--- /dev/null
+++ b/package/attr/attr.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# attr
+#
+#############################################################
+ATTR_VERSION = 2.4.46
+ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
+ATTR_SITE = http://mirror.its.uidaho.edu/pub/savannah/attr/
+ATTR_LIBTOOL_PATCH = NO
+ATTR_INSTALL_STAGING = YES
+ATTR_INSTALL_TARGET = YES
+ATTR_CONF_OPT = --enable-gettext=no
+
+define ATTR_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/getfattr/.libs/getfattr $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -m 0755 -D $(@D)/setfattr/.libs/setfattr $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -m 0644 -D $(@D)/libattr/.libs/libattr.so* $(STAGING_DIR)/usr/lib/
+endef
+
+define ATTR_INSTALL_STAGING_CMDS
+	test -d $(STAGING_DIR)/usr/include/attr/ || mkdir $(STAGING_DIR)/usr/include/attr/
+	$(INSTALL) -m 0644 -D $(@D)/include/*.h $(STAGING_DIR)/usr/include/attr/
+endef
+
+$(eval $(call AUTOTARGETS,package,attr))
-- 
1.7.5.1
