From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 23 Dec 2017 14:32:15 -0200
Subject: [Buildroot] [PATCH v2] wolfssl: new package
Message-ID: <1514046735-14732-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The wolfSSL embedded SSL library is a lightweight and portable
SSL/TLS library.

Tested on Beaglebone Black using a tool called testsuite that
comes with wolfssl source code inside the testsuite/ directory.
To build it, we have to pass --enable-examples in the configure,
and then manually copy the binary to the rootfs. Also, to use
this tool, you will we need to copy the certs/* directory to the
rootfs.

Build-tested with test-pkg script.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
Changes v1 -> v2:
  - bump to version 3.13.0
  - new version needs a toolchain with threads support
  - added two new menu options to enable all wolfssl features
    and SSv3 support
  - added an explanation on why we need autoreconf
  - removed options related to nginx, wpa_supplicant and lighttpd
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/wolfssl/Config.in    | 27 +++++++++++++++++++++++++++
 package/wolfssl/wolfssl.hash |  6 ++++++
 package/wolfssl/wolfssl.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 package/wolfssl/Config.in
 create mode 100644 package/wolfssl/wolfssl.hash
 create mode 100644 package/wolfssl/wolfssl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 77e3344fa4dc..54ba8ceb2a64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1541,6 +1541,7 @@ F:	package/mongodb/
 F:	package/stella/
 F:	package/tunctl/
 F:	package/ubus/
+F:	package/wolfssl/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/package/Config.in b/package/Config.in
index cb2141b8f3c8..1455ca6ddc1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1046,6 +1046,7 @@ menu "Crypto"
 	source "package/tinydtls/Config.in"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
+	source "package/wolfssl/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
new file mode 100644
index 000000000000..3c6d68f592fc
--- /dev/null
+++ b/package/wolfssl/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_WOLFSSL
+	bool "wolfssl"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The wolfSSL embedded SSL library (formerly CyaSSL) is a
+	  lightweight, portable, C-language-based SSL/TLS library
+	  targeted at IoT, embedded, and RTOS environments primarily
+	  because of its size, speed, and feature set.
+
+	  https://www.wolfssl.com/
+
+if BR2_PACKAGE_WOLFSSL
+
+config BR2_PACKAGE_WOLFSSL_ALL
+	bool "enable all features, except SSLv3"
+	help
+	  Enable all wolfSSL features, except SSL version 3.0 support.
+
+config BR2_PACKAGE_WOLFSSL_SSLV3
+	bool "enable SSLv3"
+	help
+	  Enable SSL version 3.0 support.
+
+endif
+
+comment "wolfssl needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
new file mode 100644
index 000000000000..204f2f09571d
--- /dev/null
+++ b/package/wolfssl/wolfssl.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256 3bafeb0cb7eaff80002ba3f7cbb70023757bcc35fc4d82181945b143f1f927c6  v3.13.0-stable.tar.gz
+
+# Hash for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 74adaaef40b96c71378b6daa3feb8ccd4a1bfd9b76debf3f3f29cf3a0e86c9a0  LICENSING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
new file mode 100644
index 000000000000..c8ef50a9bc6e
--- /dev/null
+++ b/package/wolfssl/wolfssl.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# wolfssl
+#
+################################################################################
+
+WOLFSSL_VERSION = 3.13.0
+WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
+WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
+
+WOLFSSL_LICENSE = GPL-2.0
+WOLFSSL_LICENSE_FILES = COPYING LICENSING
+
+WOLFSSL_DEPENDENCIES = host-pkgconf
+
+# wolfssl's source code is released without a configure
+# script, so we need autoreconf
+WOLFSSL_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
+WOLFSSL_CONF_OPTS += --enable-all
+else
+WOLFSSL_CONF_OPTS += --disable-all
+endif
+
+ifeq ($(BR2_PACKAGE_WOLFSSL_SSLV3),y)
+WOLFSSL_CONF_OPTS += --enable-sslv3
+else
+WOLFSSL_CONF_OPTS += --disable-sslv3
+endif
+
+ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+WOLFSSL_CONF_OPTS += --enable-armasm
+else
+WOLFSSL_CONF_OPTS += --disable-armasm
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
