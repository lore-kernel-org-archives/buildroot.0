From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  6 Oct 2014 19:34:57 +0200
Subject: [Buildroot] [PATCH] botan: new package
Message-ID: <1412616897-30619-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in       |  1 +
 package/botan/Config.in | 10 ++++++++
 package/botan/botan.mk  | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 package/botan/Config.in
 create mode 100644 package/botan/botan.mk

diff --git a/package/Config.in b/package/Config.in
index 4520ba6..cb32961 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -562,6 +562,7 @@ endmenu
 
 menu "Crypto"
 	source "package/beecrypt/Config.in"
+	source "package/botan/Config.in"
 	source "package/ca-certificates/Config.in"
 	source "package/cryptodev/Config.in"
 	source "package/gnutls/Config.in"
diff --git a/package/botan/Config.in b/package/botan/Config.in
new file mode 100644
index 0000000..4911872
--- /dev/null
+++ b/package/botan/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_BOTAN
+	bool "botan"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Botan is a crypto library for C++
+
+	  http://botan.randombit.net
+
+comment "botan needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
new file mode 100644
index 0000000..8e38b03
--- /dev/null
+++ b/package/botan/botan.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# botan
+#
+################################################################################
+
+BOTAN_VERSION = 1.10.8
+BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tgz
+BOTAN_SITE = http://files.randombit.net/botan
+BOTAN_LICENSE = BSD-2c
+BOTAN_LICENSE_FILES = doc/license.txt
+
+BOTAN_INSTALL_STAGING = YES
+BOTAN_INSTALL_TARGET = YES
+
+BOTAN_CONF_OPTS = \
+	--cpu=$(BR2_ARCH) \
+	--os=linux \
+	--cc=gcc \
+	--cc-bin="$(TARGET_CXX)"
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	BOTAN_CONF_OPTS += --disable-shared
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+	BOTAN_DEPENDENCIES += bzip2
+	BOTAN_CONF_OPTS += --with-bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_GMP),y)
+	BOTAN_DEPENDENCIES += gmp
+	BOTAN_CONF_OPTS += --with-gnump
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	BOTAN_DEPENDENCIES += openssl
+	BOTAN_CONF_OPTS += --with-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	BOTAN_DEPENDENCIES += zlib
+	BOTAN_CONF_OPTS += --with-zlib
+endif
+
+define BOTAN_CONFIGURE_CMDS
+	(cd $(@D); ./configure.py $(BOTAN_CONF_OPTS))
+endef
+
+define BOTAN_BUILD_CMDS
+	$(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
+endef
+
+define BOTAN_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)/usr" install
+endef
+
+define BOTAN_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
