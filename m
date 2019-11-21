From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Thu, 21 Nov 2019 09:12:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/libargon2: new package
Message-ID: <20191121081223.2883-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/Config.in                                  |  1 +
 ...1-libargon2-dont-fail-on-existing-symlink.patch | 23 +++++++++++++++++
 package/libargon2/Config.in                        |  8 ++++++
 package/libargon2/libargon2.hash                   |  3 +++
 package/libargon2/libargon2.mk                     | 29 ++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch
 create mode 100644 package/libargon2/Config.in
 create mode 100644 package/libargon2/libargon2.hash
 create mode 100644 package/libargon2/libargon2.mk

diff --git a/package/Config.in b/package/Config.in
index c2b48a6..37dec3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1262,6 +1262,7 @@ menu "Crypto"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
+	source "package/libargon2/Config.in"
 	source "package/libsodium/Config.in"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
diff --git a/package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch b/package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch
new file mode 100644
index 0000000..43a6deb
--- /dev/null
+++ b/package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch
@@ -0,0 +1,23 @@
+From b997b9e7d4744020409223afddc7299a771eb52d Mon Sep 17 00:00:00 2001
+From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
+Date: Thu, 7 Nov 2019 09:55:32 +0100
+Subject: [PATCH] Don't fail on existing symlink
+
+Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 837e7f7..7c116c9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -238,7 +238,7 @@ install: $(RUN) libs
+ 	$(INSTALL) -d $(INST_LIBRARY)
+ 	$(INSTALL) -m 0644 $(LIBRARIES) $(INST_LIBRARY)
+ ifdef LINKED_LIB_SH
+-	cd $(INST_LIBRARY) && ln -s $(notdir $(LIB_SH) $(LINKED_LIB_SH))
++	cd $(INST_LIBRARY) && ln -sf $(notdir $(LIB_SH) $(LINKED_LIB_SH))
+ endif
+ 	$(INSTALL) -d $(INST_BINARY)
+ 	$(INSTALL) $(RUN) $(INST_BINARY)
diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
new file mode 100644
index 0000000..aea861a
--- /dev/null
+++ b/package/libargon2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBARGON2
+	bool "libargon2"
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	help
+	  A modern password hashing algorithm
+
+	  https://password-hashing.net/#argon2
diff --git a/package/libargon2/libargon2.hash b/package/libargon2/libargon2.hash
new file mode 100644
index 0000000..c524b42
--- /dev/null
+++ b/package/libargon2/libargon2.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 eaea0172c1f4ee4550d1b6c9ce01aab8d1ab66b4207776aa67991eb5872fdcd8  libargon2-20171227.tar.gz
+sha256 220f8736a89ff51c92ef3d497f413b48e6cf1df3d6278bc909c6308c78e1718e  LICENSE
diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
new file mode 100644
index 0000000..db87d15
--- /dev/null
+++ b/package/libargon2/libargon2.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# libargon2
+#
+################################################################################
+
+LIBARGON2_VERSION = 20171227		# 20190702 is not recognized by php7.3
+LIBARGON2_SITE = $(call github,P-H-C,phc-winner-argon2,$(LIBARGON2_VERSION))
+LIBARGON2_LICENSE = CC0
+LIBARGON2_LICENSE_FILES = LICENSE
+LIBARGON2_INSTALL_STAGING = YES
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+LIBARGON2_OPTS += NO_THREADS=1
+endif
+
+define LIBARGON2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) OPTTARGET=$(GCC_TARGET_ARCH) $(LIBARGON2_OPTS)
+endef
+
+define LIBARGON2_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBARGON2_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
