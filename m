From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 18:16:55 -0300
Subject: [Buildroot] [PATCH] whois: new package
Message-ID: <1403644615-11634-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in       |  1 +
 package/whois/Config.in |  7 +++++++
 package/whois/whois.mk  | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 package/whois/Config.in
 create mode 100644 package/whois/whois.mk

diff --git a/package/Config.in b/package/Config.in
index b839512..838e822 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1047,6 +1047,7 @@ endif
 	source "package/vtun/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/wget/Config.in"
+	source "package/whois/Config.in"
 endif
 	source "package/wireless-regdb/Config.in"
 	source "package/wireless_tools/Config.in"
diff --git a/package/whois/Config.in b/package/whois/Config.in
new file mode 100644
index 0000000..40b6590
--- /dev/null
+++ b/package/whois/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_WHOIS
+	bool "whois"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	help
+	  Improved whois client.
+
+	  http://www.linux.it/~md/software/
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
new file mode 100644
index 0000000..24f5167
--- /dev/null
+++ b/package/whois/whois.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# whois
+#
+################################################################################
+
+WHOIS_VERSION = 5.1.3
+WHOIS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/w/whois
+WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
+# busybox whois is very bad so step on it
+WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
+WHOIS_MAKE_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+WHOIS_LICENSE = GPLv2+
+WHOIS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_NEEDS_GETTEXT),y)
+WHOIS_DEPENDENCIES += gettext
+WHOIS_MAKE_OPT += LIBS="-lintl"
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+WHOIS_DEPENDENCIES += libiconv
+WHOIS_MAKE_ENV += HAVE_ICONV=1
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+WHOIS_DEPENDENCIES += libidn
+WHOIS_MAKE_ENV += HAVE_LIBIDN=1
+endif
+
+define WHOIS_BUILD_CMDS
+	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPT) -C $(@D)
+endef
+
+define WHOIS_INSTALL_TARGET_CMDS
+	$(WHOIS_MAKE_ENV) $(MAKE) BASEDIR="$(TARGET_DIR)" install -C $(@D)
+endef
+
+$(eval $(generic-package))
-- 
1.8.5.5
