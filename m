From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:56:37 +0100
Subject: [Buildroot] [git commit] libscrypt: New package
Message-ID: <20170312225655.45F7582248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62a7b862eb82c627d9d0a6e0e1a8bab79bd0b425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
[Thomas:
 - Add entry to DEVELOPERS file for the new package
 - Add dependency on !BR2_STATIC_LIBS, because the Makefile
   unconditionally builds a shared library
 - Use the "github" helper function to define <pkg>_SITE, get rid of
   <pkg>_SOURCE.
 - License is BSD-2c, not just BSD.
 - Add <pkg>_LICENSE_FILES variable.
 - Define LIBSCRYPT_DISABLE_STACK_PROTECTOR inside the
   BR2_TOOLCHAIN_HAS_SSP condition, and move from a
   LIBSCRYPT_POST_EXTRACT_HOOKS to a LIBSCRYPT_POST_PATCH_HOOKS.
 - Pass $(TARGET_CONFIGURE_OPTS) instead of just passing CC.
 - Pass $(TARGET_MAKE_ENV) when calling $(MAKE).]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/libscrypt/Config.in      | 12 ++++++++++++
 package/libscrypt/libscrypt.hash |  2 ++
 package/libscrypt/libscrypt.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index afd8f38..70a5428 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1440,6 +1440,9 @@ F:	package/libtasn1/
 F:	package/proxychains-ng/
 F:	package/yasm/
 
+N:	Stefan S??rensen <stefan.sorensen@spectralink.com>
+F:	package/libscrypt/
+
 N:	Stephan Hoffmann <sho@relinux.de>
 F:	package/cache-calibrator/
 F:	package/gtest/
diff --git a/package/Config.in b/package/Config.in
index 7721727..85e4dee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -937,6 +937,7 @@ menu "Crypto"
 	source "package/libmcrypt/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
 	source "package/libsodium/Config.in"
diff --git a/package/libscrypt/Config.in b/package/libscrypt/Config.in
new file mode 100644
index 0000000..b467fd6
--- /dev/null
+++ b/package/libscrypt/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBSCRYPT
+	bool "libscrypt"
+	# Unconditionally builds a shared library
+	depends on !BR2_STATIC_LIBS
+	help
+	  This is a library that implements the secure password
+	  hashing function "scrypt".
+
+	  http://www.lolware.net/libscrypt.html
+
+comment "libscrypt needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libscrypt/libscrypt.hash b/package/libscrypt/libscrypt.hash
new file mode 100644
index 0000000..bf3f441
--- /dev/null
+++ b/package/libscrypt/libscrypt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	68e377e79745c10d489b759b970e52d819dbb80dd8ca61f8c975185df3f457d3	libscrypt-v1.21.tar.gz
diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
new file mode 100644
index 0000000..8f72d67
--- /dev/null
+++ b/package/libscrypt/libscrypt.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libscrypt
+#
+################################################################################
+
+LIBSCRYPT_VERSION = v1.21
+LIBSCRYPT_SITE = $(call github,technion,libscrypt,$(LIBSCRYPT_VERSION))
+LIBSCRYPT_LICENSE = BSD-2c
+LIBSCRYPT_LICENSE_FILES = LICENSE
+LIBSCRYPT_INSTALL_STAGING = YES
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+define LIBSCRYPT_DISABLE_STACK_PROTECTOR
+	$(SED) 's/-fstack-protector//g' $(@D)/Makefile
+endef
+LIBSCRYPT_POST_PATCH_HOOKS += LIBSCRYPT_DISABLE_STACK_PROTECTOR
+endif
+
+define LIBSCRYPT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define LIBSCRYPT_INSTALL_STAGING_CMDS
+        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr \
+		DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBSCRYPT_INSTALL_TARGET_CMDS
+        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
