From: Rico Bachmann <bachmann@tofwerk.com>
Date: Mon, 29 Apr 2013 12:35:46 +0200
Subject: [Buildroot] [PATCH] Add package subversion
Message-ID: <1367231746-30319-1-git-send-email-bachmann@tofwerk.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
---
 package/Config.in                |    1 +
 package/subversion/Config.in     |    9 +++++++++
 package/subversion/subversion.mk |   22 ++++++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/subversion/Config.in
 create mode 100644 package/subversion/subversion.mk

diff --git a/package/Config.in b/package/Config.in
index bcd3d8d..13196e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -90,6 +90,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sed/Config.in"
 endif
 source "package/sstrip/Config.in"
+source "package/subversion/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tar/Config.in"
 endif
diff --git a/package/subversion/Config.in b/package/subversion/Config.in
new file mode 100644
index 0000000..4e5c4ae
--- /dev/null
+++ b/package/subversion/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SUBVERSION
+	bool "subversion"
+	select BR2_PACKAGE_APR_UTIL
+	# apr really needs shared library support
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  Subversion is an open source version control system
+	  
+	  http://subversion.apache.org/
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
new file mode 100644
index 0000000..7a91842
--- /dev/null
+++ b/package/subversion/subversion.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# subversion
+#
+#############################################################
+SUBVERSION_VERSION = 1.7.9
+SUBVERSION_SITE = http://archive.apache.org/dist/subversion
+SUBVERSION_DEPENDENCIES = apr apr-util expat
+SUBVERSION_CONF_OPT = \
+	--with-expat=$(STAGING_DIR)/usr:$(STAGING_DIR)/usr:expat \
+	--with-apr=$(BUILD_DIR)/apr-$(APR_VERSION) \
+	--with-apr-util=$(BUILD_DIR)/apr-util-$(APR_UTIL_VERSION)
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+SUBVERSION_CONF_OPT += \
+	--with-zlib=$(STAGING_DIR)/usr
+endif
+ifeq ($(BR2_PACKAGE_NEON),y)	
+SUBVERSION_CONF_OPT += \
+	--with-neon=$(STAGING_DIR)/usr
+endif
+
+$(eval $(autotools-package))
-- 
1.7.2.5
