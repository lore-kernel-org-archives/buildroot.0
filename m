From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 21:04:19 +0200
Subject: [Buildroot] [git commit] package/coreutils: allow building as
 individual binaries
Message-ID: <20190620192137.DB4A482283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7989818466f8a963c4b6cc8b5014b04703535d3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
so that coreutils can be built and installed as individual binaries.
It can be used if the target file system doesn't support symlinks or
symlinks are undesirable.

The approach is modelled after Busybox's similarly named configuration
option.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
[Thomas: adjust to previous preparation commits.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/Config.in    | 18 ++++++++++++++++++
 package/coreutils/coreutils.mk | 33 ++++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 11a6019e82..705013bae0 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -15,6 +15,24 @@ config BR2_PACKAGE_COREUTILS
 
 	  http://www.gnu.org/software/coreutils/
 
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
+
 comment "coreutils needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index c48dc235ac..6b8f3ba4b8 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -14,8 +14,15 @@ COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_AUTORECONF = YES
 COREUTILS_GETTEXTIZE = YES
 
-COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=symlinks \
+COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
+
+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
+COREUTILS_CONF_OPTS += --disable-single-binary
+else
+COREUTILS_CONF_OPTS += --enable-single-binary=symlinks
+endif
+
 COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_chown_works=yes \
 	ac_cv_func_euidaccess=no \
@@ -96,6 +103,17 @@ COREUTILS_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
+# We want to move a few binaries from /usr/bin to /bin. In the case of
+# coreutils being built as multi-call binary, we do so by re-creating
+# the corresponding symlinks. If coreutils is built with individual
+# binaries, we actually move the binaries.
+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
+define COREUTILS_FIX_BIN_LOCATION
+	$(foreach f,$(COREUTILS_BIN_PROGS), \
+		mv $(TARGET_DIR)/usr/bin/$(f) $(TARGET_DIR)/bin
+	)
+endef
+else
 define COREUTILS_FIX_BIN_LOCATION
 	# some things go in /bin rather than /usr/bin
 	$(foreach f,$(COREUTILS_BIN_PROGS), \
@@ -103,6 +121,7 @@ define COREUTILS_FIX_BIN_LOCATION
 		ln -sf ../usr/bin/coreutils $(TARGET_DIR)/bin/$(f)
 	)
 endef
+endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_BIN_LOCATION
 endif
 
@@ -111,16 +130,28 @@ COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
 endif
 
 # link for archaic shells
+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
+define COREUTILS_CREATE_TEST_SYMLINK
+	ln -fs test $(TARGET_DIR)/usr/bin/[
+endef
+else
 define COREUTILS_CREATE_TEST_SYMLINK
 	ln -fs coreutils $(TARGET_DIR)/usr/bin/[
 endef
+endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CREATE_TEST_SYMLINK
 
 # gnu thinks chroot is in bin, debian thinks it's in sbin
+ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
+define COREUTILS_FIX_CHROOT_LOCATION
+	mv $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin
+endef
+else
 define COREUTILS_FIX_CHROOT_LOCATION
 	rm -f $(TARGET_DIR)/usr/bin/chroot
 	ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
 endef
+endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
 
 $(eval $(autotools-package))
