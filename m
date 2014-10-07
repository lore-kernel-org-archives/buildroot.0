From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Oct 2014 00:13:13 +0200
Subject: [Buildroot] [git commit] botan: new package
Message-ID: <20141007222141.4E5D0B1161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e43da7bb32285bbd41b38a379aef77132d149df7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in       |    1 +
 package/botan/Config.in |   10 +++++++
 package/botan/botan.mk  |   62 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e773715..ea89c96 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -571,6 +571,7 @@ endmenu
 
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
index 0000000..ae0e02d
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
