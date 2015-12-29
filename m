From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 17:03:34 +0100
Subject: [Buildroot] [git commit] mbedtls: new package
Message-ID: <20151229164030.C4769826E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b2df7ec5703093fc6e81c45834b20ab2ace95c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the mbed TLS library, formerly known as PolarSSL.
The 2.0+ version can live side-by-side with polarssl since it was
renamed, hence can be added with no conflict.

Use the Apache-2.0 license variant since it's somewhat more flexible,
the codebase is the same as the GPLv2 variant, just copyright
headers/license file changed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/mbedtls/Config.in    | 20 +++++++++++++++++++
 package/mbedtls/mbedtls.hash |  2 ++
 package/mbedtls/mbedtls.mk   | 46 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 973fae1..a34b5ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -798,6 +798,7 @@ menu "Crypto"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
 	source "package/libuecc/Config.in"
+	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
 	source "package/polarssl/Config.in"
diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
new file mode 100644
index 0000000..24f0f48
--- /dev/null
+++ b/package/mbedtls/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_MBEDTLS
+	bool "mbedtls"
+	help
+	  mbed TLS (formerly known as PolarSSL) makes it trivially easy
+	  for developers to include cryptographic and SSL/TLS
+	  capabilities in their (embedded) products, facilitating this
+	  functionality with a minimal coding footprint.
+
+	  https://tls.mbed.org/
+
+if BR2_PACKAGE_MBEDTLS
+
+config BR2_PACKAGE_MBEDTLS_PROGRAMS
+	bool "mbedtls programs"
+	depends on BR2_USE_MMU # fork()
+	help
+	  This option enables the installation and the build of
+	  mbed TLS companion programs.
+
+endif
diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
new file mode 100644
index 0000000..161dc2b
--- /dev/null
+++ b/package/mbedtls/mbedtls.hash
@@ -0,0 +1,2 @@
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.2.0-2.1.3-1.3.15-and-polarssl.1.2.18-released
+sha256	3c6d3487ab056da94450cf907afc84f026aff7880182baffe137c98e3d00fb55	mbedtls-2.2.0-apache.tgz
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
new file mode 100644
index 0000000..b1f232f
--- /dev/null
+++ b/package/mbedtls/mbedtls.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# mbedtls
+#
+################################################################################
+
+MBEDTLS_SITE = https://tls.mbed.org/code/releases
+MBEDTLS_VERSION = 2.2.0
+MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
+MBEDTLS_CONF_OPTS = \
+	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
+	-DENABLE_TESTING=OFF
+MBEDTLS_INSTALL_STAGING = YES
+MBEDTLS_LICENSE = Apache-2.0
+MBEDTLS_LICENSE_FILES = apache-2.0.txt
+
+# This is mandatory for hiawatha
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+define MBEDTLS_ENABLE_THREADING
+	$(SED) "s://#define MBEDTLS_THREADING_C:#define MBEDTLS_THREADING_C:" \
+		$(@D)/include/mbedtls/config.h
+	$(SED) "s://#define MBEDTLS_THREADING_PTHREAD:#define MBEDTLS_THREADING_PTHREAD:" \
+		$(@D)/include/mbedtls/config.h
+endef
+MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_THREADING
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+MBEDTLS_CONF_OPTS += \
+	-DUSE_SHARED_MBEDTLS_LIBRARY=OFF -DUSE_STATIC_MBEDTLS_LIBRARY=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+MBEDTLS_CONF_OPTS += \
+	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+MBEDTLS_CONF_OPTS += \
+	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=ON
+MBEDTLS_DEPENDENCIES += zlib
+else
+MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
