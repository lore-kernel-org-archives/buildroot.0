From: Markus Mayer <mmayer@broadcom.com>
Date: Thu,  6 Jun 2019 19:15:34 -0700
Subject: [Buildroot] [PATCH v3] package/coreutils: allow building individual
 binaries
Message-ID: <20190607021534.4657-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
so that coreutils can be built and installed as individual binaries.
It can be used if the target file system doesn't support symlinks or
symlinks are undesirable.

The approach is modelled after Busybox's similarly named configuration
option.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/coreutils/Config.in    | 18 ++++++++++++++
 package/coreutils/coreutils.mk | 45 +++++++++++++++++++++++++++++-----
 2 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 11a6019e820f..a0a84c220a48 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -19,3 +19,21 @@ comment "coreutils needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+
+if BR2_PACKAGE_COREUTILS
+
+config BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
+	bool "Individual binaries"
+	depends on !BR2_STATIC_LIBS
+	help
+	  By default (i.e. with this option disabled), coreutils is
+	  installed as a single binary (Busybox style) called
+	  /usr/bin/coreutils, and all core utilities are symbolic
+	  links to this binary.
+
+	  With this option enabled, each utility is a separate binary.
+
+comment "coreutils individual binaries need a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 8e5518f6383e..05232163a747 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -14,8 +14,13 @@ COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_AUTORECONF = YES
 COREUTILS_GETTEXTIZE = YES
 
-COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=symlinks \
+COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
+
+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),)
+COREUTILS_CONF_OPTS += --enable-single-binary=symlinks
+endif
+
 COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_chown_works=yes \
 	ac_cv_func_euidaccess=no \
@@ -59,6 +64,13 @@ COREUTILS_BIN_PROGS = base64 cat chgrp chmod chown cp date dd df dir echo false
 	kill link ln ls mkdir mknod mktemp mv nice printenv pwd rm rmdir \
 	vdir sleep stty sync touch true uname join
 
+# This is where our '[' symlink will point to.
+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),)
+TEST_BINARY = coreutils
+else
+TEST_BINARY = test
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 COREUTILS_DEPENDENCIES += acl
 else
@@ -96,13 +108,24 @@ COREUTILS_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
+# We want to move a few binaries from /usr/bin to /bin. In the case of
+# coreutils being built as multi-call binary, we do so by re-creating the
+# corresponding symlinks. If coreutils is built with individual binaries, we
+# actually move the binaries.
+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),)
 define COREUTILS_CLEANUP_BIN
-	# some things go in /bin rather than /usr/bin
 	$(foreach f,$(COREUTILS_BIN_PROGS), \
 		rm -f $(TARGET_DIR)/usr/bin/$(f) && \
 		ln -sf ../usr/bin/coreutils $(TARGET_DIR)/bin/$(f)
 	)
 endef
+else
+define COREUTILS_CLEANUP_BIN
+	$(foreach f,$(COREUTILS_BIN_PROGS), \
+                mv $(TARGET_DIR)/usr/bin/$(f) $(TARGET_DIR)/bin
+        )
+endef
+endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
 endif
 
@@ -110,14 +133,24 @@ ifeq ($(BR2_STATIC_LIBS),y)
 COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
 endif
 
-define COREUTILS_CLEANUP
+define COREUTILS_TEST_SYMLINK
 	# link for archaic shells
-	ln -fs coreutils $(TARGET_DIR)/usr/bin/[
-	# gnu thinks chroot is in bin, debian thinks it's in sbin
+	ln -fs $(TEST_BINARY) $(TARGET_DIR)/usr/bin/[
+endef
+COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_TEST_SYMLINK
+
+# GNU thinks chroot is in bin, debian thinks it's in sbin. We move chroot to
+# /usr/sbin, either by re-creating a symlink or by actually moving it.
+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),)
+define COREUTILS_CLEANUP
 	rm -f $(TARGET_DIR)/usr/bin/chroot
 	ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
 endef
-
+else
+define COREUTILS_CLEANUP
+        mv $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin
+endef
+endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
 
 $(eval $(autotools-package))
-- 
2.17.1
