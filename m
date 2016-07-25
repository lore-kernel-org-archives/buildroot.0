From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jul 2016 10:37:39 +0200
Subject: [Buildroot] [PATCH 1/1] tinycbor: new package
Message-ID: <1469435859-25918-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Concise Binary Object Representation (CBOR) Library

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in              |  1 +
 package/tinycbor/Config.in     | 20 ++++++++++++++++++++
 package/tinycbor/tinycbor.hash |  2 ++
 package/tinycbor/tinycbor.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 package/tinycbor/Config.in
 create mode 100644 package/tinycbor/tinycbor.hash
 create mode 100644 package/tinycbor/tinycbor.mk

diff --git a/package/Config.in b/package/Config.in
index 814141f..8ceeb9e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1328,6 +1328,7 @@ endif
 	source "package/qlibc/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
+	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
 endmenu
diff --git a/package/tinycbor/Config.in b/package/tinycbor/Config.in
new file mode 100644
index 0000000..edbe64a
--- /dev/null
+++ b/package/tinycbor/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_TINYCBOR
+	bool "tinyCBOR"
+	help
+	  Concise Binary Object Representation (CBOR) Library
+
+	  https://github.com/01org/tinycbor
+
+if BR2_PACKAGE_TINYCBOR
+
+config BR2_PACKAGE_TINYCBOR_JSON2CBOR
+	bool "json2cbor"
+	depends on !BR2_STATIC_LIBS # cJSON
+	select BR2_PACKAGE_CJSON
+	help
+	  The TinyCBOR library does not provide a way to convert from
+	  JSON representation back to encoded form. However, json2cbor
+	  can be used for that purpose. That tool supports the metadata
+	  format that these functions may produce.
+
+endif # BR2_PACKAGE_TINYCBOR
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
new file mode 100644
index 0000000..e60a86c
--- /dev/null
+++ b/package/tinycbor/tinycbor.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	e73a617b3a51fac103df1faab9ea037e509c1491cca29c1fd4b5083d74267597	tinycbor-v0.3.1.tar.gz
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
new file mode 100644
index 0000000..5d05a22
--- /dev/null
+++ b/package/tinycbor/tinycbor.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# tinycbor
+#
+################################################################################
+
+TINYCBOR_VERSION = v0.3.1
+TINYCBOR_SITE = $(call github,01org,tinycbor,$(TINYCBOR_VERSION))
+TINYCBOR_LICENSE = MIT
+TINYCBOR_LICENSE_FILES = LICENSE
+
+TINYCBOR_DEPENDENCIES = host-pkgconf
+TINYCBOR_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_CJSON),y)
+TINYCBOR_DEPENDENCIES += cjson
+endif
+
+TINYCBOR_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	V=1 \
+	prefix=/usr
+
+define TINYCBOR_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D)
+endef
+
+define TINYCBOR_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) install
+endef
+
+define TINYCBOR_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
