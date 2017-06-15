From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 10:29:24 -0400
Subject: [Buildroot] [PATCH 1/5] libressl: new package
Message-ID: <20170615142928.31927-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    Libressl is a fork of openssl from OpenSSL in 2014.  It's goal is to
    modernize the OpenSSL codebase, improve security, and apply best practice
    development processes.

    Right now, libressl is API compatible with OpenSSL 1.0.1, but does not yet
    include all new APIs from OpenSSL 1.0.2 and later.

    The main source is libressl-portable, which "Includes the build scaffold
    and compatibility layer that builds portable LibreSSL from the OpenBSD
    source code."

    Before the build process can begin, autogen.sh must be ran manually,
    as it pulls from the upstream OpenBSD source which adds several
    directories to the source, along with several other steps necessary
    before building can begin. Setting LIBRESSL_AUTORECONF = YES fails
    with several "No such file or directory" errors as well.

    This package has been tested with the following architectures and c libraries:
    - armv4
    - aarch64
    - ppc
    - ppc64
    - ppc64le
    - x86_64
    - uClibc-ng
    - glibc 2.24
    - musl

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/Config.in              |  1 +
 package/libressl/Config.in     | 20 ++++++++++++++++++++
 package/libressl/libressl.hash |  2 ++
 package/libressl/libressl.mk   | 31 +++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/libressl/Config.in
 create mode 100644 package/libressl/libressl.hash
 create mode 100644 package/libressl/libressl.mk

diff --git a/package/Config.in b/package/Config.in
index 529bd96..1674444 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -963,6 +963,7 @@ menu "Crypto"
 	source "package/libmcrypt/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libressl/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
diff --git a/package/libressl/Config.in b/package/libressl/Config.in
new file mode 100644
index 0000000..035176a
--- /dev/null
+++ b/package/libressl/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBRESSL
+	bool "libressl"
+	help
+	  LibreSSL is a version of the TLS/crypto stack forked from
+	  OpenSSL in 2014, with goals of modernizing the codebase,
+	  improving security, and applying best practice development
+	  processes.
+
+	  http://www.libressl.org/
+
+if BR2_PACKAGE_LIBRESSL
+
+config BR2_PACKAGE_LIBRESSL_BIN
+	bool "openssl binary"
+	help
+	  Install the openssl binary and the associated helper scripts
+	  to the target file system. This is a command line tool for
+	  doing various cryptographic stuff.
+
+endif
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
new file mode 100644
index 0000000..9c478de
--- /dev/null
+++ b/package/libressl/libressl.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c	libressl-v2.5.4.tar.gz
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
new file mode 100644
index 0000000..940ca22
--- /dev/null
+++ b/package/libressl/libressl.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libressl
+#
+################################################################################
+
+LIBRESSL_VERSION = v2.5.4
+LIBRESSL_SITE = https://github.com/libressl-portable/portable.git
+LIBRESSL_SITE_METHOD = git
+LIBRESSL_LICENSE = ISC, BSD-3-Clause, OpenSSL or SSLeay
+LIBRESSL_LICENSE_FILES = COPYING
+LIBRESSL_INSTALL_STAGING = YES
+
+# autogen.sh needs to be ran manually as it pulls from the upstream
+# OpenBSD source which adds several directories to the source.
+# Setting LIBRESSL_AUTORECONF = YES fails with several
+# "No such file or directory" errors.
+define LIBRESSL_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+LIBRESSL_POST_PATCH_HOOKS += LIBRESSL_RUN_AUTOGEN
+
+ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
+define LIBRESSL_REMOVE_BIN
+	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
+endef
+LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.9.4
