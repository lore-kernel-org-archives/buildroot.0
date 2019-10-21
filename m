From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 23:22:52 +0200
Subject: [Buildroot] [git commit] package/libolm: new package
Message-ID: <20191021212132.B84DD83AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba3b97e3cb2b0e6d9699630efd8fd9300f8589cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libolm is an implementation of the Double Ratchet cryptographic ratchet
described by:
https://whispersystems.org/docs/specifications/doubleratchet/

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libolm/Config.in   | 12 ++++++++++++
 package/libolm/libolm.hash |  3 +++
 package/libolm/libolm.mk   | 16 ++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cda6cc5da3..199c59d429 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -968,6 +968,7 @@ F:	package/fdk-aac/
 F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
+F:	package/libolm/
 F:	package/ocrad/
 F:	package/restclient-cpp/
 F:	package/tesseract-ocr/
diff --git a/package/Config.in b/package/Config.in
index e941896ea2..f5af43081d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1245,6 +1245,7 @@ menu "Crypto"
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
index 0000000000..78ee05b3c2
--- /dev/null
+++ b/package/libolm/libolm.mk
@@ -0,0 +1,16 @@
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
+$(eval $(cmake-package))
