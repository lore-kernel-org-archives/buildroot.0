From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Oct 2019 11:30:49 +0200
Subject: [Buildroot] [PATCH] package/libolm: new package
Message-ID: <20191013093049.19448-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libolm is an implementation of the Double Ratchet cryptographic ratchet
described by:
https://whispersystems.org/docs/specifications/doubleratchet/

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libolm/Config.in   | 12 ++++++++++++
 package/libolm/libolm.hash |  3 +++
 package/libolm/libolm.mk   | 22 ++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/libolm/Config.in
 create mode 100644 package/libolm/libolm.hash
 create mode 100644 package/libolm/libolm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 76b16a78f4..5b26c1b0d1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -969,6 +969,7 @@ F:	package/fdk-aac/
 F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
+F:	package/libolm/
 F:	package/ocrad/
 F:	package/restclient-cpp/
 F:	package/tesseract-ocr/
diff --git a/package/Config.in b/package/Config.in
index faa4689548..442ec57775 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1240,6 +1240,7 @@ menu "Crypto"
 	source "package/libmcrypt/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libolm/Config.in"
 	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
diff --git a/package/libolm/Config.in b/package/libolm/Config.in
new file mode 100644
index 0000000000..a863216d5c
--- /dev/null
+++ b/package/libolm/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBOLM
+	bool "libolm"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  libolm is an implementation of the Double Ratchet
+	  cryptographic ratchet in C++
+
+	  https://gitlab.matrix.org/matrix-org/olm
+
+comment "libolm needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
new file mode 100644
index 0000000000..613dda3544
--- /dev/null
+++ b/package/libolm/libolm.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 1ca9926ce71d778fb7352d1ee77513194db8c7f49c0d69d38ac49ec3bafcea38 olm-3.1.4.tar.gz
+sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594 LICENSE
diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
new file mode 100644
index 0000000000..b72cd4285e
--- /dev/null
+++ b/package/libolm/libolm.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libolm
+#
+################################################################################
+
+LIBOLM_VERSION = 3.1.4
+LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
+LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
+LIBOLM_LICENSE = Apache-2.0
+LIBOLM_LICENSE_FILES = LICENSE
+LIBOLM_INSTALL_STAGING = YES
+
+LIBOLM_CONF_OPTS = -DOLM_TESTS=OFF
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+LIBOLM_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
+else
+LIBOLM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.17.1
