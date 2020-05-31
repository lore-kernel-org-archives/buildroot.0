From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 22:36:03 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-pycrypto:
 remove package
Message-ID: <20200531204023.4493C85EFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2b80cd2969339f642bb879c4259029e932d2fd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This package doesn't work with Python 3.8 since the code contains
time.clock() that was deprecated in Python 3.3 and removed in Python 3.8.

Instead of applying non upstream patches from Fedora [1], python-pycrypto
was replaced by python-pycryptodomex for crda and optee-os package.
Now we can remove safely this package.

[1] http://lists.busybox.net/pipermail/buildroot/2020-April/280683.html

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144209

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ef76ed32fcd447391e26d33a555ff5dab6dc48e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |  7 ++++
 package/Config.in                                  |  1 -
 .../0001-remove-incorrect-header-path.patch        | 21 ----------
 package/python-pycrypto/Config.in                  |  8 ----
 package/python-pycrypto/python-pycrypto.hash       |  7 ----
 package/python-pycrypto/python-pycrypto.mk         | 49 ----------------------
 6 files changed, 7 insertions(+), 86 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b925e563d3..e04853aea4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_PYTHON_PYCRYPTO
+	bool "python-pycrypto package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed, use python-pycryptodomex
+	  instead.
+
 config BR2_PACKAGE_JAMVM
 	bool "jamvm removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index edf7687ab7..c328d9f153 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1053,7 +1053,6 @@ menu "External python modules"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
-	source "package/python-pycrypto/Config.in"
 	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
diff --git a/package/python-pycrypto/0001-remove-incorrect-header-path.patch b/package/python-pycrypto/0001-remove-incorrect-header-path.patch
deleted file mode 100644
index 9268d311d5..0000000000
--- a/package/python-pycrypto/0001-remove-incorrect-header-path.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Do not use /usr/include for headers
-
-Using /usr/include is wrong when doing cross-compilation, so get rid
-of it, and rely on the compiler to use the appropriate default paths
-for headers.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/setup.py
-===================================================================
---- a/setup.py
-+++ b/setup.py
-@@ -370,7 +370,7 @@
-       'ext_modules': plat_ext + [
-             # _fastmath (uses GNU mp library)
-             Extension("Crypto.PublicKey._fastmath",
--                      include_dirs=['src/','/usr/include/'],
-+                      include_dirs=['src/'],
-                       libraries=['gmp'],
-                       sources=["src/_fastmath.c"]),
- 
diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
deleted file mode 100644
index e998ecf89c..0000000000
--- a/package/python-pycrypto/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYCRYPTO
-	bool "python-pycrypto"
-	select BR2_PACKAGE_GMP
-	help
-	  PyCrypto is a collection of cryptographic algorithms and
-	  protocols, implemented for use from Python.
-
-	  http://www.pycrypto.org/
diff --git a/package/python-pycrypto/python-pycrypto.hash b/package/python-pycrypto/python-pycrypto.hash
deleted file mode 100644
index a16a446084..0000000000
--- a/package/python-pycrypto/python-pycrypto.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c  pycrypto-2.6.1.tar.gz
-# Locally computed
-sha256  15925a98d05c6d086c30943e4eacdbd361bcf76daa109b6e6dfc9d0c4ad9ed64  COPYRIGHT
-sha256  10c41e1aaf84bd3546d1ff7ef89454817744fd2c18cdd80a137e802095448016  LEGAL/copy/LICENSE.libtom
-sha256  253a271c681cd4b3f9503659fe754ee305efe68ebb6e8733b7f436d73845a32c  LEGAL/copy/LICENSE.python-2.2
-sha256  96f9a25274a59843715a26986e4a2427c312a1d86b9207f26fcafcea47a417fe  LEGAL/copy/LICENSE.original
diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
deleted file mode 100644
index 927ba918ae..0000000000
--- a/package/python-pycrypto/python-pycrypto.mk
+++ /dev/null
@@ -1,49 +0,0 @@
-################################################################################
-#
-# python-pycrypto
-#
-################################################################################
-
-PYTHON_PYCRYPTO_VERSION = 2.6.1
-PYTHON_PYCRYPTO_SOURCE = pycrypto-$(PYTHON_PYCRYPTO_VERSION).tar.gz
-PYTHON_PYCRYPTO_SITE = http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto
-PYTHON_PYCRYPTO_SETUP_TYPE = distutils
-
-PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License (HMAC.py, setup.py)
-PYTHON_PYCRYPTO_LICENSE_FILES = \
-	COPYRIGHT LEGAL/copy/LICENSE.libtom \
-	LEGAL/copy/LICENSE.python-2.2
-
-# The pycrypto package contains a LICENSE.orig file, but our patching
-# infrastrucure removes all .orig file, so we must rename that license
-# file prior to patching, so it is still available to the legal-info
-# infrastructure
-define PYTHON_PYCRYPTO_RENAME_LICENSE
-	mv $(@D)/LEGAL/copy/LICENSE.orig $(@D)/LEGAL/copy/LICENSE.original
-endef
-PYTHON_PYCRYPTO_POST_EXTRACT_HOOKS += PYTHON_PYCRYPTO_RENAME_LICENSE
-HOST_PYTHON_PYCRYPTO_POST_EXTRACT_HOOKS += PYTHON_PYCRYPTO_RENAME_LICENSE
-PYTHON_PYCRYPTO_LICENSE_FILES += LEGAL/copy/LICENSE.original
-
-PYTHON_PYCRYPTO_DEPENDENCIES = gmp
-HOST_PYTHON_PYCRYPTO_DEPENDENCIES = host-gmp
-
-# The configure step needs to be run outside of the setup.py since it isn't
-# run correctly for cross-compiling
-define PYTHON_PYCRYPTO_CONFIGURE_CMDS
-	(cd $(@D) && \
-	$(TARGET_CONFIGURE_OPTS) \
-	$(TARGET_CONFIGURE_ARGS) \
-	./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--sysconfdir=/etc \
-		--program-prefix="" \
-	)
-endef
-
-$(eval $(python-package))
-$(eval $(host-python-package))
