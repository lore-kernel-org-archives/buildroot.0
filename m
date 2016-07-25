From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 23:33:37 +0200
Subject: [Buildroot] [git commit] tinycbor: new package
Message-ID: <20160725213445.DCA4C7FFD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67f96915b14a3f316ee1850253fc7ce11982fafb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Concise Binary Object Representation (CBOR) Library

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
[Thomas:
 - use lower-case letters in the Config.in option prompt
 - remove BR2_PACKAGE_TINYCBOR_JSON2CBOR sub-option, simply rely on
   the cjson package being enabled
 - pass prefix=/usr only at install time.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/tinycbor/Config.in     |  6 ++++++
 package/tinycbor/tinycbor.hash |  2 ++
 package/tinycbor/tinycbor.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+)

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
index 0000000..41f0b5f
--- /dev/null
+++ b/package/tinycbor/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TINYCBOR
+	bool "tinycbor"
+	help
+	  Concise Binary Object Representation (CBOR) Library
+
+	  https://github.com/01org/tinycbor
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
index 0000000..0be91b7
--- /dev/null
+++ b/package/tinycbor/tinycbor.mk
@@ -0,0 +1,35 @@
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
+TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) V=1
+
+define TINYCBOR_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D)
+endef
+
+define TINYCBOR_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) prefix=/usr install
+endef
+
+define TINYCBOR_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) prefix=/usr install
+endef
+
+$(eval $(generic-package))
