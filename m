From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Wed, 12 Nov 2014 17:16:33 +0100
Subject: [Buildroot] [PATCH V2 4/4] c-icap-modules: new package
In-Reply-To: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1415808993-2394-5-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/Config.in                        |  1 +
 package/c-icap-modules/Config.in         |  7 +++++++
 package/c-icap-modules/c-icap-modules.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/c-icap-modules/Config.in
 create mode 100644 package/c-icap-modules/c-icap-modules.mk

diff --git a/package/Config.in b/package/Config.in
index fe0af07..8993814 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -984,6 +984,7 @@ menu "Networking applications"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
+	source "package/c-icap-modules/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
diff --git a/package/c-icap-modules/Config.in b/package/c-icap-modules/Config.in
new file mode 100644
index 0000000..616456b
--- /dev/null
+++ b/package/c-icap-modules/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_C_ICAP_MODULES
+	bool "c-icap-modules"
+	depends on BR2_PACKAGE_C_ICAP
+	help
+	  Additionals modules for c-icap server.
+
+	  http://c-icap.sourceforge.net/
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
new file mode 100644
index 0000000..8c3be67
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
+C_ICAP_MODULES_LICENCE = GPLv2+
+C_ICAP_MODULES_LICENCE_FILE = COPYING
+C_ICAP_MODULES_CONF_OPTS = --with-c-icap=$(STAGING_DIR)/usr/
+C_ICAP_MODULES_CONF_ENV = CFLAGS="$(CFLAGS) -I$(STAGING_DIR)/usr/include/c_icap/"
+C_ICAP_MODULES_DEPENDENCIES = c-icap
+
+# This sed hack is needed since values are obtained using c-icap-config script
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
-- 
1.8.4.5
