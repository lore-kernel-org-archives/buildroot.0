From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Thu, 18 Sep 2014 11:27:06 +0200
Subject: [Buildroot] [PATCH 3/3] New package: c-icap-modules Additionals
	modules for c-icap server.
In-Reply-To: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1411032426-11463-4-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds c-icap-modules, additionnal modules for c-icap.

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/Config.in                        |  1 +
 package/c-icap-modules/Config.in         |  7 +++++++
 package/c-icap-modules/c-icap-modules.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/c-icap-modules/Config.in
 create mode 100644 package/c-icap-modules/c-icap-modules.mk

diff --git a/package/Config.in b/package/Config.in
index 24a0a8e..86a50ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -951,6 +951,7 @@ menu "Networking applications"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
+	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
diff --git a/package/c-icap-modules/Config.in b/package/c-icap-modules/Config.in
new file mode 100644
index 0000000..7946c17
--- /dev/null
+++ b/package/c-icap-modules/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_C_ICAP_MODULES
+        bool "c-icap-modules"
+	depends on BR2_PACKAGE_C_ICAP
+	help
+          Additionals modules for c-icap server.
+
+          http://c-icap.sourceforge.net/
\ No newline at end of file
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
new file mode 100644
index 0000000..683dd4f
--- /dev/null
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# c-icap-modules
+#
+################################################################################
+
+C_ICAP_MODULES_VERSION = 0.3.2
+C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
+C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap/
+C_ICAP_MODULES_INSTALL_STAGING = NO
+C_ICAP_MODULES_INSTALL_TARGET = YES
+C_ICAP_MODULES_CONF_OPT = --with-c-icap=$(STAGING_DIR)/usr/ --includedir=$(STAGING_DIR)/usr/include/  \
+		CPPFLAGS="-I $(STAGING_DIR)/usr/include/ -I $(STAGING_DIR)/usr/include/c_icap/" \
+		CFLAGS="$(CFLAGS) -I $(STAGING_DIR)/usr/include/ -I $(STAGING_DIR)/usr/include/c_icap/"
+C_ICAP_MODULES_DEPENDENCIES = c-icap
+
+define C_ICAP_MODULES_REMOVE_BROKEN_INCLUDE_PATH
+	$(SED) "s#-I/usr/include -I/usr/include/c_icap###" $(C_ICAP_MODULES_DIR)/Makefile
+	$(SED) "s#-I/usr/include -I/usr/include/c_icap###" $(C_ICAP_MODULES_DIR)/services/Makefile
+	$(SED) "s#-I/usr/include -I/usr/include/c_icap###" $(C_ICAP_MODULES_DIR)/services/url_check/Makefile
+	$(SED) "s#-I/usr/include -I/usr/include/c_icap###" $(C_ICAP_MODULES_DIR)/services/virus_scan/Makefile	
+endef
+
+
+C_ICAP_MODULES_POST_CONFIGURE_HOOKS = C_ICAP_MODULES_REMOVE_BROKEN_INCLUDE_PATH
+
+$(eval $(autotools-package))
\ No newline at end of file
-- 
1.8.4.5
