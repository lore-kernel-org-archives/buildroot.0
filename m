From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 12 Oct 2011 18:13:00 +0200
Subject: [Buildroot] [PATCH] package: add polarssl library support
Message-ID: <1318435980-27451-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 package/Config.in            |    1 +
 package/polarssl/Config.in   |    6 ++++++
 package/polarssl/polarssl.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/polarssl/Config.in
 create mode 100644 package/polarssl/polarssl.mk

diff --git a/package/Config.in b/package/Config.in
index 7dc8887..b8da8e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -257,6 +257,7 @@ source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libnss/Config.in"
 source "package/openssl/Config.in"
+source "package/polarssl/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
new file mode 100644
index 0000000..b61b447
--- /dev/null
+++ b/package/polarssl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_POLARSSL
+	bool "polarssl"
+	help
+	  PolarSSL library - Crypto and SSL made easy
+
+	  http://polarssl.org/
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
new file mode 100644
index 0000000..915c5c3
--- /dev/null
+++ b/package/polarssl/polarssl.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# polarssl
+#
+#############################################################
+POLARSSL_VERSION:=1.0.0
+POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
+POLARSSL_SITE = http://polarssl.org/code/releases/
+POLARSSL_INSTALL_STAGING = YES
+
+define POLARSSL_CONFIGURE_CMDS
+	true
+endef
+
+define POLARSSL_BUILD_CMDS
+	AR="$(TARGET_AR)" CC="$(TARGET_CC)" $(MAKE) -C $(@D)/library all
+endef
+
+define POLARSSL_INSTALL_STAGING_CMDS
+	install -d $(STAGING_DIR)/usr/include/polarssl
+	install -D -m 755 $(@D)/include/polarssl/*.h $(STAGING_DIR)/usr/include/polarssl/
+	install -D -m 644 $(@D)/library/libpolarssl.* $(STAGING_DIR)/usr/lib
+endef
+
+define POLARSSL_INSTALL_TARGET_CMDS
+	install -D -m 644 $(@D)/library/libpolarssl.* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(call AUTOTARGETS,package,polarssl))
-- 
1.7.6.3
