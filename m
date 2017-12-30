From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 21:20:35 +0100
Subject: [Buildroot] [git commit] wolfssl: new package
Message-ID: <20171230203501.ED60781493@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82eec03c592497068fb6b26d01371a353a74ec6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/wolfssl/Config.in    | 27 +++++++++++++++++++++++++++
 package/wolfssl/wolfssl.hash |  6 ++++++
 package/wolfssl/wolfssl.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 73 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0588a0c..fd6d8d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1574,6 +1574,7 @@ F:	package/stella/
 F:	package/traceroute/
 F:	package/tunctl/
 F:	package/ubus/
+F:	package/wolfssl/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/package/Config.in b/package/Config.in
index c1e52a3..be72d36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1051,6 +1051,7 @@ menu "Crypto"
 	source "package/tinydtls/Config.in"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
+	source "package/wolfssl/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
new file mode 100644
index 0000000..3c6d68f
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
index 0000000..204f2f0
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
index 0000000..c8ef50a
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
